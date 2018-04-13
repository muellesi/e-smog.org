---
layout: post
title:  "TTT Dedicated Server Part 6: Administration mit ULX/ULIB"
author: Simon Müller
date:   2014-09-27 21:30:33 +0100
categories: TTT-Server
image: assets/post_images/garrysmod.jpg
showtoc: true
locale: de_DE
---

Nun haben wir also einen voll funktionsfähigen Server und an diesem auch schon so einige Änderungen vorgenommen. Wenn ihr nun aber eventuell nicht nur mit euren Freunden lokal auf einem privaten Server spielen wollt (dafür braucht man ja grundsätzlich nicht einmal einen dedizierten Server), sondern eventuell auch andere auf eurem Server mitspielen lassen wollt, so entsteht früher oder später der Bedarf, den Server besser administrieren zu können. Konkret bedeutet dies: Spieler kicken und bannen, die Map ändern, grundsätzliche Spieleinstellungen zu ändern oder ähnliches. Ohne ein passendes Plugin funktioniert das alles aber gar nicht oder nur nach einem Serverneustart. Aus diesem Grund möchte ich euch ein Plugin, welches eine solche Administration ermöglicht einmal etwas näher vorstellen: ULX.

<!--more-->

## Was kann ULX?

ULX ist ein allrounder: Es eignet sich sehr gut zur Moderation (Spieler kicken, bannen, jailen, …), kann jedoch auch noch sehr viel mehr: Mit einigen wenigen Klicks könnt ihr die Map wechseln, einen Mapvote starten, User teleportieren, usw.

Zu alledem kommen noch verschiedene zusätzliche Funktionen wie das Einblenden einer Message of the day und noch viele andere.

Im oben bereits erwähnten Konfigurationsmenü, welches ihr ingame mit dem Befehl `!menu` öffnen könnt, sind die meisten Befehle in einzelne Kategorien unterteilt, womit sie sehr schnell erreichbar sind. Die meisten dieser Befehle sind selbsterklärend, wenn man etwas englisch beherrscht, im folgenden werde ich die wichtigsten Funktionen kurz erklären, aber nicht allzu tief auf einzelne Funktionen eingehen – wer mehr Informationen zu einer bestimmten Funktion braucht, kann diese einfach mal ausprobieren, in der Dokumentation nachlesen, was sie macht oder einfach hier nachfragen.

{% figure [caption:"Das ULX-Menü bietet sehr viele Funktionen, welche allesamt in die Kategorien auf der linken Seite einsortiert sind."] [class:"figure"] %}
![ulx main menu]({{"/assets/post_images/ttt_ulx_main.jpg" | absolute_url}}){: class="figure-img img-fluid rounded"}
{% endfigure %}

### Was sind die Vorteile zu anderen Admin-Plugins?
Da ULX wohl das am weitesten verbreitete Plugin zur Serveradministration ist, sind auch viele andere Plugins darauf ausgelegt, damit interagieren zu können. Wenn ihr also ULX nutzt, ist in den meisten Fällen sichergestellt, dass eure Addons auch gut zusammenarbeiten. Außerdem gibt es aufgrund der hohen Bekanntheit auch einige sehr sinnvolle Erweiterungen für ULX – ein Beispiel hierfür wird auch ganz am Ende dieses Artikels noch kurz vorgestellt.

## Die Einrichtung
Sehr schwer ist die Einrichtung von ULX nicht: Zunächst müsst ihr euch die beiden Pakete ULX und ULib von der [Herstellerseite](http://ulyssesmod.net/downloads.php) herunterladen.

***ACHTUNG:** Ihr solltet euch unbedingt **beide** Pakete installieren, denn ohne ULib funktioniert ULX erst gar nicht richtig!*

Nun werden die zip-Archive in das Addons-Verzeichnis aus eurer Serverinstallation entpackt. Ab diesem Zeitpunkt sollte ULX bei einem Serverstart nun bereits gefunden und geladen werden. Testen könnt ihr das Plugin auch schon, indem ihr im ingame-Chat einfach !menu schreibt. Dies sollte ein kleines Fenster in der Bildschirmmitte öffnen, in dem ihr bereits die ersten paar Befehle seht, die das Plugin beherrscht. Dies sind jedoch noch nicht sehr viele, da ihr dem Plugin im Moment noch als einfacher User bekannt seid – und wer will schon jedem neuen User die Macht über den gesamten Server geben?

### Ersten Administrator anlegen

Ihr müsst dem Plugin nun also zunächst einmal klarmachen, dass ihr der Serveradmin seid. Das könnt ihr über einen kurzen Befehl in der Serverkonsole (also die von srcds.exe, welche in eurer Taskleiste mit dem Halflife-Symbol auftaucht) erreichen. Bevor ihr den nachfolgenden Befehl ausführt, solltet ihr aber auf jeden Fall mit eurem Server verbunden sein, damit dieser auch euren Spielernamen kennt.

Der nötige Befehl lautet: `ulx adduser EuerAktuellerSteamName superadmin`
Um Probleme mit Leerzeichen im Benutzernamen zu umgehen ist es außerdem sinnvoll, den Benutzernamen in Leerzeichen zu setzen. Im Zweifelsfall kann man bei einem Fehler aber einfach in den Steam-Profileinstellungen kurzzeitig seinen Nicknamen ändern (Clantags entfernen etc.), damit dieser keine Fehler verursachen kann.

{% figure [caption:"Wenn alles geklappt hat, werdet ihr im Tab Groups auch angezeigt, wenn ihr als Gruppe "superadmin" auswählt."] [class:"figure"] %}
![ulx group menu]({{"/assets/post_images/ttt_ulx_group_menu.jpg" | absolute_url}}){: class="figure-img img-fluid rounded"}
{% endfigure %}

Direkt nach Ausführen des Befehls auf der Serverkonsole solltet ihr auch im Spiel die Nachricht bekommen, dass ihr nun der Gruppe superadmin angehört. Zudem solltet ihr im Menü wie im Screenshot ganz oben zu sehen sämtliche verfügbaren Befehle angezeigt bekommen, anstatt der eingeschränkten Auswahl von zuvor.

### ULX erweitern

Gerade für einen TTT-Server ist es sinnvoll, ULX noch um einige TTT-Spezifische Befehle zu erweitern. Dies geht ganz einfach mit dem Workshopaddon [Trouble in Terrorist Town ULX Commands](http://steamcommunity.com/sharedfiles/filedetails/?id=127865722). Dieses wird wie in Part 3 beschrieben wie ein ganz normales Serveraddon installiert, woraufhin noch einige Zusätzliche Optionen im ingame-Menüfenster eingefügt werden, welche bei der Administration eines TTT-Servers noch zusätzlich helfen: Einstellen der Rundenzeit, Haste-Modus, Traitor- und Detectiveanzahl, Spielerlimit, und viele mehr. Mit der neusten Version dieses Addons hat man zusätzlich Zugriff auf so gut wie alle Server-Kofigurationsvariablen, welche TTT betreffen. Diese Einstellungen sind im ULX-Fenster in einem eigenen Tab namens TTT am oberen Fensterrand untergebracht.

{% figure [caption:"Die TTT-Erweiterung für ULX liefert euch eine große Menge an zusätzlichen Einstellungsmöglichkeiten. So könnt ihr euren Server im laufenden Betrieb ganz nach Belieben einstellen und auch mal neue Einstellungen ohne Serverneustart testen."] [class:"figure"] %}
![ulx ttt menu]({{"/assets/post_images/ttt_ulx_ttt_menu.jpg" | absolute_url}}){: class="figure-img img-fluid rounded"}
{% endfigure %}

---

#### Ersten Administrator anlegen *(alte Version)*
***Wichtig:** Ihr müsst den Server bereits einmal mit installiertem ULX gestartet haben, sonst existieren die Dateien, welche ihr im folgenden bearbeiten müsst noch gar nicht.*


Beim erstem Start des Servers mit installiertem ULX werden im Unterverzeichnis “data” des Servers (C:\steamcmd\gm\garrysmod\data) einige neue Verzeichnisse angelegt. Wichtig ist bei diesem Schritt zunächst nur das ulib-Verzeichnis in diesem Ordner: in diesem befinden sich einige Textdateien, die zur Konfiguration genutzt werden. Um einen neuen Superadmin anzulegen, müssen wir im folgenden die Datei “users.txt” bearbeiten:

Wenn ihr dem Server mir installiertem ULX bereits einmal beigetreten seid, ist die nachfolgende Einrichtung sehr einfach. In der Datei befindet sich dann bereits einiges an Text:
~~~ conf
"STEAM_0:1:########"
{
    "name" "[HYD] Asmodis"
    "deny"
    {
    }
    "allow"
    {
    }
}
~~~

Die erste Zeile ist eure Steamid. Diese wird auch in der Serverkonsole angezeigt, wenn ihr eurem Server beitretet, falls ihr die einmal von Hand eintragen müsstet.

Danach folgen in geschweiften Klammern die Berechtigungen, die diesem Benutzer für ULX eingeräumt werden. Im Moment seid ihr ein einfacher Benutzer, deshalb habt ihr keinerlei spezielle Rechte, euch wird aber auch nichts speziell verboten, weshalb die beiden Felder “allow” und “deny” einfach leer sind.

Um euch nun alle Rechte zu geben, müsst ihr allerdings nicht alle einzeln unter allow eintragen, sondern es reicht eine einfach zusätzliche Zeile:

Vor die letzte schließende Klammer fügt ihr die Zeile `"group" "superadmin"` ein. Diese sorgt dafür, dass ihr im folgenden sämtliche ULX-Kommandos im Spiel zur Verfügung haben werdet. Ab diesem Schritt werdet ihr diese Konfigurationsdatei auch nichtmehr bearbeiten müssen, da ihr das alles im Spiel über das Benutzerinterface von ULX machen könnt. Den passenden Code erzeugt ULX dann für euch.

So in etwa sollte jetzt also eure users.txt aussehen:

~~~ conf
"STEAM_0:1:########"
{
    "name" ""
    "deny"
    {
    }
    "allow"
    {
    }
    "group" "superadmin"
}
~~~

(Die ### müsst ihr natürlich durch eure SteamID ersetzen und bei “name” steht dann natürlich auch euer Steam-Benutzername)

Nun speichert ihr die Datei wieder und könnt eigentlich direkt schon auf dem Server nachschauen, ob alles funktioniert hat.

---

<p style="text-align: center;"> <em><strong>NOCH FRAGEN?</strong></em></p>
<p style="text-align: center;"><em>Schau dir doch mal die <a title="Garrys mod TTT Dedicated Server erstellen – Part 7: F.A.Q/Troubleshooting" href="{%post_url 2015-11-03-ttt-server-part-8-faq %}">FAQ </a>an, vielleicht wurde deine Frage bereits beantwortet. Wenn nicht, schreibe mir gerne in den Kommentaren.</em></p>
<p style="text-align: center;"><em>Weiter gehts in <a title="Garrys mod TTT Dedicated Server erstellen – Part 6: Serveradministration mit ULX und ULib" href="{% post_url 2014-09-27-ttt-server-part-6-admin %}">Part 7</a> mit der Einrichtung von FastDL, um Addons auch ohne Workshop angenehm benutzbar zu machen.</em></p>
&nbsp;