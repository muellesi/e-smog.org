---
layout: post
title:  "TTT Dedicated Server Part 1: Download"
author: Simon Müller
date:   2014-04-16 21:30:33 +0100
categories: TTT-Server
image: post_images/garrysmod.jpg
showtoc: true
locale: de_DE
---

Da ich vor einiger Zeit selbst vor dem Problem stand, einen Dedicated Server für den Garry’s Mod-Spielmodus Trouble in Terrorist Town zu erstellen und es sehr wenige Tutorials gibt, welche sich wirklich ausführlich mit diesem Thema beschäftigen: Hier eine (hoffentlich) sehr ausführliche Tutorialreihe zu diesem Thema.

<!--more-->

## (System-)Voraussetzungen
Einen Dedicated Server aufzusetzen, ergibt nur Sinn, wenn bestimmte Bedingungen erfüllt sind:

* Der Computer muss aus dem Internet via IPv4 erreichbar sein
* <span style="color: #ff0000;">Der Port für den Dedicated Server muss im Router geöffnet sein – und außerdem an den Server-PC weitergeleitet werden. Wie das geht, ist in der zum Router gehörenden Anleitung oder in einem der zahlreichen Tutorials im Netz nachzulesen. Für den Server ist der Port <strong>27015</strong> für TCP und UDP freizugeben und an den eigenen PC weiterzuleiten.</span>
* Die Bandbreite des Internetanschlusses des PCs sollte nicht zu knapp bemessen sein – 1MBit/s Upload sollten schon drin sein, um eine vernünftige Spielerzahl Laggfrei zu versorgen.
* Natürlich sollte auch der PC an sich nicht zu schwach auf der Brust sein. Genauere Angaben folgen, nachdem ich einige Tests zu diesem Thema gemacht habe. Grundsätzlich gilt: je mehr Spieler auf einem Server spielen wollen, desto leistungsstärker (CPU &amp; RAM) sollte dieser sein. Generell sind Source-Dedicated Server aber nicht sehr Ressourcenhungrig, deswegen tut es in den meisten Fällen ein ganz normaler Home-PC.  (Auf meinem alten PC, ausgestattet mit einem Intel i5-2500 und 8GB RAM liefen der Server mit bis zu 7 verbundenen Spielern und Garry’s Mod selbst gleichzeitig und es kam zu keinerlei Problemen).
* Eine eigene URL, unter der der Server erreichbar ist, wäre von Vorteil. Dies ist zum Beispiel mit dem Dienst von [no-ip](http://www.noip.com/) möglich.

## Steam Cmd herunterladen und aktualisieren

Im [Valve Developer-Wiki](https://developer.valvesoftware.com/wiki/SteamCMD#Downloading_SteamCMD) kann man die sogenannte Steam-Console herunterladen. Diese ist eine Minimalversion von Steam ohne Benutzeroberfläche.  Sie wird hauptsächlich zum Einrichten von Dedicated Servern genutzt - so auch hier in diesem Tutorial.

Nach dem Herunterladen entpackt ihr die steamcmd.exe aus dem Ziparchiv in einen beliebigen Ordner auf eurer Festplatte. Bedenkt dabei, dass im selben Ordner später auch euer Server installiert wird. Ihr solltet also nicht gerade eine komplett volle Festplatte wählen und den Pfad möglichst kurz halten, damit es damit später keine Probleme gibt. Ich werde in diesem Tutorial einfach den Ordner C:\steamcmd\ wählen, den ich mir vorher extra für den Server erstellt habe.

**Hinweis**: Falls euer Pfad hier oder auch später Leerzeichen enthält, müsst ihr bei allen nachfolgenden Befehlen und Einstellungen Anführungszeichen um den gesamten Dateipfad setzen. Ansonsten landen die Dateien nicht im richtigen Ordner oder manche Einstellungen werden nicht funktionieren wie gewünscht. Am besten ist es, einfach auf Leerzeichen zu verzichten, wo es nur geht, damit kann diese potentielle Fehlerquelle ganz einfach umgangen werden.

Nach dem Entpacken startet ihr die steamcmd.exe. Es sollte sich ein Konsolenfenster öffnen und Steam sollte sich ein erstes mal Updaten. Dies kann je nach Geschwindigkeit der Internetverbindung einige Minuten dauern.




## Garry’s Mod Dedicated Server herunterladen

Jetzt wo ihr also eine funktionierende SteamCMD habt, könnt ihr den eigentlichen Garry’s Mod-Server herunterladen. Im noch geöffneten SteamCMD-Fenster gebt ihr dazu den Befehl `login anonymous` ein. Damit werdet ihr bei Steam eingeloggt, sodass ihr den Server herunterladen könnt.


Standardmäßig würde steamcmd nun alle heruntergeladenen Server (und theoretisch auch Spiele) wie auch schon vom normalen Steam-Client gewohnt in den Ordner steamapps installieren. Ich persönlich finde es aber einfacher, wenn jeder Server seinen eigenen Ordner direkt im Steamcmd-Ordner hat. Mit `force_install_dir gm` sorgt ihr deshalb dafür, dass die SteamCMD den Server im nachfolgenden Schritt in den Unterordner “gm” installiert. Wer möchte, kann diesen Schritt auch auslassen, muss dann aber in den Nachfolgenden Schritten des Tutorials die Ordnerpfade entsprechend anpassen.


Nachdem ihr jetzt also bei Stem eingeloggt seid und ihr den Installationsordner festgelegt habt, könnt ihr nun via `app_update 4020 validate` den eigentlichen Garry's Mod Dedicated Server herunterladen.

Während der Server herunterlädt, könnt ihr euch in Ruhe einen Kaffee holen gehen, denn das dauert mitunter eine ganze Weile.

---

&nbsp;
<p style="text-align: center;"><em><strong>NOCH FRAGEN?
</strong>Schau dir doch mal die <a title="Garrys mod TTT Dedicated Server erstellen – Part 8: F.A.Q/Troubleshooting" href="{{ site.baseurl }}{% post_url ttt/2015-11-03-ttt-server-part-8-faq %}">FAQ </a>an, vielleicht wurde deine Frage bereits beantwortet. Wenn nicht, schreibe mir gerne in den Kommentaren.</em></p>
<p style="text-align: center;"><em><span style="font-size: small;">Weiter geht's in <a href="{{ site.baseurl }}{% post_url ttt/2014-04-16-ttt-server-part-2-setup %}">Part 2</a>  mit der grundlegenden Einrichtung.</span></em></p>