% see LICENSE file for copyright and license details

% CONTEXT

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hibiscus}
\ifdefined\article
\LoadClass[a4paper, 12pt]{article}
\else
\LoadClass[a4paper, 12pt]{report}
\fi


% PACKAGES

% Language and encoding
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[french]{babel}

% Margins
\usepackage{geometry}
\geometry{
    vmargin=3em,
    includeheadfoot=true
}

% Table of content, file structure
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{2}

% Jumps, links
\usepackage{hyperref}

% Figures
\usepackage{graphicx}

% Tables
\usepackage{booktabs}

% Scripts, including custom colorscheme for syntax highlight
\usepackage{xcolor}
\usepackage{listings}
\renewcommand{\lstlistlistingname}{Liste des scripts}
\lstdefinestyle{simple}{
    extendedchars=true,
    basicstyle=\ttfamily,
    backgroundcolor=,
    commentstyle=\color[rgb]{0,0.6,0},
    keywordstyle=\color[rgb]{0,0.2,0.8},
    stringstyle=\color[rgb]{1,0.6,0.2},
    numberstyle=\ttfamily\color[rgb]{0.5,0.5,0.5},
    breakatwhitespace=false,
    breaklines=true,
    captionpos=b,
    keepspaces=true,
    numbers=left,
    numbersep=7pt,
    showspaces=false,
    showstringspaces=false,
    showtabs=false,
    tabsize=4,
    columns=fixed
}
\lstset{style=simple}
\newcommand{\code}[1]{\lstinline{#1}}

% Abstract, acknowledgements, foreword
\usepackage{abstract}

% Bibliography
\usepackage{csquotes}
\usepackage[backend=biber, style=numeric, sorting=ynt]{biblatex}
\addbibresource{bibliography.bib}


% COVER PAGE

% For safety, define fallback values for cover page variables.
% Additionnally, figures/entity_logo_{1,2}.png must exist.

\renewcommand{\@title}{Title}

\renewcommand{\@author}{Authors}

\newcommand{\@context}{Context}
\newcommand{\context}[1]{\renewcommand{\@context}{#1}}

\newcommand{\@reporttype}{Report type}
\newcommand{\reporttype}[1]{\renewcommand{\@reporttype}{#1}}

\newcommand{\@entity}{Entity}
\newcommand{\entity}[1]{\renewcommand{\@entity}{#1}}

\def \coverpage {
    \thispagestyle{empty}

    \begin{figure}
    \begin{minipage}{0.4\linewidth} \flushleft
    \includegraphics[height=0.4\textwidth]{figures/entity_logo_1.png}
    \end{minipage}
    \hfill
    \begin{minipage}{0.4\linewidth} \flushright
    \includegraphics[height=0.4\textwidth]{figures/entity_logo_2.png}
    \end{minipage}
    \end{figure}

    \begin{center}

    \rule{\textwidth}{1pt} \\[0.8em]

    {\bf \Large \@title \\[0.3em]}
\ifdefined\article
    {\@context{} \\[0.8em]}
\else
    {\@reporttype{} - \@context{} \\[0.8em]}
\fi

\ifdefined\article
    {\@author \\[0.3em]}
\else
    {\large \@author \\[0.3em]}
\fi
    {\sc \@entity \\[0.3em]}

    \rule{\textwidth}{1pt}


\ifdefined\article
    \end{center}
\else
    \vfill
    \today
    \end{center}
    \clearpage
\fi
}


% ACKNOWLEDGEMENTS, FOREWORD

\def \acknowledgements {
    \renewcommand{\abstractname}{Remerciements}
    \begin{abstract}
    \input{appendices/acknowledgements.tex}
    \end{abstract}
}

\def \foreword {
    \renewcommand{\abstractname}{Avant-propos}
    \begin{abstract}
    \input{appendices/foreword.tex}
    \end{abstract}
}


% REFERENCES

\def \figureslist {
\ifdefined\article
    \phantomsection
    \addcontentsline{toc}{section}{\listfigurename}
\else
    \clearpage
    \phantomsection
    \addcontentsline{toc}{chapter}{\listfigurename}
\fi
    \listoffigures
}

\def \tableslist {
\ifdefined\article
    \phantomsection
    \addcontentsline{toc}{section}{\listtablename}
\else
    \clearpage
    \phantomsection
    \addcontentsline{toc}{chapter}{\listtablename}
\fi
    \listoftables
}

\def \scriptslist {
\ifdefined\article
    \phantomsection
    \addcontentsline{toc}{section}{\lstlistlistingname}
\else
    \clearpage
    \phantomsection
    \addcontentsline{toc}{chapter}{\lstlistlistingname}
\fi
    \lstlistoflistings
}

\def \bibliographyreferenceslist {
    \printbibliography[heading=bibintoc]
}
