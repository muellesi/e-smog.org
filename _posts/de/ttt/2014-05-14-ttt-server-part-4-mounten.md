---
layout: post
title:  "TTT Dedicated Server Part 4: Fehlende Physik - CSS Mounten"
author: Simon Müller
date:   2014-05-14 21:30:33 +0100
categories: TTT-Server
image: assets/post_images/garrysmod.jpg
showtoc: true
locale: de_DE
---

Da einige (bzw. eher sehr viele) Mapersteller beim bauen ihrer Maps auf Inhalte von Counterstrike und Half Life zurückgreifen, muss unser Server diese Objekte natürlich auch kennen. Wenn ihr also beim Start einer neuen Map von Fehlermeldungen wie `ERROR!: Can't create physics object for models/(...).mdl` überschwemmt werdet und durch Objekte wie Kisten, Zäune etc. einfach hindurchlaufen könnt, wird es Zeit euren Server entsprechend anzupassen. Wie das geht, zeige ich euch in diesem Teil der TTT-Server-Tutorialreihe.

<!--more-->

## 1. Schritt: CSS-Server herunterladen
Um überhaupt an die benötigten Dateien heranzukommen, solltet ihr am besten zunächst einfach den Counter Strike:Source dedicated Server herunterladen. Dies funktioniert fast genauso wie beim Garry's Mod-Server über die steamcmd. Der einzige Unterschied ist hier die ID des Programms, welches heruntergeladen werden soll und der Installationspfad. Da die Vorgehensweise bereits im ersten Tutorial besprochen wurde, werde ich jetzt nichtmehr genauer auf alles eingehen, sondern euch nur noch die passenden Kommandozeilenbefehle angeben:

~~~ bash
login anonymous
force_install_dir css
app_update 232330
~~~

Die ID, die für den von euch gewählten Dedicated-Server steht, findet ihr mit einer Google-Suche, bei der der erste Treffer dann meistens auf [steamdb.info](https://steamdb.info) verweist. Im Falle eines TF2-Servers findet man zum Beispiel [https://steamdb.info/app/232250/](https://steamdb.info/app/232250/). Die ID unter "App ID" wäre hier die richtige ID, um den TF2-Server herunterzuladen.

Wenn ihr diese Kommandos nacheinander auf der SteamCMD ausführt, sollte nach dem letzten Befehl der Download des css-Servers starten. Jetzt könnt ihr euch gemütlich einen Kaffee holen gehen, der Download dauert nämlich mitunter eine ganze Weile.

## 2. Schritt: CSS-Server in GM-Server einbinden/"mounten"
Die SteamCMD hat uns beim Download einen neuen Ordner namens `css` in unserer Server-Ordnerstruktur angelegt. In ihm liegen nun sämtliche Dateien, die von einem CSS-Server benötigt werden. Ein Garry's Mod-Server kann ebendiese Dateien nun für sich selbst einbinden und nutzen, hierfür sind nur minimale Änderungen an einer Konfigurationsdatei nötig:

Wir begeben uns wie auch schon in Part2 in den Ordner `C:\steamcmd\gm\garrysmod\cfg` und bearbeiten jetzt die Datei "mount.cfg" mit einem Texteditor.

Wenn wir diese das erste mal öffnen, sollte sie folgendermaßen aussehen:

~~~ lua
"mountcfg"
{
//"cstrike" "C:\steamcmd\steamapps\common\Counter-Strike Source Dedicated Server\cstrike"
//"tf" "C:\mytf2server\tf"
}
~~~

Wie man sieht ist hier schon vorgesehen, dass der CSS-Server eingebunden wird - wir müssen nurnoch den Pfad anpassen und die `//` vor der Zeile entfernen, damit sie vom Server auch ausgeführt wird. Nach der Bearbeitung sieht die Datei also so aus:

~~~ lua
"mountcfg"
{
"cstrike" "C:\steamcmd\css\cstrike"
//"tf" "C:\mytf2server\tf"
}
~~~

Wenn ihr diese Datei nun speichert und euren Server neu startet, sollte er euch direkt beim Start darauf hinweisen, dass er nun die CSS-Dateien einbindet. Beim Laden einer Map mit CSS-Inhalten sollten nun auch keine physics object errors mehr erscheinen.

---

<p style="text-align: center;"> <em><strong>NOCH FRAGEN?</strong></em></p>
<p style="text-align: center;"><em>Schau dir doch mal die <a title="Garrys mod TTT Dedicated Server erstellen – Part 7: F.A.Q/Troubleshooting" href="https://e-smog.org/blog/garrys-mod-ttt-dedicated-server-erstellen-part-7-f-a-q/">FAQ </a>an, vielleicht wurde deine Frage bereits beantwortet. Wenn nicht, schreibe mir gerne in den Kommentaren.</em></p>
<p style="text-align: center;"><em>Weiter geht's in <a href="https://e-smog.org/blog/garrys-mod-ttt-dedicated-server-erstellen-part-5-den-loading-screen-anpassen/">Part 5</a> mit dem Einrichten eines eigenen Ladebildschirms.</em></p>