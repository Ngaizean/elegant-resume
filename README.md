# Elegant Resume

一个简洁、优雅、模块化的中文学术/技术简历 LaTeX 模板，适用于保研、申博、科研经历展示、技术求职等场景。

模板不一定覆盖所有使用场景，你可以自行修改，或配合 AI 按自己的内容和审美继续定制。

## 预览

![Elegant Resume 模板预览](images/preview.png)

## 特性

- 基于 XeLaTeX，原生支持中文排版。
- 模板骨架与个人内容分离，减少硬编码，便于维护多份简历。
- 教育背景、科研经历、项目经历等条目自动对齐。
- 科研经历支持自动编号的工作描述 `(1)(2)(3)`。
- 头像可选，文件不存在时自动隐藏。
- 内置匿名示例数据与匿名头像占位图，适合作为公开模板项目。
- 支持 Makefile 和构建脚本。
- 不捆绑授权不明确的 CJK 字体，默认使用系统中文字体。

## 快速开始

### 环境要求

- TeX Live / MacTeX
- XeLaTeX
- latexmk

### 编译模板示例

```bash
latexmk -xelatex elegant-resume.tex
```

或：

```bash
make
```

输出文件：

```text
elegant-resume.pdf
```

也可以使用构建脚本：

```bash
./build.sh
```

## 文件结构

```text
.
├── elegant-resume.tex                 # 默认入口，加载匿名示例数据
├── resume.cls                         # 核心样式与命令定义
├── zh_CN-systemfonts.sty              # 系统中文字体配置
├── data/
│   └── resume-data.example.tex        # 匿名示例数据
├── template/
│   └── resume-template.tex            # 通用模板骨架
├── images/
│   ├── example-profile.png            # 匿名头像占位图
│   └── preview.png                    # 模板编译效果预览
├── fonts/                             # 英文字体与图标字体
├── linespacing_fix.sty                # 行间距修复
├── fontawesome.sty                    # 图标字体支持
├── Makefile                           # 编译脚本
├── build.sh                           # 构建脚本
└── LICENSE
```

## 创建自己的简历

复制匿名示例数据：

```bash
cp data/resume-data.example.tex data/resume-data.my.tex
```

创建新的入口文件，例如 `resume-my.tex`：

```tex
\newcommand{\ResumeDataFile}{data/resume-data.my}
\input{template/resume-template}
```

编译：

```bash
latexmk -xelatex resume-my.tex
```

## 维护方式

- 改简历内容：编辑 `data/resume-data-*.tex`
- 改模板结构：编辑 `template/resume-template.tex`
- 改视觉样式：编辑 `resume.cls`
- 改字体配置：编辑 `zh_CN-systemfonts.sty`

## 命令参考

### 个人信息

```tex
\resumeHeader{姓名}{电话}{邮箱}{年龄}{网站}{身份}{照片路径}
```

### 教育背景

```tex
\educationEntry{学校}{专业/方向}{学位}{时间}
```

### 科研经历

```tex
\researchEntry{课题名称}{单位}{时间}
\begin{itemize}
  \researchTech{核心技术列表}
  \researchOutcomeFirst{成果贡献}
  \researchWorkFirst{第一项工作}
  \researchWorkItem{第二项工作}
  \researchWorkItem{第三项工作}
\end{itemize}
```

### 项目经历

```tex
\projectEntry{项目名称}{项目链接}
```

如果第二个参数为空，模板不会输出多余的逗号：

```tex
\projectEntry{项目名称}{}
```

### 自定义板块

直接使用 `\section{标题}` 创建任意新板块：

```tex
\section{工作技能}
\begin{itemize}
  \item \textbf{语言}: ...
  \item \textbf{工具}: ...
\end{itemize}
```

## 字体说明

本项目不捆绑授权不明确的中文字体。`zh_CN-systemfonts.sty` 会优先尝试使用常见系统字体，例如：

- Noto Serif CJK SC / Noto Sans CJK SC
- Source Han Serif SC / Source Han Sans SC
- Songti SC / Heiti SC / Kaiti SC
- STSong / STHeiti

如果编译时报中文字体缺失，请安装上述任意一组字体，或自行修改 `zh_CN-systemfonts.sty`。

## 编译命令

```bash
make            # 编译默认示例
make clean      # 清理辅助文件，保留 PDF
make distclean  # 清理所有生成文件，包括 PDF
```

也可以手动编译：

```bash
xelatex elegant-resume.tex
```

## 开源注意事项

如果你基于本模板维护自己的简历仓库，建议不要提交：

- 个人照片
- 个人简历数据文件
- 生成的 PDF
- LaTeX 编译产物，例如 `.aux`、`.log`、`.fls`、`.fdb_latexmk`、`.xdv`
- 授权不明确的字体文件

## 致谢

- 基于 [billryan/resume](https://github.com/billryan/resume) 模板改进。
- 英文字体使用 [Tex Gyre Termes](https://www.gust.org.pl/projects/e-foundry/tex-gyre)。

## 致shit

- 感shit复旦大学某位博士生[Alidadei](https://github.com/Alidadei)的点子，帮助改进该模版先前过多缩进导致不美观的问题。同时感shit他自己精彩“好看”的cv，才有如今简约大气的模版

## License

[MIT](LICENSE)
