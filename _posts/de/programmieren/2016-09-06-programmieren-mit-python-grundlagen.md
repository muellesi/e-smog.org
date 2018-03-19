---
title: Programmieren mit Python - Grundlagen
date: 2016-09-06 12:36
image: assets/post_images/python_logo.png
categories: Programmieren
locale: de_DE
---

Python kann in vielen Bereichen genutzt werden, um einfache - aber auch komplexe - Aufgaben zu automatisieren. Python ist eine Scriptsprache, das heißt, jedes Python-Programm ist im Prinzip einfach eine Textdatei, die vom Python-Interpreter eingelesen und ausgeführt wird (Andere Scriptsprachen sind zum Beispiel Javascript, LUA oder PHP). Auch wenn ein Python Script weitergegeben wird, bleibt es immer eine Textdatei, die jeder nach belieben anpassen und verändern kann. Python-Scripts erhalten zur einfacheren Erkennung meistens die Endung ".py". 

<!--more-->

Scriptsprachen sind das genaue Gegenteil zu kompilierten Programmiersprachen wie zum Beispiel C oder C++. Bei diesen kompilierten Sprachen wird zunächst ebenfalls eine Textdatei mit dem Programmcode in der jeweiligen Sprache erstellt, diese wird allerdings anschließend von einem sogenannten Compiler in ein Bytecode-Format übersetzt, das direkt auf dem Prozessor ausgeführt werden kann. Solche Programme erhalten (zumindest unter Windows) dann die Endung ".exe".

Aus diesem Unterschied ergeben sich auch schon direkt die unterschiedlichen Einsatzzwecke für Scripts und kompilierte Programme:

Kompilierte Programme sind oft wesentlich schneller, als Scripts, da sie wesentlich besser auf die Hardware optimiert werden können. Scripts jedoch können häufig mit wenigen Befehlen hochkomplexe Aufgaben übernehmen und haben zudem den Vorteil, dass jeder sich ein Script anpassen kann, ohne, dass es neu kompiliert werden müsste. Beide Arten von Programmen lassen sich so wunderbar miteinander kombinieren: Das Grundprogramm wird in einer kompilierten Sprache geschrieben und bringt einen Script-Interpreter mit. So lässt es sich mit Hilfe von Scripts sehr einfach beliebig erweitern und verbessern. Die Scripts bauen dabei alle auf den schnellen Grundfunktionen des Hauptprogramms auf und kombinieren diese zu komplexeren Abläufen. Ein gutes Beispiel hierfür ist Gimp und seine Python Plugins. An diesem Beispiel werden sich auch die nächsten Tutorial-Teile orientieren.

## Wie funktioniert Python?

Wie schon erwähnt, werden alle Befehle eines Python-Scripts untereinander in eine Datei geschrieben. Es ist allerdings auch möglich, Python-Befehle direkt einen nach dem anderen dem Python-Interpreter zu übergeben. Dafür bringen die meisten Interpreter eine Konsole mit, in die die Befehle nacheinander eingegeben werden können. Die Eingabe der Befehle in die Konsole eignet sich besonders gut dafür, einige Dinge direkt auszuprobieren, während eine Datei natürlich immer den Vorteil hat, dass das Script auch einen Neustart des Computers überlebt.

### Grundlegende Sprachkonstrukte

Bevor auf die einzelnen Konstrukte genauer eingegangen wird, sei zu erwähnen, dass Python im Vergleich zu fast allen anderen Programmiersprachen eine bestimmte Besonderheit aufweist: nämlich den sogenannten "significant whitespace" - doch was bedeutet das genau?  In allen Programmiersprachen müssen zusammengehörige Codeblöcke auf die eine oder andere Art gekennzeichnet werden. In vielen Sprachen werden dafür geschweifte Klammern, also { und } genutzt. Damit sehen Programme häufig so aus:
~~~ python
int main() {
    print("test");
    print("test2");
}
~~~

Die geschweiften Klammern zeigen dem Compiler/Interpreter, dass die beiden print-Befehle zur main-Funktion gehören. Python nutzt jedoch eine andere Art, diese Zugehörigkeit zu zeigen, und zwar Einrückungen: Alle zusammengehörigen Befehle werden immer auf die selbe Ebene eingerückt. Ein guter Programmierer tut genau das auch schon in allen anderen Sprachen, also kann man in Python im Prinzip einfach die geschweiften Klammern weglassen:
~~~ python
def main():
    print("test")
    print("test2")
main()
~~~
Die Ausgabe wird entsprechend
~~~ python
test
test2
~~~
da mit def main(): eine Funktion definiert wird (bei der reinen Definition gibt es noch keine Ausgabe), die via print main() am Ende der Datei dann ausgeführt wird. In der Funktion befinden sich die beiden print-Befehle, die von oben nach unten nacheinander ausgeführt werden. Das birgt allerdings auch einen ziemlich dicken Fallstrick: vergisst man in einer der Sprachen mit geschweiften Klammern einmal eine Einrückung, so ist das nicht weiter schlimm - der Compiler wird das Programm trotzdem exakt gleich verstehen. Bei Python hingegen wird in vielen Fällen ein komplett anderes Ergebnis herauskommen:
~~~ python
def main():
    print("test")
print("test2")
main()
~~~

Wird in der Ausgabe zu
~~~ python
test2
test
~~~
denn: erneut wird die Funktion main() definiert (es geschieht erneut hier noch keine Ausgabe), die enthält jetzt aber nur noch den oberen print-Befehl. Der untere Befehl, bei dem die Einrückung fehlt, wird direkt ausgeführt, sobald der Interpreter auf diesen stößt. Damit steht der zweite Printbefehl in der Ausführungsreihenfolge vor dem ersten, da ja die Funktion main() erst im letzten Befehl aufgerufen wird.

#### Die Schleife

Da Scripts vor allem in Gimp gerne zur Stapelverarbeitung eingesetzt werden, ist die Schleife wohl eines der wichtigsten Konstrukte. Eine Schleife wird dazu genutzt, einen bestimmten Teil des Codes immer und immer wieder auszuführen, bis eine bestimmte Bedingung erfüllt ist. Zum Beispiel könnte man also eine Anzahl an Bildern laden und diese dann eines nach dem anderen verarbeiten, bis die Liste von Bildern komplett abgearbeitet ist. Es gibt im Großen und ganzen (wie in fast jeder Programmiersprache) zwei wichtige Schleifenarten:

##### Die for-Schleife

Die for-Schleife kann auf einfache Art sämtliche Elemente in einer Sammlung aus Elementen durchlaufen - im obigen Beispiel also zum Beispiel die Bilder. Eine For-Schleife sieht dabei immer so oder ähnlich aus:
~~~ python
for EinzelnesElement in AlleElemente:
    code, der 
    wiederholt 
    werden soll
~~~
In der for-Schleife kann dann via EinzelnesElement auf das gerade aktuelle Element zugegriffen werden. Alternativ kann in der for-Schleife auch eine Bestimmte Menge an Zahlen durchlaufen werden, indem die for-Schleife folgendermaßen geschrieben wird:
~~~ python
for Zahl in range(0, 10):
    tu etwas mit Zahl
~~~
Bei dieser Version enthält die Variable Zahl dann mit jedem Schleifendurchlauf nacheinander die Zahlen 0 bis 10.

##### Die while-Schleife

Die while-Schleife  arbeitet Grundsätzlich anders, als die for-Schleife. Sie entspricht eher der Definition einer Schleife, die ich oben gegeben habe:

Eine while-Schleife wiederholt einen gewissen Codeteil so lange, bis eine Bedingung eintrifft. Hier ein kleines Beispiel:
~~~ python
counter = 0
while counter < 10
    counter = counter + 1
    print(counter)
~~~
Dieses Stück Code wird zunächst nacheinander alle Zahlen von 1 bis 10 ausgeben. Sobald die variable counter den Wert 10 erreicht, bricht die Schleife ab und das Script ist zu Ende.

Obwohl die beiden Schleifenarten so verschieden sind, kann dennoch ein und die selbe Aufgabe häufig mit beiden Arten von Schleifen durchgeführt werden.

**Kleine Übungsaufgabe: **Nutze eine for-Schleife, um ebenfalls alle Zahlen von 1 bis 10 auszugeben

#### Die Verzweigung / if-else-Blöcke

Eine Verzweigung wird in Programmen ebenfalls oft gebraucht. Ein Beispiel wieder aus dem Bereich von Gimp wäre: Wir wollen dem Benutzer in unserem Plugin per Checkbox die Möglichkeit geben, eine bestimmte Funktion unseres Plugins an- oder abzuschalten. Unser Programm muss daraufhin natürlich auf den Status der Checkbox reagieren und die Funktion je nach Status ausführen, oder eben auch nicht.

Eine einfache Verzweigung sieht so aus:
~~~ python
zahl = 10
if ( zahl == 11 ):
    print("Die Zahl war 11")
else:
    print("Die Zahl war nicht 11")
~~~
Das obige Script vergleicht also den Inhalt der Variable "zahl" mit der Zahl 11 und je nach Ergebnis wird der Codeblock direkt unter dem if (wenn das Ergebnis wahr ist) oder direkt unter dem else (wenn das Ergebnis falsch ist) ausgeführt. Um in der selben Verzweigung auch noch eine zweite Bedingung abzuprüfen, kann das `elif`  Statement genutzt werden. So ist es möglich, drei oder mehr verschiedene Abzweigungen für den Code zu definieren:
~~~ python
zahl = 3
if ( zahl == 1 ):
    print("Zahl war 1")
elif ( zahl == 3 ):
    print("Zahl war 3")
else
    print("Zahl war irgendetwas anderes als 1 oder 3")
~~~
Soweit alles nicht besonders schwer. Aber warum wird `zahl == 3` geschrieben und nicht `zahl = 3`? Diese Frage führt auf einen weiteren Grundlegenden Bauteil des Programmierens hin:

#### Operatoren

##### Vergleichs- und Logikoperatoren

Um die Frage von oben zu beantworten: ein einzelnes Gleichzeichen ist in Python immer eine Zuweisung. Das heißt, mit `zahl = 3 ` würde der Variablen zahl der Wert 3 zugewiesen. Wollen wir die Variable allerdings mit der Zahl 3 _vergleichen, _müssen wir zwei Gleichzeichen hintereinander setzen. Das Ergebnis eines solchen Vergleiches ist anschließend immer ein Wahrheitswert, also wahr (true) oder falsch (false).

Weitere Operatoren aus dieser Kategorie sind:

Für die Beispiele: a = 3 und b = 2
<table class="table table-bordered">
<tbody>
<tr>
<td>==</td>
<td>Wenn der Inhalt der beiden Operanden gleich ist, wird dieser Ausdruck wahr</td>
<td>(a == b) ist nie wahr</td>
</tr>
<tr>
<td>!=</td>
<td>Wenn der Inhalt der beiden  Operanden _nicht _gleich ist, wird dieser Ausdruck wahr</td>
<td>(a!=b) ist wahr</td>
</tr>
<tr>
<td>&lt;&gt;</td>
<td>Wenn der Inhalt der beiden  Operanden _nicht _gleich ist, wird dieser Ausdruck wahr</td>
<td>(a &lt;&gt; b) ist wahr. Entspricht fast immer dem !=-Operator</td>
</tr>
<tr>
<td>&gt;</td>
<td>Vergleicht zwei Zahlen. Wird wahr, wenn die linke Zahl größer ist, als die rechte.</td>
<td>(a &gt; b) ist wahr</td>
</tr>
<tr>
<td>&lt;</td>
<td>Vergleicht zwei Zahlen. Wird wahr, wenn die linke Zahl _kleiner _ist, als die rechte.</td>
<td>(a &lt; b) ist falsch</td>
</tr>
<tr>
<td>&gt;=</td>
<td>Vergleicht zwei Zahlen. Wird wahr, wenn die linke Zahl größer oder gleich der rechten ist.</td>
<td>(a &gt;= b) ist wahr</td>
</tr>
<tr>
<td>&lt;=</td>
<td>Vergleicht zwei Zahlen. Wird wahr, wenn die linke Zahl _kleiner_ oder gleich der rechten ist.</td>
<td>(a &lt;= b) ist falsch</td>
</tr>
</tbody>
</table>
für die Beispiele: a = true b = false
<table class="table table-bordered">
<tbody>
<tr>
<td>and</td>
<td>Wenn beide Operanden wahr sind, wird der ganze Ausdruck wahr</td>
<td>(a and b) ist falsch</td>
</tr>
<tr>
<td>or</td>
<td>Wenn einer der beiden  Operanden nicht null ist (entspricht wahr), wird der ganze Ausdruck wahr</td>
<td>(a or b) ist wahr</td>
</tr>
<tr>
<td>not</td>
<td>Invertiert die Bedeutung der obigen Ausdrücke</td>
<td>not (a and b) ist wahr</td>
</tr>
</tbody>
</table>

###### Rechenoperatoren

Python unterstützt wie jede andere Programmiersprache auch die Grundlegenden Rechenoperatoren: + - * /

Zusätzlich stehen folgende Operatoren zur Verfügung:
<table class="table table-bordered">
<tbody>
<tr>
<td>%</td>
<td>Modulo-Operator. Gibt den Rest einer Division zurück</td>
<td>3 % 2 == 1</td>
</tr>
<tr>
<td>**</td>
<td>Exponent.</td>
<td>3**4 == 81</td>
</tr>
<tr>
<td>//</td>
<td>Floor-Division. Rundet nach der Division immer ab. Auch in negativer Richtung.</td>
<td>9//2 == 4 und -11//3 == -4</td>
</tr>
</tbody>
</table>
&nbsp;

**Kleine Übungsaufgabe zum Ende des ersten Teils:**

Schreibe das klassische fizzbuzz-Programm: Das Script soll von 0 an bis 100 hochzählen und jede Zahl ausgeben. Ist die Zahl jedoch ein vielfaches von 3, gebe anstatt der Zahl "Fizz" aus. Ist die Zahl ein vielfaches von 4, gebe "Buzz" aus. Wenn die Zahl ein vielfaches von beiden Zahlen ist, gebe "FizzBuzz" aus.

&nbsp;

[spoiler title="Codebeispiel FizzBuzz (naiver Ansatz)"]
~~~ python
for i in range(101): //101 anstatt 100, weil wir bei 0 mit dem Zaehlen anfangen.
    fizz = False
    buzz = False
    if i%3 == 0:
        fizz = True
    if i%5 == 0:
        buzz = True
    print("FizzBuzz" if (fizz and buzz) else ("Fizz" if fizz else ("Buzz" if buzz else i)))
~~~

Die letzte Zeile nutzt dabei weil ich faul bin eine sogenannte "ternary condition". Das ist eine Art, eine Bedingung in einer Zeile zu schreiben. Man könnte genauso gut schreiben:
~~~ python
if fizz and buzz:
    print("FizzBuzz")
elif fizz:
    print("Fizz")
elif buzz:
    print("Buzz")
else:
    print(i)
~~~
Wie ihr seht, muss man dann aber jedes mal das print() neu schreiben, weshalb in solchen kleinen Beispielen die obige Version wesentlich angenehmer zu schreiben ist. Die Syntax ist dabei immer:
~~~ python
(Ergebnis für True) if (Bedingung) else (Ergebnis für False)
~~~
was in etwa der normalen Satzstruktur in der deutschen Sprache folgt (Zum Vergleich habe ich mal die Klammern gleich gesetzt, wie im Codebeispiel): "(Tu das), wenn (das hier zutrifft), sonst (tu das)"
[/spoiler]