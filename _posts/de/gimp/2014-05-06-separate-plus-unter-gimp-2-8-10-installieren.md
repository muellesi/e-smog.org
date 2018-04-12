---
title: \[Veraltet\] Separate Plus unter GIMP 2.8.10 bis 2.8.14 installieren
date: 2014-05-06 08:23
image: assets/post_images/cmyk.png
categories: GIMP
locale: de_DE
---

Das für den Druck der eigenen Werke durchaus sehr sinnvolle und praktische Plugin Separate Plus spielt leider unter GIMP 2.8.x für 64-Bit-Windows nichtmehr so ganz mit: Es quittiert GIMP's Versuch, es zu laden mit einer Fehlermeldung und taucht anschließend nicht im GIMP-Menü auf. <!--more-->

<span style="color: #ff0000;">**Achtung:** Dieser Artikel ist veraltet und gilt für die alten GIMP-Versionen 2.8.x bis einschließlich 2.8.14\. Mit Separate 0.5.9 Alpha 3 gibt es eine neue Version des Plugins, die mit der neusten Version von GIMP - der Version 2.8.16 - wieder zusammenarbeitet, ohne, dass weiterer Aufwand nötig wäre. Zur Installation der neuen Version, siehe [hier](https://e-smog.org/blog/separate-unter-gimp-2-8-16-installieren/).</span>

## Was ist das Problem?

[caption id="attachment_394" align="alignright" width="300"][![“Der Prozedureinsprungpunkt g_get_home_dir_utf8 wurde in der DLL libglib-2.0-0.dll nicht gefunden”](https://e-smog.org/blog/wp-content/uploads/2014/05/g_get_home_dir-300x104.png)](https://e-smog.org/blog/wp-content/uploads/2014/05/g_get_home_dir.png) “Der Prozedureinsprungpunkt g_get_home_dir_utf8 wurde in der DLL libglib-2.0-0.dll nicht gefunden” -Zur Korrekten Funktion des Plugins brauchen wir eine eigene libglib-DLL[/caption]

Dies ist dem Umstand verschuldet, dass seit GIMP 2.8.8 (ca.) eine neue Version der in der Fehlermeldung benannten libglib-2.0-0.dll genutzt wird, welche die in der Fehlermeldung genannte Funktion nichtmehr unterstützt [<sup>1)</sup>](#ref1). Da Separate Plus leider aber noch auf die alte DLL-Datei setzt, müssen wir uns diese also besorgen. und dem Plugin zur Verfügung stellen. In der GIMP-Version 2.8.14 fiel zudem noch eine weitere Funktion weg, weshalb noch eine weitere dll bemängelt wurde. Auch diese muss dem Plugin also extra zur Verfügung gestellt werden.

## Wie wird es gelöst?

### Methode 1 (einfach)

#### Schritt 1

Zur schnellen Installation des Plugins habe ich ein Paket ([Download unten](#downloads), bitte auf die GIMP-Version achten!) zusammengestellt, mit dem man keine zusätzlichen Dateien besorgen muss: Hat man die Zip-Datei  heruntergeladen, wird sie einfach in den GIMP-Pluginordner entpackt.

#### Schritt 2

[![](https://e-smog.org/blog/wp-content/uploads/2014/05/gimp-settings-separate-1-300x236.png)](https://e-smog.org/blog/wp-content/uploads/2014/05/g_get_home_dir_2.png)Anschließend müssen wir GIMP noch sagen, dass es im so neu erstellten Ordner ebenfalls nach Plugins suchen soll. Dies geht in den Einstellungen (Bearbeiten -&gt; Einstellungen) unter Ordner -&gt; Plugins. Hier wird einfach ein neuer Eintrag angelegt, der den Pfad zum soeben erstellten Ordner enthält (Siehe Screenshot).

### Methode 2 (komplizierter)

Wer sich die Dateien lieber selbst besorgen möchte:

#### Schritt 1

Das Separate-Plugin an sich bekommt ihr von [http://de.sourceforge.jp/projects/separate-plus/releases/](http://de.sourceforge.jp/projects/separate-plus/releases/) (ganz unten, [separate+-0.5.9-alpha1.zip](http://de.sourceforge.jp/projects/separate-plus/downloads/51630/separate+-0.5.9-alpha1.zip/)).

#### Schritt 2

Das Plugin an sich wird allerdings nicht funktionieren. Ihr braucht zunächst wie oben beschrieben die libglib aus einer älteren GIMP-Version. Die libglib aus GIMP 2.8.6 müsste eigentlich funktionieren.

Ich werde hier jetzt nicht ausführlich beschreiben, wie man an diese herankommt, da es einfach zu viele Wege gibt. An die alten Versionen von GIMP kommt ihr zum Beispiel über den [Download von gimpusers.de](http://www.gimpusers.de/downloads/87-gimp-2-8-6-windows) (leitet auf Sourceforge weiter, wo früher die Windows-Installer von GIMP gehostet wurden).

Wir brauchen auf jeden Fall die folgenden drei Dateien aus dem bin-Verzeichnis der alten GIMP-Version: die libglib-2.0-0.dll, die libtiff-3.dll und die libgio-2.0-0.dll und für GIMP 2.8.14 wird zusätzlich die libgobject-2.0-0.dll benötigt.

Am besten kommt man an diese Dateien heran, indem man sich einfach den offiziellen GIMP-Installer herunterlädt und diesen mit einem [Inno-Setup-Unpacker](http://sourceforge.net/projects/innounp/) entpackt.

&nbsp;

#### Schritt 3

Zum Schluss müssen wir alle 6/7 (bei 2.8.14) Dateien (Die drei .exe-Dateien des Plugins und die drei/vier DLLs die wir eben kopiert haben) zusammen in einen eigenen Ordner (zum Beispiel mit dem Namen "Separate") im GIMP-Plugin-Verzeichnis packen.

#### Schritt 4

Ab hier wird vorgegangen wie in Methode 1, Schritt 2.

&nbsp;

## Downloads

**Download für GIMP 2.8.14:**

[download id="851"]

<span style="color: #ff0000;"><small>Hinweis: Aus irgend einem Grund kennzeichnet Google Chrome diesen Download als "Ungewöhnlich", was nicht heißt, dass Schadsoftware enthalten ist. Da Google jedoch nicht offenlegt, nach welchen Kriterien diese Einstufung erfolgt, kann ich hier leider im Moment nichts dagegen tun. Um die Datei trotz der Warnung herunterzuladen, müsst ihr ganz Rechts in der Schaltfläche des Downloads auf den kleinen Pfeil klicken und "Beibehalten" wählen. Für die Misstrauischen, hier [hier noch ein Scan durch Virustotal](https://www.virustotal.com/de/file/2527f7905d771b0e9fb011e677422165277862f070e349b7fb030d744539f40b/analysis/) ;). </small></span>

_[Update 18.03.15]: Zumindest bei mir wird jetzt keine Warnung mehr angezeigt. Wenn das bei euch auch so ist, gebt mir vielleicht einfach kurz Bescheid, damit ich diesen Hinweistext wieder entfernen kann :)_

&nbsp;

**Download für GIMP 2.8.10:**

[download id="675"]

&nbsp;

## Quellen

** [1)](#ref1)**
_Zitat dazu von Schumaml, einem Mitarbeiter am GIMP-Projekt auf gimpforum.de:_
> Das Problem:
> 
> 
> Die Funktion g_get_home_dir_utf8 sollte es in der Glib auf 64-Bit-Windows-Betriebsysstemen eigentlich nie gegeben haben, da das nur eine Krücke war, um per g_get_home_dir auf 32-Bit-Windows das Benutzerprofilverzeichnis in [UTF-8](https://de.wikipedia.org/wiki/UTF-8) ausgeben zu lassen.
> 
> 
> Dummerweise gabs ein paar Versionen dieser Bibliothek, die das doch verfügbar hatten, und ein paar Plug-ins sind nun dagegen [gelinkt](https://de.wikipedia.org/wiki/Linker_%28Computerprogramm%29). Neuere Versionen der Glib beheben den Fehler der Verfügbarkeit dieser Funktion, mit dem Ergebnis dieser Fehlermeldung.
_ [http://gimpforum.de/showthread.php?p=149780#poststop](http://gimpforum.de/showthread.php?p=149780#poststop)_