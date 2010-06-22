\def\fileversion{0.1}
\def\filedate{2010/06/22}
\def\filename{ifathesis}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{\filename}[\filedate DA/SA-Klasse des Instituts fuer Automatisierungstechnik, (c) by Stefan Hennig, Arne Sonnenburg]
\typeout{Class: '\filename' Version \fileversion, Standard DA/SA-Klasse des Instituts fuer Automatisierungstechnik.}

\newif\if@useListOfFigures\@useListOfFiguresfalse
\DeclareOption{listoffigures}{\@useListOfFigurestrue}

\newif\if@useListOfTables\@useListOfTablesfalse
\DeclareOption{listoftables}{\@useListOfTablestrue}

\newif\if@useAbbrevations\@useAbbrevationsfalse
\DeclareOption{abbrevations}{\@useAbbrevationstrue}

\newif\if@isReadyForPrint\@isReadyForPrinttrue
\DeclareOption{print}{\@isReadyForPrinttrue}
\DeclareOption{screen}{\@isReadyForPrintfalse}

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

% Absatznummerierung fuer 4 Ebenen (z.B. 2.3.2.1) gemaess IfA Richtlinie einschalten.
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{4} 

% Lade benötigte Pakete
\include{packages}

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

\renewcommand*{\backref}[1]{}
\renewcommand*{\backrefalt}[4]{%
  \ifcase #1 %
    %
  \or
    \par \footnotesize \sffamily \vspace{0.25\baselineskip} {\raggedleft Zitiert auf Seite #2.\par}%
  \else
    \par \footnotesize \sffamily \vspace{0.25\baselineskip} {\raggedleft Zitiert auf Seiten #2.\par}%
  \fi
}

\RequirePackage{ifthen}



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
\newcommand*{\@ifaTitleEN}{Titel der Arbeit}
\newcommand*{\@ifaSupervisorA}{}
\newcommand*{\@ifaSupervisorB}{}
\newcommand*{\@ifaSupervisorC}{}
\newcommand*{\@ifaSupervisorD}{}
\newcommand*{\@ifaSupervisorE}{}
\newcommand*{\@ifaProfessor}{Titel der Arbeit}
\newcommand*{\@ifaDayOfSubmission}{\today}
\newcommand*{\@ifaAppendix}{GoHaigh2}
\newcommand*{\@ifaAbstractDE}{GoHaigh2}
\newcommand*{\@ifaAbstractEN}{GoHaigh2}
\newcommand*{\@ifaReferences}{IPhei0Ox}
\newcommand*{\@ifaAbbrev}{00_Abbrev}

\newcommand*{\ifaThesis}[1]{\renewcommand*{\@ifaThesis}{#1}}
\newcommand*{\ifaAuthor}[1]{\renewcommand*{\@ifaAuthor}{#1}}
\newcommand*{\ifaAuthorBirthday}[1]{\renewcommand*{\@ifaAuthorBirthday}{#1}}
\newcommand*{\ifaAuthorBirthplace}[1]{\renewcommand*{\@ifaAuthorBirthplace}{#1}}
\newcommand*{\ifaAuthorCourse}[1]{\renewcommand*{\@ifaAuthorCourse}{#1}}
\newcommand*{\ifaAuthorYearOfMatriculation}[1]{\renewcommand*{\@ifaAuthorYearOfMatriculation}{#1}}
\newcommand*{\ifaKeywords}[1]{\renewcommand*{\@ifaKeywords}{#1}}
\newcommand*{\ifaTitleDE}[1]{\renewcommand*{\@ifaTitleDE}{#1}}
\newcommand*{\ifaTitleEN}[1]{\renewcommand*{\@ifaTitleEN}{#1}}
\newcommand*{\ifaSupervisorA}[1]{\renewcommand*{\@ifaSupervisorA}{#1}}
\newcommand*{\ifaSupervisorB}[1]{\renewcommand*{\@ifaSupervisorB}{#1}}
\newcommand*{\ifaSupervisorC}[1]{\renewcommand*{\@ifaSupervisorC}{#1}}
\newcommand*{\ifaSupervisorD}[1]{\renewcommand*{\@ifaSupervisorD}{#1}}
\newcommand*{\ifaSupervisorE}[1]{\renewcommand*{\@ifaSupervisorE}{#1}}
\newcommand*{\ifaProfessor}[1]{\renewcommand*{\@ifaProfessor}{#1}}
\newcommand*{\ifaDayOfSubmission}[1]{\renewcommand*{\@ifaDayOfSubmission}{#1}}
\newcommand*{\ifaAppendix}[1]{\renewcommand*{\@ifaAppendix}{#1}}
\newcommand*{\ifaAbstractDE}[1]{\renewcommand*{\@ifaAbstractDE}{#1}}
\newcommand*{\ifaAbstractEN}[1]{\renewcommand*{\@ifaAbstractEN}{#1}}
\newcommand*{\ifaReferences}[1]{\renewcommand*{\@ifaReferences}{#1}}
\newcommand*{\ifaAbbrev}[1]{\renewcommand*{\@ifaAbbrev}{#1}}

% Jetzt geht es los...
\AtBeginDocument{%
  % colorlinks: Farbige Verweise statt Umrahmung 
  % Verhalten von hyperef Ändern: Farbe für Bildschirm, SW für Druck
  % ...color: Farbe verschiedener Verweise nach Farbpalette svgnames
  % pdf...: Setzten von Variablen die in den Eigenschaften der PDF-Datei angzeigt werden
  % Weitere Optionen möglich - siehe Dokumentation des Paktes hyperref
  \hypersetup{
    linkcolor=\if@isReadyForPrint black\else blue\fi,%
    urlcolor=\if@isReadyForPrint black\else blue\fi,%
    citecolor=\if@isReadyForPrint black\else green\fi,%
    pdftitle=\@ifaTitleDE,%
    pdfauthor=\@ifaAuthor,%
    pdfsubject=\@ifaTitleDE,%
    pdfkeywords={\@ifaKeywords}%,%
  }

  \frontmatter
  
  \begin{titlepage}
    \begin{picture}(0,0)
      \put(-97,-50){\includegraphics*{kopfzeile}}
    \end{picture}
        
    \begin{center}
      \vfill
      \vfill

      {\huge\textsc{\@ifaThesis}}\\[0.5cm]
      zum Thema \\[0.5cm]
      {\large \@ifaTitleDE}\\

      \vfill

      \begin{tabular}{rl}
        vorgelegt von   & \@ifaAuthor \\
        im Studiengang  & \@ifaAuthorCourse,\:Jg.\:\@ifaAuthorYearOfMatriculation \\
        geboren am     & \@ifaAuthorBirthday\:in\:\@ifaAuthorBirthplace\\ 
      \end{tabular}
      \vfill

      \ifthenelse{\equal{\@ifaThesis}{Diplomarbeit}}{
        {\large zur Erlangung des akademischen Grades} \\[0.2cm]
        {\LARGE Diplomingenieur\\[0.2cm](Dipl.-Ing.)}
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
  \end{titlepage}

  \clearpage
  \begingroup
    % Im Vorspann nur Seiten ohne Kopf- und Fußzeile (außer Abschnittsbeginn)
    \pagestyle{empty}
    % Auch Abschnittsbeginn ohne Kopf- und Fußzeile
    \renewcommand*{\chapterpagestyle}{empty}

    % Aufgabenstellung
    \vfill
    \begin{center}
      \Huge Hier die Aufgabenstellung im Original (bzw. als Kopie im Zweitexemplar) nach dem Drucken, vor dem Binden einbinden, indem dieses Blatt ersetzt wird. Die Möglichkeit die Kopie als pdf-Dokument einzufügen wird evtl. in einer folgenden Version der Vorlage zur Verfügung stehen.
    \end{center}
    \cleardoublepage 

    % Kurzfassungen
    \begin{picture}(0,0)
      \put(-97,-50){\includegraphics*{kopfzeile}}
    \end{picture}
    \vfill
    \section*{\@ifaTitleDE}
    \input{\@ifaAbstractDE}
    \vfill

    \begin{flushleft}
      \scriptsize
      \begin{tabular}{ll}
        Betreuer: \ifthenelse{\equal{\@ifaSupervisorA}{}}{}{&\@ifaSupervisorA\\ \ifthenelse{\equal{\@ifaSupervisorB}{}}{}{&\@ifaSupervisorB\\ \ifthenelse{\equal{\@ifaSupervisorC}{}}{}{&\@ifaSupervisorC\\ \ifthenelse{\equal{\@ifaSupervisorD}{}}{}{&\@ifaSupervisorD\\ \ifthenelse{\equal{\@ifaSupervisorE}{}}{}{&\@ifaSupervisorE\\}}}}}Hochschullehrer: &\@ifaProfessor\\Tag der Einreichung: &\@ifaDayOfSubmission \\
      \end{tabular}
      \hfill
      \hrule
      \vspace{.2cm}\normalsize

      \ifthenelse{\equal{\@ifaThesis}{Diplomarbeit}}{DIPLOMARBEIT}{STUDIENARBEIT}
      \hfill Bearbeiter: \@ifaAuthor
    \end{flushleft}

    \cleardoublepage

    %
    \begin{picture}(0,0)
      \put(-97,-50){\includegraphics*{kopfzeile}}
    \end{picture}
    \vfill
    \section*{\@ifaTitleEN}
    \input{\@ifaAbstractEN}
    \vfill
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

    \cleardoublepage

    % Verzeichnisse
    \tableofcontents
    \clearpage
    \if@useListOfFigures
      \listoffigures
      \clearpage
    \fi
    \if@useListOfTables
      \listoftables
      \clearpage
    \fi
    \if@useAbbrevations
      \IfFileExists{\@ifaAbbrev}{
        \input{\@ifaAbbrev}
        \clearpage
      }{}
    \fi
  \endgroup
  
  \mainmatter

  \pagestyle{scrheadings}
}

% ...und gleich ist Schluss!
\AtEndDocument{
  % Auch Abschnittsbeginn ohne Kopf- und Fußzeile
  \renewcommand*{\chapterpagestyle}{empty} 

  \bibliographystyle{abbrvnat}
  \bibliography{\@ifaReferences}
  \cleardoublepage

  \IfFileExists{\@ifaAppendix}{
    \renewcommand{\appendixpagename}{Anhang}
    \begin{appendices}
      \input{\@ifaAppendix}
      \clearpage
    \end{appendices}
  }{}

  \backmatter
  
  % Im Abspann nur Seiten ohne Kopf- und Fußzeile (außer Abschnittsbeginn)
  \pagestyle{empty}  
  % Auch Abschnittsbeginn ohne Kopf- und Fußzeile
  \renewcommand*{\chapterpagestyle}{empty}

  % Selbständigkeitserklärung
  \vspace*{\fill} %4cm}
  \section*{Selbstständigkeitserklärung}
    Hiermit erkläre ich, \@ifaAuthor, geboren am \@ifaAuthorBirthday~in \@ifaAuthorBirthplace, dass ich die
    von mir am heutigen Tag dem Prüfungsausschuss der Fakultät Elektrotechnik und Informationstechnik
    eingereichte Diplomarbeitarbeit zum Thema
    \begin{quote}
       \begin{center}
          \emph{\@ifaTitleDE}
       \end{center}
    \end{quote}
    vollkommen selbstständig verfasst und keine anderen als die angegebenen Quellen und Hilfsmittel benutzt,
    sowie Zitate kenntlich gemacht habe.
  \vspace{2cm}
  \begin{flushright}
    Dresden, den \@ifaDayOfSubmission \hfill \dotfill\\
    Unterschrift
  \end{flushright}
  \vfill
}%EOF
