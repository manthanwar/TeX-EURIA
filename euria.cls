%===============================================================================
% File Name     : <euria.cls>
% Description   : European Union Research Innovation Actions Proposal 
%-------------------------------------------------------------------------------
% Author        : Amit Manohar Manthanwar
% Mailer        : manthanwar@hotmail.com
% WebURL        : https://manthanwar.github.io
% GitHub        : https://github.com/manthanwar/TeX-EURIA.git
%-------------------------------------------------------------------------------
% Copyright     : ©2024 Amit Manohar Manthanwar
% License       : MIT
%===============================================================================
%---------------+---------+-----------------------------------------------------
% Revision Log  | Author  | Description
%---------------+---------+-----------------------------------------------------
% 27-Feb-2024   | AMM     | Initial Version
%---------------+---------+-----------------------------------------------------
%---------------+---------+-----------------------------------------------------
%---------------+---------+-----------------------------------------------------
%===============================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{euria}[2024/03/01 EU Research Innovation Actions]
%-------------------------------------------------------------------------------
\LoadClass[oneside,10pt,a4paper]{article}
%-------------------------------------------------------------------------------
% \RequirePackage{authblk}
% \RequirePackage{fp}
% \RequirePackage{fix-cm}
\RequirePackage{siunitx}
% \RequirePackage[ddmmyyyy]{datetime}
\RequirePackage{fancyhdr}                           % Header & Footer
\RequirePackage{lastpage}
\RequirePackage[dvipsnames,svgnames]{xcolor}
\RequirePackage{colortbl}
% \RequirePackage{array}
\RequirePackage{multirow}
\RequirePackage{enumitem}
\RequirePackage{graphicx,psfrag,pgffor}
\RequirePackage{amsmath,amssymb}
% \RequirePackage{mathrsfs,mathtools}
% \RequirePackage{chemfig}
\RequirePackage{pstricks}
% \RequirePackage{pst-all,pst-grad,pst-blur,pst-light3d,pst-3d,pst-math}
% \RequirePackage{pst-slpe}
% \RequirePackage{pst-hsb}
% \RequirePackage{pst-coil}
% \RequirePackage{pst-flags}
%\RequirePackage{tikz}
\RequirePackage{pgfgantt}
% \RequirePackage{qrcode}
%\RequirePackage[polish-compat]{babel} \renewcommand{\datepolish}{}
\RequirePackage{hhline}
%\RequirePackage[compact]{titlesec}
\RequirePackage{titlesec}
\RequirePackage{caption}
\captionsetup[table]{skip=0mm,font=footnotesize}
\captionsetup[figure]{font=footnotesize}
%\setlength{\abovecaptionskip}{10pt}

% \RequirePackage[T1]{fontenc}
% \RequirePackage[utf8]{inputenc}

%\RequirePackage{pstricks-add}
%\RequirePackage{pst-arrow}
%\RequirePackage{pst-bezier}


%\RequirePackage[OT4]{fontenc}
%\RequirePackage[T1]{fontenc}
%\RequirePackage{polski}
%\RequirePackage{bbding}
%\RequirePackage{epsfig}                             % for figure
%\RequirePackage{array}
%\RequirePackage{array,multirow}
%\RequirePackage{booktabs}
%\RequirePackage{hhline}
%\RequirePackage{pgfgantt}
%\RequirePackage[ddmmyyyy]{datetime}
%\renewcommand{\dateseparator}{--}
%-------------------------------------------------------------------------------
%\RequirePackage{eurosym}
%\RequirePackage{fontspec}
%\RequirePackage[T1]{fontenc}
%\RequirePackage{cmbright}
%\RequirePackage{wedn}
%\RequirePackage{helvet}
%\RequirePackage{avant}
%\RequirePackage{frcursive}
%\RequirePackage{calligra}
%\RequirePackage{bickham}
%\RequirePackage{dutchcal}
%\RequirePackage{miama}
%\RequirePackage{wela}
%\RequirePackage{cmbright}
%\RequirePackage[varqu,varl]{inconsolata} % sans serif typewriter
%-------------------------------------------------------------------------------
%===============================================================================

%\RequirePackage{epsfig}                             % for figure
%\RequirePackage{array}
%\RequirePackage{array,multirow}
%\RequirePackage{booktabs}


%\RequirePackage{cmbright}
%\RequirePackage{wedn}
%\RequirePackage{pstricks-add}
%\RequirePackage{pst-arrow}
%\RequirePackage{pst-bezier}%\renewcommand{\dateseparator}{--}
%-------------------------------------------------------------------------------

% \RequirePackage[
%     backend=biber,
%     autolang=hyphen,
%     sorting=ydnt,
%     % style=nature,
%     style=numeric,
%     isbn = false,
%     url = false,
%     doi=false,
%     eprint = false,
%     date = year,
%     minbibnames=6,
%     maxbibnames=6,
%     mincitenames = 1,
%     maxcitenames = 2
% ]{biblatex}
% \addbibresource{references.bib}

%\RequirePackage[pagebackref,colorlinks=false]{hyperref}
\RequirePackage{hyperref}
\hypersetup{
    colorlinks=true,
    citecolor=Navy,
    filecolor=teal,
    linkcolor=black,
    urlcolor=blue,
    %allcolors=black
    pdfauthor={Amit M. Manthanwar},
    pdftitle={EU-Horizon},
    pdfsubject={Proposal},
    pdfkeywords={Food, Water, Energy, Environment, Health},
    pdfproducer={Amit M. Manthanwar using LaTeX},
    pdfcreator={Amit M. Manthanwar using pdflatex}
}
%-------------------------------------------------------------------------------
%   backref=true
\RequirePackage[
    backend=biber,
    autolang=hyphen,
    sorting=ydnt,
    style=nature,
    % style=numeric,
    % style=alphabetic,
    isbn = false,
    url = false,
    doi=false,
    eprint = false,
    date = year,
    minbibnames = 1,
    maxbibnames = 1,
    mincitenames = 1,
    maxcitenames = 2,
    % backref=true,
]{biblatex}
% \addbibresource{references.bib}
% \bibliography{references}

\AtEveryBibitem{
    \clearfield{note}
    \clearfield{series}
    \clearfield{volume}
    \clearfield{month}
    \clearfield{pages}
    \clearfield{date}
    \clearfield{eprint}
    \clearfield{isbn}
    \clearfield{issn}
    \clearfield{doi}
    \clearfield{url}
    \clearlist{address}
    \clearlist{language}
    \clearlist{publisher}
    \clearlist{location}
    \clearname{editor}
}

% Remove publisher and editor except for books
\AtEveryBibitem{\ifentrytype{book}{}{
        \clearlist{publisher}
        \clearname{editor}
    }}

\DefineBibliographyStrings{english}{%
    backrefpage = {on page},% originally "cited on page"
    backrefpages = {on pages},% originally "cited on pages"
}

% Abbreviate Journal Names
\DeclareSourcemap{\maps[datatype=bibtex,overwrite=true]{\map{
            \step[fieldsource=journal, match=\regexp{Water\sresearch}, replace={Water res}]
            \step[fieldsource=journal, match=\regexp{Environmental\sscience\sand\stechnology}, replace={Env sci tech}]
            % \step[fieldset=volume,null]
        }}}


\DeclareFieldFormat{volume}{\color{red}{\mkbibbold{#1}}}

% \setlength{\bibitemsep}{0.1\itemsep}


\setlength{\bibitemsep}{-0.5\itemsep}

%-------------------------------------------------------------------------------



%===============================================================================
\definecolor{teal}{rgb}{0.0, 0.5, 0.5}
\definecolor{ICBlueLight}{rgb}{0.402, 0.603, 0.787}
\definecolor{ICBlueDark}{rgb}{0, 0.273, 0.498}
\definecolor{EUBlue}{HTML}{003399}
\definecolor{EUYellow}{HTML}{FFCC00}
\definecolor{slcolor}{HTML}{882B21}
%===============================================================================
%-------------------------------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%|<--- \paperwidth \paperheight  --->|%
%|<->| \hoffset                      |%
%|   | \voffset                      |%
%|___|____________________________ __|%
%|   |<->| 1in + \oddsidemargin   |  |%
%|   |<->| 1in + \evensidemargin  |  |%
%|   |   |------------------------|  |%
%|   |   | 1in + \topmargin       |  |%
%|   |   |------------------------|  |%
%|   |   | HEADER \headheight     |  |%
%|   |   |------------------------|  |%
%|   |   | \headsep               |  |%
%|   |   |========================|  |%
%|   |   | TEXT  \topskip         |  |%
%|   |   |       \textheight      |  |%
%|   |   |<---   \textwidth   --->|  |%
%|   |   |                        |  |%
%|<-1->| | \marginparwidth        |  |%
%|   | |2| \marginparsep          |  |%
%|   |   |                        |  |%
%|   |   |========================|  |%
%|   |   | \footskip              |  |%
%|   |   |------------------------|  |%
%|   |   | FOOTER \footheight     |  |%
%|   |   |------------------------|  |%
%|___|____________________________|__|%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%-------------------------------------------------------------------------------
\paperwidth     = 210mm     %% 597pt     %% = 8.5in
\paperheight    = 297mm     %% 845pt     %% = 11in
\oddsidemargin  = 0mm       %% Real leftmargin = 1.0 in
\evensidemargin = 0mm       %% Real leftmargin = 1.0 in
\topmargin      = 0mm       %% Real topmargin = (140 - 68) / 144 = 0.5in
\hoffset        = -5.4mm    %% offset for printer's left margin
\voffset        = -25.4mm   %% offset for printer's top margin
\headheight     = 15mm      %% Height of the header
\headsep        = 5mm       %% Separation between header and main text
\footskip       = 8mm      %% Separation between footer and main text
\textwidth      = 170mm     %% 432pt = 6in = 152.4mm
\textheight     = 257mm     %% 10in
%% Letter Paper = 8.5 x 11'' = 612 x 792 pt
%% A4 Paper     = 8.27 x 11.69'' = 597 x 845 pt = 210 x 297 mm
%% 72pt = 1in = 25.4mm
\pdfpagewidth  = \paperwidth  %% Width of the PDF page to create
\pdfpageheight = \paperheight %% Height of the PDF page to create
%-------------------------------------------------------------------------------
\setlength{\parindent}{0pt}
%\setlength{\parskip}{4pt}
%\setlength{\parindent}{12pt}
%\renewcommand{\baselinestretch}{1}
%\setlength{\baselineskip}{30pt}
%\setlength{\abovecaptionskip}{0pt}
% \titlespacing*{<command>}{<left>}{<before-sep>}{<after-sep>}
\titlespacing*{\section}{0pt}{0mm}{-1mm}
\titlespacing*{\subsection}{0pt}{0mm}{-1mm}
\titlespacing*{\subsubsection}{0mm}{0mm}{-1mm}
\setlength{\textfloatsep}{1mm}
\setlength{\floatsep}{1mm}
\setlength{\intextsep}{1mm}
\setlength{\abovecaptionskip}{1mm}
\setlength{\belowcaptionskip}{1mm}
%\renewcommand{\arraystretch}{2}
%\setlength{\extrarowheight}{10mm} % Works only in the tabular
%\newcommand{\rowLineAfter}{6mm}
\newcommand{\rowsepbefore}{1mm}
\newcommand{\rowsepafter}{8mm}
%\setlength{\extrarowheight}{\rowsepbefore}

%-------------------------------------------------------------------------------
%\raggedbottom
%===============================================================================

%===============================================================================
%\setcounter{figure}{0}
%\renewcommand{\figurename}{Fig.}
%\renewcommand{\thefigure}{S\arabic{figure}}
%===============================================================================


%-------------------------------------------------------------------------------
% HE  = Horizon Europe Programme Standard Application Form
% RIA = Research and Innovation Action
% IA  = Innovation Action
% EIC = European Innovation Council
%-------------------------------------------------------------------------------
\newcommand{\callOrg}{EU Grants Application form}
\newcommand{\callRef}{HORIZON-CL6-2022-ZEROPOLLUTION-01-04}
\newcommand{\propIdn}{SEP-21083006}
\newcommand{\propVer}{1.0}
\newcommand{\acronym}{PHOENIX}
\newcommand{\numForm}[2]{\num[minimum-integer-digits=#1]{\number#2}}
\newcommand{\propNum}{\numForm{2}{\day}.\numForm{2}{\month}.\number\year}
\newcommand{\project}{%
    \textsf{Neutralisation of Pathogens in Baltic Polish Water Ecosystem}\\[4mm]
    \large{\textsf{Water Pollution Monitoring, Mitigation, Treatment, and Management}}
}

%-------------------------------------------------------------------------------
\author{}
\title{\vspace{-16mm}
    \centering\includegraphics[height=22mm]{Figures/logo_ce-en-quadri.eps}\\[4mm]
    \textbf{Proposal Part B: Technical description}\\[6mm]
    \textsf{\textbf{\project}}
    \vspace{-20mm}
}
\date{}
%===============================================================================
%-------------------------------------------------------------------------------
\fancypagestyle{plain}{\fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}}
%-------------------------------------------------------------------------------
\fancypagestyle{titlePage}{\fancyhf{}
    \lhead{\scriptsize{\textsf{Call: \callRef}}}
    \rhead{\scriptsize{\textsf{\callOrg: V\propVer\ - \propNum}}}
    \lfoot{\scriptsize{\textsf{Proposal ID: \propIdn}}}
    \cfoot{\scriptsize{\textsf{Acronym: \acronym}}}
    \rfoot{\scriptsize{\textsf{Part B: Page 1 of \pageref{LastPage}}}}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}}
%-------------------------------------------------------------------------------
\fancypagestyle{fancy}{\fancyhf{}
    \lhead{\scriptsize{\textsf{Call: \callRef}}}
    \lfoot{\scriptsize{\textsf{Proposal ID: \propIdn}}}
    \cfoot{\scriptsize{\textsf{Acronym: \acronym}}}
    \rfoot{\scriptsize{\textsf{Part B: Page \thepage\ of \pageref{LastPage}}}}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}}
%-------------------------------------------------------------------------------
%===============================================================================
%===============================================================================
\makeatletter
\def\title#1{\gdef\@title{#1}\gdef\storedAtitle{#1}}
\def\author#1{\gdef\@author{#1}\gdef\storedAauthor{#1}}
\def\date#1{\gdef\@date{#1}\gdef\storedAdate{#1}}
\makeatother


\newcommand{\mc}[3]{\multicolumn{#1}{#2}{#3}}
\newcolumntype{g}{>{\columncolor{gray!10}}c}
\newcolumntype{w}{>{\columncolor{white}}c}
\newcolumntype{G}{>{\columncolor{gray!10}}l}
\newcolumntype{W}{>{\columncolor{white}}l}

%\newcolumntype{M}[1]{>{\centering\arraybackslash}m{#1}}
%\newcolumntype{L}[1]{>{\centering\arraybackslash\raggedleft}p{#1}}
%\newcolumntype{C}[1]{>{\centering\arraybackslash\raggedleft}p{#1}}

\newcolumntype{T}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{B}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}
\newcolumntype{M}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}

\newcolumntype{F}[1]{>{\columncolor{gray!10}\raggedright\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}


%\setlength\arrayrulewidth{0.5pt}
\arrayrulecolor{gray!70}
% !{\color{green}\vrule}
% c!{\vrule width 1.6pt}
%\renewcommand{\arraystretch}{1.5}
\setlength\extrarowheight{1.5mm}
%\setlength{\tabcolsep}{0mm}

%\hhline{~|*7{-}|}
%\cline{2-8}
%==============================================================================

%===============================================================================
% New Environment - Table Participants
\newcommand{\tableParticipants}[1]{%
    %------------------------------------------------------------------------------
    \begin{table}[!ht]
        \renewcommand{\arraystretch}{0.8}
        %\setlength{\extrarowheight}{\rowsepbefore}
        \setlength{\tabcolsep}{2mm}
        \centering \ttfamily
        \noindent\resizebox{\textwidth}{!}{%
            %------------------------------------------------------------------------------
            \begin{tabular}{| c | l | c | c | c |}
                \hline
                \rowcolor{gray!10}
                \textbf{Participant No}                &
                \textbf{Participant Organisation Name} &
                \textbf{Acronym}                       &
                \textbf{Country}                       &
                \textbf{Role}                            \\[1mm] \hline
                %------------------------------------------------------------------------------
                #1%
                %------------------------------------------------------------------------------
                %1 & Materich & MAT & DE & Coordinator \\
                %%2 & Freie Universität Berlin & FUB & DE & Contributor \\
                %2 & Brandenburgischen Technischen Universität& BTU & DE &Contributor \\
                %3 & The Institute of Energy and Fuel Processing Technology &IEP & PL & Contributor\\
                %%3 & Gdańsk University of Technology & GUT & PL & Contributor \\
                %4 & Manthanwar & MAN & IN & Investigator \\
                %5 & STAR-Wik Water Utility & STR & PL & Supporter \\
                %%\arrayrulecolor{gray!2}\hline  \arrayrulecolor{gray!50}
                %%5 & Bayer AG & BAY & DE & Supporter \\
                %%6 & BP Europa SE - Nederland BV & BPN & NL & Supporter \\
                %%7 & Grupa Azoty Zakłady Chemiczne Police SA & GAP & PL & Supporter \\
                %%8 & Yara International ASA & YAR & NO & Supporter \\[1mm]
                %------------------------------------------------------------------------------
                \\\hline
            \end{tabular}}
    \end{table}}
%===============================================================================
%===============================================================================
% List of Work Packages
\newcommand{\tableListofWPs}[2]{
    %\subsubsection{List of Work Packages (Table 3.2a)}
    \setcounter{table}{0}
    \renewcommand{\thetable}{\thesubsection\alph{table}}
    \begin{table}[!ht]
        \renewcommand{\arraystretch}{0.8}
        %\setlength{\extrarowheight}{\rowsepbefore}
        \setlength{\tabcolsep}{2mm}
        \centering
        \caption{List of Work Packages}% (Table 3.2a)}
        \noindent\resizebox{\textwidth}{!}{%
            %------------------------------------------------------------------------------
            \begin{tabular}{|C{16mm}|C{58mm}|C{33mm}|C{33mm}|C{14mm}|C{14mm}|C{14mm}|}
                \hline \rowcolor{gray!10}
                \textbf{Work Package}                     &
                \textbf{Work Package Title}               &
                \textbf{Lead Participant Number}          &
                \textbf{Lead Participant Short Name}      &
                \textbf{Person Months}                    &
                \textbf{Start Month}                      &
                \textbf{End Month}                          \\[1mm] \hline
                %WP1 & Material Discovery        & 1 & MAT & 49.5 & 1 & 30 \\
                %WP2 & Material Optimisation     & 2 & BTU & 35.5 & 3 & 34 \\
                %WP3 & Circular Economy          & 3 & IEP & 28.0 & 21 & 34 \\
                %WP4 & System Integration        & 4 & MAN & 23.5 & 4 & 28 \\
                %WP5 & Knowledge Transfer        & 4 & MAN & 15.0 & 15 & 32 \\
                %WP6 & Project Management        & 1 & MAT & 11.5 & 1 & 36 \\[1mm]
                #1%
                \hline  \multicolumn{7}{c}{}                \\[-4.7mm]\hline \rowcolor{gray!10}
                \multicolumn{4}{|r}{Total Person Months:} &
                \multicolumn{1}{c}{\textbf{#2}}           &
                \multicolumn{2}{c|}{}                       \\ \hline
            \end{tabular}}
    \end{table}}
%==============================================================================

%==============================================================================
% Work Package Table
\newcounter{wp}
%\setcounter{wp}{1}
%  \newcommand{\tableWP}[8]{
%     \addtocounter{wp}{1}
%     \addtocounter{table}{0}
%     \subsubsection{Description WP\arabic{wp} - #1}
%     \renewcommand{\thetable}{\thesubsection\alph{table}\arabic{wp}}
%     \begin{table}[!ht]
%         %\setlength{\extrarowheight}{\rowsepbefore}
%         \renewcommand{\arraystretch}{0.8}
%         \setlength{\tabcolsep}{2mm}
%         \centering
%         \caption{WP\arabic{wp}}% - #1}
%         \noindent\resizebox{\textwidth}{!}{%
%             %\begin{tabular}{|>{\columncolor{gray!10}}l|C{15mm}|C{15mm}|C{15mm}|C{15mm}|C{15mm}|C{15mm}|}
%             \begin{tabular}{|F{60mm}|C{15mm}|C{15mm}|C{15mm}|C{15mm}|C{15mm}|C{15mm}|}
%                 \hline
%                 \textbf{Work Package Number}                                       &
%                 \multicolumn{2}{c|}{\textbf{WP\arabic{wp}}}                        &
%                 \multicolumn{2}{c|}{\cellcolor{gray!10}\textbf{Lead Participant:}} &
%                 \multicolumn{2}{c|}{\textbf{#2}}
%                 \\ \hline
%                 \textbf{Work Package Title}                                        &
%                 \multicolumn{6}{c|}{#1}
%                 \\ \hline
%                 \textbf{Participant Number}                                        & 1   & 2   & 3   & 4   &  &
%                 \\ \hline
%                 \textbf{Participant Short Name}                                    & MAT & MAN & OPL & INS &  &
%                 \\ \hline
%                 \textbf{Person Months Per Participant}                             & #3  & #4  & #5  & #6  &  &
%                 \\ \hline
%                 \textbf{Start Month}                                               &
%                 \multicolumn{2}{c|}{\textbf{#7}}                                   &
%                 \multicolumn{2}{c|}{\textbf{\cellcolor{gray!10} End Month}}        &
%                 \multicolumn{2}{c|}{\textbf{#8}}
%                 \\ \hline
%             \end{tabular}}
%     \end{table}}
%==============================================================================

%-------------------------------------------------------------------------------
% Key Value
% \define@key{pst-icons}{iconWidth}[4]{\newcommand{\iconWidth}{#1}}%
\makeatletter%
\newcommand{\docKey}[2]{%
    \define@key{doc}{#1}[#2]{\@namedef{#1}{##1}}%
    \presetkeys{doc}{#1}{}}%
\makeatother
%===============================================================================
\newcommand{\docSet}[1]{\presetkeys{doc}{#1}{}}%
%===============================================================================

%==============================================================================
% Work Package Table
%\newcounter{wp}
%\setcounter{wp}{1}
%-------------------------------------------------------------------------------
\docKey{wpTitle}{Work Package Title}%
\docKey{wpTeamLead}{}%
\docKey{wpTeamAnum}{}%
\docKey{wpTeamAnam}{}%
\docKey{wpTeamAMon}{}%
\docKey{wpTeamBnum}{}%
\docKey{wpTeamBnam}{}%
\docKey{wpTeamBMon}{}%
\docKey{wpTeamCnum}{}%
\docKey{wpTeamCnam}{}%
\docKey{wpTeamCMon}{}%
\docKey{wpTeamDnum}{}%
\docKey{wpTeamDnam}{}%
\docKey{wpTeamDMon}{}%
\docKey{wpTeamEnum}{}%
\docKey{wpTeamEnam}{}%
\docKey{wpTeamEMon}{}%
\docKey{wpTeamFnum}{}%
\docKey{wpTeamFnam}{}%
\docKey{wpTeamFMon}{}%
\docKey{wpStartMon}{}%
\docKey{wpFinalMon}{}%
%-------------------------------------------------------------------------------
\newcommand{\tableWorkPackage}[1][]{
    \setkeys{doc}{#1}%
    \addtocounter{wp}{1}
    % \addtocounter{table}{0}
    \subsubsection{Description WP\arabic{wp} - \wpTitle}
    % \renewcommand{\thetable}{\thesubsection\alph{subsubsection}\arabic{wp}}
    \renewcommand{\thetable}{\thesubsection b\arabic{wp}}
    \begin{table}[!ht]
        %\setlength{\extrarowheight}{\rowsepbefore}
        \renewcommand{\arraystretch}{0.8}
        \setlength{\tabcolsep}{2mm}
        \centering
        \caption{WP\arabic{wp}}% - #1}
        \noindent\resizebox{\textwidth}{!}{%
            %\begin{tabular}{|>{\columncolor{gray!10}}l|C{15mm}|C{15mm}|C{15mm}|C{15mm}|C{15mm}|C{15mm}|}
            \begin{tabular}{|F{70mm}|C{15mm}|C{15mm}|C{15mm}|C{15mm}|C{15mm}|C{15mm}|}
                \hline
                \textbf{Work Package Number}                                       &
                \multicolumn{2}{c|}{\textbf{WP\arabic{wp}}}                        &
                \multicolumn{2}{c|}{\cellcolor{gray!10}\textbf{Lead Participant:}} &
                \multicolumn{2}{c|}{\textbf{\wpTeamLead}}
                \\ \hline
                \textbf{Work Package Title}                                        &
                \multicolumn{6}{c|}{\wpTitle}
                \\ \hline
                \textbf{Participant Number}                                        & \wpTeamAnum & \wpTeamCnum
                                                                                   & \wpTeamCnum & \wpTeamDnum & \wpTeamEnum & \wpTeamFnum
                \\ \hline
                \textbf{Participant Short Name}                                    & \wpTeamAnam & \wpTeamBnam & \wpTeamCnam
                                                                                   & \wpTeamDnam & \wpTeamEnam & \wpTeamFnam
                \\ \hline
                \textbf{Person Months Per Participant}                             & \wpTeamAMon & \wpTeamBMon
                                                                                   & \wpTeamCMon & \wpTeamDMon & \wpTeamEMon & \wpTeamFMon
                \\ \hline
                \textbf{Start Month}                                               &
                \multicolumn{2}{c|}{\textbf{\wpStartMon}}                          &
                \multicolumn{2}{c|}{\textbf{\cellcolor{gray!10} End Month}}        &
                \multicolumn{2}{c|}{\textbf{\wpFinalMon}}
                \\ \hline
            \end{tabular}}
    \end{table}}
%==============================================================================

%===============================================================================
% Task
\def\ifempty#1{\def\temp{#1}\ifx\temp\empty}
        \def\milestoneEmpty#1{\ifempty{#1}{}\else{; Milestones: #1}\fi}

\newcommand{\task}[8]{
    \renewcommand{\arraystretch}{1}
    %\setlength{\extrarowheight}{\rowsepbefore}
    \setlength{\tabcolsep}{0mm}
    \begin{tabular}{
        >{\raggedright\arraybackslash}p{40mm}%
        >{\raggedright\arraybackslash}p{90mm}%
        >{\raggedleft\arraybackslash}p{20mm}%
        >{\raggedleft\arraybackslash}p{20mm}%
        }
        \multicolumn{4}{l}{%
        \textbf{Task #1 (Deliverables: #2\milestoneEmpty{#3})}} \\[-1mm]
        \multicolumn{4}{p{170mm}}{Title: \emph{#4}}             \\[-1mm]
        Lead: #5         &
        Contributors: #6 &
        Start: M#7       &
        End: M#8
        %\multicolumn{4}{p{170mm}}%{#9}
    \end{tabular}
    %\vspace{1mm}
}
%
%\cellcolor{yellow!10}Lead: #5 &
%\cellcolor{gray!10}Contributors: #6 &
%\cellcolor{teal!10}Start: M#7 &
%\cellcolor{pink!10}End: M#8\\[-1mm]
%===============================================================================
%===============================================================================
% Deliverable
\newcommand{\deliverable}[5]{
    \renewcommand{\arraystretch}{1}
    \setlength{\tabcolsep}{0mm}
    \begin{tabular}{@{\hspace{4mm}}
        >{\raggedright\arraybackslash}p{4mm}@{}
        >{\raggedright\arraybackslash}p{40mm}@{}
        >{\raggedright\arraybackslash}p{30mm}@{}
        >{\raggedright\arraybackslash}p{72mm}@{}
        >{\raggedleft\arraybackslash} p{20mm}@{}}
        $\bullet$ & \emph{Deliverable #1}               & Lead: #2 & Contributors: #3
                  & Date: M#4                                                         \\[-2mm]
                  & \multicolumn{4}{@{}p{160mm}@{}}{#5}                               \\[-2mm]
    \end{tabular}}
%------------------------------------------------------------------------------
%===============================================================================
%===============================================================================
% Milestones
\newcommand{\milestone}[5]{
    \renewcommand{\arraystretch}{1}
    \setlength{\tabcolsep}{0mm}
    \begin{tabular}{@{\hspace{4mm}}
        >{\raggedright\arraybackslash}p{4mm}@{}
        >{\raggedright\arraybackslash}p{40mm}@{}
        >{\raggedright\arraybackslash}p{30mm}@{}
        >{\raggedright\arraybackslash}p{72mm}@{}
        >{\raggedleft\arraybackslash} p{20mm}@{}}
        \rput(0.1,0.1){\scriptsize{$\blacklozenge$}} & \emph{Milestone #1}                 & Lead: #2 & Contributors: #3
                                                     & Date: M#4                                                         \\[-2mm]
                                                     & \multicolumn{4}{@{}p{160mm}@{}}{#5}                               \\[-2mm]
    \end{tabular}}
%------------------------------------------------------------------------------
%==============================================================================
% List of Deliverables
\newcommand{\tableListofDeliverables}[1]{
    %\subsubsection{List of Deliverables (Table 3.2c)}
    \begin{table}[!ht]
        \renewcommand{\arraystretch}{0.8}
        %\setlength{\extrarowheight}{\rowsepbefore}
        \setlength{\tabcolsep}{2mm}
        \centering
        \renewcommand{\thetable}{\thesubsection c}
        \caption{List of Deliverables}
        \noindent\resizebox{\textwidth}{!}{%
            %------------------------------------------------------------------------------
            \begin{tabular}
                %{|C{16mm}|C{55mm}|C{34mm}|C{34mm}| C{14mm} | C{14mm} | C{14mm} |}
                {|C{20mm}|L{114mm}|C{10mm}|C{10mm}|C{14mm}|C{10mm}|C{20mm}|}
                \hline \rowcolor{gray!10}
                \textbf{Deliverable}        &
                \textbf{Work Package Title} &
                \textbf{WP}                 &
                \textbf{Lead}               &
                \textbf{Type}               &
                \textbf{Level}              &
                \textbf{In Months}            \\ \hline
                #1
                %1.4 D1	&	Internal reports and written protocols 	&	WP1	&	IEP	&	DEM	&	PU	&	4	\\[1mm] \hline
                %2.1 D1	&	Internal report and written protocols	&	WP2	&	BTU	&	R	&	PU	&	5	\\[1mm] \hline
            \end{tabular}}
    \end{table}}
%==============================================================================
%==============================================================================
% List of Milestones
\newcommand{\tableListofMilestones}[1]{
    %\subsubsection{List of Milestones (Table 3.1d)}
    \begin{table}[!ht]
        %\setlength{\extrarowheight}{\rowsepbefore}
        \renewcommand{\arraystretch}{0.8}
        \setlength{\tabcolsep}{2mm}
        \centering
        \renewcommand{\thetable}{\thesubsection d}
        \caption{List of Milestones}
        \noindent\resizebox{\textwidth}{!}{%
            %------------------------------------------------------------------------------
            \begin{tabular}
                %{|C{16mm}|C{55mm}|C{34mm}|C{34mm}| C{14mm} | C{14mm} | C{14mm} |}
                {|C{22mm}|L{100mm}|c|c|c|}
                \hline \rowcolor{gray!10}
                \textbf{Milestone}   &
                \textbf{Title}       &
                \textbf{Related WPs} &
                \textbf{In Months}   &
                \textbf{Verification}  \\ \hline
                #1
                %1.1 M1	&	Ranking framework developed	&	WP1	&	4	&	Minutes of WP1	\\[1mm] \hline
                %1.2 M1	&	Literature candidate synthesised for benchmarking	&	WP1	&	6	&	Minutes of WP1	\\[1mm] \hline
                %1.2 M2	&	First Candidate Catalyst synthesised	&	WP1	&	12	&	Minutes of WP1	\\[1mm] \hline
                %1.4 M1	&	Lab and Pilot scale reasearch units ready for testing 	&	WP1	&	4	&	Minutes of WP1	\\[1mm] \hline
                %2.1 M1	&	Calibrated instruments ready	&	WP2	&	5	&	Minutes of WP2	\\[1mm] \hline
                %4.1 M1	&	Online software platform delivered	&	WP4	&	11	&	Minutes of WP4	\\[1mm] \hline
            \end{tabular}}
    \end{table}}
%==============================================================================
%==============================================================================
% List of Risks
\newcommand{\tableListofRisks}[1]{
    \begin{table}[!ht]
        %\setlength{\extrarowheight}{\rowsepbefore}
        \renewcommand{\arraystretch}{0.8}
        \setlength{\tabcolsep}{2mm}
        \centering
        \renewcommand{\thetable}{\thesubsection e}
        %\caption{List of critical risks (table 3.1e)}
        \caption{List of Critical Risks}
        \noindent\resizebox{\textwidth}{!}{%
            %------------------------------------------------------------------------------
            \begin{tabular}
                %{|p{75mm}|C{30mm}|p{75mm}|}
                {|p{60mm}|C{35mm}|C{24mm}|p{80mm}|}
                \hline \rowcolor{gray!10}
                \textbf{Risk Description}    &
                \textbf{Likelihood/Severity} &
                \textbf{Related WPs}         &
                \textbf{Proposed Risk-Mitigation Measures} \\ \hline
                #1
                %    Work programme is suboptimal low/medium	&	WP1-WP5	&	Literature will be studied thoroughly	\\[1mm] \hline
                %Delay in experimental results: low/medium	&	WP1-WP3	&	Conventional materials will be ordered	\\[1mm] \hline
                %Material/service cost undervalued: low/low	&	WP1-WP3	&	Prioritise resources using quotes/experience	\\[1mm] \hline
                %Poor financial control: low/low	&	WP1-WP6	&	Expert Admin/finance staff will be involved	\\[1mm] \hline
                %Findings of risk assessments: low/medium	&	WP1-WP6	&	Any changes required will be noticed to EU	\\[1mm] \hline
                %Covid pandemic worsens: low/medium	&	WP1-WP6	&	Some work can be carried out from hom	\\[1mm] \hline
            \end{tabular}}
    \end{table}}
%==============================================================================
%===============================================================================
%==============================================================================
% Summary of Staff Efforts
\newcommand{\tableStaffEffortsSummary}[3]{
    \begin{table}[!ht]
        %\setlength{\extrarowheight}{\rowsepbefore}
        \renewcommand{\arraystretch}{0.8}
        \setlength{\tabcolsep}{4mm}
        \centering
        \renewcommand{\thetable}{\thesubsection f}
        \caption{Summary of Staff Efforts}% (Table 3.1f)}
        \noindent\resizebox{\textwidth}{!}{%
            %------------------------------------------------------------------------------
            \begin{tabular}
                {|G|c|c|c|c|c|c|g|}
                %\cline{8-8}\\[-6.1mm]
                \rowcolor{gray!10}
                \hhline{~|*7{-}|}
                %\cline{2-8}
                \multicolumn{1}{c|}{\cellcolor{white}}                        &
                \textbf{WP1}                                                  &
                \textbf{WP2}                                                  &
                \textbf{WP3}                                                  &
                \textbf{WP4}                                                  &
                \textbf{WP5}                                                  &
                \textbf{WP6}                                                  &
                \textbf{Participant Person Months}                                               \\ \hline
                % 1. MAT                                              & 17   & 4    & 4.5  & 0.5 & 2    & 4   & 32 \\[1mm] \hline
                % 2. BTU                                              & 3    & 28.5 & 3    & 0   & 1    & 0.5 & 36 \\[1mm] \hline
                % 3. IEP                                              & 26.5 & 0    & 18.5 & 2   & 7    & 5   & 59 \\[1mm] \hline
                % 4. MAN                                                & 3    & 3    & 2    & 21  & 5    & 2   & 36 \\[1mm] \hline
                % \rowcolor{gray!10} Total Person Months\hspace{10mm} &
                % 49.5                                                & 35.5 & 28   & 23.5 & 15  & 11.5
                % & \textbf{163}   
                #1                                                                               \\[-13.4pt]\hline
                \multicolumn{1}{|c|}{\text{\cellcolor{gray!10}Total Efforts}} & #2 & \textbf{#3}
                \\ \hline
            \end{tabular}}
    \end{table}}
%==============================================================================
%===============================================================================
% Staff Efforts Justification of Resources
\newcommand{\tableStaffEffortsJustification}[2]{
    \begin{table}[!ht]
        %\setlength{\extrarowheight}{\rowsepbefore}
        \renewcommand{\arraystretch}{0.8}
        %\setlength{\extrarowheight}{\rowsepbefore}
        \setlength{\tabcolsep}{2mm}
        \centering
        \renewcommand{\thetable}{\thesubsection f2}
        \caption{Justification of Staff Efforts}% (Table 3.1g)}
        \noindent\resizebox{\textwidth}{!}{%
            %------------------------------------------------------------------------------
            \begin{tabular}
                {|L{40mm}|L{160mm}|C{15mm}|C{15mm}|}
                \hline \rowcolor{gray!10}
                \textbf{Resource}                                          &
                \textbf{Task Assigned/Months}                              &
                \textbf{Months}                                              \\ \hline
                %MAT Researcher 1	&	1.1/3, 1.2/9, 1.3/5, 2.1/1, 2.3/2, 2.5/1, 3.1/1, 3.2/1, 3.3/1, 3.4/0.5, 3.5/1, 4.2/0.5, 5.1/1, 5.1/1, 6.1/3, 6.2/1	&	32	\\[1mm] \hline
                %BTU Researcher 1	&	1.1/2, 1.3/1, 2.1/3, 2.2/5, 2.3/13.5, 2.4/7, 3.2/2, 3.4/1, 5.1/0.5, 5.2/0.5, 6.1/0.5	&	36	\\[1mm] \hline
                %IEP Researcher 1	&	1.4/1 , 1.5/1, 1.6/1, 1.7/6, 3.2/2, 3.4/2, 5.1/1, 5.2/2, 6.1/1	&	17	\\[1mm] \hline
                %IEP Researcher 2	&	1.4/0.5, 1.5/1, 1.6/1, 1.7/6, 3.2/1.5, 3.3/0.5,  3.4/2,.4/0.5	&	13	\\[1mm] \hline
                %IEP Researcher 3	&	1.7/0.5, 3.2/0.5, 3.3/0.5, 4.1/1, 4.3/1, 5.2/3, 6.1/3	&	9.5	\\[1mm] \hline
                %IEP Researcher 4	&	1.7/0.5, 3.1/1, 3.4/1, 5.2/0.5, 6.1/1	&	4	\\[1mm] \hline
                %IEP Researcher 5	&	1.6/0.5, 1.7/1, 3.2/0.5, 3.4/1	&	3	\\[1mm] \hline
                %IEP Engineer 1	&	1.6/0.5, 1.7/1, 3.2/0.5, 3.4/0.5	&	2.5	\\[1mm] \hline
                %IEP Engineer 2	&	1.6/0.5, 1.7/1, 3.2/0.5, 3.4/0.5	&	2.5	\\[1mm] \hline
                %IEP Engineer 3	&	1.5/0.5, 1.6/0.5, 1.7/1, 3.2/1, 3.4/1	&	4	\\[1mm] \hline
                %IEP Engineer 4	&	1.5/0.5, 1.7/1, 3.2/1, 3.4/1	&	3.5	\\[1mm] \hline
                %MAN Researcher 1	&	1.1/2, 1.7/2, 2.5/3, 3.1/1, 3.5/1, 4.1/7, 4.2/7, 4.3/7, 5.1/2, 5.2/3, 6.1/2	&	36	\\[1mm] \hline
                #1
                \rowcolor{gray!10}\multicolumn{2}{|r}{Total Person Months} &
                %{\textbf{163}}
                {\textbf{#2}}
                \\ \hline
            \end{tabular}}
    \end{table}}
%==============================================================================
%===============================================================================
% Cost Subcontracting
\newcommand{\tableCostSubcontract}[3]{
    %\subsubsection{Subcontracting Costs (Table 3.1g)}
    \begin{table}[!ht]
        \renewcommand{\arraystretch}{0.8}
        %\setlength{\extrarowheight}{\rowsepbefore}
        \setlength{\tabcolsep}{2mm}
        \centering
        \renewcommand{\thetable}{\thesubsection g}
        \caption{Subcontracting Costs}% (Table 3.1g)}
        \noindent\resizebox{\textwidth}{!}{%
            %------------------------------------------------------------------------------
            \begin{tabular}
                {|G|c|L{100mm}|}
                \hline
                \rowcolor{gray!10}
                \multicolumn{2}{|r|}{\textbf{Participant Number/Short Name}} &
                %\textbf{1/MAT}
                \textbf{#1}
                \\ \hline
                \rowcolor{gray!10}                                           & \textbf{Costs (EUR)}                          & \textbf{Description of tasks and justification}
                \\ \hline
                Subcontracting \hspace{20mm}                                 &
                %15000 & For characterization of selected material samples,
                {#2}                                                         & \multicolumn{1}{m{100mm}|}{\footnotesize{#3}}
                \\ \hline
            \end{tabular}}
    \end{table}}
%==============================================================================
%===============================================================================
% Cost Purchase
%\newcommand{\tableCostPurchaseTravel}[1]{#1}
%------------------------------------------------------------------------------
\newcommand{\tableCostPurchaseTravel}[1]{\def\tableCostPurchaseTravelTemp{#1}}
\newcommand{\tableCostPurchaseEquip}[1]{\def\tableCostPurchaseEquipTemp{#1}}
\newcommand{\tableCostPurchaseOther}[1]{\def\tableCostPurchaseOtherTemp{#1}}
\newcommand{\tableCostPurchaseRemain}[1]{\def\tableCostPurchaseRemainTemp{#1}}
%------------------------------------------------------------------------------
\newcounter{purchaseCost}
\newcommand{\tableCostPurchase}[6]{
    \addtocounter{purchaseCost}{1}
    %\subsubsection{Purchase Costs (Table 3.1h)}
    \begin{table}[!ht]
        \renewcommand{\arraystretch}{0.8}
        \setlength{\tabcolsep}{2mm}
        \centering
        \renewcommand{\thetable}{\thesubsection h\arabic{purchaseCost}}
        \caption{Purchase Costs  - #1}
        \noindent\resizebox{\textwidth}{!}{%
            %------------------------------------------------------------------------------
            \begin{tabular}
                {|F{45mm}|C{25mm}|L{100mm}|}
                \hline \rowcolor{gray!10}
                \multicolumn{2}{|r|}{\textbf{Participant Number/Short Name}} & \textbf{#1}
                \\\hline
                \rowcolor{gray!10}                                           & \textbf{Costs (EUR)} & \textbf{Justification}
                \\\hline
                Travel and subsistence                                       & #2                   &
                \multicolumn{1}{m{100mm}|}{\footnotesize{\tableCostPurchaseTravelTemp}}
                \\\hline
                Equipment                                                    & #3                   &
                \multicolumn{1}{m{100mm}|}{\footnotesize{\tableCostPurchaseEquipTemp}}
                \\\hline
                Other goods, works/services                                  & #4                   &
                \multicolumn{1}{m{100mm}|}{\footnotesize{\tableCostPurchaseOtherTemp}}
                \\\hline
                Remaining purchase costs                                     & #5                   &
                \multicolumn{1}{m{100mm}|}{\footnotesize{\tableCostPurchaseRemainTemp}}
                \\\hline
                Total                                                        & \textbf{#6}          &                        \\\hline
            \end{tabular}}
    \end{table}}
%==============================================================================
%==============================================================================
% Table Cost Other Categories
\newcommand{\tableCostOther}[4]{
    %\subsubsection{Other Costs Categories (Table 3.1i) - Not Applicable}
    %==============================================================================
    %------------------------------------------------------------------------------
    \begin{table}[!ht]
        \renewcommand{\arraystretch}{0.8}
        \setlength{\tabcolsep}{2mm}
        \centering
        \renewcommand{\thetable}{\thesubsection i}
        \caption{Other Costs Categories}
        \noindent\resizebox{\textwidth}{!}{%
            %------------------------------------------------------------------------------
            \begin{tabular}
                {|F{45mm}|C{25mm}|L{100mm}|}
                \hline
                \rowcolor{gray!10}
                \multicolumn{2}{|r|}{\textbf{Participant Number/Short Name}} &
                \textbf{#1}
                \\\hline
                \rowcolor{gray!10}                                           & \textbf{Costs (EUR)} & \textbf{Description of tasks and justification}
                \\[1mm] \hline
                Invoiced goods/services                                      & #2                   & #3
                \\\hline
                Total                                                        & \textbf{#4}          &
                \\\hline
            \end{tabular}}
    \end{table}}
%===============================================================================
%==============================================================================
% Table Cost Inkind
%\subsubsection{In-kind Contributions from third parties (Table 3.1j) - Not Applicable}
\newcommand{\tableCostInkind}[5]{
    \begin{table}[!ht]
        \renewcommand{\arraystretch}{0.8}
        \setlength{\tabcolsep}{2mm}
        \centering
        \renewcommand{\thetable}{\thesubsection j}
        \caption{In-kind Contributions from third parties}% (Table 3.1j)
        \noindent\resizebox{\textwidth}{!}{%
            %------------------------------------------------------------------------------
            \begin{tabular}
                {|C{40mm}|C{25mm}|C{25mm}|L{80mm}|}
                \hline
                \rowcolor{gray!10}
                \multicolumn{2}{|r|}{\textbf{Participant Number/Short Name}} &
                \multicolumn{2}{l|}{\textbf{#1}}
                \\\hline
                \rowcolor{gray!10} \textbf{Third Party Name}                 & \textbf{Category} & \textbf{Costs (EUR)} & \textbf{Description of tasks and justification}
                \\\hline
                #2                                                           & #3                & #4                   & #5
                \\\hline
            \end{tabular}}
    \end{table}}
%===============================================================================

%===============================================================================
% Table Impact Summary I
%------------------------------------------------------------------------------
\newcommand{\impactSummaryItemize}[1]{
    \begin{minipage}[t]{\linewidth}
        \begin{itemize}[nosep,left=-0mm,itemindent=4mm]
            %\vspace{-6mm}
            %\setlength{\itemindent}{-4mm}
            %\setlength{\labelsep}{2mm}
            \setlength{\itemsep}{0mm}
            \setlength{\partopsep}{0pt}
            \setlength{\parskip}{0pt}
            \setlength{\parsep}{0pt}
            \setlength{\topsep}{0pt}
            #1
        \end{itemize}
        \vspace{2mm}
    \end{minipage}
}
%------------------------------------------------------------------------------
\newcommand{\tableImpactSummaryNeeds}[1]{\def\tableImpactSummaryNeedsTemp{#1}}
\newcommand{\tableImpactSummaryResult}[1]{\def\tableImpactSummaryResultTemp{#1}}
\newcommand{\tableImpactSummaryMeasure}[1]{\def\tableImpactSummaryMeasureTemp{#1}}
%------------------------------------------------------------------------------
\newcommand{\tableImpactSummaryI}{
    %\subsection{Impact summary}
    %==============================================================================
    \begin{table}[!ht]
        %\arrayrulecolor{cyan}
        %\setlength{\tabcolsep}{12pt}
        %\setlength\extrarowheight{30mm}
        \renewcommand{\arraystretch}{1}
        \setlength{\tabcolsep}{2mm}
        \centering
        %\caption{Impact Summary}
        \noindent\resizebox{\textwidth}{!}{
            %------------------------------------------------------------------------------
            \begin{tabular}[t]{| C{56mm} | c | C{56mm} | c | C{56mm} | }
                %\rowcolor{cyan!80!black}
                %\rowcolor{ICBlueDark}
                \rowcolor{SteelBlue}
                \textbf{\textcolor{white}{SPECIFIC NEEDS}}   &
                \cellcolor{gray!10}                          &
                \textbf{\textcolor{white}{EXPECTED RESULTS}} &
                \cellcolor{white}                            &
                \textbf{\textcolor{white}{D \& E \& C MEASURES}}   \\[1mm]
                %------------------------------------------------------------------------------
                \impactSummaryItemize{\tableImpactSummaryNeedsTemp}
                                                             &   &
                \impactSummaryItemize{\tableImpactSummaryResultTemp}
                                                             &   &
                \impactSummaryItemize{\tableImpactSummaryMeasureTemp}
                \\
                \cline{1-1} \cline{3-3} \cline{5-5}
            \end{tabular}}
    \end{table}}
%==============================================================================
%===============================================================================
% Table Impact Summary II
%------------------------------------------------------------------------------
\newcommand{\tableImpactSummaryTarget}[1]{\def\tableImpactSummaryTargetTemp{#1}}
\newcommand{\tableImpactSummaryOutcome}[1]{\def\tableImpactSummaryOutcomeTemp{#1}}
\newcommand{\tableImpactSummaryImpact}[1]{\def\tableImpactSummaryImpactTemp{#1}}
%------------------------------------------------------------------------------
\newcommand{\tableImpactSummaryII}{
    %==============================================================================
    \begin{table}[!ht]
        %\arrayrulecolor{white}
        %\setlength\extrarowheight{30mm}
        \renewcommand{\arraystretch}{1}
        \setlength{\tabcolsep}{2mm}
        \centering
        \noindent\resizebox{\textwidth}{!}{
            %------------------------------------------------------------------------------
            \begin{tabular}{| C{56mm} | c | C{56mm} | c | C{56mm} | }
                %\rowcolor{cyan}
                \rowcolor{SteelBlue}
                \textbf{\textcolor{white}{TARGET GROUPS}} &
                \cellcolor{gray!10}                       &
                \textbf{\textcolor{white}{OUTCOMES}}      &
                \cellcolor{white}                         &
                \textbf{\textcolor{white}{IMPACTS}}             \\[1mm]
                \impactSummaryItemize{\tableImpactSummaryTargetTemp}
                                                          &   &
                \impactSummaryItemize{\tableImpactSummaryOutcomeTemp}
                                                          &   &
                \impactSummaryItemize{\tableImpactSummaryImpactTemp}
                \\[1mm]
                \cline{1-1} \cline{3-3} \cline{5-5}
            \end{tabular}}
    \end{table}}
%==============================================================================
%===============================================================================
%==============================================================================
%%%% GANTT CHART
%\begin{figure}
%  \centering
%
%  \begin{ganttchart}%
%    [
%    x unit = 0.25cm,
%    y unit title=0.4cm,
%    y unit chart=0.4cm,
%    vgrid,
%    title/.style={draw=black!50, fill=green!50!black},
%    title label font=\sffamily\bfseries\color{white},
%    title label anchor/.style={below=-1.6ex},
%    title left shift=.05,
%    title right shift=-.05,
%    title height=1,
%    bar/.style={draw=none, fill=blue!75},
%    bar height=.6,
%    bar label font=\small\color{black!50},
%    milestone label font=\small\color{red!50},
%    group right shift=0,
%    group top shift=.6,
%    group height=.3,
%    group peaks={}{}{.2},
%    incomplete/.style={fill=red}]{60}
%    \gantttitle{ACRONYM}{60} \\
%    \gantttitle{Year 1}{12}
%    \gantttitle{Year 2}{12}
%    \gantttitle{Year 3}{12}
%    \gantttitle{Year 4}{12}
%    \gantttitle{Year 5}{12} \\
%
%    \ganttchartdata % data generated by the ICTProposal.cls
%
%  \end{ganttchart}
%
%  \caption[Gantt chart]{Project Gantt chart.}
%  \label{fig:gantt}
%\end{figure}
%==============================================================================
\ganttset{%canvas/.style={fill=yellow!2,draw=gray},
    hgrid, vgrid,
    x unit = 10mm,
    %y unit title=10mm,
    y unit chart=10mm,
    %vgrid,
    vgrid={*{6}{red, dotted},*{6}{blue,dotted}},
    %bar height=0.6,
    title label font=\large\color{black},
    title/.style={draw=black!50, fill=green!5},
    %milestone label left shift = 2,
    milestone label node/.style={left=2mm},
    milestone label node/.style={font=\large\itshape\color{black}, left=2mm},
    group label node/.style={left=2mm,color=black, font=\bfseries\large{#1}},
    %group height=0.2pt,
    %bar height=0.01pt,
    bar label node/.style={left=2mm},
    bar label node/.style={font=\large\color{black}, left=2mm},
    %milestone label node/.style={right=2mm},
    bar progress label node/.style={right=4mm},
    bar incomplete/.append style={fill=gray!50},
    group incomplete/.append style={draw=black,fill=none},
    link/.style={->, black, rounded corners=1mm}}
%------------------------------------------------------------------------------
%==============================================================================
\newcommand{\ganttStyleWPi}{
    \ganttset{group/.append style={draw=black, fill=red!40},
    group incomplete/.append style={draw=black,fill=red!10},
    bar/.style={draw=black, fill=red!10},
    %bar/.style={draw=black, fill=gray!10},
    %bar incomplete/.append style={fill=red!10}
}}
%---------------+---------+----------------------------------------------------
\newcommand{\ganttStyleWPii}{
    \ganttset{group/.append style={draw=black, fill=Dandelion!60},
    group incomplete/.append style={draw=black,fill=Dandelion!10},
    bar/.style={draw=black, fill=Dandelion!10},
    %bar/.style={draw=black, fill=gray!10},
    %bar incomplete/.append style={fill=Dandelion!10}
}}
%---------------+---------+----------------------------------------------------
\newcommand{\ganttStyleWPiii}{
    \ganttset{group/.append style={draw=black, fill=green!60},
    group incomplete/.append style={draw=black,fill=green!10},
    bar/.style={draw=black, fill=green!10},
    %bar/.style={draw=black, fill=gray!10},
    %bar incomplete/.append style={fill=green!10}
}}
%---------------+---------+----------------------------------------------------
\newcommand{\ganttStyleWPiv}{
    \ganttset{group/.append style={draw=black, fill=cyan!40},
    group incomplete/.append style={draw=black,fill=cyan!10},
    bar/.style={draw=black, fill=cyan!10},
    %bar/.style={draw=black, fill=gray!10},
    %bar incomplete/.append style={fill=cyan!10}
}}
%---------------+---------+----------------------------------------------------
\newcommand{\ganttStyleWPv}{
    \ganttset{group/.append style={draw=black, fill=violet!40},
    group incomplete/.append style={draw=black,fill=violet!10},
    bar/.style={draw=black, fill=violet!10},
    %bar/.style={draw=black, fill=gray!10},
    %bar incomplete/.append style={fill=violet!10}
}}
%---------------+---------+----------------------------------------------------
\newcommand{\ganttStyleWPvi}{
    \ganttset{group/.append style={draw=black, fill=Tan!60},
    group incomplete/.append style={draw=black,fill=Tan!10},
    bar/.style={draw=black, fill=Tan!10},
    %bar/.style={draw=black, fill=gray!10},
    %bar incomplete/.append style={fill=Tan!10}
}}
%===============================================================================
%%%% GANTT CHART
\newcommand{\figGanttChart}[1]{
    %\subsubsection{Project management Gantt Chart}
    %---------------+---------+----------------------------------------------------
    \begin{figure}[!ht]
        \centering
        \noindent\resizebox{!}{120mm}{
            %\noindent\resizebox{\textwidth}{!}{
            %\noindent\resizebox{\textwidth}{100mm}{
            %---------------+---------+----------------------------------------------------
            \begin{ganttchart}{1}{36}
                %------------------------------------------------------------------------------
                %------------------------------------------------------------------------------
                #1
                %------------------------------------------------------------------------------
                %------------------------------------------------------------------------------
                %------------------------------------------------------------------------------
            \end{ganttchart}
            %------------------------------------------------------------------------------
        }
        %------------------------------------------------------------------------------
        \caption[Gantt chart]{Project Gantt chart.}
        %\label{fig:gantt}
    \end{figure}}
%==============================================================================
