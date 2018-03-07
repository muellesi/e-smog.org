---
title: Der Registrierungseditor (regedit)
date: 2014-08-20 08:59
categories: Windows
---

In einigen Artikeln auf dieser Seite muss etwas tiefer ins Windows-Betriebssystem eingegriffen werden, um bestimmte Einstellungen zu ändern. Dies geschieht meistens über den Registrierungseditor. Wie dieser funktioniert, soll Inhalt dieses Artikels sein.<!--more-->

### Starten des Registrierungseditors

[![regedit](https://e-smog.org/blog/wp-content/uploads/2014/08/regedit-300x175.png)](https://e-smog.org/blog/wp-content/uploads/2014/08/regedit.png)Am schnellsten geht dies, indem ihr einfach auf der Tastatur gleichzeitig die Windows und die R-Taste drückt. Im sich anschließend öffnenden Fester gebt ihr nun `regedit` ein und drückt Enter.

_Falls ihr über keine Windows-Taste verfügt:_

Öffnet das Startmenü (Windows XP/Vista/7) oder die  Edge UI/Metro-Oberfläche (Windows 8/8.1) über einen klick auf das Windows-Logo links unten. Ohne nun etwas weiteres vorher zu tun, gebt nun einfach regedit ein und klickt dann auf das Suchergebnis "regedit.exe". Ein Fenster sollte sich öffnen, welches ungefähr dem Screenshot rechts entspricht.

&nbsp;

### Die Oberfläche von regedit

Die Oberfläche des Editors entspricht im großen und ganzen der des Windows-Explorers, sieht nur nichtmehr ganz so zeitgemäß aus. Wie im Explorer gibt es auf der linken Seite eine Art Ordnerstruktur (Die Ordner der Registry heißen "Schlüssel"), in der man navigieren kann und auf der rechten Seiten eine Art "Dateien" (diese werden "Werte" genannt).

#### Die Schlüssel

[![regedit_schluessel](https://e-smog.org/blog/wp-content/uploads/2014/08/regedit_schluessel-141x300.png)](https://e-smog.org/blog/wp-content/uploads/2014/08/regedit_schluessel.png) Beim start des Registrierungseditors sind zunächst alle Schlüssel eingeklappt und es sind nur die 5 Hauptschlüssel Sichtbar:

1.  HKEY_CLASSES_ROOT (oft abgekürzt mit **HKCR** oder HCR)
2.  HKEY_CURRENT_USER (**HKCU**/HCU)
3.  HKEY_LOCAL_MACHINE (**HKLM**/HLM)
4.  HKEY_USERS (**HKU**/HU)
5.  HKEY_CURRENT_CONFIG (**HKCC**/HCC)
Wichtig sind hier bei den meisten Tutorials eigentlich nur Nr. 2 und 3, da in diesen beiden Schlüsseln die meisten wichtigen System- und Benutzereinstellungen abgelegt sind.

Unten im Fenster wird außerdem der Übersicht wegen auch noch einmal der vollständige Pfad bis zum gerade angeklickten Schlüssel angezeigt.

#### Erstellen eines neuen (Unter-) Schlüssels

um einen neuen Registrierungsschlüssel zu erzeugen, klickt ihr mit der rechten Maustaste auf den Schlüssel, in dem der neue (Unter-)Schlüssel erzeugt werden soll und wählt im Kontextmenü Neu-&gt;Schlüssel aus. Wie beim erstellen eines Ordners könnt ihr eurem so neuen Schlüssel dann auch direkt noch einen Namen geben.

&nbsp;

#### Die Werte[![regedit_werte](https://e-smog.org/blog/wp-content/uploads/2014/08/regedit_werte-300x216.png)](https://e-smog.org/blog/wp-content/uploads/2014/08/regedit_werte.png)

Rechts neben der Schlüsselansicht befindet sich die Werteansicht. Hier wird wie im Explorer mit den Dateien der Inhalt der jeweils angeklickten Schlüssel angezeigt. Jeder Wert hat dabei immer drei Eigenschaften: Einen **Namen**, einen **Typ** und zugehörige **Daten**. Name und enthaltene Daten eines Wertes können jederzeit geändert werden, während zum ändern des Typs der Wert gelöscht und mit dem gewünschten Typ neu erstellt werden muss.

##### Erstellen eines Wertes

Das erstellen eines neuen Wertes funktioniert ähnlich wie das eines neuen Schlüssels: Mit einem Rechtsklick in die Werteansicht öffnet ihr das Kontextmenü und könnt nun Mit Neu-&gt;... einen neuen Wert mit dem angeklickten Typ erstellen. Der benötigte Typ wird im jeweiligen Tutorial angegeben.

##### Ändern des Wertes

Habt ihr einen neuen Wert erstellt und wollt dessen Daten oder die eines anderen Wertes bearbeiten, könnt ihr mit einem Doppelklick auf den Wert ein Bearbeitungsfenster öffnen. Hier könnt ihr unter Wert die neuen Daten eintragen. Mit "Basis"-Auswahl auf der rechten Seite könnt ihr zudem bei einigen Typen auswählen, ob ihr die Daten im Dezimal- oder im Hexadezimalsystem eingeben wollt. Normalerweise werdet ihr hier wahrscheinlich "Dezimal" nutzen. Solltet ihr doch einmal "Hexadezimal" benötigen, wird das im entsprechenden Tutorial vorher erwähnt.

#### Sichern einzelner Registrierungsschlüssel

Änderungen in der Registry sind in der Regel unwiderrufbar. Das heißt, eine Rückgängig-Funktion, wie sie eventuell aus Bildbearbeitungsprogrammen oder auch dem Windows Explorer bekannt ist, gibt es hier nicht. Dafür kann man unter Umständen mit einer einzigen unbedachten Äderung das ganze System durcheinanderbringen. Umso wichtiger ist es, eine Sicherung aller Daten anzulegen, die wir bearbeiten wollen.
Diese Funktion ist im Registrierungseditor für jeden Schlüssel sehr leicht über das Kontextmenü erreichbar, das wir erhalten, wenn wir mit der rechten Maustaste auf den entsprechenden Eintrag klicken. Die Sicherungsfunktion versteckt sich im Kontextmenü dann unter dem Eintrag "Exportieren". Mit einem Klick auf diesen Eintrag bekommen wir einen Datei-Speichern-Dialog angezeigt, wo wir Pfad und Dateinamen der Sicherungsdatei angeben können. Mit Hilfe dieser Datei, welche die Dateiendung .reg erhält, können wir später im Notfall, falls etwas schiefgelaufen sein sollte, mit einem einfachen Doppelklick sämtliche Werte in einem Schlüssel auf ihren Zustand zum Zeitpunkt der Sicherung zurücksetzen (Die Sicherung also auf jeden Fall immer **vor** der Änderung machen...). Auch nach einer erfolgreichen Änderung, bei der anscheinend nichts schiefgelaufen ist, lohnt es sich, die Sicherungsdatei noch eine Weile aufzuheben, falls sich doch noch späte unerwünschte Auswirkungen der Änderung zeigen.