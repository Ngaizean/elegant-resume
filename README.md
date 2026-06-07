# Elegant Resume

Elegant Resume is a clean XeLaTeX template for Chinese academic and technical resumes.
It separates layout from content so you can reuse the same visual system across different resume versions.

## Features

- One-page Chinese resume layout
- Data-driven content file
- Anonymous example profile included
- No bundled proprietary CJK fonts
- Works with system CJK fonts through XeLaTeX

## Project Structure

```text
elegant-resume/
├── elegant-resume.tex          # Main example entry
├── resume.cls                  # Resume class and layout commands
├── zh_CN-systemfonts.sty       # System CJK font configuration
├── data/
│   └── resume-data.example.tex # Anonymous example content
├── template/
│   └── resume-template.tex     # Reusable template shell
├── images/
│   └── example-profile.png     # Anonymous avatar placeholder
└── fonts/                      # Bundled Latin and icon fonts
```

## Build

Install a TeX distribution with XeLaTeX and `latexmk`, then run:

```bash
latexmk -xelatex elegant-resume.tex
```

Or:

```bash
./build.sh
```

The generated PDF will be `elegant-resume.pdf`.

## Create Your Own Resume

Copy the example data file:

```bash
cp data/resume-data.example.tex data/resume-data.my.tex
```

Create a new entry file:

```tex
\newcommand{\ResumeDataFile}{data/resume-data.my}
\input{template/resume-template}
```

Then compile that entry with XeLaTeX.

## CJK Fonts

This template does not include proprietary Chinese fonts. It tries common system fonts such as:

- Noto Serif CJK SC / Noto Sans CJK SC
- Source Han Serif SC / Source Han Sans SC
- Songti SC / Heiti SC / Kaiti SC
- STSong / STHeiti

If compilation fails because no CJK font is available, install one of the above fonts or edit `zh_CN-systemfonts.sty`.

## License

See `LICENSE`.
