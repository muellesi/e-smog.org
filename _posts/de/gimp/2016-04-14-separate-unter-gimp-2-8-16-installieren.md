---
title: Separate+ unter Gimp 2.8.16+ installieren
date: 2016-04-14 14:11
image: assets/post_images/cmyk.png
categories: Gimp
---

Am 26\. März wurde eine neue Alpha-Version des Plugins Separate Plus für Gimp veröffentlicht, die den Aufwand aus dem Tutorial "Separate Plus unter Gimp 2.8.10 bis 2.8.14 installieren" unnötig macht. Wie die Installation mit dieser neuen Version funktioniert, zeige ich hier.
<!--more-->

### Separate herunterladen und entpacken

Das Plugin kann nach wie vor auf [osdn.jp](https://osdn.jp/projects/separate-plus/releases/p8879) gefunden werden. Dort findet ihr die Datei [separate+-0.5.9-alpha3.zip](https://osdn.jp/projects/separate-plus/downloads/51630/separate%2B-0.5.9-alpha3.zip/), welche ihr herunterladet und anschließend öffnet. Ein halbwegs aktuelles Windows sollte die zip-Datei ohne zusätzliche Programme öffnen können. Im Zip-Archiv befinden sich nun innerhalb eines einzelnen Unterordners verschiedene Dateien, die wir aber bei weitem nicht alle brauchen werden. Bei einem Großteil der Dateien handelt es sich um Quellcode-Dateien, die den eigentlichen Code des Plugins enthalten, uns jedoch keinerlei Nutzen bringen. Wir interessieren uns nur für die exe-Dateien, die sich jeweils im Unterordner Win32_x64 bzw. Win32_x86 befinden.

Bevor wir uns ans entpacken machen, legen wir zunächst im Gimp-Benutzerordner (Unter C:\Users\EUER BENUTZERNAME\.gimp-2.8\) innerhalb des Ordners plug-ins einen neuen Ordner namens separate an. Nun habt ihr also den Ordnerpfad  C:\Users\EUER BENUTZERNAME\.gimp-2.8\plug-ins\separate. Falls dieser Ordner schon existiert, weil ihr eventuell bereits meiner alten Anleitung gefolgt seid, kann der bestehen bleiben, ihr müsst aber **alle(!)** Dateien, die sich darin befinden, löschen.

[caption id="attachment_1140" align="alignright" width="300"][![So sollte der Inhalt des separate-ordners dann aussehen. ](https://e-smog.org/blog/wp-content/uploads/2016/04/separate-entpackt-300x64.png)](https://e-smog.org/blog/wp-content/uploads/2016/04/separate-entpackt.png) So sollte der Inhalt des separate-ordners dann aussehen.[/caption]

An diesem Punkt solltet ihr nun - wenn ihr das nicht sowieso schon wisst - nachsehen, ob ihr ein 32-bit oder ein 64-bit System habt. Je nachdem, welche Art von System ihr habt, kopiert ihr jetzt den Inhalt des Unterordners Win32_x86 (für 32-Bit Systeme) oder des Ordners Win32_x64 (für 64-Bit Systeme) in den gerade angelegten separate-Ordner.  Am Ende sollte das dann so in etwa aussehen, wie auf dem nebenstehenden Screenshot.

### Letzte Einstellungen in Gimp

[![](https://e-smog.org/blog/wp-content/uploads/2014/05/gimp-settings-separate-1-300x236.png)](https://e-smog.org/blog/wp-content/uploads/2014/05/gimp-settings-separate-1.png)

**Hinweis**: Diesen Teil könnt ihr überspringen, falls ihr entsprechend meinem alten Tutorial bereits die Ordnereinstellungen in Gimp angepasst habt. Guckt am besten vorsichtshalber einfach trotzdem mal nach, ob die entsprechende Einstellung bei euch vorhanden ist.

Nach dem Entpacken müssen wir Gimp noch sagen, dass es im gerade neu erstellten Ordner "separate" ebenfalls nach Plugins suchen soll. Dies geht in den Einstellungen (Bearbeiten -&gt; Einstellungen) unter Ordner -&gt; Plugins. Hier wird einfach ein neuer Eintrag angelegt, der den Pfad zum soeben erstellten Ordner enthält (Siehe Screenshot).

Einen neuen Eintrag legt ihr an, indem ihr einmal oben das Icon mit dem leeren Papier anklickt, anschließend in das Textfeld den Pfad zum Separate-Ordner eintragt und mit Enter bestätigt. Wenn ihr einen gültigen Pfad angegeben habt, wechselt beim Drücken von Enter außerdem der Punkt neben dem  Textfeld seine Farbe von rot nach grün. Falls ihr den Pfad nicht von Hand eingeben wollt, könnt ihr auch den Durchsuchen-Dialog nutzen, den ihr mit einem Klick auf das Ordnersymbol bekommt.

Nach einem Neustart von Gimp sollte das neue Separate+ nun geladen werden und euch unter Bild-&gt;Separate zur Verfügung stehen.