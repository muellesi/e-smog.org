---
title: Garry’s Mod - Texturfehler ohne Counter-Strike Source beheben
layout: post
date: 2016-02-04 08:26
image: /post_images/garrysmod_texturfehler.png
categories: Games Garrysmod
showtoc: true
locale: de_DE
---

Für sehr viele Maps in Garry's Mod, insbesondere im Spielmodus Trouble in Terrorist Town werden Ressourcen benötigt, die eigentlich Teil von Counter-Strike Source sind und nur per Link in die Mapfiles eingebaut sind. Hat man das Spiel (CS:S) nicht installiert, führt das zu hässlichen Rosa-Schwarzen Flächen überall auf der Map. Hier möchte ich zeigen, wie man dennoch kostenlos und komplett legal an die Ressourcen kommt. 

<!--more-->

### Wie geht das?

Wir werden uns zu Nutze machen, dass die benötigten Ressourcen auch beim kostenlos erhältlichen Dedicated Server für Counter-Strike Source mitgeliefert werden. Im folgenden müssen wir den Counter Strike Server herunterladen, die Ressourcendateien lokalisieren und entpacken und die entpackten Ressourcen dann in den Addon-Ordner unserer Garry's Mod Installation verschieben.

### Den Counter-Strike:Source Server herunterladen

**Hinweis**: Solltet ihr bereits [Part 4]({% post_url ttt/2014-05-14-ttt-server-part-4-mounten %}) meiner Tutorial-Reihe zum Garry's Mod Server befolgt haben, könnt ihr diesen Teil jetzt überspringen und unten bei „GCFScape besorgen" weitermachen.
{: class="alert alert-info"}

Unter <https://developer.valvesoftware.com/wiki/SteamCMD#Downloading_SteamCMD> findet ihr den aktuellen Downloadlink für die sogenannte SteamCMD -- steamcmd ist im Grunde eine Kommandozeilenversion des Steam-Clients. Nach dem Herunterladen muss die enthaltene steamcmd.exe zunächst entpackt werden. Um später alle bei den nachfolgenden Schritten anfallenden Dateien problemlos wieder löschen zu können, empfiehlt es sich, dafür einen neuen, leeren Ordner zu benutzen.

Nach dem Entpacken muss steamcmd.exe gestartet werden. Es öffnet sich ein Konsolenfenster und SteamCMD sollte sich ein erstes mal Updaten. Dies kann je nach Geschwindigkeit der Internetverbindung einige Minuten dauern.

Nach dem Update-Vorgang kann der Counter Strike: Source server mit den folgenden drei Befehlen heruntergeladen werden:

1. `login anonymous` zum Login bei Steam - für den Download von Gameservern ist kein echter Account nötig, daher kann hier der Anonymous-Account genutzt werden.

2. Mit `force_install_dir css` kann dafür gesorgt werden, dass SteamCMD den Server im nachfolgenden Schritt in den Unterordner "css" installiert.

3. `app_update 232330` lädt nun den eigentlichen Couter-Strike-Server herunter. Das kann je nach Geschwindigkeit der vorhandenen Internetverbindung einige Zeit dauern.

### GCFScape besorgen

Die Ressourcen sind im Server in Zip-ähnlichen komprimierten Paketen versteckt. Diese sind für Garry's Mod allerdings zunächst nutzlos.  Um die Pakete zu entpacken und damit an  die eigentlichen Ressourcen zu gelangen, wird ein Tool namens [GCFScape](https://developer.valvesoftware.com/wiki/GCFScape) benötigt, das unter <http://nemesis.thewavelength.net/index.php?p=26> heruntergeladen werden kann (Wenn ihr das Tool nicht wirklich unbedingt permanent installieren wollt, nehmt den Download namens "Archive" -- das ist eine portable Version).

Im heruntergeladenen Zip-Archiv befinden sich zwei Ordner -- x64 und x86. Je nachdem, ob ihr ein 64-Bittiges (x64) oder ein 32-Bittiges (x86) Betriebssystem nutzt, müsst  ihr den passenden Ordner aus dem Archiv entpacken. Wenn ihr nicht vorhabt, gcfscape weiterzubenutzen, könnt ihr das ebenfalls in den temporären Ordner packen, in dem auch schon die SteamCMD liegt.

### Die Archive entpacken

Bis ihr hier weitermachen könnt, muss nun zuerst der Counter-Strike-Server komplett heruntergeladen sein.

Sobald der Server heruntergeladen ist, könnt ihr GCFScape starten.

In GCFScape wählt ihr File->Open und navigiert euch im nun geöffneten Dialog zu eurem temporären Ordner -- bei mir liegt der auf dem Desktop und heißt steamcmd. Habt ihr den Ordner gefunden, sollte dieser nach dem Herunterladen  des Counter-Strike-Servers einen Unterordner namens `css` enthalten, der wiederum den Ordner `cstrike` enthält. In diesen Ordner wechselt ihr nun also und wählt dort die Datei `cstrike_pak_dir.vpk` (das ist bei normaler Ordnersortierung die letzte der vpk-Dateien ganz unten) und klickt auch öffnen.

Auf der Benutzeroberfläche von GCFScape solltet ihr nun auf der linken Seite eine Ordnerstruktur sehen, die mit dem Ordner `root` beginnt. Diesen klickt ihr einmal rechts an und wählt im Kontextmenü "Extract", woraufhin euch GCFScape fragt, wohin es die Dateien extrahieren soll. Dort wählt ihr einfach den Desktop aus und klickt ok.

GCFScape braucht nun kurze Zeit, eure Dateien zu entpacken und dann seid ihr auch schon fast fertig. Wenn die Dateien fertig entpackt sind, könnt ihr GCFScape schließen -- das braucht ihr nun nicht mehr.

### Die entpackten Dateien aufräumen

Zunächst: Beim Entpacken ist die Ordnerstruktur aus den Archiven direkt übernommen worden -- auch der root-Ordner, in dem nun unsere ganzen Dateien liegen. Damit das später etwas schöner aussieht, benennen wir einfach den root-Ordner auf dem Desktop um in `css_content`.

Wir brauchen aber nicht alles, was mit in den Archiven war, weshalb wir noch einige Dateien und Ordner aus dem css_content-Ordner löschen können.

Was gelöscht werden kann:

-   Sämtliche *.txt, *.db und *.cfg-Dateien, die direkt im css_content-Ordner liegen
-   Der Ordner cfg
-   Der Ordner scripts

### Den Ordner in Garry's Mod kopieren

Der Restliche Ordner hat nun noch ca. 1,3 GB. Diesen müsst ihr nun in den addon-Ordner eures Garry's Mod-Spielclients verschieben. Üblicherweise müsste dieser unter `C:\Programme\Steam\SteamApps\common\garrysmod\garrysmod\addons` zu finden sein. Ihr habt danach also in diesem addons-Ordner den Ordner `css_content`, der eure gerade entpackten Ressourcen enthält. 

Damit seid ihr auch schon fertig! Ihr könnt testen, ob alles funktioniert hat, indem ihr einem Server mit einer Map beitretet, die auf jeden Fall Counter-Strike-Content mit benutzt (ttt_rooftops_b2 zum Beispiel). Ab jetzt sollten an Stelle der bisher rosa-schwarzen Texturen die Texturen aus Counter-Strike getreten sein.