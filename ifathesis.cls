%!TEX root = example.tex
%*******************************************************************************
% * Copyright (c) 2006-2013 
% * Institute of Automation, Dresden University of Technology
% * 
% * All rights reserved. This program and the accompanying materials
% * are made available under the terms of the Eclipse Public License v1.0 
% * which accompanies this distribution, and is available at
% * http://www.eclipse.org/legal/epl-v10.html
% * 
% * Contributors:
% *   Institute of Automation - TU Dresden, Germany 
% *      - initial API and implementation
% ******************************************************************************/

\def\fileversion{0.1}
\def\filedate{2013/07/05}
\def\filename{ifathesis}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{\filename}[\filedate DA/SA-Klasse des Instituts fuer Automatisierungstechnik, (c) by Stefan Hennig, Arne Sonnenburg, Matthias Freund, Christopher Martin]
\typeout{Class: '\filename' Version \fileversion, Standard DA/SA-Klasse des Instituts fuer Automatisierungstechnik.}

\newif\if@useListOfFigures\@useListOfFiguresfalse
\DeclareOption{listoffigures}{\@useListOfFigurestrue}

\newif\if@useListOfTables\@useListOfTablesfalse
\DeclareOption{listoftables}{\@useListOfTablestrue}

\newif\if@useListOfListings\@useListOfListingsfalse
\DeclareOption{listoflistings}{\@useListOfListingstrue}

\newif\if@useAbbrevations\@useAbbrevationsfalse
\DeclareOption{abbrevations}{\@useAbbrevationstrue}

\newif\if@isReadyForPrint\@isReadyForPrinttrue
\DeclareOption{print}{\@isReadyForPrinttrue}
\DeclareOption{screen}{\@isReadyForPrintfalse}

\newcommand*{\@ifaThesisLanguage}{de}
\DeclareOption{langDE}{\renewcommand*{\@ifaThesisLanguage}{de}}
\DeclareOption{langEN}{\renewcommand*{\@ifaThesisLanguage}{en}}

\newcommand*{\@ifaBibliographyStyle}{}
\DeclareOption{bibIfa}{\renewcommand*{\@ifaBibliographyStyle}{authoryear-comp}}
\DeclareOption{bibHarvard}{\renewcommand*{\@ifaBibliographyStyle}{alphabetic}}
\DeclareOption{bibNumeric}{\renewcommand*{\@ifaBibliographyStyle}{numeric-comp}}

\newcommand*{\@ifaBibliographyBackend}{bibtex8}
\DeclareOption{bibtex}{\renewcommand*{\@ifaBibliographyBackend}{bibtex}}
\DeclareOption{bibtex8}{\renewcommand*{\@ifaBibliographyBackend}{bibtex8}}
\DeclareOption{biber}{\renewcommand*{\@ifaBibliographyBackend}{biber}}

\ProcessOptions\relax

% Lade Basisklasse der Vorlage
\PassOptionsToPackage{%
  paper=a4,           % Papiergröße
  headinclude=true,   % Gehört Kopfzeile eher zur Seite oder zum Rand?
  footinclude=false,  % Gehört Fußzeile eher zur Seite oder zum Rand?
  pagesize            % Schreibt die Seitengröße ins Seitenregister,
                      % sodass DVI- und PDF-Seiten die richtige Größe haben.
}{typearea}

\PassOptionsToPackage{svgnames}{xcolor}  % Namensraum für xcolor Paket
      
\PassOptionsToPackage{fleqn}{amsmath}

\LoadClass[
  fontsize=12pt,                                            % Grundschriftgröße
  \if@isReadyForPrint  BCOR=15mm\else BCOR=0mm\fi,          % Binderandgröße
  \if@isReadyForPrint  DIV=10\else DIV=9\fi,                % Teil der Seite, der als Seitenrand berücksichtigt wird (auch =calc mgl.):
                                                            % Z.B. DIV=10: Randbreite Oben und Mitte 1/10, Unten und Außen 2/10 der Seite.
                                                            % Regel: 60 bis 70 Zeichen pro Zeile, weniger ist besser, niemals mehr als 80!
  captions=tableheading,                                    % Tabellenabstände für TabellenÜBERschriften optimieren
  \if@isReadyForPrint  twoside=true\else twoside=false\fi,  % Dokument zweiseitig?
  headings=small,                                           % Relative Größe der Überschriften, small ist besser lesbar und erzeugt weniger Zweizeiligs
  fleqn,                                                    % Formeln linksbündig
  bibliography=totoc,                                       % Literaturverzeichnis im Inhaltsverzeichnis referenziert
  numbers=noenddot,                                         % Punkte nach Abschnittsnummern? (Weglassen = Automatik)
                                                            % Nach Duden im vorliegenden Bsp. falsch, da auch Buchstaben in Gliederung (Anhang), sieht aber besser aus.
]{scrbook}                                                  % Basisklasse der Vorlage: Koma-Skrip Klasse analog zur book-Klasse.

% ==============================================================
% = Definiere mögliche Parameter zur Konfiguration der Vorlage =
% ==============================================================
%%%%%
% Jetzt müssen zunächst die variablen Angaben geladen werden
\newcommand*{\@ifaThesis}{Diplomarbeit}
\newcommand*{\@ifaAuthor}{Max Mustermann}
\newcommand*{\@ifaAuthorBirthday}{01.01.1970}
\newcommand*{\@ifaAuthorBirthplace}{Dresden}
\newcommand*{\@ifaAuthorCourse}{Informationssystemtechnik}
\newcommand*{\@ifaAuthorYearOfMatriculation}{2000}
\newcommand*{\@ifaKeywords}{Komma-separierte, Liste, mit, Schlagwörtern, zum Thema, der Arbeit}
\newcommand*{\@ifaTitleDE}{Titel der Arbeit}
\newcommand*{\@ifaTitleEN}{Thesis' title goes here}
\newcommand*{\@ifaChair}{} % Wird nur im Modus 'Dissertation' zur Angabe des Vorsitzenden der Prüfungskommission verwendet
\newcommand*{\@ifaSupervisorA}{}
\newcommand*{\@ifaSupervisorB}{}
\newcommand*{\@ifaSupervisorC}{}
\newcommand*{\@ifaSupervisorD}{}
\newcommand*{\@ifaSupervisorE}{}
\newcommand*{\@ifaProfessor}{Titel der Arbeit}
\newcommand*{\@ifaDayOfSubmission}{\today}
\newcommand*{\@ifaDayOfDefense}{} % Wird nur im Modus 'Dissertation' zur Angabe des Tags der Verteidigung verwendet
\newcommand*{\@ifaTopicDescriptionPDF}{he0ohDie}
\newcommand*{\@ifaAppendix}{GoHaigh2}
\newcommand*{\@ifaAbstractDE}{GoHaigh2}
\newcommand*{\@ifaAbstractEN}{GoHaigh2}
\newcommand*{\@ifaReferences}{IPhei0Ox}
\newcommand*{\@ifaAbbrev}{00_Abbrev}
\newcommand*{\@ifaAcknowledgements}{Acknowledgements}
\newcommand*{\@ifaBibliographyBeforeAppendix}{true}
\newcommand*{\@ifaAdditionalContributors}{}

\newcommand*{\ifaThesis}[1]{\renewcommand*{\@ifaThesis}{#1}}
\newcommand*{\ifaAuthor}[1]{\renewcommand*{\@ifaAuthor}{#1}}
\newcommand*{\ifaAuthorBirthday}[1]{\renewcommand*{\@ifaAuthorBirthday}{#1}}
\newcommand*{\ifaAuthorBirthplace}[1]{\renewcommand*{\@ifaAuthorBirthplace}{#1}}
\newcommand*{\ifaAuthorCourse}[1]{\renewcommand*{\@ifaAuthorCourse}{#1}}
\newcommand*{\ifaAuthorYearOfMatriculation}[1]{\renewcommand*{\@ifaAuthorYearOfMatriculation}{#1}}
\newcommand*{\ifaKeywords}[1]{\renewcommand*{\@ifaKeywords}{#1}}
\newcommand*{\ifaTitleDE}[1]{\renewcommand*{\@ifaTitleDE}{#1}}
\newcommand*{\ifaTitleEN}[1]{\renewcommand*{\@ifaTitleEN}{#1}}
\newcommand*{\ifaChair}[1]{\renewcommand*{\@ifaChair}{#1}}
\newcommand*{\ifaSupervisorA}[1]{\renewcommand*{\@ifaSupervisorA}{#1}}
\newcommand*{\ifaSupervisorB}[1]{\renewcommand*{\@ifaSupervisorB}{#1}}
\newcommand*{\ifaSupervisorC}[1]{\renewcommand*{\@ifaSupervisorC}{#1}}
\newcommand*{\ifaSupervisorD}[1]{\renewcommand*{\@ifaSupervisorD}{#1}}
\newcommand*{\ifaSupervisorE}[1]{\renewcommand*{\@ifaSupervisorE}{#1}}
\newcommand*{\ifaProfessor}[1]{\renewcommand*{\@ifaProfessor}{#1}}
\newcommand*{\ifaDayOfSubmission}[1]{\renewcommand*{\@ifaDayOfSubmission}{#1}}
\newcommand*{\ifaDayOfDefense}[1]{\renewcommand*{\@ifaDayOfDefense}{#1}}
\newcommand*{\ifaTopicDescriptionPDF}[1]{\renewcommand*{\@ifaTopicDescriptionPDF}{#1}}
\newcommand*{\ifaAppendix}[1]{\renewcommand*{\@ifaAppendix}{#1}}
\newcommand*{\ifaAbstractDE}[1]{\renewcommand*{\@ifaAbstractDE}{#1}}
\newcommand*{\ifaAbstractEN}[1]{\renewcommand*{\@ifaAbstractEN}{#1}}
\newcommand*{\ifaReferences}[1]{\renewcommand*{\@ifaReferences}{#1}}
\newcommand*{\ifaAcknowledgements}[1]{\renewcommand*{\@ifaAcknowledgements}{#1}}
\newcommand*{\ifaAbbrev}[1]{\renewcommand*{\@ifaAbbrev}{#1}}
\newcommand*{\ifaBibliographyBeforeAppendix}[1]{\renewcommand*{\@ifaBibliographyBeforeAppendix}{#1}}
\newcommand*{\ifaAdditionalContributors}[1]{\renewcommand*{\@ifaAdditionalContributors}{#1}}

%-------------------------------------------------------------------------
\RequirePackage{ifthen}

% Paket für einfache Realisation von String-Vergleichen, die hier in der Vorlage verwendet werden
\RequirePackage{xstring}

% Absatznummerierung fuer 4 Ebenen (z.B. 2.3.2.1) gemaess IfA Richtlinie einschalten.
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3} 

\RequirePackage{scrhack} %Zur Herstellung der Kompabilitaet mit Paketen, die nicht kompatibel zum KOMA-Script sind.

% Muss 'atEndOfClass' geladen werden, da es sonst zu Problemen kommt (bibtex/biber meldet, es könnten Verweise nicht aufgelöst werden, obwohl dies nicht der Fall ist)
\AtEndOfClass{
  \RequirePackage[           % Verwendung von biblatex für das Literaturverzeichnis
    style=\@ifaBibliographyStyle, 
    backend=\@ifaBibliographyBackend, 
    maxbibnames=99,
    backref=true,
    natbib=true
  ]{biblatex}

  % Erlaube URL-Linebreaks
  \setcounter{biburlnumpenalty}{6000}% Penalty für Zahlenumbruch
  \setcounter{biburlucpenalty}{3000} % Penalty für Umbruch an Großbuchstaben
  \setcounter{biburllcpenalty}{9000} % Penalty für Umbruch an Kleinbuchstaben
}


% Lade weitere benötigte Pakete
\include{packages}

% definiere Farben
\definecolor{TUDBLAU}{rgb}{0.0,0.348,0.637}
\definecolor{OSGREEN}{rgb}{0,0.75,0.25} 

% Kläre zunächst einige Dinge, die von der Sprache abhängen
\ifthenelse{\equal{\@ifaThesisLanguage}{de}}{ 
  % Deutsche Pakete
  \RequirePackage[ngerman]{babel}    % Silbentrennung nach neuer deutscher Rechtschreibung.
  \RequirePackage[german]{nomencl}
  % Deutsche Begrifflichkeiten
  \newcommand{\@conTitle}{Inhaltsverzeichnis}
  \newcommand{\@bibTitle}{Literaturverzeichnis}
  \newcommand{\@appTitle}{Anhang}
  \renewcommand{\@pdftitle}{\@ifaTitleDE}
  \renewcommand{\nomname}{Abkürzungs- und Symbolverzeichnis}
  \renewcommand{\lstlistlistingname}{Quelltextverzeichnis}            
}{
  % Englische Pakete
  \RequirePackage[english]{babel}    % Silbentrennung nach englischer Rechtschreibung.
  \RequirePackage[english]{nomencl}
  % Englische Begrifflichkeiten
  \newcommand{\@conTitle}{Contents}
  \newcommand{\@bibTitle}{References}
  \newcommand{\@appTitle}{Appendix}
  \renewcommand{\@pdftitle}{\@ifaTitleEN}
  \renewcommand{\nomname}{Nomenclature}
  \renewcommand{\lstlistlistingname}{List of Listings}          
}

%-------------------------------------------------------------------------
% Macht im Anhang aus "A Quellcode" -> "Anhang A Quellcode"
%-------------------------------------------------------------------------
\newcommand*{\appendixmore}{%
  \renewcommand*{\chapterformat}{%
    \appendixname~\thechapter\autodot:\enskip}
  \renewcommand*{\chaptermarkformat}{%
    \appendixname~\thechapter\autodot:\enskip}
}
%-------------------------------------------------------------------------
                                              
% Veränderung der Bildunterschriften und Tabellenüberschriften:
\addtokomafont{caption}{\small}                 % Kleinere Schriftgröße für Captions
\setkomafont{captionlabel}{\sffamily\bfseries}  % Caption-Label fett und serifenlos
\setcapindent{1em}                              % 2. Zeile der Caption mit hängendem Einzug

%-------------------------------------------------------------------------
% Anpassung des Literaturverzeichnisses
%-------------------------------------------------------------------------
\AtEndOfClass{ % muss 'atEndOfClass' ausgeführt werden, da das 'biblatex'-Paket erst dann geladen wird (s.o.)
  \setlength{\bibitemsep}{10pt}
  \defbibheading{bibliography}{
        \chapter*{\@bibTitle}
        \addcontentsline{toc}{chapter}{\@bibTitle}
  }
  % Notwendig für Autovervollständigung der Zitate im Texnic Center
  \renewcommand*{\bibliography}[1]{\addbibresource{#1.bib}}
  % Anpassung für eckige Klammern bei 'authoryear-comp'
  \ifthenelse{\equal{\@ifaBibliographyStyle}{authoryear-comp}}{\renewcommand*{\citep}[2][]{\mkbibbrackets{\cite[#1]{#2}}}}{}
}

%-------------------------------------------------------------------------
% Löst Probleme mit deutschen Umlauten in Listings
%-------------------------------------------------------------------------
\lstset{literate=%
  {Ö}{{\"O}}1
  {Ä}{{\"A}}1
  {Ü}{{\"U}}1
  {ß}{{\ss}}2
  {ü}{{\"u}}1
  {ä}{{\"a}}1
  {ö}{{\"o}}1
}

%-------------------------------------------------------------------------
% Integriert Listings und baut diese als Gleitobjekt aus, wenn gewünscht
%-------------------------------------------------------------------------
% Usage: \listing{<Caption>}{<Label>}{<[Dialect]Language>}{<Pfad>}{<float?>} 

\newcommand*{\ifalisting}[6]{
  \renewcommand{\lstlistingname}{\hspace{-0.6cm}Listing}
  \ifthenelse{\equal{#6}{true}}{
    \ifalistingFloat{#1}{#2}{#3}{#4}{#5}
  }{
    \ifalistingNoFloat{#1}{#2}{#3}{#4}{#5}
  }  
  \vspace{4.5mm}
}

\newcommand*{\ifalistingFloat}[5]{% 
    \begin{minipage}{0.96\textwidth}
    \lstset{belowcaptionskip=2mm}                   % Abstand unterhalb der Beschriftung
    \ifalistingRaw{#1}{#2}{#3}{#4}{#5}
    \end{minipage}
}
  
% Thanks to Matthias Freund who provided the code to enables listings which are longer than one page.
%                                  
\newcommand*{\ifalistingNoFloat}[5]{%  
  \begin{addmargin}[4mm]{1.5mm}       % verändert den Abstand ohne Verwendung einer Minipage
    \lstset{belowcaptionskip=2mm}                  % Abstand unterhalb der Beschriftung
    \ifalistingRaw{#1}{#2}{#3}{#4}{#5}
    \vspace{-1mm}
    \begin{flushright}
      \scriptsize
      Listing \ref{#2}
    \end{flushright}
  \end{addmargin}
}                                      

\newcommand*{\ifalistingRaw}[5]{
  \lstinputlisting[
    caption={#1},
    label={#2}, 
    language={#3},
    keywordstyle=\color{blue},
    identifierstyle=\color{black},
    stringstyle=\itshape\color{red},
    basicstyle=\ttfamily\color{darkgray}\footnotesize,% Schriftschnitt des Codes
    showstringspaces=false,                           % Leerzeichen nicht markieren
    commentstyle=\ttfamily\color{teal},               % Schriftschnitt der Kommentare
    tabsize=2,                                        % Tabulatorengröße in Leerzeichen
    breaklines=true,                                  % zu lange Zeilen umbrechen
    frame=tb,                                         % Rahmen um das Listing
    abovecaptionskip=3mm,                             % Abstand oberhalb der Beschriftung
    captionpos=t,                                     % Position der Beschriftung (b=bottom, t=top)
    numbers=#4,
    numbersep=5pt
  ]{#5}
}

% Erlaubt das Einfügen eines automatischen Symbolverzeichnisses
% Definiere die richtige Sprache (bspw. für Silbentrennung, ...)
% [Die entsprechenden Pakete wurden bereits eingefügt]
\makenomenclature    

% Jetzt geht es los...
\AtBeginDocument{%
  % colorlinks: Farbige Verweise statt Umrahmung 
  % Verhalten von hyperef Ändern: Farbe für Bildschirm, SW für Druck
  % ...color: Farbe verschiedener Verweise nach Farbpalette svgnames
  % pdf...: Setzten von Variablen die in den Eigenschaften der PDF-Datei angzeigt werden
  % Weitere Optionen möglich - siehe Dokumentation des Paktes hyperref  
  \hypersetup{
    linkcolor=\if@isReadyForPrint black\else TUDBLAU\fi,%
    urlcolor=\if@isReadyForPrint black\else TUDBLAU\fi,%
    citecolor=\if@isReadyForPrint black\else OSGREEN\fi,%
    pdftitle=\@pdftitle,%
    pdfauthor=\@ifaAuthor,%
    pdfsubject=\@pdftitle,%
    pdfkeywords={\@ifaKeywords}%,%
  }

  \frontmatter

% =================
% = Titelseite(n) =
% =================  
  \begin{titlepage}
    \begin{picture}(0,0)
      \put(-97,-50){\includegraphics*{kopfzeile}}
    \end{picture}
    
    % A dissertation will get a different titlepage
    \ifthenelse{\not\equal{\@ifaThesis}{Dissertation}}{
      % ===============================
      % = Diplom-, Studienarbeit etc. =
      % ===============================
      \begin{center}
        \vfill
        \vfill
        {\huge\textsc{\@ifaThesis}}\\[0.5cm]
          zum Thema \\[0.5cm]
        {\large \IfStrEq{\@ifaThesisLanguage}{de}{\@ifaTitleDE}{\@ifaTitleEN}}\\
        \vfill
        \begin{tabular}{rl}
          vorgelegt von & \@ifaAuthor \\
          im Studiengang & \@ifaAuthorCourse,\:Jg.\:\@ifaAuthorYearOfMatriculation \\
          geboren am & \@ifaAuthorBirthday\:in\:\@ifaAuthorBirthplace\\ 
        \end{tabular}
        \vfill
        \ifthenelse{\equal{\@ifaThesis}{Diplomarbeit}}{
          {\large zur Erlangung des akademischen Grades eines} \\[0.2cm]
          {\Large Diplomingenieurs\\[0.2cm](Dipl.-Ing.)}
          \vfill
        }{
          \vfill
          \vfill
        }
        \begin{tabular}{rl}
          Betreuer: \ifthenelse{\equal{\@ifaSupervisorA}{}}{}{&\@ifaSupervisorA\\ \ifthenelse{\equal{\@ifaSupervisorB}{}}{}{&\@ifaSupervisorB\\ \ifthenelse{\equal{\@ifaSupervisorC}{}}{}{&\@ifaSupervisorC\\\ifthenelse{\equal{\@ifaSupervisorD}{}}{}{&\@ifaSupervisorD\\ \ifthenelse{\equal{\@ifaSupervisorE}{}}{}{&\@ifaSupervisorE\\}}}}}
          Verantwortlicher Hochschullehrer:   & \@ifaProfessor \\
          Tag der Einreichung:  & \@ifaDayOfSubmission \\
        \end{tabular}
      \end{center}
    }{
      % ================
      % = Dissertation =
      % ================
      \begin{center}
        \vfill
        \vfill
        \setstretch{1.7}
        {\Large {\bfseries\@ifaTitleDE}}\\[5mm]
        {\Large \@ifaTitleEN}\\
        \setstretch{1}
        \vfill
        {\large\bfseries\@ifaAuthor}
        \vfill
        Der Fakultät Elektrotechnik und Informationstechnik\\
        der Technischen Universität Dresden\\[5mm]
        zur Erlangung des akademischen Grades eines\\[2mm]
        {\Large{\bfseries Doktoringenieurs}\\[0.2cm](Dr.-Ing.)}\\[5mm]
        vorgelegte Dissertation\\[5mm]
        ------ \ding{91} ------
        \vfill
        \begin{tabular}{rl}
          \ifthenelse{\equal{\@ifaChair}{}}{}{Vorsitzender: & \@ifaChair \vspace*{.7em}\\}
          Gutachter: \ifthenelse{\equal{\@ifaSupervisorA}{}}{}{&\@ifaSupervisorA\ifthenelse{\equal{\@ifaSupervisorB}{}}{}{\\&\@ifaSupervisorB\ifthenelse{\equal{\@ifaSupervisorC}{}}{}{\\&\@ifaSupervisorC\ifthenelse{\equal{\@ifaSupervisorD}{}}{}{\\&\@ifaSupervisorD\ifthenelse{\equal{\@ifaSupervisorE}{}}{}{\\&\@ifaSupervisorE}}}}}\vspace*{.7em}\\
          % Verantwortlicher Hochschullehrer:   & \@ifaProfessor \\
          Tag der Einreichung: & \@ifaDayOfSubmission \\
          \ifthenelse{\equal{\@ifaDayOfDefense}{}}{}{Tag der Verteidigung: & \@ifaDayOfDefense \\}
        \end{tabular}
      \end{center}
    }
  \end{titlepage}

  \cleardoublepage

  \begingroup
    % Im Vorspann nur Seiten ohne Kopf- und Fußzeile (außer Abschnittsbeginn)
    \pagestyle{empty}
    % Auch Abschnittsbeginn ohne Kopf- und Fußzeile
    \renewcommand*{\chapterpagestyle}{empty}

    % Aufgabenstellung
    \IfFileExists{\@ifaTopicDescriptionPDF} {
      \includepdf{\@ifaTopicDescriptionPDF}
      \cleardoublepage 
    }{
      \ifthenelse{\not\equal{\@ifaThesis}{Dissertation}}{
        \ClassWarning{ifathesis}{Es wurde keine Aufgabenstellung angegeben.}
      }{}
    }
      
    % Kurzfassungen
    \IfFileExists{\@ifaAbstractDE}{
      \begin{picture}(0,0)
        \put(-97,-50){\includegraphics*{kopfzeile}}
      \end{picture}
      \vfill
      \section*{\@ifaTitleDE}
      \input{\@ifaAbstractDE}
      \vfill
      \ifthenelse{\not\equal{\@ifaThesis}{Dissertation}}{
        \begin{flushleft}
          \scriptsize
          \begin{tabular}{ll}
            Betreuer: \ifthenelse{\equal{\@ifaSupervisorA}{}}{}{&\@ifaSupervisorA\\ \ifthenelse{\equal{\@ifaSupervisorB}{}}{}{&\@ifaSupervisorB\\ \ifthenelse{\equal{\@ifaSupervisorC}{}}{}{&\@ifaSupervisorC\\ \ifthenelse{\equal{\@ifaSupervisorD}{}}{}{&\@ifaSupervisorD\\ \ifthenelse{\equal{\@ifaSupervisorE}{}}{}{&\@ifaSupervisorE\\}}}}}Hochschullehrer: &\@ifaProfessor\\Tag der Einreichung: &\@ifaDayOfSubmission \\
          \end{tabular}
          \hfill
          \hrule
          \vspace{.2cm}\normalsize

          \ifthenelse{\equal{\@ifaThesis}{Diplomarbeit}}{DIPLOMARBEIT}{}
          \ifthenelse{\equal{\@ifaThesis}{Masterarbeit}}{MASTERARBEIT}{}
          \ifthenelse{\equal{\@ifaThesis}{Bachelorarbeit}}{BACHELORARBEIT}{}
          \ifthenelse{\equal{\@ifaThesis}{Studienarbeit}}{STUDIENARBEIT}{}
          \ifthenelse{\equal{\@ifaThesis}{Final Project}}{FINAL PROJECT}{}
          \ifthenelse{\equal{\@ifaThesis}{Forschungspraktikum}}{FORSCHUNGSPRAKTIKUM}{}
          \hfill Bearbeiter: \@ifaAuthor
        \end{flushleft}
      }{}
      \cleardoublepage
    }{
      \ClassWarning{ifathesis}{
        Konnte die englische Kurzfassung nicht finden. Diese ist fuer Arbeiten am Institut fuer 
        Automatisierungstechnik unbedingt erforderlich. Sollte die Vorlage anderswo verwendet, 
        dann kann diese Warnung ignoriert werden.
      }
    }


    % Englische Kurzfassung
    \IfFileExists{\@ifaAbstractEN}{
      \begin{picture}(0,0)
        \put(-97,-50){\includegraphics*{kopfzeile}}
      \end{picture}
      \vfill
      \section*{\@ifaTitleEN}
      \input{\@ifaAbstractEN}
      \vfill
      \ifthenelse{\not\equal{\@ifaThesis}{Dissertation}}{
        \begin{flushleft}
          \scriptsize
          \begin{tabular}{ll}
            Tutor: \ifthenelse{\equal{\@ifaSupervisorA}{}}{}{&\@ifaSupervisorA\\ \ifthenelse{\equal{\@ifaSupervisorB}{}}{}{&\@ifaSupervisorB\\ \ifthenelse{\equal{\@ifaSupervisorC}{}}{}{&\@ifaSupervisorC\\ \ifthenelse{\equal{\@ifaSupervisorD}{}}{}{&\@ifaSupervisorD\\ \ifthenelse{\equal{\@ifaSupervisorE}{}}{}{&\@ifaSupervisorE\\}}}}}Supervisor: &\@ifaProfessor\\Day of Submission: &\@ifaDayOfSubmission \\
          \end{tabular}
          \hfill
          \hrule
          \vspace{.2cm}\normalsize
          \ifthenelse{\equal{\@ifaThesis}{Diplomarbeit}}{DIPLOMA THESIS}{STUDENT RESEARCH THESIS}
          \hfill Author: \@ifaAuthor
        \end{flushleft}
      }{}
      \cleardoublepage
    }{
      \ClassWarning{ifathesis}{
        Konnte die englische Kurzfassung nicht finden. Diese ist fuer Arbeiten am Institut fuer 
        Automatisierungstechnik unbedingt erforderlich. Sollte die Vorlage anderswo verwendet, 
        dann kann diese Warnung ignoriert werden.
      }
    }
    
    % Danksagung
    \IfFileExists{\@ifaAcknowledgements}{
      \chapter*{\IfStrEq{\@ifaThesisLanguage}{de}{Danksagung}{Acknowledgements}}
      \input{\@ifaAcknowledgements}
      \cleardoublepage
    }{}
    
    % Verzeichnisse
    \pdfbookmark[1]{\@conTitle}{toc}
    \tableofcontents
    \clearpage
    \if@useListOfFigures
      \listoffigures
      \cleardoublepage
    \fi
    \if@useListOfTables
      \listoftables
      \cleardoublepage
    \fi
    \if@useListOfListings
      \lstlistoflistings
      \cleardoublepage
    \fi
    \if@useAbbrevations
      \IfFileExists{\@ifaAbbrev}{
        \input{\@ifaAbbrev}
        \cleardoublepage
      }{}
    \fi
  \endgroup
  
  \mainmatter

  \pagestyle{scrheadings}
}

% ...und gleich ist Schluss!
\AtEndDocument{
  \cleardoublepage
  % Auch Abschnittsbeginn ohne Kopf- und Fußzeile
  %\renewcommand*{\chapterpagestyle}{empty} 
  % Literaturverzeichnis vor dem Anhang
  \ifthenelse{\equal{\@ifaBibliographyBeforeAppendix}{true}}{        
    \if@isReadyForPrint  
      \markboth{\@bibTitle}{}
    \else 
      \markright{\@bibTitle}
    \fi
    \printbibliography 
    \cleardoublepage
    \automark[section]{chapter}
  }{}

  % Anhänge
  \IfFileExists{\@ifaAppendix}{
    \renewcommand{\appendixpagename}{\@appTitle}
    % Zuerst die Titelseite                          
    \begin{center}                          
      \thispagestyle{empty}
      \vspace*{\fill}
    {\sffamily\bfseries\huge\appendixpagename}
    \vspace{\fill}
      \cleardoublepage
    \end{center}
    % Nun die Anhänge, ohne Titelseite (siehe \RequirePackage --> ohne page-Option)
    \begin{appendices}
      \ifthenelse{\equal{\@ifaBibliographyBeforeAppendix}{true}}{        
        \pagenumbering{Roman}             % römische Nummerierung im Anhang
      \setcounter{page}{1}              % beginne wieder mit Seitenzahl 1
      }{}
      \input{\@ifaAppendix}
      \cleardoublepage
    \end{appendices}
  }{}
           
  % Literaturverzeichnis nach dem Anhang
  \ifthenelse{\equal{\@ifaBibliographyBeforeAppendix}{false}}{
    \if@isReadyForPrint  
      \markboth{\@bibTitle}{}
    \else 
      \markright{\@bibTitle}
    \fi
    \printbibliography 
    \cleardoublepage
    \automark[section]{chapter}
  }{}

  \backmatter

  % Im Abspann nur Seiten ohne Kopf- und Fußzeile (außer Abschnittsbeginn)
  \pagestyle{empty}  
  % Auch Abschnittsbeginn ohne Kopf- und Fußzeile
  \renewcommand*{\chapterpagestyle}{empty}
  
  % Selbständigkeitserklärung
  \vspace*{\fill} %4cm} 
  \section*{Selbstständigkeitserklärung}
Hiermit versichere ich, \@ifaAuthor, geboren am \@ifaAuthorBirthday~in
\@ifaAuthorBirthplace, dass ich \ifthenelse{\not\equal{\@ifaThesis}{Forschungspraktikum}}{die vorliegende \@ifaThesis}{das vorliegende \@ifaThesis}~zum Thema
    \begin{quote}
       \begin{center}
          \emph{\@ifaTitleDE}
       \end{center}
    \end{quote}
  ohne unzulässige Hilfe Dritter und ohne Benutzung anderer als der angegebenen Hilfsmittel angefertigt habe; 
  die aus fremden Quellen direkt oder indirekt übernommenen Gedanken sind als
  solche kenntlich gemacht. Bei der Auswahl und Auswertung des Materials sowie
  bei der Herstellung des Manuskripts habe ich Unterstützungsleistungen von folgenden Personen erhalten:
        \begin{center}
        \emph{\@ifaSupervisorA\IfStrEq{\@ifaSupervisorB}{}{}{, \@ifaSupervisorB}\IfStrEq{\@ifaSupervisorC}{}{}{, \@ifaSupervisorC}\IfStrEq{\@ifaSupervisorD}{}{}{, \@ifaSupervisorD}\IfStrEq{\@ifaSupervisorE}{}{}{, \@ifaSupervisorE}\IfStrEq{\@ifaAdditionalContributors}{}{}{, \@ifaAdditionalContributors}}
      \end{center}
  Weitere Personen waren an der geistigen Herstellung \ifthenelse{\not\equal{\@ifaThesis}{Forschungspraktikum}}{der vorliegenden \@ifaThesis}{des vorliegenden \@ifaThesis s}~nicht beteiligt. Mir ist bekannt, dass die Nichteinhaltung dieser Erklärung zum nachträglichen Entzug des Diplomabschlusses (Masterabschlusses) führen kann.
  \vspace{2cm}
  \begin{flushright}
    Dresden, den \@ifaDayOfSubmission \hfill \dotfill\\
    Unterschrift
  \end{flushright}
  \vfill
}%EOF