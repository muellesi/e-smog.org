---
title: GIMP Grundlagen - Pixelzahl und Auflösung – Die Bildgröße
date: 2015-05-28 14:11
image: post_images/pixelzahl_aufloesung.jpg
categories: GIMP
locale: de_DE
---

Ein häufiges Problem beim Start in die digitale Bildbearbeitung ist, dass ein digitales Bild schwer zu begreifen ist -- was ist zum Beispiel ein Pixel und wie groß ist sowas? In diesem Artikel möchte ich kurz darauf eingehen, wie die Größe eines digitalen Bildes zustande kommt und dies hoffentlich auch für Einsteiger in die Bildbearbeitung etwas klarer machen.

<!--more-->

Das Pixel
---------

Ein Pixel ist die kleinste Einheit in einer digitalen Pixelgrafik (Es gibt auch noch andere Arten von Grafiken, die Vektorgrafiken, die sollen aber Thema eines anderen Artikels sein) und gleichzeitig Träger sämtlicher Informationen. Ein Pixel an sich hat zunächst keine Größe und besteht im klassischen RGB(A)-Modell aus drei, beziehungsweise vier Zahlenwerten -- dem Rotanteil, dem Grünanteil, dem Blauanteil und bei RGBA auch noch dem Alpha-Anteil. Da ein Pixel an sich eigentlich keine Größe hat, hat ein digitales Bild genausowenig eine echte Größe.

### Darstellung von Pixeln auf dem Monitor

Ein digitales Bild ist zunächst beliebig groß -- seine eigentliche sichtbare Größe erhält es nur durch die Monitorauflösung.

Ein digitales Bild hat keine Größe? Das mag verwunderlich erscheinen -- das Bild wird doch auf dem Bildschim dargestellt und hat dort auch eine Größe? Genau!

{% figure [caption:"Ein digitales Bild ist zunächst beliebig groß -- seine eigentliche sichtbare Größe erhält es nur durch die Monitorauflösung."] [class:"figure"] %}
![Visualisierung Bildprojektion auf Monitor]({{"/post_images/visualization_image_size.png" | absolute_url}}){: class="figure-img img-fluid rounded"}
{% endfigure %}

Die sichtbare Größe eines digitalen Bildes wird aber immer erst bei der Ausgabe -- sei es auf dem Bildschirm oder beim Druck -- festgelegt.  Bei der Ausgabe auf einem Bildschirm wird bei einem Zoomfaktor von 1 üblicherweise jedes Pixel im Bild auf einem Monitorpixel abgebildet. Das Bild bekommt hier also über die Größe der einzelnen Pixel im Monitor indirekt eine Größe zugeordnet, welche sich über Pixelzahl*Monitorpixelgröße berechnen lässt. Ein Bild mit 1000 Pixeln in der Breite erscheint damit also breiter als eines mit nur 500 Pixeln. Da jedes Monitormodell eine andere Pixeldichte (Anzahl Pixel/Fläche, oft angegeben in dpi (Dots per Inch), obwohl eigentlich ppi (Pixel per Inch) besser wäre) haben kann, unterscheidet sich ein Bild in der Darstellungsgröße aber auch von Monitor zu Monitor -- auf vielen der modernen 4k-Monitoren erscheinen Bilder daher sehr klein, da die Pixeldichte bei diesen sehr hoch (100+ ppi) und die Pixelgröße damit extrem klein ist.

Ein Bild hat zunächst grundsätzlich **keine** Eigenschaft für die Auflösung. Es hat **nur** Pixel. Wenn ein Bild mit einer bestimmten ppi-Zahl erstellt wird ist das nur ein Hilfswert, um aus einer realen Größe eine Pixelzahl zu berechnen. Manche Bildformate erlauben das Abspeichern dieser Information, das ist aber nicht notwendig.
{: class="alert alert-info"}

**Beispiel:** Ich möchte dass ein Bild auf meinem Monitor in der Größe von 10x10cm (= 3.93 x 3,93 inch) ausgegeben wird und ich weiß, dass mein Monitor eine Auflösung von 96ppi hat. Dann kann man daraus mit 3,93in * 96ppi errechnen, dass das Bild am Ende ca. 377 x 377 Pixel benötigt. Sobald diese Pixelanzahl festgelegt ist, wird die ppi-Zahl nichtmehr benötigt. Ein Festhalten dieser in den Exif-Informationen bringt im Normalfall keinerlei Mehrwert.

#### Mythos 72/96 dpi

Seit Jahrzehnten hält sich der Mythos, Grafiken, die später auf dem Bildschirm dargestellt werden sollen, müssten für 72ppi oder 96ppi ausgelegt sein. Dies bedeutet, dass die Grafiken mit einer gewissen Pixelanzahl angelegt werden, sodass sie später auf dem Monitor auch eine bestimmte Größe haben. Dies unterstellt allerdings, dass jeder Monitor eine dieser beiden Auflösungen hat, was aber gerade in den Zeiten der eben genannten 4k-Monitore absoluter Unsinn ist. Es ist unmöglich, dafür zu sorgen, dass ein Bild auf jedem Monitor die gleiche Größe hat -- weshalb beim Webdesign heute auch eher auf die Verwendung von grafischen Elementen verzichtet, und mit prozentualen Angaben gearbeitet wird. Natürlich ist es dennoch sinnvoll, beim Erstellen von Grafiken darauf zu achten, dass die Pixelzahl ausreichend ist -- so ist es nicht besonders klug, eine Grafik mit 100x100px zu erstellen und dann zu erwarten, dass diese auf dem Monitor 10cm einnimmt... 72 oder auch 96ppi sind dabei ein hilfreicher Richtwert -- diesen zu erzwingen ist allerdings absolut sinnlos.

### Darstellung im Druck

Hier funktioniert das ganze ähnlich wie auf dem Monitor. Ein Drucker, sei es ein Laser- oder ein Tintenstrahldrucker arbeitet üblicherweise mit kleinen „Farbklecksen", die er auf das Papier aufbringt -- den sogenannten Dots. Genau wie beim Monitor können diese Kleckse verschieden groß sein, weshalb es vor dem Druck nötig ist, die sogenannte Druckauflösung festzulegen und dem Drucker dadurch mitzuteilen, wie viele solcher Dots er pro Fläche setzen soll. Da allerdings gedruckte Medien oft wesentlich näher an das Auge herankommen, als Monitore muss die Druckauflösung auch sehr viel höher sein, als die Monitorauflösung, um dennoch einen halbwegs vollflächigen Eindruck zu machen.  Üblich ist hier eine Auflösung von 300dpi.

Ohne weitere Angabe wird beim Druck nun oft ein Pixel jeweils in einen Dot „übersetzt" und mit der angegebenen Dichte gedruckt. Wird allerdings eine bestimmte Druckgröße gewünscht, müssen bei angegebener Auflösung genug Pixel vorhanden sein, um diese Größe auch zu erreichen -- die Rechnung ist die selbe wie oben: Ich möchte ein 10×10 cm (= 3.93 x 3,93 in) großes Bild bei einer Auflösung von 300dpi drucken? Dann brauche ich ungefähr 1181 Pixel in jede Richtung. Habe ich mehr oder weniger Pixel als nötig, wird das Bild wie auch schon für den Monitor skaliert und dadurch beim Druck eventuell verschwommen dargestellt.