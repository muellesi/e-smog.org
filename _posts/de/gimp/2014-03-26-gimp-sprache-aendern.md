---
title: Gimp Sprache ändern
date: 2014-03-26 15:01
categories: Gimp
---

Vor allem auf Systemen mit Windows 7 kann es vorkommen, dass gimp bei der Installation die Sprache nicht korrekt erkennt und in englisch startet. Um diesen "Fehler" zu beheben sind dann ein paar kleine Schritte notwendig, die hier näher erläutert werden.

<!--more-->Natürlich kann die gezeigte Vorgehensweise auch für jede andere Sprache verwendet werden (zum Beispiel, um gimp in englisch zu starten, wenn man ein englisches Tutorial vorliegen hat und die Namen der Werkzeuge und Filter nicht immer übersetzen will).

Um die Sprache von Gimp umzustellen gibt es zwei Wege.

_Der erste verändert die Sprache dauerhaft:_

1.  Durch die Tastenkombination "Windows+Pause" wird das Systeminformationsfenster von Windows geöffnet.
2.  Auf der Linken Seite dieses Fensters ist der Menüpunkt "Erweiterte Systemeinstellungen" zu finden - dieser Wird angeklickt.
3.  Ein weiteres Fenster öffnet sich, in dem der Tab "Erweitert" ausgewählt ist.
4.  Ganz unten rechts findet sich jetzt der Button "Umgebungsvariablen" - auch dieser wird angeklickt.
5.  Im darauf folgenden Fenster gibts jetzt zwei Buttons, die mit "Neu..." beschriftet sind.
6.  Wichtig ist für uns zunächst nur der obere der beiden - er wird angeklickt.
7.  In das Textfeld, welches mit "Name der Variablen" beschriftet ist, wird "LANG" (ohne die Anführungszeichen) und bei "Wert der Variablen" "de" eingegeben (auch wieder ohne die "")
8.  Sämtliche Fenster und Dialoge werden nun mit einem Klick auf OK geschlossen.
9.  Beim nächsten Start sollte Gimp jetzt deutsch sein.

    * * *

10.  soll Gimp bei jedem Benutzer auf deutsch starten, muss bei Punkt 6 der untere Neu...-Button angeklickt werden.
_Der zweite Weg ändert die Sprache von Gimp nur temporär, wenn es über eine bestimmte Batchdatei gestartet wird._

1.  Wir öffnen einen beliebigen Texteditor (ein Texteditor wie Notepad++ oder zur Not auch das windowseigene Notepad, kein Textverarbeitungsprogramm wie Word oder OpenOffice) und öffnen ein neues Dokument.
2.  In dieses Dokument kommen nun die folgenden zwei Zeilen:
<pre>set LANG=de
start gimp-2.6.exe</pre>

3.  Wichtig: vor das gimp-2.6.exe muss noch der Pfad zu ebendieser Datei gesetzt werden. Dieser lautet meistens C:\Program Files\GIMP-2.0\bin\, bzw. bei 64-Bit-Sytemen C:\Program Files(x86)\GIMP-2.0\bin\
4.  Das Dokument wird zum Beispiel auf dem Desktop mit dem Namen Gimp.bat abgespeichert (Das .bat ist wichtig!)
5.  Ein Doppelklick auf die erstellte Batchdatei sollte Gimp in der gewünschten Sprache starten
Anstatt dem "de" hinter LANG=, bzw. in der Umgebungsvariablen können die Kürzel für beliebige Sprachen stehen (solange diese von Gimp unterstützt werden, natürlich) möglich sind hier zum Beispiel:

*   de
*   en
*   fr
*   ne
*   ru
usw.