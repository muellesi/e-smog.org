---
layout: post
title:  "TTT Dedicated Server Part 5: Ein eigener Loadingscreen"
author: Simon Müller
date:   2014-06-18 21:30:33 +0100
categories: TTT-Server
image: post_images/garrysmod.jpg
showtoc: true
locale: de_DE
---

In diesem Teil der Tutorialreihe zum Einrichten eines Dedicated Servers für TTT möchte ich euch zeigen, wie ihr einen eigenen Ladebildschirm erstellt, der dann allen Spielern, die sich mit eurem Server verbinden angezeigt wird. Ich werde in diesem Tutorial allerdings nur die allgemeinen Grundlagen zeigen und euch keinen fertigen Ladebildschirm liefern. Wenn ihr also einen eigenen Ladebildschirm erstellen wollt, solltet ihr euch zusätzlich noch ein wenig mit HTML und CSS auseinandersetzen, da dieser als ganz normale Webseite umgesetzt wird, welche einfach im Spiel angezeigt wird.

<!--more-->

Zunächst möchte ich euch eine kleine Zutatenliste geben.  Ihr braucht für euren eigenen Ladebildschirm:

* Einen Dedicated Server für Garry’s Mod
* Einen eigenen Webspace (idealerweise mit PHP) auf den ihr per ftp zugreifen könnt
* Grundkenntnisse in [HTML](http://wiki.selfhtml.org/wiki/Startseite), [CSS](http://www.css4you.de/), [Javascript](http://de.selfhtml.org/javascript/) und bei Bedarf [PHP](http://www.selfphp.de/)


Habt ihr all diese Grundlagen erfüllt, steht eurem eigenen Ladebildschirm nichts mehr im Wege.

## Was müssen wir auf dem Webspace tun
Auf dem Webspace erfolgt der Hauptteil der ganzen Arbeit. Hier werden wir im Folgenden eine ganz normale Webseite anlegen.

### Anlegen eines eigenen Verzeichnisses im Webspace
Um uns nicht den ganzen Webspace mit den Dateien für den Ladebildschirm zu "verunstalten", legen wir ein eigenes Verzeichnis an, in dem später nur die  zum Ladebildschirm gehörenden Dateien landen. Ich werde das Verzeichnis im Folgenden `ttt_loading` nennen. Passt bei der Namensgebung darauf auf, möglichst auf Sonderzeichen, Umlaute und Leerzeichen zu verzichten, da diese zu Problemen führen können.

### Anlegen der nötigen Dateien
Wenn ihr einen Webspace habt, welcher PHP unterstützt, legt ihr am besten zunächst eine Datei namens index.php in eurem neuen Verzeichnis an. dazu kommt noch eine Datei für euer CSS-Stylesheet und eine weitere Datei, welche ich in diesem Beispiel jetzt loading.js nennen werde. Diese enthält später Spielspezifische Funktionen, die im Laufe des Ladefortschritts vom Spiel aufgerufen werden und mit deren Hilfe wir dadurch auf Ladefortschritte reagieren können. Wichtig ist, dass ihr sämtliche Dateien, welche ihr in eurem Ladebildschirm nutzen wollt, natürlich auch in die index.php einbinden müsst.

### Funktionen für die `loading.js`
Wie bereits erwähnt gibt es einige vordefinierte JavaScript-Funktionen, die ihr selbst schreiben und damit auf Ladefortschritte reagieren könnt. Diese Funktionen werden während des Ladens vom Spiel aufgerufen und erhalten per Parameter den aktuellen Ladezustand aber auch andere Informationen zum Server. Im folgenden werde ich euch diese Funktionen kurz vorstellen und euch ihren Sinn erklären:

~~~ js
function DownloadingFile( fileName )
~~~
*Diese Funktion erhält über den Parameter fileName den Namen der Datei, welche gerade vom Spiel heruntergeladen wird. Diesen könnt ihr dann nutzen, um zum Beispiel eine kleine Statusanzeige zu realisieren.*

~~~ js
function SetStatusChanged( status )
~~~ 
*Im Laufe des Ladevorgangs durchläuft das Laden verschiedene Phasen. Diese könnt ihr auch beim Laden mit dem Standard-Ladebildschirm in dem dunkelgrünen Rechteck unten rechts sehen (“Retrieving Server Info”, “Workshop finished”, …)*

~~~ js
function SetFilesTotal( total )
~~~
*Diese Funktion wird genau ein einziges mal aufgerufen, bevor der Download startet. Sie erhält über den Parameter total die Gesamtzahl aller herunterzuladenden Dateien. Wenn ihr euch diese Zahl speichert, könnt ihr mit der nachfolgenden Funktion den prozentualen Fortschritt berechnen.*

~~~ js
function SetFilesNeeded( needed )
~~~
*Diese Funktion erhält  über den Parameter needed nach jeder heruntergeladenen Datei die Information, wie viele Dateien noch heruntergeladen werden müssen. Mit dieser  Funktion lässt sich also zum Beispiel ein Ladebalken realisieren, welcher den aktuellen Downloadfortschritt anzeigt.*

~~~ js
function GameDetails( servername, serverurl, mapname, maxplayers, steamid, gamemode )
~~~
*Diese Funktion ruft das Spiel am Anfang des Ladevorgangs genau einmal auf. Hier werden die wichtigsten Infos zum Server und zum gerade laufenden Spiel übergeben. Die meisten Parameter sollten eigentlich selbsterklärend sein. Im Parameter steamid  wird die Steamid des gerade Ladenden Spielers übergeben. Damit könnt ihr dann zum Beispiel sein Avatar anzeigen. Dies ist jedoch mit PHP wesentlich einfacher, wie ich euch gleich noch zeigen werde.*

#### Weitere Funktionalität für den Ladebildschirm
Das Avatar eines Spielers könnt ihr sehr leicht via PHP anzeigen. Dazu braucht ihr allerdings erneut den im [dritten Tutorial]({{ site.baseurl }}{% post_url ttt/2014-04-22-ttt-server-part-3-workshop %}) erzeugten Key für die Steam API.

Der dazu nötige Code in PHP sieht folgendermaßen aus:

~~~ php
<?php
	$communityid = $_GET["steamid"];
	$authserver = bcsub($communityid, '76561197960265728') & 1;
	$authid = (bcsub($communityid, '76561197960265728')-$authserver)/2;
	$steamid = "STEAM_0:$authserver:$authid";
	$url     = "http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=EUERSTEAMAPIKEY&steamids=".$communityid."&format=xml";
	$data    = file_get_contents($url);
	$xml     = simplexml_load_string($data);
	$avatar = $xml->players->player->avatarfull;
?>
~~~

In der Variable `$avatar` steht anschließend der volle Pfad zum großen Thumbnail des Spieleravatars. Diesen könnt ihr dann nutzen, um das Bild in einem `img`-Tag anzuzeigen. Was ihr euch noch so alles an Informationen über euren joinenden Spieler über die Steam-API holen könnt, könnt ihr euch ansehen, wenn ihr die URL von `$url` mal mit einer validen `$communityid` und eurem API-Key aufruft. Ihr solltet dann ein XML-Dokument angezeigt bekommen, in dem die ganzen Informationen aufgelistet sind. Hier der Aufbau dieses XML-Dokuments:

~~~ xml
<response>
	<players>
	  <player>
		  <steamid>…</steamid>
		  <communityvisibilitystate>3</communityvisibilitystate>
		  <profilestate>1</profilestate>
		  <personaname>…</personaname>
		  <lastlogoff>…</lastlogoff>
		  <profileurl>http://steamcommunity.com/id/…/</profileurl>
		  <avatar>http://media.steampowered.com/…</avatar>
		  <avatarmedium>http://media.steampowered…</avatarmedium>
		  <avatarfull>http://media.steampowered.com/…</avatarfull>
		  <personastate>0</personastate>
		  <realname>…</realname>
		  <primaryclanid>…</primaryclanid>
		  <timecreated>…</timecreated>
		  <personastateflags>0</personastateflags>
		  <loccountrycode>…</loccountrycode>
		  <locstatecode>…</locstatecode>
		  <loccityid>…</loccityid>
	  </player>
	</players>
</response>
~~~

Wer bereits ein bisschen PHP  programmiert hat wird sehen: dem obigen PHP-Script muss mit einem GET-Parameter die Steamid des Spielers übergeben werden. Wie das funktioniert, folgt gleich.

## Einrichten des eigenen Ladebildschirms im Server
Um dem Server zu erklären, welchen Ladebildschirm ihr euren Spielern anzeigen wollt, müsst ihr erneut eine Konfigurationsdatei ändern. Wir benötigen dafür wieder die autoexec.cfg aus dem cfg-Verzeichnis des TTT-Servers. In diese müsst ihr nun die folgende Zeile einfügen:

~~~ conf
sv_loadingurl "http://euer-webspace.de/ttt_loading/index.php?mapname=%m&amp;steamid=%s"
~~~
Wie ihr eventuell sehen könnt, werden hier beim Laden der Seite zusätzlich noch die Parameter mapname und steamid übergeben (das %m und das %s wird durch den Server durch die tatsächlichen Werte für den Mapnamen und die Steamid des joinenden Spielers ersetzt – Diese wird zum Beispiel vom Avatar-Script weiter oben genutzt).

## Abschließendes
### Musik im Loading-Screen: Ja oder Nein?
Von meiner Seite aus ein klares NEIN! Ihr werdet mit der Musik garantiert nicht den Geschmack jedes potentiellen Mitspielers treffen. Außerdem ist es in der Ladephase unmöglich, Steuerelemente im Ladebildschirm zu bedienen, man hat also keine Möglichkeit, die Musik zu stoppen. Auch sind die Ladezeiten beim ersten Betreten eines Servers mitunter sehr lange, wodurch sich ein Lied durchaus während der Ladezeit auch 3-4 Male wiederholen kann – das wird sich keiner antun und euren Server verlassen, bevor er überhaupt mitgespielt hat. Zu guter Letzt kommen noch mögliche Copyrightprobleme dazu, wenn ihr keine eigene Musik nutzt, sondern auf Chartmusik oder ähnliches zurückgreift.

### Und was soll ich jetzt in den Ladebildschirm einbauen?
Hier müsst ihr eurer Kreativität freien Lauf lassen. Häufig wird irgendeine Form von Ladefortschrittsanzeige eingebaut. Zusätzlich könnt ihr zum Beispiel die Serverregeln oder mit Hilfe anderer Tools eventuell Serverstatistiken anzeigen. Viel Spaß dabei!


---

<p style="text-align: center;"> <em><strong>NOCH FRAGEN?</strong></em></p>
<p style="text-align: center;"><em>Schau dir doch mal die <a title="Garrys mod TTT Dedicated Server erstellen – Part 7: F.A.Q/Troubleshooting" href="{{ site.baseurl }}{% post_url ttt/2015-11-03-ttt-server-part-8-faq %}">FAQ </a>an, vielleicht wurde deine Frage bereits beantwortet. Wenn nicht, schreibe mir gerne in den Kommentaren.</em></p>
<p style="text-align: center;"><em>Weiter gehts in <a title="Garrys mod TTT Dedicated Server erstellen – Part 6: Serveradministration mit ULX und ULib" href="{{ site.baseurl }}{% post_url ttt/2014-09-27-ttt-server-part-6-admin %}">Part 6</a> mit der Einrichtung und Nutzung von ULX, einem Plugin zur einfacheren Administration des Servers.</em></p>