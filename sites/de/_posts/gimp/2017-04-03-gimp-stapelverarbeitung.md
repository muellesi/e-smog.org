---
title: Stapelverarbeitung mit GIMP
date: 2017-04-03 08:23
image: post_images/gimp-batch.png
categories: GIMP
locale: de_DE
---

Nicht selten kommt es vor, dass auf mehrere Bilder hintereinander die gleichen Bearbeitungsschritte angewendet werden müssen -- sei es, um eine Belichtungskorrektur bei allen Photos einer Serie durchzuführen oder um Bilder für die Verwendung auf einer Webseite auf ein passendes, gemeinsames Format zu bringen. In diesem Artikel möchte ich zwei hilfreiche Plugins vorstellen, die dies in GIMP möglich machen.
<!--more-->

Gleich im Voraus sei erwähnt: Wer regelmäßig große Mengen an Bildmaterial im Stapel verarbeiten muss, sollte sich überlegen, ob für ihn nicht andere, genau für diesen Zweck entwickelte, Software wie imagemagick besser geeignet wäre. Stapelverarbeitung mit GIMP ist durchaus möglich, allerdings meistens nicht die schnellste und beste Lösung. Wer allerdings seltener Stapelverarbeitungsaufgaben hat und entsprechend nicht den Umgang mit einem komplett neuen Tool lernen möchte, ist auch bei GIMP gut aufgehoben.

Zunächst möchte ich zwei Plugins vorstellen, die Stapelverarbeitung in GIMP mit Hilfe einer einfach zu bedienenden Oberfläche sehr leicht machen:

## BIMP

[Bimp](https://github.com/alessandrofrancesconi/gimp-plugin-bimp) ist ein Stapelverarbeitungsplugin für GIMP, das von Alessandro Francesconi entwickelt wird. Es bietet grafische Einstellungen für alle wichtigen verallgemeinerbaren Bildoperationen (Vergrößern, Verkleinern, Schärfen, Wasserzeichen, Konvertierung, uvm.). Außerdem kann Bimp auf den GIMP-Prozedurenbrowser zugreifen und kann somit beinahe jede in GIMP verfügbare Funktion nutzen -- wenn auch nicht so komfortabel, wie die vorher genannten.

Ein großer Vorteil ist, dass einmal zusammengestellte Abläufe als Set gespeichert und zu einem späteren Zeitpunkt wieder geladen werden können. So können die zusammengestellten Funktionen mit den gleichen Parametern immer wieder genutzt werden, ohne jedes Mal die Einstellungen neu vornehmen zu müssen. Eine mögliche Einsatzmöglichkeit wäre, zwei unterschiedliche Presets mit Skalierung und Kompression anzulegen und damit Bilder für Webseiten und dazugehörige Thumbnails zu generieren.

Zuguterletzt bietet Bimp eine Umbenennungsfunktion an, in der auch einfache Muster genutzt werden können. So ist es zum Beispiel möglich, einen Präfix vor den Dateinamen bearbeiteter Bilder zu setzen, sie durchzummerieren oder auch, diese mit dem Bearbeitungsdatum zu versehen.

{% figure [caption:"In einer übersichtlichen Oberfläche kann in Bimp ein Ablauf von Bearbeitungsschritten festgelegt werden."] [class:"figure"] %}
![Bimp UI]({{"/post_images/gimp_bimp.png" | absolute_url}}){: class="figure-img img-fluid rounded"}
{% endfigure %}

**Hinweis:** Bimp wird mit einem Installer geliefert, der allerdings mehr als unnötig ist (und eine dll ins Systemverzeichnis kopiert, was durchaus problematisch sein kann). Dieser lässt sich aber auch mit einem Entpacker wie etwa 7zip öffnen, woraufhin einfach die enthaltene Datei „bimp.exe" ins GIMP-Pluginverzeichnis kopiert werden kann.
{: class="alert alert-warning"}


## Davids Batch Processor

[Davids Batch Processor](http://members.ozemail.com.au/~hodsond/dbp.html) (kurz: DBP) ist ebenfalls ein Batch-Plugin für GIMP, das allerdings mittlerweile nicht mehr aktiv weiterentwickelt wird. Dennoch funktioniert die unter  http://members.ozemail.com.au/~hodsond/dbp.html bereitgestellte Version 1.1.8 des Plugins noch problemlos mit der zum Zeitpunkt der Veröffentlichung dieses Artikels aktuellen GIMP-Version 2.8.20.

{% figure [caption:"Davids Batch Processor bietet weniger Optionen, diese sind dafür schnell über die einzelnen Tabs erreichbar."] [class:"figure"] %}
![DBP UI]({{"/post_images/gimp_dbp.png" | absolute_url}}){: class="figure-img img-fluid rounded"}
{% endfigure %}

Das Plugin bietet einige einfache Operationen auf mehreren grafisch auswählbaren Bildern an. Diese sind: Konvertierung des Bildformats, Drehen, Weichzeichnen, Farbanpassungen, Skalierung, Zuschneiden und Schärfen. Zudem lassen sich bearbeitete Bilddateien mit Hilfe von einfachen Regeln neu benennen. Der Funktionsumfang ist damit wesentlich geringer, als der von Bimp, allerdings können auch diese Funktionen bereits ausreichend sein, wenn zum Beispiel nur Bilder für eine Webseite verkleinert werden sollen. In diesem Fall bietet die einfachere Oberfläche des DBP einen deutlichen Vorteil gegenüber Bimp.

