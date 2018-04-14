---
title: GIMP vs. Inkscape - Anwendungsbeispiele kurz erklärt
date: 2017-08-22 20:00
image: assets/post_images/gimpvsinkscape.png
categories: GIMP
locale: de_DE
---

Beim Erstellen von Grafiken gibt es einiges zu beachten. Eine wichtige Entscheidung, die noch vor allen anderen Entscheidungen getroffen werden sollte, ist dabei die Wahl des Grafikformates: Eignet sich für die geplante Grafik eher ein vektorbasiertes Format oder doch eher ein Pixelbild? Mit dieser Wahl fällt in den Meisten Fällen auch bereits die Wahl der zu verwendenden Software: Möchte ich eine Pixelgrafik erstellen, ist GIMP die richtige Wahl. Soll es hingegen eine Vektorgrafik werden, kommt Inkscape zum Zug. In diesem Artikel soll es nun darum gehen, von Anfang an die richtige Entscheidung zu treffen, damit später nicht möglicherweise ein böses Erwachen folgt.

<!--more-->

Vektorgrafik -- was ist das eigentlich?
--------------------------------------

Am einfachsten lässt sich Vektorgrafik wohl dadurch erklären, was sie **nicht** ist: Jeder weiß heutzutage von Digitalkameras und dem täglichen Kontakt mit digitalen Bildern, dass diese aus Pixeln aufgebaut sind. Jedes Bild besteht dabei im Prinzip aus einer extrem großen Matrix an Pixeln, von denen jedes wiederum aus drei Farbkomponenten zusammengesetzt ist -- **R**ot, **G**rün und **B**lau, die in Kombination eine Farbe ergeben - diese Art von Bildern wird auch Rastergrafik genannt. Und genau das ist es, was Vektorgrafiken nicht sind. Eine reine Vektorgrafik enthält keine Pixel -- und dennoch wird sie auf dem Bildschirm mit Pixeln angezeigt. Was ist eine Vektorgrafik also dann?

{% figure [caption:"Die Pixel einer Rastergrafik sind gut sichtbar, wenn man hineinzoomt."] [class:"figure"] %}
![Rastergrafik gezoomt]({{ "/assets/post_images/gimp_inkscape_pixel.jpg" | absolute_url }}){: class="figure-img img-fluid rounded"}
{% endfigure %}

Die Idee hinter Vektorgrafiken stammt vom Wunsch her, nicht mehr von der Pixelauflösung eines Bildes abhängig sein zu wollen: Nimmt man ein gewöhnliches Pixelbild, das einen Kreis enthält, hat dieser Kreis eine ganz bestimmte Größe. Will man diesen Kreis nun vergrößern oder verkleinern, muss das Bild in jedem Fall skaliert werden, worunter jedoch immer auch die Bildqualität leidet: Wird der Kreis größer skaliert, muss das Grafikprogramm Pixel "hinzuerfinden". Wird der Kreis dagegen kleiner skaliert, sind am Ende weniger Pixel im Bild -- es müssen also zwangsweise Information aus dem Bild entfernt werden.

Vektorgrafiken versuchen das Problem zu umgehen, indem in einer Vektorgrafikdatei gar keine Pixelinformationen mehr gespeichert werden. Anstatt dessen besteht eine svg-Datei (svg ist der Quasi-Standard für Vektorgrafiken) aus normalem Text, der die Objekte im Bild mathematisch beschreibt. Für unser Kreisbeispiel könnte in der svg-Datei also einfach die Information abgelegt sein, dass an der Position (0,0) im Bild ein Kreis mit dem Radius 5 und schwarzer Umrandung von einer Einheit Dicke gezeichnet werden soll. Ein Programm, das diese Grafik nun anzeigen möchte, muss den Text also einlesen, interpretieren und anschließend in eine Rastergrafik umwandeln.

Und was bringt das jetzt?
-------------------------

Mit der obigen Definition ergibt sich ein entscheidender Vorteil: Während eine skalierte Rastergrafik auf jeden Fall immer schlechter aussieht, als das Originalbild, ist eine Vektorgrafik beliebig skalierbar -- und das ohne, dass Kanten verpixeln oder Details unscharf werden. Dafür muss das Anzeigeprogramm lediglich alle Werte aus der Textdatei mit dem Skalierungsfaktor multiplizieren.

{% figure [caption:"Links: kleiner skaliert; Mitte: Original; Rechts: größer skaliert Es ist deutlich zu sehen, dass der kleiner skalierte Kreis deutlich heller ist, als das Original, während beim größer skalierten Kreis vor allem oben und unten starkes Aliasing sichtbar ist."] [class:"figure"] %}
![Kreise in Rastergrafik gezoomt]({{ "/assets/post_images/gimp_inkscape_circle_pixel.jpg" | absolute_url }}){: class="figure-img img-fluid rounded"}
{% endfigure %}

Wollen wir den oben erwähnten Kreis also um den Faktor zwei Vergrößern, muss das Pixelgrafikprogramm aus der Vorhandenen Menge an Pixeln noch einmal die selbe Menge hinzuerfinden, was zu einem sehr verschwommenen Bild führen wird. Das Vektorgrafikprogramm hat es hingegen einfach: Der skalierte Kreis hat die folgenden Eigenschaften:

-   Position: (0,0) * 2 = (0,0)
-   Radius: 5 * 2 = 10
-   Linienstärke: 1 * 2 = 2

Wie zu sehen ist, wird der Kreis also genau doppelt so groß, während er seine relative Position im Bild beibehält. Für die Bildschirmausgabe des skalierten Vektorkreises wird nun einfach ein neuer Kreis mit den skalierten Eigenschaften gezeichnet.

{% figure [caption:"Die gleichen Kreise als Vektorgrafik. Nun sind alle Größen gleich scharf. Zudem ist zu erkennen, dass einzelne Objekte auswählbar sind, was ein weiterer Vorteil von Vektorgrafiken ist. *Dieses Bild ist ein **Screenshot** einer Vektorgrafik und damit eine Rastergrafik! Leichtes Aliasing kann also auch hier sichtbar sein.* "] [class:"figure"] %}
![Kreise in Vektorgrafik gezoomt]({{ "/assets/post_images/gimp_inkscape_circle_vector.jpg" | absolute_url }}){: class="figure-img img-fluid rounded"}
{% endfigure %}

Natürlich kann das Vektorgrafikformat nicht nur Kreise darstellen: Auch andere geometrische Formen und sogar Freihandlinien sind möglich. Letztere werden dann einfach als eine Ansammlung von Punkten, den sogenannten Stützstellen in der svg-Datei abgelegt. Um aus diesen Stützstellen wieder eine Linie zu erzeugen ist etwas komplexere Mathematik nötig, deshalb werde ich das an dieser Stelle nicht weiter ausführen. Wer gerne mehr darüber wissen möchte, dem sei der Wikipedia-Artikel zur [Spline-Interpolation](https://de.wikipedia.org/wiki/Spline-Interpolation) ans Herz gelegt. Wichtig ist hier lediglich: Die oben gezeigte Skalierung durch einfache Multiplikation aller Eigenschaften mit dem Skalierungsfaktor funktioniert auch mit diesen komplexeren Objekten.

### Objekt versus Pixelmatsch

Das Stichwort Objekt liefert hier direkt einen weiteren Vorteil von Vektorgrafiken: Während das Grafikprogramm bei einer Rastergrafik nach dem Erstellen des Beispielkreises nicht mehr zwischen dem eigentlichen Kreis und den umgebenden Pixeln unterscheiden kann[^1], ist der Kreis in einer Vektorgrafik ganz klar als solcher definiert und kann von anderen Objekten getrennt bearbeitet werden (siehe Grafik). Das sorgt dafür, dass der Kreis in der Vektorgrafik ohne Probleme verschoben werden kann, ohne, dass die Pixel der anderen Objekte beeinflusst werden.

Wann sollte ich nun also Vektorgrafiken benutzen?
-------------------------------------------------

Die einfache Antwort ist: immer wenn es möglich ist. Aus einer Vektorgrafik kann zu jeder Zeit eine Rastergrafik mit beliebiger Auflösung gerendert werden. Eine Rastergrafik jedoch in eine Vektorgrafik umzuwandeln geht meist nur von Hand und benötigt sehr viel Zeit.

Es gibt aber auch Ausnahmen: Während sich Logos, Icons und sonstige Bilder mit geometrischen Formen mit absolut scharfen Kanten sehr gut dafür eignen, im oben vorgestellten Vektorformat dargestellt zu werden, gibt es Grafiken, wo dies unmöglich ist: Photos, Renderbilder aus 3D-Softwares oder auch handgemalte Bilder enthalten so viele Informationen und oft kaum bis gar nicht voneinander trennbare Objekte, dass sie einfach nicht als Vektorgrafik darstellbar sind. Der Versuch, das doch zu tun, wird in den meisten Fällen wie der Versuch eines Kindergartenkindes aussehen, eines der Bilder nachzumalen. Diese Art von Bildern ist also der Standard-Anwendungsfall für Rastergrafikprogramme wie GIMP.

Alle anderen Grafiken hingegen, die scharfe Linien, Text und geometrische Formen enthalten, sind auf jeden Fall immer gut geeignet, als Vektorgrafik angelegt zu werden und werden damit mit Inkscape erstellt.

[^1]: Natürlich kann man den Kreis auf einer extra Ebene ablegen und hat dann innerhalb des Grafikprogramms eine ähnliche Funktionalität. Wird das Bild aber exportiert, werden am Ende in den meisten Formaten alle Ebenen in eine einzige Ebene zusammengeführt. Soll eine Pixelgrafik also bearbeitet werden, ohne, dass die Projektdatei (bei GIMP wäre das xcf) vorliegt, besteht das genannte Problem auf jeden Fall.