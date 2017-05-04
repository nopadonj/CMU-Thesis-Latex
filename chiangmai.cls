%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% File: nopadon_cmu_dissertation.tex
%% Author: Nopadon Juneam
%% Date:  May 4, 2017
%% Email: juneam.n@gmail.com, nopadon_j@cmu.ac.th
%% Department of Computer Science, Chiang Mai University
%%
%% This is the main tex file of the latex template for Thesis and Dissertation for Chiang Mai University.
%% The propose of the tex file is to demonstrate the use of CMU Thesis & Dissertation Package for writing a %% thesis/dissertation according to the format of the graduate school of Chiang Mai University.
%%
%% Caution: Please keep in mind that the file is not the official template from the graduate school of 
%% Chiang Mai University. However, the author's dissertation using this tex file have passed the school's 
%% inspection (in April 2017).
%%
%% Credit: This main tex file is modified from the original latex template for Theses and Dissertation of 
%% Chulalongkorn University by Dr. Nattee Niparnan.
%%
%% The file is compatible with XeLaTex and tested with TeX Live 2016 Version 3.14159265.
%% 
%% You can freely modify the file.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Identification %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{chiangmai}[2016/12/14]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Initial Code %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{calc}
\RequirePackage{fontspec}
%\setmainfont{Times New Roman}
%\newfontfamily\cyrillicfont{Times New Roman}
\setmainfont[
  %Ligatures=TeX,
  SmallCapsFont={TeX Gyre Termes},
  SmallCapsFeatures={Letters=SmallCaps},
]{Times New Roman}
\RequirePackage{xunicode}
\RequirePackage{xltxtra}
\RequirePackage{polyglossia}
\RequirePackage{ragged2e}
\RequirePackage{tikz}
%\RequirePackage{showframe}
\RequirePackage{setspace}
\RequirePackage{geometry}
%\RequirePackage{afterpage}
\RequirePackage{ucharclasses}
\setTransitionTo{Thai}{\fontspec{Angsana New}}
%\setTransitionTo{Thai}{\fontspec{Garuda}}
\usepackage{xltxtra} 

%\newfontfamily\thaifont[BoldFont={Garuda-Bold:script=thai},
%                 ItalicFont={Garuda-Oblique:script=thai},
%                 BoldItalicFont={Garuda-BoldOblique:script=thai}
%                ]{Garuda:script=thai} 
\setdefaultlanguage{english}
\setotherlanguage{thai}
\XeTeXlinebreaklocale “th_TH” 

\newif\if@doctor
\newif\if@firstcoadvisor
\newif\if@secondcoadvisor
\newif\if@thaithesis

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Option Declaration %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareOption{doctor} {
  \@doctortrue
} \DeclareOption{master} {
  \@doctorfalse
} \DeclareOption{firstcoadvisor} {
  \@firstcoadvisortrue
} \DeclareOption{secondcoadvisor} {
  \@secondcoadvisortrue
} \DeclareOption{thaithesis} {
  \@thaithesistrue
} \DeclareOption{engthesis} {
  \@thaithesisfalse
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}  % pass any unknown option to the report class

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Option Execution %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ExecuteOptions{master,thaithesis}
\ProcessOptions

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Class & Package Loading %%%%%%%%%%%%%%%%%%%%%%%%%%
\LoadClass{report}           % this class is based on the report class

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Main Code %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\AtEndOfClass{
\onehalfspacing
 %\linespread{1.3}
 
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% localize the strings (xxxxname )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\selectthesislang{
  \if@thaithesis
    \selectlanguage{thai}
  \else
    \selectlanguage{english}
  \fi
}

%% string setting
\if@doctor
  \newcommand{\@ThaiDegreeType}{ปริญญาดุษฎีบัณฑิต}
  \newcommand{\@EnglishDegreeType}{Doctoral Degree}
\else
  \newcommand{\@ThaiDegreeType}{ปริญญามหาบัณฑิต}
  \newcommand{\@EnglishDegreeType}{Master's Degree}
\fi

\if@thaithesis
  %% my new string
  \newcommand{\@AcknowledgementsString}{กิตติกรรมประกาศ}
  \newcommand{\@BiographyString}{ประวัติผู้เขียนวิทยานิพนธ์}
  \newcommand{\@AbstractThaiString}{บทคัดย่อ}
  \newcommand{\@AbstractEnglishString}{บทคัดย่อภาษาอังกฤษ}
  \newcommand{\@PageString}{หน้า}
  \newcommand{}{}

  %%string already defined in babel (some are not used in this class, but I add it anyway
    \renewcommand\captionsthai{%
      \def\prefacename{คำนำ}%
      \def\refname{หนังสืออ้างอิง}%
      \def\abstractname{บทคัดย่อ}%
      \def\bibname{รายการอ้างอิง}%
      \def\chaptername{บทที่}%
      \def\appendixname{ภาคผนวก}%
      \def\appendixpage{ภาคผนวก}%
      \def\contentsname{สารบัญ}%
      \def\listfigurename{สารบัญภาพ}%
      \def\listtablename{สารบัญตาราง}%
      \def\indexname{ดรรชนี}%
      \def\figurename{รูปที่}%
      \def\tablename{ตารางที่}%
      \def\partname{ภาค}%
      \def\enclname{สิ่งที่แนบมาด้วย}%
      \def\ccname{สำเนาถึง}%
      \def\headtoname{เรียน}%
      \def\pagename{หน้า}%
      \def\seename{ดู}%
      \def\alsoname{ดูเพิ่มเติม}%
      \def\proofname{พิสูจน์}%
    }
\else
  %% my new string
  \newcommand{\@AcknowledgementsString}{Acknowledgement}
  \newcommand{\@CVString}{Curriculum Vitae}
  \newcommand{\@AbstractThaiString}{Abstract in Thai}
  \newcommand{\@AbstractEnglishString}{Abstract in English}
  \newcommand{\@StatementString}{Statements of Originality}
  \newcommand{\@ListPublicationString}{List of Publications}
  \newcommand{\@ListSymbolString}{List of Symbols}
  \newcommand{\@ListAbbvString}{List of Abbreviations}
  \newcommand{\@PageString}{Page}
  %\newcommand{}{}

  %%string already defined in babel (some are not used in this class, but I add it anyway
    \renewcommand\captionsenglish{%
      \def\prefacename{Preface}%
      \def\refname{References}%
      \def\abstractname{Abstract}%
      \def\abstractpage{ABSTRACT}%
      \def\acknowledgementpage{ACKNOWLEDGEMENT}%
      \def\statementpage{STATEMENTS OF ORIGINALITY}%
      \def\listsymbolpage{LIST OF SYMBOLS}%
      \def\listabbvpage{LIST OF ABBREVIATIONS}%
      \def\cvpage{CURRICULUM VITAE}%
      \def\bibname{BIBLIOGRAPHY}%
      \def\listpublicationpage{LIST OF PUBLICATIONS}%
      \def\bibpage{Bibliography}%
      \def\chaptername{Chapter}%
      \def\appendixname{Appendix}%
      \def\appendicesname{Appendices}%
      \def\appendixpage{APPENDIX}%
      \def\appendicespage{APPENDICES}%
      \def\contentsname{Contents}%
      \def\contentspage{CONTENTS}%
      \def\listfigurename{List of Figures}%
      \def\listfigurepage{LIST OF FIGURES}%
      \def\listtablename{List of Tables}%
      \def\listtablepage{LIST OF TABLES}%
      \def\indexname{Index}%
      \def\figurename{Figure}%
      \def\tablename{Table}%
      \def\partname{Part}%
      \def\enclname{encl}%
      \def\ccname{cc}%
      \def\headtoname{To}%
      \def\pagename{Page}%
      \def\seename{see}%
      \def\alsoname{see also}%
      \def\proofname{Proof}%
      \def\glossaryname{Glossary}%
      \def\figurename{Figure}
      \def\tablename{Table}
    }
\fi

\if@thaithesis
  \captionsthai
\else
  \captionsenglish
\fi


%% set chapter string
\renewcommand\@chapapp{\chaptername}

%% to write text over dotted line
\newcommand{\udot}[1]{%
    \tikz[baseline=(todotted.south)]{
        \node[inner sep=0pt,outer sep=0pt] (todotted) {#1};
        \draw[loosely dotted, thick] (todotted.south west) -- (todotted.south east);
    }%
}%

%% to choose the word between Appendix or Appendices
\newcommand{\numappendices}[1]{
  \newcommand{\@numappendices}{#1}
}

%% additional command for setting the first few pages of the thesis
%% please refer to the accompanying bare_thesis.tex for the example
%% usage of these command.
\newcommand{\authortitle}[2]{                               % define Title of Author
  \newcommand{\@ThaiAuthorTitle}{#1}
  \newcommand{\@EnglishAuthorTitle}{#2}
}
\newcommand{\thesisauthor}[2]{                              % define author
  \newcommand{\@ThaiAuthor}{#1}
  \newcommand{\@EnglishAuthor}{#2}
  \newcommand{\@EnglishAuthorUP}{\uppercase{#2}}
}
\newcommand{\thesistitle}[2]{                               % define Thesis' title
  \newcommand{\@ThaiTitle}{#1}
  \newcommand{\@EnglishTitle}{#2}
  \newcommand{\@EnglishTitleUP}{\uppercase{#2}}
}
\newcommand{\advisor}[4]{                                   % define Advisor
  \newcommand{\@ThaiAdvisor}{#1}
  \newcommand{\@ThaiAdvisorShort}{#2}
  \newcommand{\@EnglishAdvisor}{#3}
  \newcommand{\@EnglishAdvisorUP}{\uppercase{#3}}
  \newcommand{\@EnglishAdvisorShort}{#4}
  \newcommand{\@EnglishAdvisorShortUP}{\uppercase{#4}}
}
\newcommand{\firstcoadvisor}[4]{                                 % define co-author (auto include coadvision option)
  \newcommand{\@ThaiFirstCoAdvisor}{#1}                         
  \newcommand{\@ThaiFirstCoAdvisorShort}{#2}
  \newcommand{\@EnglishFirstCoAdvisor}{#3}
  \newcommand{\@EnglishFirstCoAdvisorUP}{\uppercase{#3}}
  \newcommand{\@EnglishFirstCoAdvisorShort}{#4}
  \newcommand{\@EnglishFirstCoAdvisorShortUP}{\uppercase{#4}}
  \@firstcoadvisortrue
}

\newcommand{\secondcoadvisor}[4]{                                 % define co-author (auto include coadvision option)
  \newcommand{\@ThaiSecondCoAdvisor}{#1}                         
  \newcommand{\@ThaiSecondCoAdvisorShort}{#2}
  \newcommand{\@EnglishSecondCoAdvisor}{#3}
  \newcommand{\@EnglishSecondCoAdvisorUP}{\uppercase{#3}}
  \newcommand{\@EnglishSecondCoAdvisorShort}{#4}
  \newcommand{\@EnglishSecondCoAdvisorShortUP}{\uppercase{#4}}
  \@secondcoadvisortrue
}

\newcommand{\faculty}[2]{                                   % define faculty
  \newcommand{\@ThaiFaculty}{#1}
  \newcommand{\@EnglishFaculty}{#2}
}
\newcommand{\department}[2]{                                % define department
  \newcommand{\@ThaiDept}{#1}
  \newcommand{\@EnglishDept}{#2}
}
\newcommand{\fieldofstudy}[2]{                              % define field of study
  \newcommand{\@ThaiFieldOfStudy}{#1}
  \newcommand{\@EnglishFieldOfStudy}{#2}
  \newcommand{\@EnglishFieldOfStudyUP}{\uppercase{#2}}
}
\newcommand{\degree}[2]{                                    % define degree name
  \newcommand{\@ThaiDegree}{#1}
  \newcommand{\@EnglishDegree}{#2}
  \newcommand{\@EnglishDegreeUP}{\uppercase{#2}}
}
\newcommand{\examdate}[3]{
  \newcommand{\@ExamDate}{#1 #2 #3}
  \newcommand{\@ExamDateUP}{\uppercase{#2 #3}}
}
\newcommand{\academicyear}[1]{                              % define academic year
  \newcounter{AcadYear}
  \setcounter{AcadYear}{#1}
  \newcommand{\@ThaiAcademicYear}{\theAcadYear}
  \newcounter{EngAcadYear}
  \setcounter{EngAcadYear}{\value{AcadYear}-543}
  \newcommand{\@EnglishAcademicYear}{\theEngAcadYear}
}
\newcommand{\deanname}[2]{                                  % define name of the dean
  \newcommand{\@ThaiDeanName}{#1}
  \newcommand{\@EnglishDeanName}{#2}
}
\newcommand{\keywords}[1]{                                  % define keywords
  \newcommand{\@Keywords}{\uppercase{#1}}
}
\newcommand{\dedicationTitle}[1]{                                  % define keywords
  \newcommand{\@DedicationTitle}{#1}
}
\newcommand{\authorid}[1]{                                  % define student ID of the author
  \newcommand{\@AuthorID}{#1}
}
\newcommand{\committee}[1]{                                 % define commitee
  \newcommand{\@Committee}{
    \if@thaithesis \fi
    #1
  }
}

%% additional counter, length,  reference, etc

\newcounter{subsubsubsection}[subsubsection]
\setcounter{subsubsection}{0}                 % this class allow subsubsubsection

\newcounter{bib}                       
\setcounter{bib}{0}
\newcounter{TotalPage}                 
\setcounter{TotalPage}{0}
\newcounter{isAppendiced}              
\setcounter{isAppendiced}{0}
\setcounter{tocdepth}{2}
\setcounter{secnumdepth}{3}

\newlength{\pageleft}               % for the remaining space of the page

\renewcommand{\thechapter}{\@arabic\c@chapter}                                    % \ref{} in chapter
\renewcommand{\thesection}{\thechapter.\@arabic\c@section}                        % \ref{} in section
\renewcommand{\thesubsection}{\thesection.\@arabic\c@subsection}                  % \ref{} in subsection
\renewcommand{\thesubsubsection}{\thesubsection.\@arabic\c@subsubsection}         % \ref{} in subsubsection
\renewcommand{\thesubsubsubsection}{\thesubsubsection.\@arabic\c@subsubsubsection}% \ref{} in subsubsubsection

%\renewcommand{\@cite}[1]{[#1]}
%\renewcommand{\@biblabel}[1]{#1.}

%% command for appendix
\newcommand\startappendix{
  %readjust toc length
  \addtocontents{toc}{\protect\setlength{\tocindentchap}{1.4em}}
  \addtocontents{toc}{\protect\gentocwidthparam}                       %regen according to new chapter indent
  \addtocontents{toc}{\protect{\setlength{\tocnwidthchap}{10.0em}}}    %set the nwidth of chapter AFTER generate (to accommodate \appendixname)

  \par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \setcounter{isAppendiced}{1}%
  \renewcommand\@chapapp{\appendixname}%

  \if@thaithesis
    \renewcommand{\thechapter}{\@thaiAlph\c@chapter}
  \else
    \renewcommand{\thechapter}{\@Alph\c@chapter}
  \fi

  \newpage
  \thispagestyle{empty}
  \centerline{~}
  \vfill
  \ifnum \@numappendices > 1
    \centerline{\Large \appendicespage}
  \else
    \centerline{\Large \appendixpage}
  \fi
  \vfill
  \centerline{~}
}



%%%%%%%%%%%%%%%%
% page layout %
%%%%%%%%%%%%%%%
\setlength{\hoffset}{-1in+35mm}           %  left-side margin = 1 inch + hoffset
\setlength{\voffset}{-1in+35mm}          %  top-side margin = 1 inch + voffset
\setlength{\topmargin}{0.00cm}         %
\setlength{\oddsidemargin}{0.00cm}     %
\setlength{\evensidemargin}{0.00cm}    %
\setlength{\headheight}{0.00cm}        %
\setlength{\headsep}{0.00cm}           %
\setlength{\textwidth}{15.00cm}        %  text-area width
\setlength{\textheight}{22.70cm}       %  text-area height
\setlength{\marginparsep}{0.00cm}      %
\setlength{\marginparwidth}{0.00cm}    %
\setlength{\footskip}{10mm}          %
\renewcommand{\baselinestretch}{1.5}
\setlength{\parindent}{10mm}         %  paragraph indent
%\setlength{\parskip}{12pt}     %  distance between paragraphs
%\renewcommand{\baselinestretch}{1.5}



%%%%%%%%%%%%%%%%%%
% page numbering %
%%%%%%%%%%%%%%%%%%
\def\ps@headings{\def\@oddhead{{\slshape\rightmark}\hfil\if@thaithesis\fi\thepage}}
%\def\ps@myheadings{\def\@oddhead{{\slshape\rightmark}\hfil\thepage \vspace*{5cm} Hahaha}}
\pagestyle{plain}



\if@thaithesis
  \pagenumbering{thaialph}
  %\pagenumbering{arabic}
\else
  \pagenumbering{roman}
\fi

%%%%%%%%%%%%%%%%%%
% small commands %
%%%%%%%%%%%%%%%%%%
\renewcommand\chapter{
                      \if@openright\cleardoublepage\else\clearpage\fi
                      %\thispagestyle{empty}%
                      \global\@topnum\z@   % Prevents figures from going at top of page.
                      \@afterindenttrue
                      \ifnum \c@chapter = 0
                          \ifnum \c@isAppendiced = 0
                            \pagenumbering{arabic}
                            %\\toccont
                            %\addtocontents{toc}{\protect\leftline{\bfseries \chaptername}}
                          \else
                            \toccont
                            \addtocontents{toc}{\protect\vspace*{-0.5cm}}
                            \ifnum \@numappendices > 1
                                \addtocontents{toc}{\protect\contentsline{nchapter}{\bfseries \appendicesname}{\thepage}}
                            \else
                                \addtocontents{toc}{\protect\contentsline{nchapter}{\bfseries \appendixname}{\thepage}}
                            \fi
                          \fi
                      \fi
                      \ifnum \c@isAppendiced = 1
                        \addtocontents{toc}{\protect\vspace*{-0.5cm}}
                      \fi

                      \secdef\@chapter\@schapter
}

\def\@chapter[#1]#2{
    \refstepcounter{chapter}
    \toccont
    %\addtocontents{toc}{\protect\vspace*{-0.3cm}}
    \ifnum \c@isAppendiced = 0
      \addcontentsline{toc}{chapter}{\chaptername~{\thechapter}~#1}
      \addtocontents{toc}{\protect\vspace*{0.2cm}}
    \else
      \addcontentsline{toc}{chapter}{\appendixname~~\protect\numberline{\thechapter}#1}
    \fi
    \@makechapterhead{#2}
    \@afterheading
    %\indent
}

\def\@schapter#1{
    {
    \newpage 
    %\parindent \z@ \centering                % zero indent (\z@ = 0pt}
    \centerline{\bfseries\large #1} %\par\nobreak
    \begin{spacing}{2}
    \end{spacing}
    \begin{spacing}{2}
    \@afterheading
    \end{spacing}
    }

}

\def\@makechapterhead#1{%
    {
    %\parindent \z@ \centering
    \newpage
    ~\\ \vspace{-11mm}
     \begin{spacing}{3} 
    \centerline{\bfseries\large \MakeUppercase{\@chapapp}~\arabic{chapter}} 
    \centerline{\bfseries\large {#1} }
    \end{spacing}
    \begin{spacing}{2} \end{spacing}
    
    }
}

\renewcommand{\section}{
    \toccont
    \addtocontents{toc}{\protect\vspace*{-0.3cm}}
    \@startsection{section}{2}{0cm}{0cm}{0.001cm}{\bfseries}
}
\renewcommand{\subsection}{
    \toccont
    \addtocontents{toc}{\protect\vspace*{-0.3cm}}
    \@startsection{subsection}{2}{0cm}{0cm}{0.001cm}{\bfseries}
}
\renewcommand{\subsubsection}{
    \toccont
    %\addtocontents{toc}{\protect\vspace*{-0.5cm}}
     %\addtocontents{toc}{\protect\vspace*{-0.3cm}}
    \@startsection{subsubsection}{2}{0cm}{0cm}{0.001cm}{\bfseries}
}
\newcommand{\subsubsubsection} {
    %\toccont
    %\addtocontents{toc}{\protect\vspace*{-0.5cm}}
    %\@startsection{subsubsubsection}{0}{0cm}{0cm}{0.001cm}{\bfseries}
}

%%%%%%%%%%%%
% contents %
%%%%%%%%%%%%
\renewcommand\@pnumwidth{0.5cm}        % toc's parameter
\renewcommand\@tocrmarg{1.5cm}         % toc's parameter
\renewcommand\@dotsep{200}               % toc's parameter
%\addtocontents{toc}{\protect\vspace*{0.3cm}}
\addtocontents{toc}{\protect\rightline{\pagename}}
\addtocontents{toc}{\protect\vspace{0.5cm}}

\newlength{\tocindentchap}
\newlength{\tocnwidthchap}
\newlength{\tocindentsection}
\newlength{\tocnwidthsection}
\newlength{\tocindentsubsection}
\newlength{\tocnwidthsubsection}
\newlength{\tocindentsubsubsection}
\newlength{\tocnwidthsubsubsection}
\newlength{\tocindentsubsubsubsection}
\newlength{\tocnwidthsubsubsubsection}
\newlength{\tocnwidthperstep}
\newlength{\tocnwidthoffset}

\setlength{\tocnwidthperstep}{0.8em}
\setlength{\tocnwidthoffset}{2.5mm}
\setlength{\tocindentchap}{0.0em}
\setlength{\tocnwidthchap}{\tocnwidthoffset}

\newcommand{\gentocwidthparam}{
  \setlength{\tocindentsection}{10mm}
  \setlength{\tocnwidthsection}{\tocnwidthoffset + \tocnwidthperstep * 1}
  \setlength{\tocindentsubsection}{20mm}
  \setlength{\tocnwidthsubsection}{\tocnwidthoffset + \tocnwidthperstep * 2}
  \setlength{\tocindentsubsubsection}{\tocindentsubsection + \tocnwidthsubsection}
  \setlength{\tocnwidthsubsubsection}{\tocnwidthoffset + \tocnwidthperstep * 3}
  \setlength{\tocindentsubsubsubsection}{\tocindentsubsubsection + \tocnwidthsubsubsection}
  \setlength{\tocnwidthsubsubsubsection}{\tocnwidthoffset + \tocnwidthperstep * 3}
}


\gentocwidthparam

\newcommand{\l@nchapter}{\@dottedtocline{0}{0cm}{0cm}}
\renewcommand{\l@chapter}[2]{\@dottedtocline{0}{\tocindentchap}{\tocnwidthchap}{#1}{#2}}
\renewcommand{\l@section}{\@dottedtocline{1}{\tocindentsection}{\tocnwidthsection}}
\renewcommand{\l@subsection}{\@dottedtocline{2}{\tocindentsubsection}{\tocnwidthsubsection}}
\renewcommand{\l@subsubsection}{\@dottedtocline{3}{\tocindentsubsubsection}{\tocnwidthsubsubsection}}
\newcommand{\l@subsubsubsection}{\@dottedtocline{4}{\tocindentsubsubsubsection}{\tocnwidthsubsubsubsection}}

\renewcommand{\l@table}{\@dottedtocline{0}{0cm}{1.7cm}}
\renewcommand{\l@figure}{\@dottedtocline{0}{0cm}{1.8cm}}

\renewcommand{\tableofcontents}{
    \selectthesislang
   % \fontsize{10}{12}\selectfont
    %\thispagestyle{empty}
    \toccont
    %\addtocontents{toc}{\protect\vspace*{-0.5cm}}
    %\addtocontents{toc}{\protect\contentsline{nchapter}{\bfseries \contentsname}{\thepage}}
    \newpage
    \centerline{\bfseries \large \contentspage}
    \begin{spacing}{2}\end{spacing}
    \begin{spacing}{2}
    \@starttoc{toc}
    \end{spacing}
    %\addtocounter{TotalPage}{\arabic{page}}
}
\newcommand{\toccont}{
    \addtocontents{toc}{
        \protect\setlength{\protect\pageleft}{\protect\textheight - \protect\pagetotal}
        \protect\ifdim \protect\pageleft < 1cm
            \protect\newpage
		\hfill\pagename
		\protect\vspace{0.5cm}          
		%\addtocounter{TotalPage}{\arabic{page}}
        \protect\fi
        
    }
}

%%%%%%%%%%%%%%%%%
% list of table %
%%%%%%%%%%%%%%%%%
\setlength{\arraycolsep}{5\p@}            % tabular's parameter
\setlength{\tabcolsep}{6\p@}              % tabular's parameter
\setlength{\arrayrulewidth}{.4\p@}        % tabular's parameter
\setlength{\doublerulesep}{2\p@}          % tabular's parameter
\renewcommand{\arraystretch}{1.0}         % tabular's parameter
\renewcommand{\thetable}{\tablename~\ifnum\c@chapter>\z@\thechapter.\fi\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\thetable}

\renewenvironment{table}{
    \@float{table}
}{
    \lotcont
    \end@float
}

\setlength{\abovecaptionskip}{10\p@}
\setlength{\belowcaptionskip}{10\p@}
\long\def\@makecaption#1#2{
\vskip\abovecaptionskip
\sbox\@tempboxa{#1: #2}
\ifdim \wd\@tempboxa > \hsize
    #1: #2\par
\else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}
\fi
\vskip\belowcaptionskip}

\renewcommand{\listoftables}{
    \toccont
    %\addtocontents{toc}{\protect\vspace*{-0.3cm}}
    \newpage\justify  
     \centerline{\bfseries \large \listtablepage}
     \begin{spacing}{3}\end{spacing}
     \begin{spacing}{1.5}
    	\@starttoc{lot}
    \end{spacing}
    \addtocontents{toc}{\protect\contentsline{nchapter}{\listtablename}{\thepage}}
    \addtocontents{lot}{\hfill\pagename\hspace{-0.1cm}}
    \addtocontents{lot}{\vspace{0.5cm}}           %  distance between paragraphs
    %\addtocounter{TotalPage}{\arabic{page}}
}

\newcommand{\lotcont}{
    \addtocontents{lot}{
        \protect\setlength{\protect\pageleft}{\protect\textheight - \protect\pagetotal}
        \protect\ifdim \protect\pageleft < 1cm
            \protect\newpage
            {\hspace{-1cm}\hfill\pagename\hspace{-0.1cm}}
        \protect\fi
        }
}

%%%%%%%%%%%%%%%%%%%
% list of figures %
%%%%%%%%%%%%%%%%%%%
\renewcommand{\thefigure}{\figurename~\ifnum\c@chapter>\z@\thechapter.\fi\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\thefigure}

\renewenvironment{figure}{
    \@float{figure}
}{
    \lofcont
    \end@float
}

\renewcommand{\listoffigures}{
    \toccont
    %\addtocontents{toc}{\protect\vspace*{-0.3cm}}

    \newpage\justify  
    \centerline{\bfseries\large \listfigurepage}
    \begin{spacing}{3}\end{spacing}
    \begin{spacing}{1.5}
    \@starttoc{lof}
    \end{spacing}
    \addtocontents{toc}{\protect\contentsline{nchapter}{\listfigurename}{\thepage}}
    \addtocontents{lof}{\hfill\pagename\hspace{-0.1cm}}
    \addtocontents{lof}{\vspace{0.5cm}}

    %% my new attempt
    %t\addtocontents{lof}{\protect\setlength{\parskip}{0.0cm}}           %  distance between paragraphs

    %\addtocontents{lof}{\protect\thispagestyle{myheadings}}

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % save number of roman pages %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    \addtocounter{TotalPage}{\arabic{page}}
}

\newcommand{\lofcont}{
    \addtocontents{lof}{
        \protect\setlength{\protect\pageleft}{\protect\textheight - \protect\pagetotal}
        \protect\ifdim \protect\pageleft < 1cm
            \protect\newpage
            {\hspace{-1cm}\figurename\hfill\pagename\hspace{-0.1cm}}
       \protect\fi
    }
}

%%%%%%%%%%%%
% equation %
%%%%%%%%%%%%
\@addtoreset{equation}{chapter}
\renewcommand{\theequation}{\ifnum\c@chapter>\z@\thechapter.\fi\@arabic\c@equation}

%%%%%%%%%%%%%
% emphasize %
%%%%%%%%%%%%%
\newcommand\e[1]{{\normalem \emph{#1}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Front matter commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\makefrontcover}{
	\newpage
	\onehalfspacing
	\thispagestyle{empty}
	\vspace*{5mm}
	
	\centerline{ 
		\begin{tabular}{p{12cm}}
			\begin{center}
			\fontsize{16}{19.2}\selectfont
			{\bfseries \@EnglishTitleUP}
			\end{center}
		\end{tabular}
	}
    	
	\vfill

	{\large
    	\centerline{{\bfseries \@EnglishAuthorUP}}
	}
	
	\vfill
	
	\begin{center}
	{\large \bfseries
	\@EnglishDegreeUP \\
	IN \@EnglishFieldOfStudyUP \\
	}
	\end{center}

	\vfill
	
	\begin{center}
	{\large \bfseries GRADUATE SCHOOL \\ CHIANG MAI UNIVERSITY \\  MARCH 2017 \\}
	\end{center}
}

\newcommand{\makeinnercover}{
	\newpage
	\onehalfspacing
	\thispagestyle{empty}
	\vspace*{5mm}
	
	\centerline{ 
		\begin{tabular}{p{12cm}}
			\begin{center}
			\fontsize{16}{19.2}\selectfont
			{\bfseries \@EnglishTitleUP}
			\end{center}
		\end{tabular}
	}
    	
	\vfill

	{\large
    	\centerline{{\bfseries \@EnglishAuthorUP}}
	}
	
	\vfill
	
	\begin{center}
	{\large \bfseries
	\@EnglishDegreeUP \\
	IN \@EnglishFieldOfStudyUP \\
	}
	\end{center}

	\vfill
	
	\begin{center}
	{\large \bfseries GRADUATE SCHOOL \\ CHIANG MAI UNIVERSITY \\  \@ExamDateUP \\}
	\end{center}
}


\newcommand{\maketitlepage}{
	\newpage
	\onehalfspacing
	\setcounter{page}{1}
	\vspace*{5mm}
	
	\centerline{
		\begin{tabular}{p{11cm}}
			\begin{center}
			{\large \bfseries \@EnglishTitleUP}
			\end{center}
		\end{tabular}
	}
    	
	\vfill
	
    	\centerline{{\bfseries \@EnglishAuthorUP}}
	
	\vfill
	
	\begin{center}
	{\bfseries
	A THESIS SUBMITTED TO CHIANG MAI UNIVERSITY  IN PARTIAL \\ 
	FULFILLMENT OF THE REQUIREMENT FOR THE DEGREE OF \\
	\@EnglishDegreeUP \\
	IN \@EnglishFieldOfStudyUP \\
	}
	\end{center}

	\vfill
	
	\begin{center}
	{\bfseries GRADUATE SCHOOL, CHIANG MAI UNIVERSITY \\  \@ExamDateUP}
	\end{center}
}

\newcommand{\EnglishCommittee}{
	\newpage

	\begin{center}	
	\begin{tabular}{p{12cm}}
		\centering \bfseries \large \@EnglishTitleUP
	\end{tabular}
	\begin{spacing}{4}\end{spacing}
	\centerline{\@EnglishAuthorUP}
    	\begin{spacing}{4}\end{spacing}
    THIS THESIS HAS BEEN APPROVED TO BE A PARTIAL FULFILLMENT OF \\
    THE REQUIREMENTS FOR THE DEGREE OF \\
    \@EnglishDegreeUP \\
    IN \@EnglishFieldOfStudyUP
    \begin{spacing}{4}\end{spacing}
    \noindent

    \begin{tabular}{@{}l @{}c @{}l}
    {\bfseries Examination Committee:} & & {\bfseries Advisory Committee:}  \\
    	
	\begin{tabular}{@{}p{5cm}@{}l} 
		\@Committee 
	\end{tabular} &  &
	\begin{tabular}{@{}p{5cm}@{}l} 
		\CommitteeBlockAdvisor
		\CommitteeBlockFirstCoAdvisor
		\CommitteeBlockSecondCoAdvisor
		\nullBlock
		\nullBlock
	\end{tabular} 
	
    \end{tabular}
    
     \vfill
     
     \@ExamDate \\
     Copyright~\copyright~by Chiang Mai University   
     \end{center} 
}

\newcommand{\makededicationpage} {
	\newpage
	\vspace*{35mm}
	\begin{center}
	\fontsize{16}{19.2}\selectfont
	{\bfseries \itshape \@DedicationTitle}
	\end{center}
	\vfill
	\normalsize
}

\newcommand{\makeapprovalpage} {
  \protect\if@thaithesis
     \ThaiCommittee
  \protect\else
     \EnglishCommittee
  \protect\fi
}

\newcommand{\CommitteeBlock}[2] {
     \hspace*{5cm} &  \\
     \dotfill & {\if@thaithesis \fi #1} \\
     \multicolumn{2}{l}{\if@thaithesis \fi (#2)} \\
}

\newcommand{\CommitteeBlockAdvisor} {
     \hspace*{5cm} & \\
     \dotfill & {\if@thaithesis {อาจารย์ที่ปรึกษาวิทยานิพนธ์หลัก} \else Advisor \fi} \\ 
     \multicolumn{2}{l}{(\if@thaithesis \@ThaiAdvisor \else \@EnglishAdvisor \fi)} \\
}

\newcommand{\CommitteeBlockFirstCoAdvisor} {
    \if@firstcoadvisor
    \hspace*{5cm} & \\
    \dotfill & {\if@thaithesis {อาจารย์ที่ปรึกษาร่วม} \else Co-advisor \fi} \\
    \multicolumn{2}{l}{(\if@thaithesis \@ThaiFirstCoAdvisor \else \@EnglishFirstCoAdvisor \fi)} \\
    \fi
}

\newcommand{\CommitteeBlockSecondCoAdvisor} {
    \if@secondcoadvisor
    \hspace*{5cm} & \\
    \dotfill & {\if@thaithesis {อาจารย์ที่ปรึกษาร่วม} \else Co-advisor \fi} \\
    \multicolumn{2}{l}{(\if@thaithesis \@ThaiSecondCoAdvisor \else \@EnglishSecondCoAdvisor \fi)} \\
    \fi
}

\newcommand{\nullBlock} {
    \hspace*{1cm} & \\
    & \\
    \multicolumn{2}{l}{} \\
}


\newenvironment{statementthai}{
    \toccont
    \addtocontents{toc}{\protect\contentsline{nchapter}{\@StatementString in Thai}{\hspace{-0.12cm}\thepage}}
    
    \newpage\justify
 
    \fontsize{20}{24}\selectfont 
    \centerline{{\bfseries ข้อความแห่งการริเริ่ม}} 
    \normalsize
    \begin{spacing}{2}\end{spacing}    
}

\newenvironment{statementenglish}{
    \toccont
    \addtocontents{toc}{\protect\contentsline{nchapter}{\@StatementString in English}{\hspace{-0.14cm}\thepage}}
    
    \newpage\justify
    \centerline{\bfseries\large \statementpage}
    \begin{spacing}{3}\end{spacing}
}

\newenvironment{acknowledgements}{
    \toccont
    \addtocontents{toc}{\protect\contentsline{nchapter}{\@AcknowledgementsString}{\thepage}}
    \setlength{\parindent}{10mm}
    
    \newpage\justify
    \centerline{\bfseries \large \acknowledgementpage}
    \normalsize
    \begin{spacing}{2}\end{spacing}
    \indent
}

\newenvironment{thaiabstract}{
        \fontsize{16}{19.2}\selectfont
        	\toccont
        
        	\addtocontents{toc}{\protect\contentsline{nchapter}{\@AbstractThaiString}{\thepage}}
     
        	\newpage\justify
        	\noindent
        	\begin{tabular}{@{}p{4.5cm}@{}p{10.5cm}}
        	{\bfseries หัวข้อดุษฎีนิพนธ์} & \@ThaiTitle
        	\end{tabular}
        	\begin{spacing}{2}\end{spacing}
        	\noindent
        	\begin{tabular}{@{}p{4.5cm}@{}p{10.5cm}}
        {\bfseries ผู้เขียน} & \@ThaiAuthorTitle\@ThaiAuthor
        \end{tabular}
        \begin{spacing}{2}\end{spacing}   
        \noindent 
        	\begin{tabular}{@{}p{4.5cm}@{}p{10.5cm}}
        {\bfseries ปริญญา} &  \@ThaiDegree~(\@ThaiFieldOfStudy) \\
        \end{tabular}
        \begin{spacing}{2}\end{spacing}   
        \noindent 
        \begin{tabular}{@{}p{4.5cm}@{}p{10.5cm}}
        {\bfseries คณะกรรมการที่ปรึกษา}
        &	\@ThaiAdvisorShort  \hfill อาจารย์ที่ปรึกษาหลัก \\
        		\if@firstcoadvisor & \@ThaiFirstCoAdvisor \hfill อาจารย์ที่ปรึกษาร่วม \\
        		\fi
        		\if@secondcoadvisor & \@ThaiSecondCoAdvisorShort \hfill อาจารย์ที่ปรึกษาร่วม \\
        		\fi
        \end{tabular} 
        \normalsize
        \begin{spacing}{3}\end{spacing} 
        \fontsize{20}{24}\selectfont 
        \centerline{{\bfseries บทคัดย่อ}} 
        \normalsize
        \begin{spacing}{2}\end{spacing}    
}


\newenvironment{englishabstract}{
    \normalsize
    \toccont
    
    \addtocontents{toc}{\protect\contentsline{nchapter}{\@AbstractEnglishString}{\thepage}}
    
    \newpage\justify
    \noindent
     \begin{tabular}{@{}p{4.5cm}@{}p{10.5cm}}
    {\bfseries Dissertation Title} & \@EnglishTitle
    \end{tabular}
    \begin{spacing}{2}\end{spacing}
    \noindent
     \begin{tabular}{@{}p{4.5cm}@{}p{10.5cm}}
    {\bfseries Author} & \@EnglishAuthorTitle~\@EnglishAuthor
     \end{tabular}
     \begin{spacing}{2}\end{spacing}   
     \noindent 
     \begin{tabular}{@{}p{4.5cm}@{}p{10.5cm}}
    {\bfseries Degree} &  \@EnglishDegree~(\@EnglishFieldOfStudy) \\
     \end{tabular}     
     \begin{spacing}{2}\end{spacing}   
     \noindent 
     \begin{tabular}{@{}p{4.5cm}@{}p{10.5cm}}
    {\bfseries Advisory Committee}
    	& \@EnglishAdvisor \hfill Advisor~~~~~~ \\
    	\if@firstcoadvisor
    	& \@EnglishFirstCoAdvisor \hfill Co-advisor \\
    	\fi
    	\if@secondcoadvisor
    	& \@EnglishSecondCoAdvisor \hfill  Co-advisor \\
    	\fi
    \end{tabular}   
    \begin{spacing}{3}\end{spacing}
    \centerline{\large \bfseries \abstractpage}
    \begin{spacing}{2}\end{spacing}
}

\newenvironment{cv}{
    \toccont
    \addtocontents{toc}{\protect\contentsline{nchapter}{\@CVString}{\thepage}}
    
    \newpage\justify
    \centerline{\bfseries\large \cvpage}
    \begin{spacing}{3}\end{spacing}
}

\newenvironment{listsymbol}{
    \toccont
    \addtocontents{toc}{\protect\contentsline{nchapter}{\@ListSymbolString}{\thepage}}
    \newpage\justify 
    \centerline{\bfseries\large \listsymbolpage}
    \begin{spacing}{3}\end{spacing}
}

\newenvironment{listabbv}{
    \toccont
    \addtocontents{toc}{\protect\contentsline{nchapter}{\@ListAbbvString}{\thepage}}
    \newpage\justify 
    \centerline{\bfseries\large \listabbvpage}
    \begin{spacing}{3}\end{spacing}
}

\newenvironment{listpublication}{
    \toccont
    \addtocontents{toc}{\protect\contentsline{nchapter}{\@ListPublicationString}{\thepage}}    
    \newpage\justify
    \centerline{\bfseries\large \listpublicationpage}
    \begin{spacing}{1}\end{spacing}
 
}

\newcommand{\insertbibtoc}{
    \toccont
    \addtocontents{toc}{\protect\contentsline{nchapter}{\bibpage}{\thepage}}
}

\makeatletter
\renewenvironment{thebibliography}[1]
{	
        	\newpage
        	\setcounter{page}{\thepage-1}
        	\centerline{\bfseries\large \bibname}
        	\begin{spacing}{1}
        	\end{spacing}
        \begin{enumerate}[label={[\arabic{enumi}]}, labelsep=6.5mm, leftmargin=20mm]
        \@openbib@code
        \sloppy
        \clubpenalty4000
        \@clubpenalty \clubpenalty
        \widowpenalty4000
        \sfcode`\.\@m}
        {\def\@noitemerr
        {\@latex@warning{Empty `thebibliography' environment}}%
        \end{enumerate}}
    
\makeatother

