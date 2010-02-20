%!TEX root = /Users/stefan/Desktop/de.tud.et.ifa.latex.ifathesis/test-template.tex

% Copyright text goes here...
%
%
%
\def\fileversion{0.1}
\def\filedate{2010/02/20 }
\def\filename{ifathesis}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{\filename}[\filedate DA/SA-Klasse des Instituts fuer Automatisierungstechnik, (c) by Stefan Hennig, Arne Sonnenburg]
\typeout{Class: '\filename' Version \fileversion, Standard DA/SA-Klasse des Instituts fuer Automatisierungstechnik.}

% Lade Basisklasse der Vorlage
\LoadClass[
	fontsize=12pt,			% Grundschriftgröße
	a4paper,				% Papiergröße
	%BCOR=12mm,				% Binderandgröße für DRUCK ANSCHALTEN!!!
	DIV=9,					% Teil der Seite, der als Seitenrand berücksichtigt wird (auch =calc mgl.):
							% Z.B. DIV=10: Randbreite Oben und Mitte 1/10, Unten und Außen 2/10 der Seite.
							% Regel: 60 bis 70 Zeichen pro Zeile, weniger ist besser, niemals mehr als 80!
							% Für DRUCK DIV=10!!!
	headinclude=true,		% Gehört Kopfzeile eher zur Seite oder zum Rand?
	footinclude=false,		% Gehört Fußzeile eher zur Seite oder zum Rand?
	captions=tableheading,	% Tabellenabstände für TabellenÜBERschriften optimieren
	twoside=false,			% Dokument zweiseitig?
	headings=small,			% Relative Größe der Überschriften
	bibliography=totoc,		% Literaturverzeichnis im Inhaltsverzeichnis referenziert
	%chapterprefix,			% Schaltet die "Kapitel ..." Zeile ein
	%appendixprefix,		% Schaltet die "Anhang ..." Zeile ein (inkompatibel mit der Definition weiter unten)
	numbers=noenddot,		% Punkte nach Abschnittsnummern? (Weglassen = Automatik)
							% Nach Duden im vorliegenden Bsp. falsch, da auch Buchstaben in Gliederung (Anhang).
	pagesize,				% Schreibt die Seitengröße ins Seitenregister, so das DVI- und PDF-Seiten die richtige
							% Größe haben.
	svgnames				% Namensraum für xcolor Paket											
]{scrbook}					% Basisklasse der Vorlage: Koma-Skrip Klasse analog zur book-Klasse.

\RequirePackage[utf8]{inputenc}	% Eingabe von Umlauten ermöglichen.
\RequirePackage[T1]{fontenc}		% EC-Fonts verwenden, so dass Wörter mit Umlauten getrennt werden
\RequirePackage{lmodern}			% Verbesserte Schriftart. Alternativ auch \RequirePackage{palatino}, \RequirePackage{fourier}, etc.
\RequirePackage[ngerman]{babel}		% Silbentrennung nach neuer deutscher Rechtschreibung.
\RequirePackage{nameref}			% Zusatzpaket zu hyperref. Muss vor inkompatiblen Paketen geladen werden.
\RequirePackage{graphicx} 			% zum Einbinden von Graphiken (.png,.pdf,...)
\RequirePackage{units}				% zum Korrekten setzen von Einheiten mit \unit[Wert]{Einheit}
									% (noch weitere Befehle unterstützt)
\RequirePackage{booktabs}			% verbessert das Aussehen von Tabellen, neue Berehele \toprule, \midrule, etc.
\RequirePackage{multirow}			% Mehrere Zeilen in Tabellen zusammenfassen
\RequirePackage{multicol}			% Mehrere Spalten in Tabellen zusammenfassen
\RequirePackage{paralist}			% Ermöglicht parametrisierbare Listen wie z.B. compactitem
\RequirePackage{subfigure} 			% Zum Benutzen der Subfigure Umgebung  (2 Bilder in einem) <VOR/NACH Paket hyperref?>
\RequirePackage[section]{placeins}	% Plaztiert zu einem Abschnitt gehörende Floating-Objekte spätestens am Ende des Abschnitts
\RequirePackage{pdfpages} 			% Zum einbinden von kompletten PDF-Seiten (z.B. Aufgabenstellung)
\RequirePackage{caption}			% Paket zum Einbinden von Captions bei Nicht-Float-Objekten (hauptsächlich für Anhang)
\RequirePackage{natbib}		        % Paket zum Personalisieren von Zitaten im Text. Fuer eckige Klammern [square]

\RequirePackage{calc} 				% Für Berechnungen mit Variablen
\RequirePackage{upgreek} 			% Aufrechte griechische Buchstaben (beachte ISO konformer Formelsatz
\RequirePackage{bm}               	% Fette Formelzeichen (Vektoren, Matrizen, etc.)

\RequirePackage{microtype} 			% Optischer Randausgleich

\RequirePackage{textcomp}			% Sonderzeichen wie Copyright, Trademark, Registered und nicht kursives mü
	% Zum hochgestellten Benutzen der des Registered-Zeichens
	\def\TReg{\textsuperscript{\textregistered}}
	% Zum hochgestellten Benutzen der des Copyright-Zeichens
	\def\TCop{\textsuperscript{\textcopyright}} 
	% Zum hochgestellten Benutzen der des Trademark-Zeichens
	\def\TTra{\textsuperscript{\texttrademark}}  

% für mathematische Symbole <Kompatibilität zu hyperref beachten!>
\RequirePackage{amsmath}			
	% Workaround für hyperref Verwendung
	\let\equation\gather	
	% Workaround für hyperref Verwendung			
	\let\endequation\endgather	

% zur scrbook-Klasse passendes Koma-Skript- Paket zum Einbinden einer Kopf-/Fußzeile:		
\RequirePackage[
	headsepline, 	% headsepline für die Linie unter der Kopfzeie,
	automark		% automark für das automatische Update des Kopfzeileninhalts
]{scrpage2} 	
																							

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
\addtokomafont{caption}{\small}					% Kleinere Schriftgröße für Captions
\setkomafont{captionlabel}{\sffamily\bfseries}	% Caption-Label fett und serifenlos
\setcapindent{1em}								% 2. Zeile der Caption mit hängendem Einzug

% Für farbige Verweise
\RequirePackage{xcolor}								

% Paket zum setzen von Verweisen im Dokument 	
\RequirePackage[
	pdfpagelabels, 
	plainpages=false, 
	colorlinks=true
]{hyperref}

\RequirePackage[
	hyperpageref,
	german
]{backref}

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

																						

%%%%%
% Jetzt müssen zunächst die variablen Angaben geladen werden
\newcommand*{\@ifaThesis}{Diplomarbeit}
\newcommand*{\@ifaAuthor}{Max Mustermann}
\newcommand*{\@ifaAuthorBirthday}{01.01.1970}
\newcommand*{\@ifaAuthorBirthplace}{Dresden}


\newcommand*{\@ifaKeywords}{Komma-separierte, Liste, mit, Schlagwörtern, zum Thema, der Arbeit}
\newcommand*{\@ifaTitle}{Titel der Arbeit}
\newcommand*{\@ifaBetreuer}{Stefan Hennig}
\newcommand*{\@ifaHochschullehrer}{Titel der Arbeit}

\newcommand*{\ifaThesis}[1]{\renewcommand*{\@ifaThesis}{#1}}
\newcommand*{\ifaAuthor}[1]{\renewcommand*{\@ifaAuthor}{#1}}
\newcommand*{\ifaKeywords}[1]{\renewcommand*{\@ifaKeywords}{#1}}
\newcommand*{\ifaTitle}[1]{\renewcommand*{\@ifaTitle}{#1}}

\newcommand{\ifaTitlepage} {

}



\AtBeginDocument{%
	% colorlinks: Farbige Verweise statt Umrahmung 
	% Verhalten von hyperef ändern: Farbe für Bildschirm, SW für Druck
	% ...color: Farbe verschiedener Verweise nach Farbpalette svgnames
	% pdf...: Setzten von Variablen die in den Eigenschaften der PDF-Datei angzeigt werden
	% Weitere Optionen möglich - siehe Dokumentation des Paktes hyperref
	\hypersetup{
		linkcolor=DarkBlue,%
		urlcolor=blue,%
		citecolor=DarkGreen,%
		pdftitle=\@ifaTitle,%
		pdfauthor=\@ifaAuthor,%
		pdfsubject=\@ifaTitle,%
		pdfkeywords={\@ifaKeywords},%
		pdfdisplaydoctitle=true,%
		pdfpagemode=UseOutlines	%Determines how the file is opening:
		%UseNone, UseThumbs (show thumbnails), UseOutlines (show bookmarks), FullScreen, UseOC, UseAttachments
	}
    \setlength{\baselineskip}{2.4ex plus0.3ex minus0.2ex}%
    \setlength{\parskip}{\baselineskip}%
    \setlength{\parindent}{0mm}%
    \raggedright%

	\frontmatter
	\begin{titlepage}
		\begin{picture}(0,0)
		\put(-91,-50){\includegraphics*{kopfzeile.pdf}}
		\end{picture}
		\begin{center}
			\vfill
			{\huge\textsc{\@ifaThesis}}
			\vfill
			zum Thema \\[0.5cm]
			{\large \@ifaTitle}
			\vfill
			\begin{tabular}{rl}
				vorgelegt von 	& \@ifaAuthor \\
				geboren am 		& \@ifaAuthorBirthday in \@ifaAuthorBirthplace\\ 
			\end{tabular}
			\vfill

			\ifthenelse{\equal{\@ifaThesis}{Diplomarbeit}}{
				{\large zur Erlangung des akademischen Grades} \\[0.2cm]
				{\LARGE Diplomingenieur\\(Dipl.-Ing.)}
				\vfill
			} {
				\vspace{4.5cm}
			}

			\begin{tabular}{rl}
				Betreuer: 												& Dipl.-Ing.\,\,B.\,Treuer,\\
																					& Dr.-Ing.\,\,S.\,Onstiger\\
				Verantwortlicher									& \\
				Hochschullehrer: 									& Prof.\,Dr.\,techn.\ K.\,Janschek\\
				Tag der Einreichung: 							& 7. August 2008\\
			\end{tabular}
		\end{center}
	\end{titlepage}

}

