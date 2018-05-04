---
title: Ghostscript-Dateien (eps) in GIMP importieren
date: 2014-09-04 10:35
image: assets/post_images/ghostscript.png
categories: GIMP
locale: de_DE
---

GIMP bringt eine Funktion mit, eps-Dokumente zu importieren. Leider scheint aber in der Version 2.8.x ein Fehler in der dafür zuständigen dll vorhanden zu sein, weshalb zwar der Export nach eps klappt, der Import aber mit einer Fehlermeldung wie "PostScript-Datei »C:\...\*.eps« konnte nicht interpretiert werden" fehlschlägt.

<!--more-->

Das Problem lässt sich jedoch sehr einfach beheben:
Zunächst müsst ihr euch Ghostscript herunterladen und installieren. Die jeweils aktuellste Version gibt es unter http://www.ghostscript.com/download/gsdnld.html (In der Spalte GPL Release). **Wichtig:** sucht euch die jeweils zu eurem Betriebssystem passende (32/64 bit) Version, damit später das Zusammenspiel mit GIMP klappt.
Nun geht ihr folgendermaßen vor (**x.yy** ist die Ghostscript-Version, **zz** ist die bit-Zahl eures Systems, also 32 oder 64):

1.  C:\Program Files\GIMP 2\bin\libgs-8.dll zur Sicherung in einen separaten Ordner verschieben
2.  C:\Program Files\gs\gs**x**.**yy**\bin\gsdll**zz**.dll auf den Desktop kopieren
3.  Kopierte gsdll**zz**.dll umbenennen in libgs-8.dll
4.  Die so umbenannte Datei verschieben nach C:\Program Files\GIMP 2\bin\
Wenn ihr das erledigt habt, könnt ihr GIMP starten und zum Test eine eps-Datei importieren. Nun sollte alles wie gewünscht funktionieren.

&nbsp;

_**Hinweis:** Solange das Problem in GIMP nicht behoben wird, müsst ihr obiges nach jedem Update von GIMP wiederholen, weil der Installer die kaputte Datei wiederherstellt._