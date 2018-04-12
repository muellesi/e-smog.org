---
title: Windows 8.1 Update 1 - Maus bleibt an Bildschirmkante hängen - FIX
date: 2014-08-20 08:13
image: assets/post_images/windows_kaefer.png
categories: Windows
---

Wenn ihr einen PC mit mehreren Monitoren nutzt, kann es beim Update auf die Windows-Version 8.1 Update 1 dazu kommen, dass die Maus zwischen den Bildschirmen hängen bleibt, wenn ihr sie beim Übergang zwischen den beiden Schirmen nicht schnell genug bewegt. Was eigentlich ein neues Feature sein soll, fühlt sich für viele jedoch in der Bedienung ungemein nervig an - Die Lösung zu diesem Problem ist aber simpel und wird im folgenden beschrieben.<!--more-->

#### 1\. Schritt: Beheben für die Desktopansicht

1.  Öffnet den Registrierungseditor
2.  Wechselt in der Schlüsselansicht auf der Linken Seite in den Schlüssel `HKEY_CURRENT_USER\Control Panel\Desktop`
3.  Dort sollte sich nun auf der rechten Seite unter den ganzen anderen enthaltenen Werten auch der Wert `MouseMonitorEscapeSpeed` befinden, welcher standardmäßig den Datenwert 0 hat.
4.  Mit einem Doppelklick auf diesen Wert öffnet ihr ihn zum Bearbeiten und gebt im Textfeld für den Wert eine 1 anstatt der bereits eingetragenen 0 an.

#### 2\. Schritt: Beheben für die Edge UI/Metro-Oberfläche

Der hierzu benötigte Registry-Schlüssel ist etwas tiefer in der Struktur versteckt:

1.  Wechselt nun in den Registry-Schlüssel `HKCU\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell\EdgeUi`, hier sollten sich zu beginn nur wenige Werte befinden.
2.  Nun müsst ihr auf der rechten Seite mittels Rechtsklick-&gt;Neu einen neuen DWORD-Wert erstellen. Diesen nennt ihr wie auch den Wert oben schon `MouseMonitorEscapeSpeed`.
3.  Anschließend müsst ihr wie oben in Schritt 4 den Inhalt des neu erstellten Wertes noch zu einer 1 machen.

#### 3\. Schritt: explorer.exe oder PC neu starten

Nun könnt ihr entweder im Taskmanager unter Prozesse den Windows-Explorer suchen, diesen beenden und anschließend über Datei-&gt;Neuen Task ausführen mit dem Befehl `explorer` erneut ausführen oder einfach euren PC neustarten.

Nach diesem Schritt solltet ihr eure Maus wieder ganz normal über die Bildschirmgrenzen bewegen können, ohne, dass sie dabei hängen bleibt.