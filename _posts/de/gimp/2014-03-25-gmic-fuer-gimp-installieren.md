---
title: G'MIC für GIMP installieren
date: 2014-03-25 21:22
categories: GIMP
image: assets/post_images/wilber_quest.png
locale: de_DE
---

Ein sehr bekanntes Plugin für GIMP ist das Gmic-Plugin. Einmal installiert stellt es eine riesige Anzahl an Filtern zur Verfügung, mit denen Bilder und Photos bearbeitet werden können - dabei lässt es so gut wie keine Wünsche offen - von verschiedenen Weichzeichneralgorithmen (Gmic ist der Nachfolger des Bildentrauschungsplugins [**GREYCstoration**](http://registry.gimp.org/node/137)) bis zu eher künstlerischen Filtern wie dem Rodilius-Filter, der dem [Fractalius](http://www.redfieldplugins.com/filterFractalius.htm)-Filter von Photoshop ähnelt. Wer GIMP nutzt, sollte gmic zumindest einmal ausprobiert haben.
Da immer wieder Fragen aufkommen, wie das Plugin denn nun installiert wird, hier ein kurzes Tutorial dazu.

<!--more-->

## G'MIC besorgen

Das geht zum Beispiel über folgenden Link:

[http://gmic.eu/files/windows/gmic_gimp_qt_win32.exe](http://gmic.eu/files/windows/gmic_gimp_qt_win32.exe) (dieser sollte eigentlich immer die aktuellste gmic-Version zum Download anbieten - für ein 64Bit-System braucht ihr natürlich dann auch [http://gmic.eu/files/windows/gmic_gimp_qt_win64.exe](http://gmic.eu/files/windows/gmic_gimp_qt_win64.exe))

Die Datei wird an einem beliebigen Ort gespeichert.

## Das Plugin installieren

Per Doppelklick wird die heruntergeladene Datei nun ausgeführt. Ab Version 8 meckert Windows nach Bestätigung der Nachfrage nach Administratorrechten eventuell noch der Smart Screen Filter herum - das ist jedoch kein Grund zur Sorge, sondern bedeutet einfach nur, dass die Datei noch nicht von besonders vielen heruntergeladen wurde. Wenn ihr ganz sicher sein wollt, bietet sich ein online Virenscanner wie virustotal zur Absicherung an. Die Installationsdialoge könnt ihr im Großen und ganzen einfach durchklicken (lesen was man da anklickt schadet trotzdem nie ;) ).

## Den Installationsordner in GIMP bekannt machen

{% figure [caption:"Der Pfad zum Gmic Addon muss in den GIMP Einstellungen bekannt gemacht werden"] [class:"figure"] %}
![GMIC Pfad GIMP Einstellungen]({{"/assets/post_images/gimp_gmic_new_path.png" | absolute_url}}){: class="figure-img img-fluid rounded"}
{% endfigure %}

Nachdem ihr das Plugin nun installiert habt, ist seit der Version 2.0.3 des Plugins ein weiterer Schritt nötig (siehe [Kommentar des Plugin-Autors](https://discuss.pixls.us/t/using-the-windows-installer-for-version-2-0-3-of-gmic/4825)). Da das Plugin viele zusätzliche Dateien mit sich bringt, wird es standardmäßig in den Unterordner gmic_gimp_qt/ eures GIMP-Pluginordners installiert. Dort wird es jedoch von GIMP 2.8 nicht direkt gefunden und muss über die Einstellungen erst bekannt gemacht werden:

In den Einstellungen (Bearbeiten -&gt; Einstellungen) wird im Untermenü Ordner -&gt; Plugins ein neuer Eintrag angelegt, der den Pfad zum Installationsort des Plugins enthält. Falls ihr bei der installation keine Änderungen am Pfad vorgenommen habt, lautet der also C:\Users\EUERUSERNAME\.gimp-2.8\plug-ins\gmic_gimp_qt (EUERUSERNAME muss natürlich durch euren Windows-Benutzernamen ersetzt werden).

Nachdem ihr den neuen Pfad hinzugefügt habt, könnt ihr die Einstellungen mit einem Klick auf OK speichern und den Dialog schließen.

## GIMP erneut starten

Nachdem der neue Pfad in GIMP bekannt gemacht wurde, muss GIMP einmal neu gestartet werden, damit der neue Pfad nun ebenfalls nach Plugins durchsucht wird. Eventuell dauert der Start dieses Mal dann etwas länger als gewohnt. Sobald GIMP komplett geladen ist, sollte gmic im Filtermenü zu finden sein. Der Menüpunkt ist Anfangs noch ausgegraut, sobald in GIMP aber ein Bild geladen wurde, ist er anklickbar.