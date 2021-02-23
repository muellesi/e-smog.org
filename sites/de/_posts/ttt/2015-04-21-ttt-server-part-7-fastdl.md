---
layout: post
title:  "TTT Dedicated Server Part 7: Fast-DL einrichten"
author: Simon Müller
date:   2015-04-21 21:30:33 +0100
categories: TTT-Server
image: post_images/garrysmod.jpg
kramdown:
    parse_block_html: true
    parse_span_html: true
locale: de_DE
---

In diesem Part möchte ich euch zeigen, wie ihr euren Mitspielern den ersten Serverbeitritt angenehmer gestalten könnt, wenn ihr sogenannte legacy Addons (Alle Addons, die nicht aus dem Workshop stammen) benutzt. Dies geschieht über eine Technik namens FastDL, die von jedem Source-Server unterstützt wird.

<!--more-->

Anmerkung: Das folgende Tutorial orientiert sich an <http://forums.srcds.com/viewtopic/5240>. Da diese Anleitung jedoch nur auf englisch verfügbar ist und um diese Tutorialreihe möglichst vollständig zu halten, möchte ich eine eigene Version dieses Tutorials schreiben. Falls etwas unklar ist, hilft eventuell ein Blick auf die dortige Anleitung.
{: class="alert alert-info"}


## Motivation

Ein normaler Garrys Mod-Server unterstützt eine maximale Downloadrate von 64kBit/Sekunde. Dies ist wie ihr eventuell ausrechnen könnt für Addons mit mehreren MB Größe extrem unpraktisch, weil so der erste Serverbeitritt mitunter mehrere Minuten dauern kann. Hierfür gibt es eine Lösung namens Fast Download oder FastDL. Das Prinzip von FastDL besteht darin, dass alle wichtigen Dateien, die normalerweise direkt vom Spielserver heruntergeladen werden müssten, auf einem Webserver gespiegelt werden, der eine deutlich höhere Bandbreite unterstützt. Die Spielclients bekommen dann beim ersten Beitritt mitgeteilt, wo die Inhalte zu finden sind und können so die große Bandbreite des Webservers nutzen, um große Dateien herunterzuladen.

## Was ihr dafür braucht:

-   Einen Garrys Mod-Server
-   Einen eigenen Webspace, auf den ihr Dateien hochladen könnt, die dann auch per http abgerufen werden können (Kein File Hoster wie Mega o.ä. - ihr müsst eine eigene Verzeichnisstruktur anlegen können). Natürlich braucht ihr entsprechend der Größe eurer Addons eine passende Menge von Speicherplatz. Falls ihr bereits einen eigenen Loading Screen erstellt habt, könnt ihr zum Beispiel den Webspace, welchen ihr hierfür genutzt habt noch einmal verwenden.

### Schritt 1: Dateien zusammensuchen:
Alle Addons, die ihr manuell in `C:\steamcmd\gm\garrysmod` erstellt/kopiert habt, sind Kandidaten für FastDL, da diese vom Client heruntergeladen werden müssen, wenn es sich nicht gerade um ein Server-Only Plugin wie ULX handelt. Da auf jedem Server andere Inhalte genutzt werden, kann ich hier keine allgemein gültige Liste angeben. Auf vielen Servern werden allerdings wahrscheinlich herunterladbare Inhalte in den Ordnern `addons`, `maps`, `materials`, `models` und `sounds` vorhanden sein. 

Um euch den späteren Upload und eventuell das Komprimieren im nächsten Schritt zu vereinfachen, solltet ihr zuerst Kopien aller Dateien anlegen, die ihr später hochladen wollt. Legt dazu auf eurem Desktop o.ä. einen Ordner an (Ich nenne diesen einfach mal beispielhaft `gm_content_tmp`) und kopiert die hochzuladenden Dateien dort unter Erhaltung der Verzeichnisstruktur hinein. Wenn eine Datei auf dem Server also im Ordner `maps` liegt, müsst ihr in eurem `gm_content_tmp`-Ordner ebenfalls einen Ordner `maps` anlegen und die Datei dort hinein kopieren.

Dateien aus dem `addons`-Ordner, die die Endung `.gma` tragen braucht ihr **nicht** hochzuladen. Dies sind Addons, die ihr per Steam Workshop eingebunden habt und entsprechend bei den Clients auch aus dem Workshop heruntergeladen werden.
{: class="alert alert-warning"}

#### Kurzes Beispiel

Ihr habt manuell die Map map1.bsp installiert, die sich nun also in `C:\steamcmd\gm\garrysmod\maps` befindet. Außerdem habt ihr manuell das Addon "shuriken" installiert und dafür den Ordner `shuriken` nach `C:\steamcmd\gm\garrysmod\addons` kopiert.
Vom Ordner `C:\steamcmd\gm\garrysmod` aus gesehen hättet ihr also folgende Ordnerstruktur:
<pre>
garrysmod/
├── addons/
│   └── shuriken
│       ├── lua
│            ├── ...
│       ├── materials
│       └── ...
└── maps
    └── map1.bsp
</pre>

Dann würdet ihr in eurem `gm_content_tmp`-Ordner entsprechend die Unterordner `addons` und `maps` anlegen. In den neuen maps-Unterordner kopiert ihr dann die map1.bsp-Datei und in den addons-Unterordner der gesamte shuriken-Ordner mit allen enthaltenen Dateien und Ordnern.
Am Ende sollte der `gm_content_tmp`-Ordner dann die gleiche Struktur aufweisen wie der garrysmod-Ordner (nur eben nicht mit allen Dateien, sondern nur mit den manuell installierten Addons):
<pre>
gm_content_tmp/
├── addons/
│   └── shuriken
│       ├── lua
│            ├── ...
│       ├── materials
│       └── ...
└── maps
    └── map1.bsp
</pre>

### Schritt 1.2: Komprimieren (optional)

Um den Up- und Downloadvorgang noch einmal deutlich zu beschleunigen, gibt es die Option, die Dateien vor dem Upload mit Hilfe von bzip2 zu komprimieren. 

bzip2 kann in der neusten Version von der [Herstellerseite](http://www.bzip.org/) heruntergeladen werden, ist dort jedoch in der aktuellen Version im Moment nur als Sourcecode-Paket verfügbar. Aus diesem Grund stelle ich hier eine kompilierte Version zur Verfügung. Wer möchte (und eine Version von Visual Studio zur Verfügung hat), kann das Kompilieren aber auch selbst übernehmen.
{: class="alert alert-info"}

---
{::options parse_block_html="true" /}

<div id="accordion">
<div class="card">
<div class="card-header" id="headingOne">
<h5 class="mb-0">
<button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
Mit Toolkit
</button>
</h5>
</div>
<div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
<div class="card-body">

Falls ihr die von mir kompilierte Version von bzip2 herunterladet, sind Skript und Ordner schon beigelegt, sodass diese Schritte entfallen.

<center><a href="{{"/downloads/Bzip2Tool.zip" | absolute_url}}" class="btn btn-primary btn-lg" role="button">Download Bzip2Tool</a></center>

<br/>
Nach dem Download müsst ihr zunächst den in der zip-Datei enthaltenen Ordner entpacken. Darin befindet sich die `bzip2.exe`, ein Batch-Skript namens `compress.bat` und ein Ordner namens `compress`. 

Um die hochzuladenden Inhalte zu komprimieren, kopiert ihr einfach euren `gm_content_tmp`-Ordner mit allen Inhalten in den enthaltenen `compress`-Unterordner und startet dann das Batch-Skript. bzip2 sollte nun rekursiv alle Inhalte komprimieren und an den Dateinamen `.bz2` anhängen.
</div>
</div>
</div>
<div class="card">
<div class="card-header" id="headingTwo">
<h5 class="mb-0">
<button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
Für Selbstkompilierer
</button>
</h5>
</div>
<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
<div class="card-body">

Da bzip2 nur mit einzelnen Dateien arbeiten kann und keine Option zur rekursiven Komprimierung ganzer Verzeichnisse anbietet, ist es sinnvoll, das mit Hilfe eines kleinen Batch-Skriptes selbst "nachzurüsten":

~~~ shell
:: compress.bat
:: Recursive bz2 Compress
:: By: Simon Mueller

@echo off

echo Recursively compressing files in %~dp0compress\
IF NOT EXIST compress MKDIR compress
for /r compress %%x in (*) do bzip2.exe -v -z "%%x"
@echo Press enter to exit...
@pause >nul
~~~

<br />
Das obenstehende Batch-Skript sollte zusammen mit der bzip2.exe in einen eigenen Ordner abgelegt werden. Außerdem muss im selben Ordner ein Unterordner namens `compress` angelegt werden. Alle Inhalte, die sich in diesem Unterordner befindet, wird beim Start des Batch-Skriptes dann automatisch und rekursiv komprimiert. 

Um also die hochzuladenden Inhalte zu komprimieren, kopiert ihr einfach euren `gm_content_tmp`-Ordner mit allen Inhalten in den enthaltenen `compress`-Unterordner und startet dann das Batch-Skript. bzip2 sollte nun rekursiv alle Inhalte komprimieren und an den Dateinamen `.bz2` anhängen.

</div>
</div>
</div>
</div>

<br />

## Schritt 2: Vorbereitung auf dem Server

Am besten legt ihr auf eurem Webserver für den Content, den ihr gleich hochladen werdet, einen eigenen Ordner an (für das Tutorial wähle ich hier einfach den Namen `gm_content`), um alles schön übersichtlich zu halten. Auf diese Weise könnt ihr falls das später nötig wird zum Beispiel auch Content für einen zweiten Server in einem anderen Ordner ablegen.

## Schritt 3: Upload

In den soeben erstellten Ordner auf eurem Server ladet ihr nun den gesamten Inhalt eures `gm_content_tmp`-Ordners hoch. Am Ende sollte der Inhalt des `gm_content`-Ordners auf eurem Webserver also wie bereits der `gm_content_tmp`-Ordner Teile der Struktur des `garrysmod`-Ordners aus eurem Garry's Mod Server spiegeln.

## Schritt 3: Konfiguration

Nachdem alle Dateien erfolgreich hochgeladen sind, müsst ihr euren Server nun noch so konfigurieren, dass er den Clients auch mitteilt, wo sie die Dateien schnell herunterladen können.
Dafür müsst ihr ein weiteres Mal eure server.cfg bearbeiten. Fügt die folgenden drei Zeilen an einer beliebigen Stelle ein und passt die URL unter `sv_downloadurl` an euer eigenes Setup an. Wenn ihr also einen Server habt, der unter `foo.de` erreichbar ist und dort den Inhalt in den Ordner `gmod_content` hochgeladen habt, gebt ihr entsprechend `http://foo.de/gmod_content` an.

~~~ conf
sv_downloadurl "http://euerserver.de/gmod_content"
sv_allowdownload 1
sv_allowupload 1
~~~

---
<p style="text-align: center;"> <em><strong>NOCH FRAGEN?</strong></em></p>
<p style="text-align: center;"><em>Schau dir doch mal die <a title="Garrys mod TTT Dedicated Server erstellen – Part 7: F.A.Q/Troubleshooting" href="{{ site.baseurl }}{% post_url ttt/2015-11-03-ttt-server-part-8-faq %}">FAQ </a>an, vielleicht wurde deine Frage bereits beantwortet. Wenn nicht, schreibe mir gerne in den Kommentaren.</em></p>
&nbsp;