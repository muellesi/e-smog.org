---
title: Separate+ für GIMP 2.10.6
date: 2018-10-10 11:00
image: post_images/cmyk.png
categories: GIMP
locale: de_DE
---

Nachdem das separate+-Plugin unter GIMP 2.10 leider nicht mehr funktionierte und im Moment auch keine neuen Releases abzusehen scheinen, habe ich kurzerhand einfach  eine eigene Version kompiliert. Dies war möglich durch die Hilfe von Massimo Valentini, der mir im [GIMP Bugtracker](https://gitlab.gnome.org/GNOME/gimp/issues/2305) einen entscheidenden Hinweis auf mögliche Probleme im Source-Code des Plugins gab. 

<!--more-->

## Installation

Mit der neuen GIMP-Version 2.10 hat sich der Pfad zum GIMP-Benutzerordner geändert, entsprechend müssen die Plugindateien natürlich auch an den neuen Ort kopiert werden.

**Achtung**: Das Plugin gibt es hier vorerst leider nur in einer 64bit Version. Diese wird mit 32bit Installationen von GIMP nicht funktionieren! Stellt also vor der Installation des Plugins sicher, dass ihr auch wirklich ein 64bit Betriebssystem nutzt.
{: class="alert alert-warning"}

Das Plugin gibt es im Downloadbereich der Seite herunterzuladen: 

<a href="{{"/downloads/separate-2106.zip" | absolute_url}}" class="btn btn-primary btn-lg" role="button">Download Separate+</a>


Nach dem Download der Zip-Datei entpackt ihr den darin enthaltenen Ordner namens "separate" in das `plug-ins` Unterverzeichnis des neuen GIMP-Benutzerordners `C:\Users\EUER BENUTZERNAME\AppData\Roaming\GIMP\2.10\`. 

{% figure [caption:"So sollte der Inhalt des separate-Ordners dann aussehen."] [class:"figure"] %}
![Separate Ordner Inhalt]({{"/post_images/separate_2_10_plugin_folder.png" | absolute_url}}){: class="figure-img img-fluid rounded"}
{% endfigure %}

In den Anleitungen zu separate+ für GIMP 2.8 waren an dieser Stelle noch weitere Anpassungen der GIMP-Einstellungen nötig, damit das Plugin beim GIMP-Start dann auch wirklich geladen wird. Mit GIMP 2.10 sollten nun allerdings auch Plugins aus Unterordnern des `plug-ins` Verzeichnisses ohne weitere Anpassungen direkt geladen werden. 

Mit dem nächsten GIMP-Start solltet ihr nun also ohne weitere Anpassungen wieder den Menüpunkt "separate" im Bild-Menü finden.

**Achtung:** Mit GIMP 2.10 wurden neue Farbtiefenmodi für Bilder eingeführt. Das Separate-Plugin nutzt für die Kommunikation mit GIMP allerdings noch die alte API, die diese neuen Farbtiefen nicht unterstützt. Entsprechend wird es bei der Anwendung des Plugins zu Informationsverlust kommen, wenn ihr euer Bild mit einem der neuen 16 oder 32 bit Modi erstellt habt (die Farben werden dann bei Anwendung des Plugins in 8bit Farbtiefe konvertiert).
{: class="alert alert-warning"}