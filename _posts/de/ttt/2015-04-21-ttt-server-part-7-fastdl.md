---
layout: post
title:  "TTT Dedicated Server Part 7: Fast-DL einrichten"
author: Simon Müller
date:   2015-04-21 21:30:33 +0100
categories: TTT-Server
image: assets/post_images/garrysmod.jpg
locale: de_DE
---

In diesem Part möchte ich euch zeigen, wie ihr euren Mitspielern den ersten Serverbeitritt angenehmer gestalten könnt, wenn ihr sogenannte legacy Addons (Alle Addons, die nicht aus dem Workshop stammen) benutzt. Dies geschieht über eine Technik namens FastDL, die von jedem Source-Server unterstützt wird.

<!--more-->

Anmerkung: Das folgende Tutorial orientiert sich an <http://forums.srcds.com/viewtopic/5240>. Da diese Anleitung jedoch nur auf englisch verfügbar ist und um diese Tutorialreihe möglichst vollständig zu halten, möchte ich eine eigene Version dieses Tutorials schreiben.
{: class="alert alert-warning"}

### Motivation

Ein normaler Garrys Mod-Server unterstützt eine maximale Downloadrate von 64kBit/Sekunde. Dies ist wie ihr eventuell ausrechnen könnt für Addons mit mehreren MB Größe extrem unpraktisch, weil so der erste Serverbeitritt mitunter mehrere Minuten dauern kann. Hierfür gibt es eine Lösung namens Fast Download oder FastDL. Das Prinzip von FastDL besteht darin, dass alle wichtigen Dateien, die normalerweise direkt vom Spielserver heruntergeladen werden müssten, auf einem Webserver gespiegelt werden, der eine deutlich höhere Bandbreite unterstützt. Die Spielclients bekommen dann beim ersten Beitritt mitgeteilt, wo die Inhalte zu finden sind und können so die große Bandbreite des Webservers nutzen, um große Dateien herunterzuladen.

### Was ihr dafür braucht:

-   Einen Garrys Mod-Server
-   Einen eigenen Webspace, auf den ihr Dateien hochladen könnt, die dann auch per http abgerufen werden können (Kein File Hoster wie Mega o.ä. - ihr müsst eine eigene Verzeichnisstruktur anlegen können). Natürlich braucht ihr entsprechend der Größe eurer Addons eine passende Menge von Speicherplatz. Falls ihr bereits einen eigenen Loading Screen erstellt habt, könnt ihr zum Beispiel den Webspace, welchen ihr hierfür genutzt habt noch einmal verwenden.

### Schritt 1: Vorbereitung

Am besten legt ihr auf eurem Webserver für den Content, den wir gleich hochladen werden, einen eigenen Ordner an (für das Tutorial wähle ich hier einfach den Namen `gm_content`), um alles schön übersichtlich zu halten. Auf diese Weise könnt ihr falls das später nötig wird zum Beispiel auch Content für einen zweiten Server in einem anderen Ordner ablegen. In diesem Ordner werden wir im folgenden alle wichtigen Dateien unterbringen, die beim Serverbeitritt vom User heruntergeladen werden müssen.


#### Schritt 1.1: Dateien zusammensuchen: 
Alle Dateien, die ihr bisher in `/gm/garrysmod` erstellt/kopiert habt sind Kandidaten für FastDL, da diese ziemlich sicher vom Client heruntergeladen werden müssen, wenn es sich nicht gerade um ein Server-Only Plugin wie ULX handelt.  Da auf jedem Server andere Inhalte genutzt werden, ist es schwierig, hier eine allgemeine Liste anzugeben. Auf den meisten Servern werden allerdings wahrscheinlich Inhalte in den Ordnern `maps`, `materials`, `models` und `sounds` vorhanden sein. W 

Um euch den späteren Upload und eventuell das Komprimieren im nächsten Schritt zu vereinfachen, solltet ihr am besten zuerst Kopien aller Dateien anlegen, die ihr später hochladen wollt. Legt dazu auf eurem Desktop o.ä. einen temporären Ordner an und kopiert die hochzuladenden Dateien dort unter Erhaltung der Verzeichnisstruktur hinein. Wenn eine Datei auf dem Server also im Ordner `maps` liegt, müsst ihr in eurem temporären Ordner ebenfalls einen Ordner `maps` anlegen und die Datei dort hinein kopieren.


#### Schritt 1.1: Komprimieren (optional)
Damit der Download noch einmal deutlich beschleunigt wird, gibt es die Option, die Dateien mit Hilfe von bzip2 zu komprimieren. 

### Schritt 2: Upload

Nun ladet ihr alle Dateien, die ihr von Hand in `/gm/garrysmod` erstellt/kopiert habe, unter Erhaltung der Ordnerstruktur in den gerade angelegten Ordner hoch. Dazu gehören unter anderem: Maps, Addons, Musik, Soundeffekte, Grafiken, etc.

#### Ein Kurzes Beispiel:

Ihr habt eine eigene SWEP (Traitor/Detective-Waffe, ...) installiert und musstet hierfür Dateien oder gar ganze Ordner nach `C:\steamcmd\gm\garrysmod\gamemodes\terrortown\entities\weapons` kopieren. Dann müssen nun alle diese eigenen Dateien/Ordner nach `WEBSERVER/fastdl/gamemodes/terrortown/entities/weapons` hochgeladen werden. Wenn ihr also die beiden Verzeichnisstrukturen vom Ordner "garrysmod" auf eurem PC und dem Ordner "fastdl" auf eurem Webserver vergleicht, sollten sie übereinstimmen. Achtung: Ladet aber keinen Content hoch, der schon seit der Serverinstallation vorhanden ist (und damit direkt zum Server gehört) -- das hat keinerlei Nutzen und sorgt nur dafür, dass die Spieler unnötige Dateien herunterladen müssen. Wenn ihr also keine eigenen Dateien im Ordner "materials" habt, braucht ihr diesen Ordner auch nicht auf eurem Webserver zu erstellen. Ladet außerdem auf keinen Fall euer cfg-Verzeichnis hoch -- darin ist unter anderem das rcon-Passwort zu finden -- ihr würdet damit also jedem das Passwort herausgeben, mit dem man euren Server fernsteuern kann.

### Schritt 3: Konfiguration

Nachdem alle Dateien erfolgreich hochgeladen sind, müsst ihr euren Server nun noch so konfigurieren, dass er den Clients auch mitteilt, wo sie die Dateien schnell herunterladen können.
Dafür müsst ihr ein weiteres Mal eure server.cfg bearbeiten. Fügt die folgenden drei Zeilen an einer beliebigen Stelle ein und passt die URL unter `sv_downloadurl` an euer eigenes Setup an. Wenn ihr also einen Server habt, der unter `foo.de` erreichbar ist und dort den Inhalt in den Ordner `bar` hochgeladen habt, gebt ihr entsprechend `http://foo.de/bar` an.

~~~ conf
sv_downloadurl "http://euerserver.de/gmod_content"
sv_allowdownload 1
sv_allowupload 1
~~~

---
<p style="text-align: center;"> <em><strong>NOCH FRAGEN?</strong></em></p>
<p style="text-align: center;"><em>Schau dir doch mal die <a title="Garrys mod TTT Dedicated Server erstellen – Part 7: F.A.Q/Troubleshooting" href="{%post_url de/ttt/2015-11-03-ttt-server-part-8-faq %}">FAQ </a>an, vielleicht wurde deine Frage bereits beantwortet. Wenn nicht, schreibe mir gerne in den Kommentaren.</em></p>
&nbsp;