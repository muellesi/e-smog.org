---
title: Battlefield 4 Addons nachträglich registrieren
layout: post
date: 2014-08-26 09:54
image: assets/post_images/bf4_logo.jpg
categories: Games Battlefield
locale: de_DE
---

Aufgrund der großen Menge der herunterzuladenden Daten für Battlefield 4, ist es nach einer Neuinstallation des Betriebssystems wesentlich einfacher, vorher gesicherte Spieldateien zu verwenden, anstatt alles neu herunterzuladen. Leider werden nach dem zurückkopieren der Dateien aber die Addons nichtmehr vom Battlelog-Plugin erkannt. Die Folge ist, dass die Addons zunächst nicht mehr spielbar sind. Versuche, einem Server beizutreten, werden immer nur mit einer Fehlermeldung wie "Du musst diese Erweiterung herunterladen und installieren" quittiert und auch ein Prüfen der Dateien mittels Origin schafft keine Abhilfe. Wie sich die Plugins wieder aktivieren lassen, wird im folgenden Artikel erklärt.
<!--more-->

{% figure [caption:"So sollte jeder der Unterschlüssel nach den Schritten aussehen. Im Beispielbild wurden alle Addons installiert."] [class:"figure"] %}
![BF4 Addon registration Registry Ansicht]({{"/assets/post_images/bf4_addon_activation.png" | absolute_url}}){: class="figure-img img-fluid rounded"}
{% endfigure %}

Das Problem ist relativ einfach zu lösen: Zur korrekten Aktivierung der Addonswird für jedes einzelne Addon lediglich ein zusätzlicher Eintrag in der Registry benötigt (Natürlich muss sich das jeweilige Addon auch wirklich in eurem Besitz befinden).

### Und so geht's:

*   Öffnet den Registrierungs-Editor
*   Navigiert zum Schlüssel `HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\EA Games\Battlefield 4`
*   Hier müsst ihr jetzt je nach Addon einen neuen Unterschlüssel anlegen:

    *   `Xpack0` Für "Second Assault"
    *   `Xpack1` Für "China Rising"
    *   `Xpack2` Für "Naval Strike"
    *   `Xpack3` Für "Dragon's Teeth"

*   In jedem dieser Unterschlüssel wird nun noch ein neuer Wert mit den folgenden Daten angelegt:

    *   Typ: `Zeichenfolge`
    *   Name: `Installed`
    *   Wert: `True`

*   Anschließend solltet ihr noch Origin neustarten, um zu garantieren, dass auch alles wirklich korrekt erkannt wird. Dieser Schritt scheint allerdings nicht zwingend notwendig zu sein.
&nbsp;