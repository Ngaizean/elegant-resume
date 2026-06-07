\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2026/06/06 Elegant Chinese Academic Resume Template]
\LoadClass[11pt]{article}

%% ============================================================
%%  resume.cls — Elegant Chinese Academic Resume Template
%% ============================================================
%%
%%  A clean LaTeX resume class designed for Chinese academic
%%  resumes. Compile with XeLaTeX.
%%
%%  ---- Available Commands ----
%%
%%  HEADER:
%%    \resumeHeader{name}{phone}{email}{age}{website}{title}{photo}
%%      photo: path to profile image, omitted automatically if
%%             the file does not exist
%%
%%  EDUCATION:
%%    \educationEntry{school}{major}{degree}{date}
%%    \educationItemGap
%%
%%  RESEARCH:
%%    \researchEntry{title}{institution}{date}
%%    \researchEntryGap
%%    \researchTech{technologies}          — "核心技术" bullet
%%    \researchOutcomeFirst{outcome}       — "成果贡献" bullet
%%    \researchWorkFirst{first item}       — "主要工作" + starts numbering
%%    \researchWorkItem{item}              — continues (1)(2)(3) numbering
%%
%%  PROJECT:
%%    \projectEntry{name}{url}
%%    \projectEntryGap
%%
%%  SECTIONS: use \section{标题} for any custom section
%%
%% ============================================================

% ---- Global settings ----
\setlength{\parindent}{0pt}
\AtBeginDocument{\linespread{1.09}\selectfont}

% ---- Packages ----
\RequirePackage{xltxtra}         % XeTeX improvements
\RequirePackage{xifthen}         % Conditional commands
\RequirePackage{fontawesome}     % Icons
\RequirePackage[usenames,dvipsnames]{xcolor}
\RequirePackage{graphicx}        % Profile photo
\RequirePackage{fontspec}        % Font loading

% ---- Main font (Tex Gyre Termes, bundled in fonts/Main/) ----
\setmainfont[
  Path = fonts/Main/ ,
  Extension = .otf ,
  UprightFont = *-regular ,
  BoldFont = *-bold ,
  ItalicFont = *-italic ,
  BoldItalicFont = *-bolditalic ,
  SmallCapsFont = Fontin-SmallCaps
]{texgyretermes}

% ---- Page layout ----
\RequirePackage[
  a4paper,
  left=0.7in,
  right=0.7in,
  top=0.50in,
  bottom=0.5in,
  nohead
]{geometry}

% ---- Section formatting ----
\RequirePackage{titlesec}
\newcommand{\sectionrule}{\titlerule[0.7pt]}
\titleformat{\section}
  {\Large\scshape\raggedright}
  {}{0em}
  {}
  [\sectionrule]
\titlespacing*{\section}{0cm}{8pt}{5pt}

\titleformat{\subsection}
  {\large\raggedright}
  {}{0em}
  {}
\titlespacing*{\subsection}{0cm}{*0.55}{0.35ex}

% ---- List formatting ----
\RequirePackage{enumitem}
\setlist{noitemsep}
\setlist[itemize]{topsep=0pt, parsep=0.2ex, leftmargin=1.5pc}
\setlist[enumerate]{topsep=0pt, leftmargin=1.5pc}

\RequirePackage[super]{nth}

% ============================================================
%  HEADER
% ============================================================

\newcommand{\resumeHeader}[7]{%
  \noindent
  \IfFileExists{#7}{%
    \begin{minipage}[c]{0.72\textwidth}%
      {\Huge\scshape{#1}\par}%
      \vspace{1.55ex}%
      {\sffamily\large #2｜#3｜#4\par}%
      \vspace{0.45ex}%
      {\sffamily\large #5｜#6\par}%
    \end{minipage}%
    \hfill
    \begin{minipage}[c]{0.22\textwidth}%
      \raggedleft
      \includegraphics[width=2.15cm,height=2.75cm,keepaspectratio]{#7}%
    \end{minipage}%
  }{%
    {\Huge\scshape{#1}\par}%
    \vspace{1.55ex}%
    {\sffamily\large #2｜#3｜#4\par}%
    \vspace{0.45ex}%
    {\sffamily\large #5｜#6\par}%
  }%
  \par
  \vspace{0.2ex}%
}

% ============================================================
%  EDUCATION
% ============================================================

% \educationEntry{学校}{专业/方向}{学位}{时间}
%   Columns: school(28%) major(40%) degree(12%) date(right-aligned)
\newcommand{\educationEntry}[4]{%
  {\large
    \makebox[0.28\textwidth][l]{\textbf{#1}}%
    \makebox[0.40\textwidth][l]{#2}%
    \makebox[0.12\textwidth][l]{#3}%
    \hfill #4\par
  }%
}
\newcommand{\educationItemGap}{\vspace{0.95ex}}

% ============================================================
%  RESEARCH
% ============================================================

% \researchEntry{课题名称}{单位}{时间}
%   Columns: title(48%) institution(28%) date(right-aligned)
\newcommand{\researchEntry}[3]{%
  {\large
    \makebox[0.48\textwidth][l]{\textbf{#1}}%
    \makebox[0.28\textwidth][l]{#2}%
    \hfill #3\par
  }%
  \vspace{0.15em}%
}
\newcommand{\researchEntryGap}{\vspace{5pt}}

% \researchTech{技术列表} — 核心技术条目
\newcommand{\researchTech}[1]{%
  \item \textbf{核心技术}: #1%
}

% \researchOutcomeFirst{成果描述} — 成果贡献条目
\newcommand{\researchOutcomeFirst}[1]{%
  \item \textbf{成果贡献}: #1%
}

% \researchWorkFirst{首条工作} + \researchWorkItem{后续工作}
%   Generates auto-numbered items: (1) ... (2) ... (3) ...
\newcounter{workitem}
\newcommand{\researchWorkFirst}[1]{%
  \item \textbf{主要工作}: \setcounter{workitem}{0}\researchWorkItem{#1}%
}
\newcommand{\researchWorkItem}[1]{%
  \stepcounter{workitem}%
  \raisebox{0.2ex}{(\arabic{workitem})}\ #1%
}

% ============================================================
%  PROJECT
% ============================================================

% \projectEntry{项目名称}{链接}
\newcommand{\projectEntry}[2]{%
  {\large
    \textbf{#1}%
    \ifthenelse{\isempty{#2}}{}{, \textit{#2}}%
    \par
  }%
  \vspace{0.15em}%
}
\newcommand{\projectEntryGap}{\vspace{5pt}}
