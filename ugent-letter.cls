%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    Ghent University letter class 
%    Created by DF Benoit, November 28, 2018
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ugent-letter}

\RequirePackage{kvoptions}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{ifthen}
\RequirePackage{calc}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc} % suggested by helvet
\RequirePackage[scaled=.85]{helvet}
\RequirePackage{lastpage}
\renewcommand{\familydefault}{\sfdefault}

\SetupKeyvalOptions{family=ugl,prefix=ugl@}

\DeclareStringOption[eb]{faculty}
\DeclareStringOption[en]{language}
\DeclareStringOption[.25]{rightcolwidth}
\DeclareBoolOption{signature}
\DeclareBoolOption{pagenumbers}
\ProcessKeyvalOptions*

\ifthenelse{\equal{\ugl@language}{en}}{
    \RequirePackage[english]{babel}
}{
    \RequirePackage[dutch]{babel}
}

\LoadClass[a4paper]{letter}

% Define input macro's
\newcommand{\mydept}[1]{\def\fromdept{#1}}
\newcommand{\myname}[1]{\def\fromname{#1}}
\newcommand{\myposition}[1]{\def\fromposition{#1}}
\newcommand{\myemail}[1]{\def\fromemail{#1}}
\newcommand{\myphone}[1]{\def\fromphone{#1}}
\newcommand{\myaddress}[1]{\def\fromaddresss{#1}} %need extra s to avoid interference with internal commands
\newcommand{\myref}[1]{\def\fromref{#1}}
\newcommand{\mydate}[1]{\def\fromdate{#1}}
\newcommand{\mysubject}[1]{\def\fromsubject{#1}}
% Init optional macro's
\myref{}
\mysubject{}
% Read default values for macro's
\input{defaultsender-\ugl@language}

% define colors
\definecolor{ugentblue}{RGB}{30,100,200}

% define page layout lengths
\setlength{\oddsidemargin}{0mm} 
\setlength{\evensidemargin}{\oddsidemargin}
\setlength{\topmargin}{-10mm} %2.54cm + \topmargin
\setlength{\textheight}{210mm} %firstpage only
\setlength{\headheight}{10mm} %height of header
\setlength{\headsep}{15mm} %distance between header and text
\setlength{\textwidth}{\paperwidth-2in}
\setlength{\footskip}{30mm}
\setlength{\parskip}{1em}
\setlength{\parindent}{0.0em}
\newlength{\rightcol}
\setlength{\rightcol}{\ugl@rightcolwidth\textwidth}
\newlength{\leftcol}
\setlength{\leftcol}{\textwidth-\rightcol}

% Normal pages 
\renewcommand{\ps@headings}{%
    % 
    \renewcommand{\@oddhead}{%

        \begin{minipage}[b][\headheight]{\textwidth}

            \begin{minipage}[b][1cm]{\leftcol}
                \includegraphics[height=1cm]{img/\ugl@faculty-\ugl@language.png}
            \end{minipage}%
            \begin{minipage}[b][1cm][b]{\rightcol}
                \color{ugentblue}
                \scshape
                \fromdept%
            \end{minipage}%
        \end{minipage}
    }%
    % 
    \renewcommand{\@oddfoot}{%
        \parbox[t][22.5mm]{\textwidth}{%
            \includegraphics[height=22.5mm]{img/ugent-\ugl@language.png}
            \ifugl@pagenumbers
                \hfill\thepage/\pageref{LastPage}
            \fi
        }%
    }%
    \renewcommand{\@evenhead}{\@oddhead}
    \renewcommand{\@evenfoot}{\@oddfoot}
}

% set standard layout
\pagestyle{headings}

% redefine opening command
% and set subsequent page lengths
\renewcommand{\opening}[1]{%\thispagestyle{headings}%

        \begin{minipage}[b][62.5mm]{\textwidth}

            \hspace{\leftcol}%
            \begin{minipage}[b][7.5mm][c]{\leftcol}
                \fromname\\
                \fromposition 
            \end{minipage}%

            \vspace{2.5mm}
            
            \begin{minipage}[b][25mm][t]{\leftcol}
                \toname\\
                \toaddress
            \end{minipage}%
            \begin{minipage}[b][25mm][t]{\rightcol}
                \textbf{E}\hspace{1ex}\fromemail\\
                \textbf{T}\hspace{1ex}\fromphone\\[2mm]
                \fromaddresss
            \end{minipage}%

            \vspace{10mm}%

            \begin{minipage}[b][7.5mm][t]{\leftcol}
                \ifx\fromref\empty
                    \hfill
                \else
                    {\scshape\color{ugentblue} \ifthenelse{\equal{\ugl@language}{en}}{Our Ref.}{Onze Ref.}}\\
                    \fromref
                \fi
            \end{minipage}%
            \begin{minipage}[b][7.5mm][t]{\rightcol}
                {\scshape\color{ugentblue} \ifthenelse{\equal{\ugl@language}{en}}{Date}{Datum}}\\
                \fromdate
            \end{minipage}%

            \ifx\fromsubject\empty
            \else
                \vspace{5mm}%

                \begin{minipage}[b][5mm][t]{\textwidth}
                    {\scshape\color{ugentblue} \ifthenelse{\equal{\ugl@language}{en}}{Subject}{Onderwerp}}\\
                    \fromsubject
                \end{minipage}%
            \fi

        \end{minipage}%
        \vspace{7.5mm}

    % start opening of letter
    #1 \par%\noindent

}

% redefine closing command to sign off with name and postion
\renewcommand{\closing}[1]{\par\nobreak\vspace{2\parskip}%
    \stopbreaks
    \noindent
    \parbox{\indentedwidth}{\raggedright
        \ignorespaces #1\ifugl@signature
            \\\hspace{-4ex}\includegraphics[height=9\medskipamount]{img/signature.png}\\
        \else
            \\[9\medskipamount]%
        \fi
        \fromname\\ \fromposition}%
    \par
}
