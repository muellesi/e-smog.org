---
title: Windows - Anpassen der Path-Variablen
date: 2017-09-05 15:25
image: assets/post_images/path_variable.png
categories: Windows
---

Soll ein Programm häufig aus der Kommandozeile gestartet werden oder wird es von anderen Programmen benötigt, kann es vorkommen, dass das entsprechende Programm zur Path-Variablen hinzugefügt werden muss. Wie das geht, erkläre ich in diesem Artikel.
<!--more-->
### Was ist die Path-Variable?

Wenn in die Windows-Kommandozeile (oder auch den Ausführen-Dialog, den man mit Windowstaste+R bekommt) der Name eines Programms in Windows eingegeben wird (zum Beispiel „cmd" oder „explorer"), dann sucht Windows in vordefinierten Orten nach einer ausführbaren Datei mit diesem Namen. Standardmäßig sind das die Ordner „C:\Windows", „C:\Windows\System32" und einige andere. Wenn das Programm dort nicht gefunden wird, kann es auf diesem Weg nicht gestartet werden.

Um die Menge der Ordner, die von Windows durchsucht werden, zu erweitern, kann nun die Path-Systemvariable genutzt werden. In dieser können zusätzliche Ordnerpfade zu ausführbaren Dateien angegeben werden, die ebenfalls durchsucht werden sollen, wenn der Name eines Programms eingegeben wird.

Dabei gibt es immer zwei verschiedene Path-Variablen:

Die erste Variable gilt nur für den gerade angemeldeten Benutzer. Sobald dieser sich also abmeldet und sich ein anderer Benutzer anmeldet, sucht Windows nichtmehr in den dort angegebenen Ordnern nach Programmen. Stattdessen wird dann die Path-Variable des neu angemeldeten Benutzers genutzt.

Die zweite Path-Variable gilt Systemweit und für jeden Benutzer. Ein Ordnerpfad, der dort eingetragen ist, wird immer durchsucht, egal, welcher Benutzer gerade angemeldet ist. Dort sind nebenbei bemerkt auch die beiden eben genannten Pfade „C:\Windows" und „C:\Windows\System32" eingetragen.

### Wie kann ich die Path-Variable ändern?

Das ist nicht besonders schwer, wenn du dich aber mit PCs nicht gut auskennst, solltest du zunächst den Abschnitt „Probleme" lesen, um auf der sicheren Seite zu sein.

Die Path-Variable kann an zwei Stellen geändert werden. Beide Methoden werde ich hier kurz zeigen.

#### In der Systemsteuerung


Ruft die Systemsteuerung eures PCs auf und klickt in der Kategorieansicht auf „Sicherheit und System". Anschließend klickt ihr auf System und seht dann die Systemsteuerungsseite aus dem Screenshot rechts vor euch. Auf der linken Seite klickt ihr nun auf „Erweiterte Systemeinstellungen" und erhaltet damit ein weiteres Fenster mit mehreren Tabs. Hier ist der Tab „Erweitert" nun interessant, da es in diesem ganz unten den button „Umgebungsvariablen" gibt.

{% figure [class:"figure"] %}
![System und Sicherheit]({{"/assets/post_images/windows_system.png" | absolute_url}}){: class="figure-img img-fluid rounded"}
{% endfigure %}

Mit einem Klick auf diesen Buttton bekommt ihr ein weiteres Fenster, in dem jetzt alle Umgebungsvariablen aufgelistet werden. Unter Windows 10 sieht dieser aus, wie im Bild unten, unter früheren Windows-Versionen ist der grundlegende Aufbau gleich, nur sieht der Dialog etwas anders aus.

Die beiden Listen entsprechen dabei der im vorigen Abschnitt angesprochenen Unterteilung in System- und Benutzervariablen.

{% figure [caption:"Umgebungsvariablen haben einen Namen und einen Wert. PATH ist eine Spezielle Umgebungsvariable, die Pfade zu Programmen enthält."] [class:"figure"] %}
![Umgebungsvariableneditor UI]({{"/assets/post_images/environment_variables.png" | absolute_url}}){: class="figure-img img-fluid rounded"}
{% endfigure %}

#### Via Script

Die Path-Variable kann zusätzlich zur oben genannten permanenten Methode auch noch temporär für die Ausführzeit eines einzelnen Scripts angepasst werden. Dafür wird wie für normale batch-Variablen auch das Set-Kommando genutzt: `set "path=%path%;C:\Beispiel\Pfad"` Sinnvoll ist dabei, wie im Beispiel den bisherigen Inhalt der Variablen mittels `%path%` wieder mit einzufügen, um nicht unabsichtlich eigentlich benötigte Einträge zu überschreiben.

**Wichtig:** Die Änderung bleibt wirklich nur während der Ausführung des Scriptes erhalten. Ihr müsst die Path-Variable also immer auch wirklich in dem Script anpassen, in dem ihr die Anpassung benötigt. Dies über ein externes Script zu tun, das ihr vor der Ausführung eures eigentlichen Scriptes aufruft, wird also nicht funktionieren.

### Probleme

Windows geht beide Path-Variablen bei der Suche nach einem Programm von vorne nach hinten durch. Zuerst kommt dabei immer die Systemweite Variable dran und danach die Benutzerabhängige. Das kann aber auch zu Problemen führen: Stellt euch vor, ihr ladet ein Programm namens „cmd.exe" herunter -- das Programm hat also genau den gleichen Namen wie die Windows-Konsole im Pfad „C:\Windows\System32". Wenn ihr nun den Pfad zu diesem Programm in eure System-Path-Variable vor den Pfad „C:\Windows\System32" setzt, wird in Zukunft immer zuerst das neue Programm gefunden. Das kann beabsichtigt sein, kann aber auch zu Fehlverhalten führen.