\ProvidesClass{meetingnotes}

\RequirePackage{paralist}
\RequirePackage{xparse}
\LoadClass{article}
\ProcessOptions

\def\stime#1{\gdef\@stime{#1}}
\def\etime#1{\gdef\@etime{#1}}
\def\attlist#1{\gdef\@attlist{#1}}

\def\@stime{\@latex@error{No start time given}\@ehc}
\def\@etime{\@latex@error{No end time given}\@ehc}
\def\@attlist{\@latex@error{No attendees list given}\@ehc}

\renewcommand\@maketitle{%
\par\noindent\begin{minipage}[t]{0.6\linewidth}
  {\Huge\@title\par\smallskip}
  \@date\\
  \begin{tabular}{@{}ll@{}}
  Start time: & \@stime\\
  End time: & \@etime
  \end{tabular}
\end{minipage}%
\fbox{%
\begin{minipage}[t]{\dimexpr0.4\linewidth-2\fboxsep-2\fboxrule\relax}
  \textbf{Attendees}
  \begin{compactitem}\setlength{\leftmargin}{0.1in}
  \@for\temp@a:=\@attlist\do
    {\item  \temp@a}
  \end{compactitem}
\end{minipage}}\par\bigskip%
}
\renewcommand\maketitle{%
\if@twocolumn
  \twocolumn[\@maketitle]%
\else
  \@maketitle%
\fi%
}

\NewDocumentCommand\name{m}{#1\marginpar{#1}}
\NewDocumentCommand\att{m o}{{\bf #1}\IfNoValueTF{#2}{}{ (#2)}}