---
layout: post
title:  "TTT Dedicated Server Part 3: Integration des Steam Workshop"
author: Simon Müller
date:   2014-04-22 21:30:33 +0100
categories: TTT-Server
image: assets/post_images/garrysmod.jpg
showtoc: true
locale: de_DE
---

In diesem Teil soll es nun wie bereits angekündigt darum gehen, unserem Server ein wenig Leben in Form von Steam-Workshop-Inhalten wie neuen Waffen, Funktionen – oder dem allerwichtigsten: zusätzlichen Maps! - einzuhauchen.

<!--more-->

## Steam API-Key besorgen

Um mit eurem Server auf den Steam Workshop zugreifen zu können, braucht ihr zunächst einen Steam API-Key. Diesen könnt ihr euch unter [http://steamcommunity.com/dev/apikey](http://steamcommunity.com/dev/apikey) generieren lassen.

Für welchen Zweck man hier einen Domainnamen eingeben muss, erschließt sich mir hier nicht so ganz, soweit ich weiß ist dieser allerdings auch nicht weiter von Bedeutung. Wenn ihr wie im ersten Teil empfohlen eine no-ip-Domain angelegt habt, könnt ihr beispielsweise diese nutzen. Ansonsten könnt ihr soviel ich weiß aber auch jede andere Domain eingeben ([In diesem Tutorial](https://www.youtube.com/watch?v=saCof9QqjnA) zum Beispiel wird steamidfinder.com als Domain genutzt).

Nach Bestätigung der Eingabe erhaltet ihr einen 32 Zeichen langen Schlüssel aus Zahlen und Großbuchstaben, den ihr euch am besten zunächst in einer Textdatei abspeichert.

## Eine Workshop-Kollektion anlegen

***Hinweis:** Bevor ihr die Kollektion erstellt, abonniert am besten im Workshop ein beliebiges Garry’s Mod- Objekt – sonst kann es unter umständen zu Problemen bei der Einrichtung kommen.*

Nun müsst ihr euch noch eine Workshop-Kollektion anlegen, in die von nun an alle Addons gepackt werden, welche auf eurem Server laufen sollen. Dieser Prozess ist eigentlich ziemlich selbsterklärend:

Im Workshop zu Garry’s Mod geht ihr in den [Kollektions-Tab](http://steamcommunity.com/workshop/browse/?appid=4000&amp;section=collections) und klickt rechts auf "Kollektion erstellen".  Ihr werdet nun durch eine Einrichtung geführt (Eigentlich ist alles, was ihr hier eingebt und auswählt ziemlich egal – nur beim Punkt *"Um welche Art von Kollektion handelt es sich?"* solltet ihr *"Objekte, die zusammenpassen (zeigt einen "Alle abonnieren"-Knopf)"* auswählen), welche eigentlich ziemlich selbsterklärend ist.

Nach einem klick auf Speichern und Fortfahren, habt ihr die Möglichkeit, jetzt schon Objekte zur Kollektion hinzuzufügen. Diesen Schritt überspringen wir aber zunächst, da dies später noch genauso gut möglich ist (**Ein** Objekt **müssen** wir leider hinzufügen, um mit der Einrichtung überhaupt weitermachen zu dürfen – hier kommt das am Anfang des Abschnitts abonnierte Objekt ins Spiel - im Tab Abonnierte Objekte könnt ihr dieses in die Kollektion holen – keine Angst, später kann es auch wieder daraus entfernt werden).

Ein weiterer Klick auf Speichern und Fortfahren bringt uns zum vorerst letzten Schritt bei der Einrichtung: wir sollen ein Hintergrundbild hochladen – auch hier ist eigentlich egal, was ihr hochladet, ihr solltet nur aufpassen, dass ihr bei keinem hochgeladenen Bild die Rechte anderer verletzt (Copyright, Bilder von anderen Personen, …) und auch ein Bild von der letzten Party ist eher fehl am Platz – zur Not legt ihr mit Paint ein reinweises Bild an und ladet dieses hoch.

Nach einem Klick auf den "Veröffentlichen"-Button seid ihr fertig (**Das Veröffentlichen ist wichtig!** Sonst kann der Server eure Kollektion nicht abrufen).

Nun könnt ihr nach belieben im Workshop nach Addons und Maps stöbern, die ihr auf dem Server nutzen wollt und diese via dem Button “Zur Kollektion hinzufügen” auf den Server packen. Verzichtet dabei aber darauf, andere Kollektionen mit einzubinden, sondern holt euch lieber alle Addons dieser Kollektionen einzeln - mit verlinkten Kollektionen scheint der Server Probleme zu haben.

## Das Serverstartscript anpassen
Da der Server von alledem ja noch nichts mitbekommen hat, müssen wir ihm nun noch mitteilen, welche Kollektion er denn nutzen soll. Hierzu braucht ihr noch die ID eurer Kollektion. Diese findet ihr heraus, indem ihr eure Kollektion in eurem Browser aufruft und euch die URL anschaut. Lautet diese zum Beispiel `http://steamcommunity.com/sharedfiles/filedetails/?id=251913754`, dann ist die ID eurer Kollektion entsprechend `251913754`.

Nun müsst ihr eurem Server noch euren frisch generierten API-Key und die ID der Kollektion mitteilen. Dies geschieht im Startscript über weitere Parameter: `+host_workshop_collection` für die ID eurer Kollektion und `-authkey` für den oben frisch generierten Identifikationsschlüssel. Habt ihr bisher also aus [Tutorial Nr. 2]({% post_url de/ttt/2014-04-16-ttt-server-part-2-setup %}) noch folgendes in eurem Startscript stehen:

~~~ bash
srcds.exe -console -maxplayers 16 -game garrysmod +gamemode terrortown +map gm_construct
~~~

so wird das mit den passenden Ergänzungen zu

~~~ bash
srcds.exe -console -maxplayers 16 -game garrysmod +gamemode terrortown +map gm_construct -authkey XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX +host_workshop_collection XXXXXXXXX
~~~

Die XXXX müsst ihr natürlich dabei jeweils durch euren Key und eure Kollektions-ID ersetzen.

Wenn ihr bereits ein paar Maps in eurer Kollektion habt, könnt ihr bei dieser Gelegenheit auch gleich eine von ihnen als Startmap festlegen. Statt `+map gm_construct` schreibt ihr einfach `+map EUER_MAPNAME`. Ein Beispiel aus meiner Serverkonfiguration wäre hier: `+map ttt_minecraft_b5`.

## Workshopdownload erzwingen
Es kann bei manchen Workshoppaketen vorkommen, dass diese von den Clients der Mitspieler nicht heruntergeladen werden, obwohl sie eigentlich im Spiel benötigt werden. Dies ist besonders häufig der Fall bei Content-Addons, wie sie zum Beispiel für den Pointshop benötigt werden. Die Folge ist, dass Texturen fehlen, Spieler als Error-Nachrichten herumlaufen oder ebendiese wild auf der Map verteilt herumliegen, was bisweilen ganz schön stören kann.

Mit einer kleinen Datei könnt ihr jedoch den Download dieser Pakete bei den Clients erzwingen. Beachtet dabei aber bitte, dass die Addons dann auf jeden Fall immer von allen komplett heruntergeladen werden müssen - eure Maps solltet ihr in die Liste also nicht mit aufnehmen, die werden normalerweise automatisch heruntergeladen und würden sonst den ersten Serverbeitritt eines potentiellen Mitspielers zur Qual machen.

### Wie gehts?
Um den Download der Pakete zu erzwingen benötigt ihr eine lua-Datei, deren Inhalt auf jeden Fall beim Serverstart ausgeführt wird.

#### Halbautomatischer Weg
Um diesen Vorgang zu erleichtern habe ich ein kleines Tool geschrieben, in dem ihr bequem per Häkchen auswählen könnt, für welche Addons der Download erzwungen werden soll. Das Tool generiert euch daraufhin dann den Quelltext, den ihr mit der nachfolgenden manuellen Methode komplett von Hand erzeugen müsstet.

<center><a href="{{"/assets/downloads/ResourcesLuaCreator.zip" | absolute_url}}" class="btn btn-primary btn-lg" role="button">Download</a></center>


#### Manueller Weg
Am einfachsten geht das, wenn ihr im Unterordner `/garrysmod/lua/autorun/server` eine neue Lua-Datei mit beliebigem Namen erstellt. Die Dateien in diesem Ordner werden alle auf jeden Fall auf dem Server beim Starten ausgeführt. Als Inhalt bekommt die Datei nun nur Zeilen nach dem folgenden Format:

~~~ lua
resource.AddWorkshop( "workshopid" )
~~~ 

Anstatt "workshopid" müsst ihr für jedes Addon, dessen Download ihr erzwingen wollt dessen ID in Anführungszeichen einfügen. Wenn also die URL eines Addons im Workshop `http://steamcommunity.com/sharedfiles/filedetails/?id=1234567` lautet, müsstet ihr die folgende Zeile einfügen, um dessen Download zu erzwingen: `resource.AddWorkshop( "1234567" )`. Mit ein paar mehr Addons sähe das dann so aus:

~~~ lua
resource.AddWorkshop( "1234567" ) --Pedobär Playermodel Version 1337
resource.AddWorkshop( "89101112" ) --Supermegatolle Spezialwaffe
resource.AddWorkshop( "13141516" ) --Total lächerlicher Hut für Pointshop
~~~

Wie ihr seht habe ich mittels zwei Bindestrichen hinter jede Zeile einen Kommentar gesetzt, welcher das Addon kurz beschreibt. Das macht das aktualisieren und Warten der Liste erheblich einfacher, da man nicht einfach nur vor einem Haufen Zahlen sitzt, sondern auf einen Blick sieht, um welches Addon es sich bei der jeweiligen Zeile handelt. Wenn ihr diese Datei nun abspeichert und euren Server neu startet, sollten von nun an alle Clients die spezifizierten Addons beim ersten Serverbeitritt herunterladen.

## Welche Addons sind für den Start sinnvoll?
Ihr solltet von Anfang an darauf achten, euren Server – so cool die ganzen Addons auch klingen – nicht zu überladen. Sonst wird es für potentielle Spieler eine Qual, sich das erste Mal mit eurem Server zu verbinden, wenn sie zunächst 2 Stunden Workshop-Content herunterladen müssen, anstatt direkt losspielen zu können.

Deshalb hier eine kleine Liste von Addons, die auf einem TTT-Server durchaus sinnvoll sind:

#### Addons:

* [Mapvote](http://steamcommunity.com/sharedfiles/filedetails/?id=151583504)– Der Name sagt alles. Anstatt immer von Hand in der Serverkonsole die Map ändern zu müssen, wird nach der Runde eine Liste mit Maps angezeigt, über die die Spieler abstimmen können.
* [TTT Weapon Collection](http://steamcommunity.com/sharedfiles/filedetails/?id=194965598) – macht das Spiel durch zusätzliche Waffen – auch für Traitors und Detectives - etwas abwechslungsreicher.
* [ULX/ULIB]({% post_url de/ttt/2014-09-27-ttt-server-part-6-admin %}) - Ein Addon zum administrieren des Servers. Von der kompletten Neukonfiguration des Servers (nur während einer Runde) bis zu einem Mapwechsel ist alles mit wenigen Mausklicks machbar. *Die aktuelle Version des Addons sollte man sich auf jeden Fall auf der Herstellerseite herunterladen und nicht über den Steam Workshop, deshalb verlinke ich hier auf einen weiteren Teil dieser Artikelserie, wo die Installation von ULX genau erklärt wird.*

#### Maps:

* [TTT Map Pack](http://steamcommunity.com/sharedfiles/filedetails/?id=148364870) – ein guter Anfangsbestand an Maps, auf den man aufbauen kann.
* [ttt_minecraft_b5](http://steamcommunity.com/sharedfiles/filedetails/?id=159321088) – Tolle Map, es bleibt eigentlich immer spannend, ohne, dass sich alle an einem Punkt versammeln.
* [ttt_mw2_terminal](http://steamcommunity.com/sharedfiles/filedetails/?id=176887855) – Für alle die gerne COD:MW2 gespielt haben: TERMINAL! Muss ich noch mehr sagen? (Auch wenn die etwas eckige Optik ein bisschen gewöhnungsbedürftig ist)
* [ttt_rooftops_a2_f1](http://steamcommunity.com/sharedfiles/filedetails/?id=434164467) – eine durch die wenigen Verbindungen zwischen den Dächern immer sehr spannende Map – die Traitors haben viele Sniper-Möglichkeiten und können versteckt hinter einem Hausdach oder einer Ecke auch mal einen Innocent killen, ohne sofort aufzufliegen.
* [ttt_whitehouse_b2](http://steamcommunity.com/sharedfiles/filedetails/?id=163347610) – Ebenfalls sehr viele Möglichkeiten, sich zu verteilen und damit gute Chancen für die Traitors ohne dabei zu unausgewogen zu werden.
* [ttt__bb_teenroom_b2](http://steamcommunity.com/sharedfiles/filedetails/?id=141103402) – durch die einzelne Sniperposition auf dem Schrank leider etwas unausgewogene aber dennoch immer wieder lustige Map in einem riesigen Kinderzimmer – bietet viele kleine vernetzte Gänge durch Mäuselöcher in der Wand und im Lüftungssystem.
Wer weitere Vorschläge für gute Maps/Addons hat, kann diese gerne in den Kommentaren nennen, eventuell nehme ich sie dann in die Liste mit auf.

---

<p style="text-align: center;"> <em><strong>NOCH FRAGEN?</strong></em></p>
<p style="text-align: center;"><em>Schau dir doch mal die <a title="Garrys mod TTT Dedicated Server erstellen – Part 7: F.A.Q/Troubleshooting" href="{%post_url de/ttt/2015-11-03-ttt-server-part-8-faq %}">FAQ </a>an, vielleicht wurde deine Frage bereits beantwortet. Wenn nicht, schreibe mir gerne in den Kommentaren.</em></p>
<p style="text-align: center;"><em>Weiter gehts in <a title="Garrys mod TTT Dedicated Server erstellen – Part 4: Andere Spiele “mounten”" href="{% post_url de/ttt/2014-05-14-ttt-server-part-4-mounten %}">Part 4</a> mit dem Mounten der Dateien aus CounterStrike: Source</em></p>