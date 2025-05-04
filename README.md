# Automate-Dockerfile-Generation-with-Local-LLMs

```markdown
# AI Dockerfile Generator

![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)
![AI](https://img.shields.io/badge/AI-FF6F00.svg?style=for-the-badge&logo=openai&logoColor=white)

Generate optimized Dockerfiles using either local (Ollama) or cloud (Google AI Studio) AI models.

## Table of Contents
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
  - [Ollama](#ollama-local)
  - [Google AI Studio](#google-ai-studio-cloud)
- [Usage](#usage)
- [Supported Languages](#supported-languages)
- [Customization](#customization)
- [Troubleshooting](#troubleshooting)
- [Files](#files)
- [License](#license)

## Features

- **Automatic Detection**: Identifies project dependencies
- **Best Practices**: Follows Docker security and optimization guidelines
- **Multi-Language**: Supports 6+ programming languages
- **Dual Mode**: Choose between local or cloud AI processing

## Prerequisites

| Requirement          | Ollama | Google AI Studio |
|----------------------|--------|------------------|
| Python 3.8+          | ✓      | ✓                |
| Internet Connection  | Only for model download | ✓                |
| API Key              | ❌      | ✓                |
| Local AI Setup       | ✓      | ❌                |

## Installation

### Ollama (Local)

1. **Install Ollama**:
   ```bash
   curl -fsSL https://ollama.com/install.sh | sh
   ```

2. **Download AI Model**:
   ```bash
   ollama pull phi3  # or mistral, llama2, etc.
   ```

3. **Install Python Dependencies**:
   ```bash
   pip install ollama python-dotenv
   ```

### Google AI Studio (Cloud)

1. **Get API Key**:
   - Visit [Google AI Studio](https://aistudio.google.com/)
   - Create → Get API Key

2. **Install Dependencies**:
   ```bash
   pip install google-generativeai python-dotenv
   ```

3. **Configure Environment**:
   ```bash
   echo "GOOGLE_API_KEY=your_key_here" > .env
   ```

## Usage

### For Both Implementations

1. **Run the Script**:
   ```bash
   # For Ollama
   python dockerfile_generator_ollama.py

   # For Google AI
   python dockerfile_generator_google.py
   ```

2. **Follow Prompts**:
   ```
   Enter programming language (e.g., Python, JavaScript): Python
   Generating Dockerfile...
   
   FROM python:3.9-slim
   WORKDIR /app
   COPY requirements.txt .
   RUN pip install --no-cache-dir -r requirements.txt
   ...
   ```

3. **Save Output**:
   ```
   Save to Dockerfile? (y/n): y
   ```

## Supported Languages

| Language   | Dependency File | Both Implementations |
|------------|-----------------|----------------------|
| Python     | requirements.txt| ✓                    |
| JavaScript | package.json    | ✓                    |
| Java       | pom.xml         | ✓                    |
| Go         | go.mod          | ✓                    |
| Ruby       | Gemfile         | ✓                    |
| PHP        | composer.json   | ✓                    |

## Customization

Edit `PROMPT_TEMPLATE` in either script to modify:

```python
PROMPT_TEMPLATE = """
Generate Dockerfile for {language}...
# Add your custom requirements here
"""
```

## Troubleshooting

### Common Issues

| Issue                     | Ollama Fix                     | Google AI Fix                     |
|---------------------------|--------------------------------|-----------------------------------|
| Model not loading         | `ollama pull phi3`             | Check API key in .env             |
| Dependency detection fail | Verify file exists in project  | Same as Ollama                    |
| Timeout errors           | Restart Ollama service         | Check network connection          |

## Files

```
project/
├── dockerfile_generator_ollama.py   # Local AI version
├── dockerfile_generator_google.py   # Cloud AI version
├── .env.example                    # Template for API keys
├── requirements.txt                # Python dependencies
└── README.md                       # This file
```

