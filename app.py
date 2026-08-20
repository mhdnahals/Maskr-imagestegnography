from flask import Flask, request, jsonify, send_file
from flask_cors import CORS
from PIL import Image
import numpy as np
import tensorflow as tf
from tensorflow.keras.applications.resnet50 import preprocess_input
import hashlib
import io
import base64
import random

app = Flask(__name__)
CORS(app)

# Load model
resnet_model = tf.keras.applications.ResNet50(
    weights='imagenet',
    include_top=False,
    pooling='avg'
)

def extract_features(image):
    image = image.resize((224, 224))
    image_array = np.array(image.convert('RGB'))
    image_array = preprocess_input(image_array)
    image_array = np.expand_dims(image_array, axis=0)
    features = resnet_model.predict(image_array)
    return features.flatten()

def generate_random_order(seed, length):
    random.seed(seed)
    indices = list(range(length))
    random.shuffle(indices)
    return indices

def encode_message(image, message):
    encoded = image.copy()
    message += chr(0)

    binary_message = ''.join(format(ord(c), '08b') for c in message)

    pixels = list(image.getdata())
    total_bits = len(pixels) * 3

    if len(binary_message) > total_bits - 64:
        raise ValueError("Message too long")

    features = extract_features(image)
    seed = int.from_bytes(hashlib.sha256(features.tobytes()).digest()[:4], 'big')

    length_binary = format(len(binary_message), '032b')
    seed_binary = format(seed, '032b')

    pixels = [list(p) for p in pixels]

    # metadata
    for i in range(32):
        p, c = divmod(i, 3)
        pixels[p][c] = (pixels[p][c] & ~1) | int(length_binary[i])

    for i in range(32):
        p, c = divmod(i + 32, 3)
        pixels[p][c] = (pixels[p][c] & ~1) | int(seed_binary[i])

    order = generate_random_order(seed, len(binary_message))

    for i, bit_index in enumerate(order):
        p, c = divmod(bit_index + 64, 3)
        pixels[p][c] = (pixels[p][c] & ~1) | int(binary_message[i])

    encoded.putdata([tuple(p) for p in pixels])
    return encoded

def decode_message(image):
    pixels = list(image.getdata())

    length_binary = ''.join(str(pixels[i // 3][i % 3] & 1) for i in range(32))
    length = int(length_binary, 2)

    seed_binary = ''.join(str(pixels[i // 3][i % 3] & 1) for i in range(32, 64))
    seed = int(seed_binary, 2)

    order = generate_random_order(seed, length)

    bits = ['0'] * length

    for i, bit_index in enumerate(order):
        p, c = divmod(bit_index + 64, 3)
        bits[i] = str(pixels[p][c] & 1)

    chars = [
        chr(int(''.join(bits[i:i+8]), 2))
        for i in range(0, len(bits), 8)
    ]

    return ''.join(chars).split(chr(0))[0]

@app.route('/encode', methods=['POST'])
def encode():
    data = request.json
    image_data = base64.b64decode(data['image'])
    message = data['message']

    img = Image.open(io.BytesIO(image_data))
    encoded_img = encode_message(img, message)

    img_io = io.BytesIO()
    encoded_img.save(img_io, 'PNG')
    img_io.seek(0)

    return send_file(img_io, mimetype='image/png')

@app.route('/decode', methods=['POST'])
def decode():
    file = request.files['image']
    img = Image.open(file.stream)

    message = decode_message(img)

    return jsonify({"message": message})

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)