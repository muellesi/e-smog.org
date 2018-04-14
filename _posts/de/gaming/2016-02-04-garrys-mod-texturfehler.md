---
title: Garry’s Mod - Texturfehler ohne Counter-Strike Source beheben
layout: post
date: 2016-02-04 08:26
image: /assets/post_images/garrysmod_texturfehler.png
categories: Games Garrysmod
locale: de_DE
---

Für sehr viele Maps in Garry's Mod, insbesondere im Spielmodus Trouble in Terrorist Town werden Ressourcen benötigt, die eigentlich nur mit Counter-Strike Source zu bekommen sind. Hat man das Spiel nicht installiert, führt das zu hässlichen Rosa-Schwarzen Flächen überall auf der Map. Hier möchte ich zeigen, wie man dennoch kostenlos und komplett legal an die Ressourcen kommt. 
<!--more-->
### Wie geht das?

Wir werden uns zu Nutze machen, dass die benötigten Ressourcen auch beim kostenlos erhältlichen Dedicated Server für Counter-Strike Source mitgeliefert werden. Alles, was wir also machen müssen, ist, diesen Server herunterzuladen und die entsprechenden Dateien zu kopieren und fertig sind wir schon.

### Den Counter-Strike:Source Server herunterladen

**Hinweis**: Solltet ihr bereits [Part 4]({% post_url 2014-05-14-ttt-server-part-4-mounten %}) meiner Tutorial-Reihe zum Garry's Mod Server befolgt haben, könnt ihr diesen Teil jetzt überspringen und unten bei „GCFScape besorgen" weitermachen.
{: class="alert alert-info"}

Unter <https://developer.valvesoftware.com/wiki/SteamCMD#Downloading_SteamCMD> findet ihr den aktuellen Downloadlink für die sogenannte SteamCMD -- das ist sozusagen eine Kommandozeilenversion eures Steam-Clients. Von dort ladet ihr SteamCMD herunter und entpackt es in einen temporären Ordner (Nachdem wir fertig sind, könnt ihr alle entstandenen Dateien wieder löschen, wenn ihr wollt -- deshalb packt am besten alles in einen Ordner, den ihr am Ende komplett löschen könnt.

Nach dem entpacken, startet ihr die steamcmd.exe. Es sollte sich ein Konsolenfenster öffnen und Steam sollte sich ein erstes mal Updaten. Dies kann je nach Geschwindigkeit der Internetverbindung einige Minuten dauern.

Nach dem Update-Vorgang habt ihr nun also das Schwarze Kommandozeilenfenster der SteamCMD vor euch. In diesem Fenster gebt ihr nun nacheinander folgende Befehle ein:

`login anonymous`

Damit werdet ihr bei Steam eingeloggt, sodass ihr den Server herunterladen könnt.

Mit `force_install_dir css`  sorgt ihr dafür, dass die SteamCMD den Server im nachfolgenden Schritt in den Unterordner "css" installiert.

Nun könnt ihr via `app_update 232330 `den eigentlichen Couter-Strike-Server herunterladen. Das kann je nach Geschwindigkeit eurer Internetverbindung schon einige Zeit dauern, holt euch also erstmal einen Kaffe und macht solange schon mal mit dem nächsten Abschnitt weiter.

### GCFScape besorgen

Die Ressourcen sind im Server in Zip-ähnlichen komprimierten Paketen versteckt. Mit diesen Paketen können wir allerdings leider nichts anfangen. Um die Ressourcen also benutzen zu können, müssen wir sie zunächst noch entpacken. Dazu brauchen wir ein Tool namens [GCFScape](https://developer.valvesoftware.com/wiki/GCFScape). Ihr könnt es unter <http://nemesis.thewavelength.net/index.php?p=26> herunterladen (Wenn ihr das Tool nicht wirklich unbedingt permanent installieren wollt, nehmt den Download namens „Archive" -- das ist eine portable Version).

Im heruntergeladenen Zip-Archiv befinden sich zwei Ordner -- x64 und x86. Je nachdem, ob ihr ein 64-Bittiges (x64) oder ein 32-Bittiges (x86) Betriebssystem habt, entpackt ihr euch jetzt den passenden Ordner aus dem Archiv. Wenn ihr nicht vorhabt, gcfscape weiterzubenutzen, könnt ihr das ebenfalls in den temporären Ordner packen, in dem auch schon die SteamCMD liegt.

###  Die Archive entpacken

Bis ihr hier weitermachen könnt, muss nun zuerst der Counter-Strike-Server komplett heruntergeladen sein. Ist er das noch nicht, ist's Zeit für einen zweiten Kaffee !😉

Sobald der Server heruntergeladen ist, könnt ihr GCFScape starten.

In GCFScape wählt ihr File->Open und navigiert euch im nun geöffneten Dialog zu eurem temporären Ordner -- bei mir liegt der auf dem Desktop und heißt steamcmd. Habt ihr den Ordner gefunden, sollte dieser nach dem Herunterladen  des Counter-Strike-Servers einen Unterordner namens „css" enthalten, welcher wiederum den Ordner „cstrike" enthält. In diesen Ordner wechselt ihr nun also und wählt dort die Datei „cstrike_pak_dir.vpk" (das ist bei normaler Ordnersortierung die letzte der vpk-Dateien ganz unten) und klickt auch öffnen.

Auf der Benutzeroberfläche von GCFScape solltet ihr nun auf der linken Seite eine Ordnerstruktur sehen, die mit dem Ordner „root" beginnt. Diesen klickt ihr einmal rechts an und wählt im Kontextmenü „Extract", worauf euch GCFScape fragt, wohin es die Dateien extrahieren soll. Dort wählt ihr einfach den Desktop aus und klickt ok.

GCFScape braucht nun kurze Zeit, eure Dateien zu entpacken und dann seid ihr auch schon fast fertig. Wenn die Dateien fertig entpackt sind, könnt ihr GCFScape schließen -- das braucht ihr nun nicht mehr.

### Die entpackten Dateien aufräumen

Zunächst: Beim Entpacken ist die Ordnerstruktur aus den Archiven direkt übernommen worden -- auch der root-Ordner, in dem nun unsere ganzen Dateien liegen. Damit das später etwas schöner aussieht, benennen wir einfach den root-Ordner auf dem Desktop um in „css_content".

Wir brauchen aber nicht alles, was mit in den Archiven war, weshalb wir noch einige Dateien und Ordner aus dem css_content-Ordner löschen können.

Was gelöscht werden kann:

-   Sämtliche *.txt, *.db und *.cfg-Dateien, die direkt im css_content-Ordner liegen
-   Der Ordner cfg
-   Der Ordner scripts

### Den Ordner in Garry's Mod kopieren

Der Restliche Ordner hat nun noch ca. 1,3 GB. Diesen Ordner müsst ihr nun in den addon-Ordner eures Garry's Mod-Spielclients packen. Üblicherweise müsste dieser unter C:\Programme\Steam\SteamApps\common\garrysmod\garrysmod\addons zu finden sein. Ihr habt danach also in diesem addons-Ordner den Ordner „css_content", der eure gerade entpackten Ressourcen enthält.

Und damit seid ihr auch schon fertig! Ihr könnt testen, ob alles funktioniert hat, indem ihr einfach mal auf einen Server mit einer Map beitretet, die auf jeden Fall Counter-Strike-Content mit benutzt (ttt_rooftops_b2 zum Beispiel). Ab jetzt sollten an Stelle der bisher rosa-schwarzen Texturen die Texturen aus Counter-Strike getreten sein.