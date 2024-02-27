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
\ProvidesClass{euria}[2024/02/27 EU Research Innovation Actions]
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
% \RequirePackage{hhline}
%\RequirePackage[compact]{titlesec}
\RequirePackage{titlesec}
\RequirePackage{caption}
\captionsetup[figure]{font=footnotesize}

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
\titlespacing*{\section}{0pt}{0mm}{-2mm}
\titlespacing*{\subsection}{0pt}{0mm}{-2mm}
\titlespacing*{\subsubsection}{0mm}{0mm}{-2mm}
\setlength{\textfloatsep}{1mm}
\setlength{\floatsep}{1mm}
\setlength{\intextsep}{1mm}
%\renewcommand{\arraystretch}{2}
%\setlength{\extrarowheight}{10mm} % Works only in the tabular
%\newcommand{\rowLineAfter}{6mm}
\newcommand{\rowsepbefore}{1mm}
\newcommand{\rowsepafter}{8mm}
%\setlength{\extrarowheight}{\rowsepbefore}

%-------------------------------------------------------------------------------
%\raggedbottom
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
