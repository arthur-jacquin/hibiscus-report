# hibiscus-report

This repository is meant to be a template for LaTeX reports.

Additionnaly, this readme can be used as a cheatsheet/list of tips.


## General tips

The very most important tip is to focus on CONSISTENCY. Whatever approach you
choose, try to stick to it. If it's a collaborative work, ensure all members are
on the same wavelength.

That being said, here are some non-critical tips:

* Only use lowercase letters and the underscore in file names, labels, and
    bibliography reference names.
* Create one file per chapter/appendix, in the according folder. The file should
    start with a `\chapter` command. Call the file from `main.tex`.
* Put figures in `figures/`, scripts in `scripts/`.
* Avoid messing with default spacing, especially with absolute lengths.
* If there are many files in `scripts/` or `figures/`, use subfolders.
* Some stuff needs multiple compilations, for example references. Compile twice
    before considering the output file stable. If you use a bibliography, it's
    even more subtle: refer to the according section.


## Referencing

The `\label{labelname}` command allow to later reference some objects. Use it
below heading commands or inside floating environments (figures, tables...).

Once an object is labelled, you can use `\ref{labelname}` to reference to it,
and `\pageref{labelname}` to reference its page location.

Some tips:

* Choose concise label names.
* Expliciting the type of the labelled object is a good thing to avoid clashes,
    for examples: `fig:XXX` for figures, `ch:XXX` for chapters...
* Try to have a consistant decision process regarding what to label and what not
    to label. Labelling objects is never a problem, even if you don't expect
    some objects to be referred to.
* `\pageref` is especially useful for a floating object, as it can be rendered
    on a very distant page. Use it whenever referencing this kind of object.

Lastly, it is also possible to cite bibliography references, with the
`\cite{referencename}` command. The command accept a comma-separated list of
reference: `\cite{ref1, ref2}` is valid.


## Using a bibliography

Bibliographies are managed by another compilation system, for example `biber`,
that works collaboratively with the main LaTeX compiler:

1. run the LaTeX compiler once to collect citations,
2. run the bibliography compiler to generate the bibliography,
3. then rerun the LaTeX compiler to get the bibliography inserted.

That's a bit of a hassle. Thus, the `bib` makefile target is provided for ease
of use: whenever you make a new citation in the report, you just have to add the
reference to `bibliography.bib` and then run `make bib`.

Only references cited in the report are generated in the report bibliography.
Therefore, you can add as many references to `bibliography.bib` without
polluting the output file.


## Most common elements

### Headings

```tex
\chapter{XXX}
\label{ch:XXX}

\section{XXX}
\label{sec:XXX}

\subsection{XXX}
\label{subsec:XXX}

\subsubsection{XXX}
\label{subsubsec:XXX}
```

### Figures

```tex
\begin{figure}[h]
    \centering
    \includegraphics[height=XXX]{figures/XXX}
    \caption{XXX}
    \label{fig:XXX}
\end{figure}
```

### Tables

```tex
\begin{table}[ht]
    \centering
    \begin{tabular}{XXX}
    \toprule
    XXX & XXX \\
    \midrule
    XXX & XXX \\
    XXX & XXX \\
    \bottomrule
    \end{tabular}
    \caption{XXX}
    \label{tab:XXX}
\end{table}
```

### Equations

```tex
\begin{equation}
    XXX
    \label{eq:XXX}
\end{equation}
```

### Scripts

```tex
\code{XXX}          % inline code

% script
\begin{lstlisting}[language=XXX, caption=XXX, label=XXX]
XXX
\end{lstlisting}

% external script
\lstinputlisting[language=XXX, caption=XXX, label=XXX]{scripts/XXX}
\lstinputlisting[language=XXX, firstline=XXX, lastline=XXX, caption=XXX,
    label=XXX]{scripts/XXX}
```


## Links

* [Tables tutorial](https://texblog.org/2017/02/06/proper-tables-with-latex/)
* [Short bibliography reference](https://www.overleaf.com/learn/latex/Bibliography_management_with_biblatex#Reference_guide)
* [Short scripts reference](https://www.overleaf.com/learn/latex/Code_listing#Reference_guide)
* [Manipulating the table of content](https://tex.stackexchange.com/questions/48509/insert-list-of-figures-in-the-table-of-contents)
* [Paragraph spacing](https://www.overleaf.com/learn/latex/Articles/How_to_change_paragraph_spacing_in_LaTeX#The_parskip_package)
