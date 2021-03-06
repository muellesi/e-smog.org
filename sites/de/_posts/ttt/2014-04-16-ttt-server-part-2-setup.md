---
layout: post
title:  "TTT Dedicated Server Part 2: Setup"
author: Simon Müller
date:   2014-04-16 21:31:33 +0100
categories: TTT-Server
image: post_images/garrysmod.jpg
showtoc: true
locale: de_DE
---

Nach dem Herunterladen folgt jetzt die grundlegende Einrichtung des Servers. In diesem Teil möchte ich euch zeigen, wie man einen Garry’s Mod-Server zu einem Trouble in Terrorist Town Server macht und was es dabei zu beachten gibt. Nach diesem Teil ist der Server bereit für einen ersten Test.

<!--more-->

## Grundeinstellungen für den Server
Da es in diesem Tutorial um einen TTT-Server gehen soll, werde ich euch jetzt auch die Einstellungen für Trouble in Terrorist Town zeigen. Für andere Spielmodi von Garry’s Mod ist die Vorgehensweise wahrscheinlich ähnlich.

### TTT Als Spielmodus wählen
Das einstellen des Spielmodus ist eigentlich relativ einfach: in die autoexec.cfg, welche ihr unter C:\steamcmd\gm\garrysmod\cfg findet, wenn ihr die Ordnernamen aus dem ersten Teil alle so gewählt habt wie ich, tragt ihr die folgende Zeile ein:

~~~ lua
gamemode terrortown
~~~

Dies sollte dafür sorgen, dass euer Server sofort mit dem richtigen Spielmodus startet.

### Der erste Start
Da wir im folgenden des öfteren testen werden, ob der Server auch genau das tut, was wir wollen, werden wir jetzt die Startdatei anlegen: Unter C:\steamcmd\gm findet ihr eine Datei mit dem Namen srcds.exe. Dies ist unser Server. Da wir diesen aber mit sogenannten Kommandozeilenparametern starten wollen, können wir die Exe-Datei nicht einfach per Doppelklick starten.

Deshalb legen wir eine neue Textdatei an und benennen sie um in “startServer.bat”. Diese Datei öffnen wir nun mit einem Texteditor (Notepad++ zum Beispiel. Word ist **KEIN** Texteditor) und fügen den folgenden Inhalt ein:

~~~ bash
srcds.exe -console -maxplayers 16 -game garrysmod +gamemode terrortown +map gm_construct
~~~

Habt ihr dies eingetragen und gespeichert, könnt ihr den Texteditor wieder schließen und die Bat-Datei per Doppelklick ausführen. Es sollten sich zwei Konsolenfenster öffnen. Die Nachfrage der Windows Firewall bestätigt ihr. Sobald der Server läuft, könnt ihr zum Testen Garrys Mod starten und unter “Mehrspieler Spiel Finden” –&gt; “Lokales Netzwerk” im Menü nach eurem Server suchen. Wird dieser hier mit 0 von 16 Spielern, der Map gm_construct und dem Spielmodus TTT angezeigt, dann hat alles geklappt. Wenn ihr wollt könnt ihr euch jetzt noch auf ihn verbinden, um es wirklich ganz sicher zu wissen.

Wenn alles funktioniert: Herzlichen Glückwunsch! Ihr habt jetzt einen funktionierenden TTT-Server.

#### Fehlerbehandlung unter Linux
Unter Linux taucht in der Serverkonsole unter Umständen mehrmals die Fehlermeldung `Fatal Error: Failed to load ~/.steam/sdk32/libsteam.so` auf. Dieser scheint jedoch nicht weiter schlimm zu sein und lässt sich noch dazu relativ einfach beheben:

Zunächst müsst ihr den Ordnerpfad ~/.steam/sdk32 für den Benutzer, unter welchem der Server laufen soll, anlegen. Nach diesem Schritt müsst ihr nur noch die libsteam.so, die ihr im bin-Verzeichnis eurer Garry's Mod-Serverinstallation findet in den gerade erstellten Ordner kopieren. Beim nächsten Serverstart sollte die Fehlermeldung dann nicht mehr auftauchen.

Den Fehler `[S_API FAIL] SteamAPI_Init() failed; SteamAPI_IsSteamRunning() failed.`, der auch noch auf der Konsole auftauchen kann, kann man leider nicht beheben, der sollte allerdings auch die Funktion des Servers in keiner Weise beeinträchtigen.


## Grundeinrichtung für den Spielmodus
Nach dem Testen schließt ihr sämtliche Konsolenfenster wieder. Jetzt geht es an die erste Einrichtung:

Diese wird in der server.cfg im bereits bekannten cfg-Ordner vorgenommen. Im folgenden habe ich euch den Code einer Grund-Konfiguration angehängt. In dieser sind fast alle Einstellungsmöglichkeiten berücksichtigt.  Eine vollständige Liste aller Variablen und deren Bedeutung findet ihr unter [http://ttt.badking.net/config-and-commands/convars](http://ttt.badking.net/config-and-commands/convars)

~~~ conf
// server name
hostname "Euer Servername"
sv_contact "Eure Mailadresse"

// rcon passsword
rcon_password "Euer Rcon Passwort (wird zum kicken von Spielern etc. benötigt)"

//DNA
ttt_killer_dna_range 300
ttt_killer_dna_basetime 100

//Prep
ttt_firstpreptime 60
ttt_preptime_seconds 30
ttt_posttime_seconds 15

//Round length
ttt_haste 0
// ttt_haste_starting_minutes 5
// ttt_haste_minutes_per_death 0.5

ttt_roundtime_minutes 10

//Map Switching
ttt_round_limit 6
ttt_time_limit_minutes 75

//ttt_always_use_mapcycle 0

//Player Counts
ttt_minimum_players 2
ttt_traitor_pct 0.25
ttt_traitor_max 32
ttt_detective_pct 0.13
ttt_detective_max 32
ttt_detective_min_players 5
ttt_detective_karma_min 600

//Karma
ttt_karma 1
ttt_karma_strict 1
ttt_karma_starting 1000
ttt_karma_max 1000
ttt_karma_ratio 0.001
ttt_karma_kill_penalty 15
ttt_karma_round_increment 5
ttt_karma_clean_bonus 30
ttt_karma_traitordmg_ratio 0.0003
ttt_karma_traitorkill_bonus 40
ttt_karma_low_autokick 1
ttt_karma_low_amount 300
ttt_karma_low_ban 0
ttt_karma_low_ban_minutes 60
ttt_karma_persist 1
ttt_karma_clean_half 0.25

//Other
ttt_postround_dm 1
ttt_no_nade_throw_during_prep 0
ttt_weapon_carrying 1
ttt_weapon_carrying_range 50
ttt_teleport_telefrags 1
ttt_ragdoll_pinning 1
ttt_ragdoll_pinning_innocents 1
ttt_use_weapon_spawn_scripts 1
ttt_spawn_wave_interval 2

// server logging
log on
sv_logbans 1
sv_logecho 1
sv_logfile 1
sv_log_onefile 0

// operation
sv_lan 0
sv_region 3 //Europa

exec banned_user.cfg
exec banned_ip.cfg 
~~~

Dies war die grundlegende Einrichtung eines TTT-Servers. Ihr seid jetzt bereits so weit, dass ihr im lokalen Netzwerk mit Freunden TTT spielen könntet.

---

<p style="text-align: center;"> <em><strong>NOCH FRAGEN?</strong></em></p>
<p style="text-align: center;"><em>Schau dir doch mal die <a title="Garrys mod TTT Dedicated Server erstellen – Part 7: F.A.Q/Troubleshooting" href="{{ site.baseurl }}{% post_url ttt/2015-11-03-ttt-server-part-8-faq %}">FAQ </a>an, vielleicht wurde deine Frage bereits beantwortet. Wenn nicht, schreibe mir gerne in den Kommentaren.</em></p>
<p style="text-align: center;"><em>Weiter gehts im <a title="Garrys mod TTT Dedicated Server erstellen – Part 3: Steam Workshop integrieren" href="{{ site.baseurl }}{% post_url ttt/2014-04-22-ttt-server-part-3-workshop %}">nächsten Teil</a> mit dem Einbinden von Steam-Workshop-Inhalten</em></p>