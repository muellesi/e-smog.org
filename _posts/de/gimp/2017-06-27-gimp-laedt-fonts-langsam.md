---
title: Fix - Gimp 2.8.22 lädt lange fonts
date: 2017-06-27 13:00
categories: gimp
---

Mit dem Update auf Gimp 2.8.22 kann es mitunter vorkommen, dass Gimp beim Starten mehr Zeit benötigt, als üblich. In diesem Fall legt Gimp insbesondere beim Laden der Schriften eine Bedenkpause ein und braucht mitunter bis zu 40 Sekunden für den Start. Hier sei noch erwähnt: Das wäre in einigen Situationen (Liste unter dem Artikel) durchaus normal, wenn dies aber bei jedem Start passiert, seid ihr über einen Bug gestolpert, der im Gimp Bugtracker unter der ID [#782676](https://bugzilla.gnome.org/show_bug.cgi?id=782676) bereits beschrieben ist. In diesem Artikel zeige ich, wie sich dieser leicht beheben lässt.
<!--more-->

### Die Lösung

Die Lösung für das Problem ist einfach: Schuld an den langen Ladezeiten ist ein defekter Cache der von Gimp benutzten Library „[fontconfig](https://www.freedesktop.org/wiki/Software/fontconfig/)„. Wenn dieser Cache nicht korrekt gelesen werden kann, wird er mit jedem neuen Start von Gimp neu angelegt, was entsprechend Zeit in Anspruch nimmt. Für die Behebung des Problems reicht es also, den fontconfig-Cache einmal komplett zu löschen, sodass er beim nächsten Start einmal korrekt angelegt wird und von da an wieder korrekt gelesen werden kann.

Der zu löschende Ordner, der den Cache enthält, befindet sich auf Windows-Systemen normalerweise unter C:\Users\USERNAME\AppData\Local\fontconfig. Da der Ordner AppData normalerweise versteckt ist, erreicht ihr den „Local"-Ordner am schnellsten über den Ausführen-Dialog von Windows: Drückt einmal die Tastenkombination Win + r und gebt im erscheinenden Dialog `%LOCALAPPDATA%` ein. Damit habt ihr euch die Navigation nach C:\Users\USERNAME\AppData\Local gespart und könnt direkt im erscheinenden Explorer-Fenster den Ordner „fontconfig" suchen und löschen.

Wenn ihr den Entwicklern von Gimp und fontconfig etwas Gutes tun wollt, **löscht ihr den Ordner nicht direkt**, sondern sichert ihn zunächst und meldet euch dann im oben verlinkten Bugreport. Eventuell könnt ihr mit den gesicherten Cachedateien dazu beitragen, dass der Fehler gefunden und behoben werden kann.

#### Nun noch zur versprochenen Liste der Situationen, in denen der Gimp-Start auch normalerweise länger dauern darf:

1.  Nach der Installation direkt nach der Installation kann noch kein Fontcache existieren -- entsprechend muss er da immer neu angelegt werden
2.  Nach der Installation neuer Schriften: Mit der Installation neuer Schriften wird der bisherige Cache ungültig, da dieser die neuen Schriften nicht enthält und Gimp legt einen neuen an.
3.  Bei Zeitumstellungen, Schaltsekunden, etc. durch eine ungeschickt programmierte Schnittstelle für Datums- und Zeitangaben von Windows kann Gimp bei einer Zeitumstellung nicht erkennen, dass der Cache noch aktuell ist -- für Gimp stimmt dann das Alter des Caches und das Erstellungsdatum nichtmehr überein, was den Cache ungültig macht. Entsprechend wird dieser bei einer Zeitumstellung neu angelegt.


*[C:\Users\USERNAME\AppData\Local\fontconfig]: `USERNAME` müsst ihr hier durch euren Windows-Benutzernamen ersetzen.