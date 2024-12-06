# Resume Generator

A markdown-based resume generator that creates professional PDFs with automatic portfolio updates.

## Table of Contents

- [Setup](#setup)
- [Usage](#usage)

## Setup

1. Install Node.js and npm or pnpm
2. Install Git
3. Global installation of md-to-pdf:
```bash
npm i -g md-to-pdf
```

4. Clone and configure
```bash
git clone github.com/haroonalbar/resume-generator
cd resume-generator
chmod +x run.sh
```

5. Update Configuration
- Edit run.sh:
    >Set RESUME_DIR
    >Set PORTFOLIO_DIR
    >Set DOCUMENTS_DIR

## Usage

1. Edit Resume
    Open resume.md
    Replace all [placeholders]
    Add your experiences
    Update skills section

2. Generate PDF
- One-time generation:
    ```bash
    md-to-pdf resume.md
    ```
- Watch mode:
    ```bash
    md-to-pdf -w resume.md
    ```
- Auto-Update Portfolio and Copies:
    ```bash
    ./run.sh
    ```