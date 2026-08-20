<!DOCTYPE html>

<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <title>Maskr | AI Image Steganography</title>

  <style>
    * {
      box-sizing: border-box;
      scroll-behavior: smooth;
    }

    body {
      margin: 0;
      font-family: Arial, Helvetica, sans-serif;
      background: #080b10;
      color: #e6edf3;
      line-height: 1.7;
    }

    a {
      color: #8ab4ff;
      text-decoration: none;
    }

    .container {
      width: min(1100px, 90%);
      margin: auto;
    }

    /* HERO */

    .hero {
      min-height: 90vh;
      display: flex;
      align-items: center;
      justify-content: center;
      text-align: center;
      padding: 80px 20px;
      background:
        radial-gradient(circle at top, #172033 0%, #080b10 55%);
    }

    .logo {
      width: 85px;
      height: 85px;
      margin: auto;
      border: 1px solid #3b82f6;
      border-radius: 24px;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 40px;
      background: #0d1420;
      box-shadow: 0 0 40px rgba(59, 130, 246, 0.2);
    }

    h1 {
      font-size: clamp(3rem, 8vw, 6rem);
      margin: 25px 0 10px;
      letter-spacing: -3px;
    }

    .gradient {
      background: linear-gradient(90deg, #60a5fa, #a78bfa);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
    }

    .subtitle {
      max-width: 700px;
      margin: auto;
      color: #9ca3af;
      font-size: 1.2rem;
    }

    .buttons {
      margin-top: 35px;
    }

    .btn {
      display: inline-block;
      padding: 14px 25px;
      margin: 8px;
      border-radius: 10px;
      font-weight: bold;
      transition: 0.2s;
    }

    .btn-primary {
      background: #2563eb;
      color: white;
    }

    .btn-secondary {
      border: 1px solid #30363d;
      color: #e6edf3;
      background: #161b22;
    }

    .btn:hover {
      transform: translateY(-2px);
    }

    /* BADGES */

    .badges {
      margin-top: 30px;
    }

    .badge {
      display: inline-block;
      padding: 7px 13px;
      margin: 4px;
      background: #161b22;
      border: 1px solid #30363d;
      border-radius: 999px;
      color: #c9d1d9;
      font-size: 0.85rem;
    }

    /* SECTIONS */

    section {
      padding: 90px 0;
      border-top: 1px solid #1f2937;
    }

    h2 {
      font-size: 2.3rem;
      margin-bottom: 10px;
    }

    .section-text {
      color: #9ca3af;
      max-width: 750px;
      margin-bottom: 40px;
    }

    /* CARDS */

    .grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
      gap: 20px;
    }

    .card {
      background: linear-gradient(145deg, #121820, #0d1117);
      border: 1px solid #242c38;
      border-radius: 16px;
      padding: 28px;
      transition: 0.25s;
    }

    .card:hover {
      transform: translateY(-5px);
      border-color: #3b82f6;
    }

    .icon {
      font-size: 32px;
      margin-bottom: 15px;
    }

    .card h3 {
      margin: 5px 0 10px;
    }

    .card p {
      color: #9ca3af;
      margin: 0;
    }

    /* WORKFLOW */

    .workflow {
      display: grid;
      gap: 15px;
      margin-top: 30px;
    }

    .step {
      display: flex;
      align-items: center;
      gap: 20px;
      padding: 20px;
      background: #0d1117;
      border: 1px solid #242c38;
      border-radius: 14px;
    }

    .number {
      min-width: 45px;
      height: 45px;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      background: #1d4ed8;
      font-weight: bold;
    }

    /* CODE */

    pre {
      background: #05070a;
      border: 1px solid #242c38;
      border-radius: 14px;
      padding: 22px;
      overflow-x: auto;
      color: #c9d1d9;
    }

    code {
      font-family: "SFMono-Regular", Consolas, monospace;
    }

    /* TABLE */

    table {
      width: 100%;
      border-collapse: collapse;
      background: #0d1117;
      border-radius: 12px;
      overflow: hidden;
    }

    th,
    td {
      padding: 16px;
      border-bottom: 1px solid #242c38;
      text-align: left;
    }

    th {
      background: #161b22;
      color: #8ab4ff;
    }

    /* ARCHITECTURE */

    .architecture {
      background: #05070a;
      border: 1px solid #242c38;
      border-radius: 20px;
      padding: 40px;
      text-align: center;
      color: #93c5fd;
      font-family: monospace;
      white-space: pre-wrap;
      line-height: 2;
    }

    /* FOOTER */

    footer {
      text-align: center;
      padding: 60px 20px;
      color: #6b7280;
      border-top: 1px solid #1f2937;
    }

    @media (max-width: 600px) {
      .hero {
        min-height: auto;
        padding: 100px 20px;
      }

      h1 {
        letter-spacing: -1px;
      }
    }
  </style>

</head>

<body>

<!-- HERO -->

<header class="hero">

  <div>

```
<div class="logo">🔐</div>

<h1>
  <span class="gradient">Maskr</span>
</h1>

<p class="subtitle">
  AI-Powered Image Steganography for hiding and recovering
  secret messages inside digital images.
</p>

<div class="badges">
  <span class="badge">🐦 Flutter</span>
  <span class="badge">🐍 Python</span>
  <span class="badge">⚡ Flask</span>
  <span class="badge">🤖 TensorFlow</span>
  <span class="badge">🧠 ResNet50</span>
  <span class="badge">🖼️ LSB Steganography</span>
</div>

<div class="buttons">

  <a href="#installation" class="btn btn-primary">
    🚀 Get Started
  </a>

  <a href="https://github.com/mhdnahals/Maskr-imagestegnography"
     class="btn btn-secondary">
    View on GitHub
  </a>

</div>
```

  </div>

</header>

<main class="container">

<!-- ABOUT -->

<section>

  <h2>What is Maskr?</h2>

  <p class="section-text">
    Maskr is a full-stack steganography application that enables users
    to conceal secret text messages inside images and recover them later.
    The project combines modern web development, image processing,
    deep learning, and deterministic randomized encoding.
  </p>

  <div class="grid">

```
<div class="card">
  <div class="icon">🔐</div>
  <h3>Hide Information</h3>
  <p>
    Embed secret text messages directly into image pixel data.
  </p>
</div>

<div class="card">
  <div class="icon">🔓</div>
  <h3>Reveal Messages</h3>
  <p>
    Decode hidden information from previously encoded images.
  </p>
</div>

<div class="card">
  <div class="icon">🤖</div>
  <h3>AI-Assisted</h3>
  <p>
    Uses ResNet50 image feature extraction to generate a deterministic seed.
  </p>
</div>
```

  </div>

</section>

<!-- FEATURES -->

<section>

  <h2>✨ Key Features</h2>

  <div class="grid">

```
<div class="card">
  <div class="icon">🖼️</div>
  <h3>Image Upload</h3>
  <p>Select an image directly from the browser.</p>
</div>

<div class="card">
  <div class="icon">🧩</div>
  <h3>LSB Encoding</h3>
  <p>Secret data is embedded into the least significant bits of RGB pixels.</p>
</div>

<div class="card">
  <div class="icon">🎲</div>
  <h3>Randomized Placement</h3>
  <p>Message bits are distributed using a deterministic randomized order.</p>
</div>

<div class="card">
  <div class="icon">🔢</div>
  <h3>SHA-256 Seed</h3>
  <p>Image features are hashed to generate a repeatable seed.</p>
</div>

<div class="card">
  <div class="icon">📥</div>
  <h3>PNG Download</h3>
  <p>Encoded images can be downloaded directly from the application.</p>
</div>

<div class="card">
  <div class="icon">🌐</div>
  <h3>Web Interface</h3>
  <p>A responsive Flutter Web interface for encoding and decoding.</p>
</div>
```

  </div>

</section>

<!-- WORKFLOW -->

<section>

  <h2>⚙️ How It Works</h2>

  <p class="section-text">
    Maskr follows a simple workflow while combining AI feature extraction
    with pixel-level steganography.
  </p>

  <div class="workflow">

```
<div class="step">
  <div class="number">1</div>
  <div>
    <strong>Upload an Image</strong><br>
    Select the image that will carry the secret message.
  </div>
</div>

<div class="step">
  <div class="number">2</div>
  <div>
    <strong>Enter a Secret Message</strong><br>
    The message is converted into binary data.
  </div>
</div>

<div class="step">
  <div class="number">3</div>
  <div>
    <strong>Extract Image Features</strong><br>
    ResNet50 generates feature representations from the image.
  </div>
</div>

<div class="step">
  <div class="number">4</div>
  <div>
    <strong>Generate a Seed</strong><br>
    SHA-256 hashing produces a deterministic seed.
  </div>
</div>

<div class="step">
  <div class="number">5</div>
  <div>
    <strong>Embed Message Bits</strong><br>
    Message data is embedded into the image using randomized LSB positions.
  </div>
</div>

<div class="step">
  <div class="number">6</div>
  <div>
    <strong>Download the Encoded Image</strong><br>
    The final image is returned and saved as a PNG file.
  </div>
</div>
```

  </div>

</section>

<!-- ARCHITECTURE -->

<section>

  <h2>🏗️ System Architecture</h2>

  <div class="architecture">
┌───────────────────────────────┐
│        Flutter Web UI         │
│                               │
│   Upload Image + Message      │
└───────────────┬───────────────┘
                │
                ▼
┌───────────────────────────────┐
│         Flask REST API        │
│                               │
│      /encode   /decode        │
└───────────────┬───────────────┘
                │
                ▼
┌───────────────────────────────┐
│       AI Processing Layer     │
│                               │
│       TensorFlow ResNet50     │
└───────────────┬───────────────┘
                │
                ▼
┌───────────────────────────────┐
│      Steganography Engine     │
│                               │
│ SHA-256 → Seed → Random Order │
│            ↓                  │
│       LSB Encoding            │
└───────────────┬───────────────┘
                │
                ▼
          Encoded PNG
  </div>

</section>

<!-- TECH -->

<section>

  <h2>🛠️ Technology Stack</h2>

  <table>

```
<tr>
  <th>Layer</th>
  <th>Technology</th>
</tr>

<tr>
  <td>Frontend</td>
  <td>Flutter & Dart</td>
</tr>

<tr>
  <td>Backend</td>
  <td>Python & Flask</td>
</tr>

<tr>
  <td>Deep Learning</td>
  <td>TensorFlow & ResNet50</td>
</tr>

<tr>
  <td>Image Processing</td>
  <td>Pillow & NumPy</td>
</tr>

<tr>
  <td>Hashing</td>
  <td>SHA-256</td>
</tr>

<tr>
  <td>Communication</td>
  <td>REST API</td>
</tr>
```

  </table>

</section>

<!-- INSTALLATION -->

<section id="installation">

  <h2>🚀 Getting Started</h2>

  <h3>1. Clone the Repository</h3>

<pre><code>git clone https://github.com/mhdnahals/Maskr-imagestegnography.git
cd Maskr-imagestegnography</code></pre>

  <h3>2. Create a Python Virtual Environment</h3>

<pre><code>python3 -m venv .venv
source .venv/bin/activate</code></pre>

  <h3>3. Install Backend Dependencies</h3>

<pre><code>pip install -r requirements.txt</code></pre>

  <h3>4. Start the Flask Server</h3>

<pre><code>python app.py</code></pre>

  <p>The backend will run at:</p>

<pre><code>http://127.0.0.1:5000</code></pre>

  <h3>5. Install Flutter Dependencies</h3>

<pre><code>flutter pub get</code></pre>

  <h3>6. Run the Web Application</h3>

<pre><code>flutter run -d chrome</code></pre>

</section>

<!-- API -->

<section>

  <h2>🔌 API</h2>

  <table>

```
<tr>
  <th>Endpoint</th>
  <th>Method</th>
  <th>Description</th>
</tr>

<tr>
  <td>/encode</td>
  <td>POST</td>
  <td>Embeds a secret message inside an image.</td>
</tr>

<tr>
  <td>/decode</td>
  <td>POST</td>
  <td>Extracts a hidden message from an encoded image.</td>
</tr>
```

  </table>

</section>

<!-- STRUCTURE -->

<section>

  <h2>📁 Project Structure</h2>

<pre><code>Maskr-imagestegnography/
│
├── lib/
│   └── main.dart          # Flutter frontend
│
├── app.py                 # Flask backend
├── requirements.txt       # Python dependencies
├── pubspec.yaml           # Flutter dependencies
│
├── android/
├── ios/
├── linux/
├── macos/
├── web/
├── windows/
│
├── .gitignore
└── README.md</code></pre>

</section>

<!-- NOTES -->

<section>

  <h2>⚠️ Important Notes</h2>

  <div class="grid">

```
<div class="card">
  <div class="icon">🖼️</div>
  <h3>Use PNG</h3>
  <p>
    PNG is recommended because lossy image formats may modify pixel data.
  </p>
</div>

<div class="card">
  <div class="icon">🖥️</div>
  <h3>Run the Backend</h3>
  <p>
    The Flask server must be running before using the Flutter frontend.
  </p>
</div>

<div class="card">
  <div class="icon">📦</div>
  <h3>Do Not Upload .venv</h3>
  <p>
    Virtual environments should remain excluded from Git using .gitignore.
  </p>
</div>
```

  </div>

</section>

<!-- FUTURE -->

<section>

  <h2>🔮 Future Improvements</h2>

  <div class="grid">

```
<div class="card">
  <div class="icon">🔑</div>
  <h3>Password Protection</h3>
  <p>Add password-based protection before encoding messages.</p>
</div>

<div class="card">
  <div class="icon">🛡️</div>
  <h3>Encryption</h3>
  <p>Add encryption before embedding secret data.</p>
</div>

<div class="card">
  <div class="icon">☁️</div>
  <h3>Cloud Deployment</h3>
  <p>Deploy the backend for remote access.</p>
</div>

<div class="card">
  <div class="icon">🐳</div>
  <h3>Docker</h3>
  <p>Add containerization for easier deployment.</p>
</div>
```

  </div>

</section>

</main>

<footer>

  <h2>🔐 Maskr</h2>

  <p>
    AI-Powered Image Steganography
  </p>

  <p>
    Built with Flutter, Flask, TensorFlow and ResNet50.
  </p>

  <p>
    © 2026 Maskr Project
  </p>

</footer>

</body>
</html>
