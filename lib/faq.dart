import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'festival_config.dart';
import 'menu.dart';

const String faq = '''
    <link href="https://fonts.googleapis.com/css?family=Pirata+One&display=swap" rel="stylesheet">
    <style>
    h3 {
      font-family: 'Pirata One';
      font-size: 27px;
    }
    body {
      margin: 20px;
    }
    a:link, a:visited {
      color: #9da400;
    }
    </style>
    <body>
        <div class="row"><div class="col-xs-12 col-sm-12 col-md-4">
<div id="c27" class="frame frame-default frame-type-text frame-layout-0"><header><h3 class="">
				Festival
			</h3></header><p>Das Party.San wird mit seiner 25. Auflage erneut auf dem Flugplatz Obermehler nahe der Stadt Schlotheim stattfinden. Da wir einen Flugplatz als Veranstaltungsareal nutzen, sind ein paar gesonderte Verhaltensregeln nötig, auf die wir noch genauer eingehen werden. Erneut werden wir&nbsp; die so genannte &nbsp;Underground - Bühne mit jeweils 5 Bands am Tag bespielen. Gesamt werden auf dem Party. San Open Air 2019 - 41 Bands auftreten. Wir hoffen natürlich, dass wir von Schäden, Unwettern &nbsp;und von Bandabsagen verschont bleiben. Das Party.San findet vom Donnerstag, 08.08.2019, bis Samstag, 10.08.2019, statt.</p></div>


<div id="c31" class="frame frame-default frame-type-text frame-layout-0"><header><h3 class="">
				Camping / Parken
			</h3></header><p>Der Zeltplatz ist ab Mittwoch, dem 07.08.2019, 10:00 Uhr geöffnet.</p><p>Der Campingplatz befindet sich direkt neben dem Festivalgelände.</p><p>Der Untergrund besteht aus befestigter/drainierter&nbsp; Wiese und ist relativ eben.</p><p>Es ist auf dem gesamten Campground und dem Festivalgelände untersagt:</p><ol start="1" type="1"><li>Lagerfeuer zu errichten&nbsp; - außer in speziell dafür vorgesehenen Behältern.</li><li>Das Graben von Löchern, wie zum Beispiel für Lagerstellen von Getränken usw.</li><li>Das Betreten des Flugplatzes außerhalb der bereitgestellten Flächen.</li><li>Beschädigungen an Leiteinrichtungen oder anderem Eigentum des Flugplatzbetreibers oder des Veranstalters.</li><li>Das Übersteigen und/oder Beschädigen von Zaunanlagen / Toren sowie aller anderen Sicherungsanlagen</li><li>Das gesamte Gelände ist mit einer max. Geschwindigkeit von 20 km/h zu befahren.&nbsp;</li></ol><p>Preissteigerungen, wie in den zurückliegenden Jahren, lassen sich auch auf die immer wieder aufgetretenen Beschädigungen zurückführen. Sollte es zu Schäden kommen, für die wir haftbar gemacht werden, müssen wir die Kosten wiederum auf die Preise im kommenden Jahr umlegen. Das Party.San versucht der Metal - Community eine faire Alternative zu bieten, dazu brauchen wir allerdings immer eure Unterstützung!</p><p>Das Fahrzeug&nbsp; kann direkt neben dem Zelt abgestellt werden. Ohne gültiges Ticket und der dazugehörigen Parkvignette ist das Betreten oder Befahren des gesamten Festivalgeländes incl. aller Zeltflächen nicht gestattet. Achtung! Private Stromaggregate sind nicht erlaubt!!!</p></div>

<div id="c591" class="frame frame-default frame-type-text frame-layout-0"><header><h3 class="">
				Gruppencamps
			</h3></header><p>Alle Camper, die in der Gruppe, größer 30 Personen, zusammen zelten möchten, Haben die Möglichkeit sich eine Campingfläche zu reservieren. Die reservierten Flächen unterliegen ausnahmslos unseren Sonderregeln GREEN CAMPING! Ihr müsst euch also entscheiden ob ihr diese Regeln befolgen könnt. Anfragen / Anmeldungen per Email an <a href="mailto:info@party-san.de">info@party-san.de</a> können bis zum <em><strong>21.06.2019</strong></em> an uns geschickt werden. Dabei sind diese Parameter zu beachten: Bitte schickt uns bei der Anmeldung die Infos für Punkt 1-7.</p><ol><li><p class="western">Bezeichnung der Gruppe / Fanclubname o.ä.</p></li><li><p class="western">Wie viele Autos</p></li><li><p class="western">Wie viele Zelte</p></li><li><p class="western">Wie viele Caravans</p></li><li><p class="western">Wie viele Personen (mind. 30 Personen)</p></li><li><p class="western">Für die Reservierung ist eine Bearbeitungsgebühr im Voraus von, 30-45 Pers. = 60,-€ 46-65 Pers. = 80,-€ / 66-100 Pers. = 100,-€) zu entrichten.</p></li><li><p class="western">Es besteht die Möglichkeit eine Mobiltoilette zu mieten, die dann direkt an eurem Camp stehen wird. Kosten dafür sind: 120,-€ (inkl. drei Reinigungen + 25,-€ Kaution).</p></li></ol><p>Da die Flächen für die Reservierung im letzten Jahr ausgebucht waren, kann es möglich sein, dass wir schon&nbsp;vor der Deadline ausgebucht sind. Daher bitten wir um schnelle Rückmeldung.</p><p>In der GREEN CAMPING AREA / reservierte Camping-Areale gelten einige besondere Campingregeln, die alle Besucher einhalten sollten, die in diesem Bereich campen wollen:</p><h3>Die neuen Richtlinien zu reservierten Flächen "green camping"!</h3><p>In der GREEN CAMPING AREA / reservierte Camping-Areale gelten einige besondere Campingregeln, die alle Besucher einhalten sollten, die in diesem Bereich campen wollen:</p><p>Die Sauberkeit des Camping -Areals liegt uns sehr am Herzen, daher fordern wir die Nutzer der reservierten Flächen auf, unnötige Campingutensilien gleich zuhause zu lassen und euren Zeltplatz während des Festivals weitestgehend sauber zu halten..</p><p>Zur Erleichterung der Abfallentsorgung werden in der Area an verschiedenen Punkten Sammelgefäße für Müll aufgestellt, die täglich, bei Bedarf auch mehrmals, entleert werden. Jeder Besucher erklärt sich bereit, die von ihm aufgestellten Zelte und Pavillons nach der Veranstaltung auch wieder mit nach Hause zu nehmen oder selbst in den vor Ort bereitgestellten Müllsammeltonnen zu entsorgen. Ihr stimmt überdies zu, am Abreisetag euren Restmüll vollständig an der Müllannahmestation abzugeben oder in den bereitgestellten Abfallbehältern zu entsorgen.</p><p>Es dürfen Zelte und Pavillons aufgebaut werden, aber keine sonstigen Bauten. Campingstühle sind natürlich zulässig, aber keine großen Möbel wie Sessel, Sofas, Betten und Kühlschränke. Das Mitbringen und der Betrieb von Stromaggregaten sind wie auf allen anderen Flächen untersagt. In der Zeit von 02:00 Uhr - 08:00 Uhr bitten wir, die Nachtruhe der Campingnachbarn zu respektieren. Das heißt nicht, dass auf den reservierten Flächen keine Musik gehört werden darf, sondern dass diese auf Wunsch der Nachbarschaft auf ein erträgliches Maß eingestellt werden muss.</p><p>Kommt es bei einzelnen Gruppen zu Verletzungen der Richtlinie, führt das zum dauerhaften Ausschluss aus den Reservierungsmöglichkeiten.</p></div>

</div><div class="col-xs-12 col-sm-12 col-md-4">
<div id="c34" class="frame frame-default frame-type-text frame-layout-0"><header><h3 class="">
				Bühnen
			</h3></header><p>Es wird wieder zwei Bühnen geben. Die erste ist die Hauptbühne, auf der ab Donnerstag die Bands spielen werden. Die zweite ist die Zeltbühne, diese wird 2014 erneut als zweite offizielle Bühne für täglich jeweils 5 Bands (Undergroundstage) genutzt. Weiter findet dort täglich die Aftershow- Party mit &nbsp;unseren beiden Radiosendern "The New Noise" &amp; "Hellborn Metal Radio" aus Thüringen statt. Da der Frühschoppen im letzten Jahr sehr gut angenommen wurde wird auch 2019 eine Band zu diesem Anlass aufspielen.</p></div>


<div id="c28" class="frame frame-default frame-type-text frame-layout-0"><header><h3 class="">
				Tickets
			</h3></header><p>Sichert euch euer Ticket im Vorverkauf! Auch unsere Kapazitäten sind nicht unendlich! Inwieweit es WE-Ticket/ Tagestickets an der Abendkasse geben wird, können wir zum jetzigen Zeitpunkt noch nicht sagen. Wir werden hierzu erst spätestens Mitte Juni eine Aussage treffen können.</p></div>


<div id="c33" class="frame frame-default frame-type-text frame-layout-0"><header><h3 class="">
				Müll
			</h3></header><p>Da das Party.San auf einer Flugbetriebsfläche stattfindet, ist noch stärker als bisher auf die Ordnung und Sauberkeit der Flächen bei der Abreise zu achten.
</p><p>Wir haben&nbsp; uns verpflichtet, den Campingflächen 2 Tage nach dem Festival gereinigt an den Eigentümer zu übergeben. Deshalb ist es unumgänglich eine Gebühr für das Parken und für die Müllentsorgung zu erheben. Diese wird für PKWs 10,00€ und für Caravans / Reisebusse oder Fahrzeuge mit Anhänger 20,-€ betragen. &nbsp;. Müllsäcke werden wie bisher weiterhin kostenlos ausgegeben und gegen Abgabe eines gut gefüllten Müllsackes wird es auch wieder unseren Party.San-Kalender geben. Wir hoffen auf euer Verständnis und bedanken und bei denen die ihren Platz sauber verlassen. 
</p><p>Außer für angemeldete Händler ist es auf dem gesamten Gelände verboten, mit Food/Nonfood Artikeln zu handeln.&nbsp;</p></div>


<div id="c30" class="frame frame-default frame-type-text frame-layout-0"><header><h3 class="">
				Kinder
			</h3></header><p>Kinder und Jugendliche (bis 16 Jahren) ohne erziehungsbeauftragte Person haben, laut JuSchG § 5, keinen Zutritt bei Konzert- und Tanz-Veranstaltungen. Jugendliche (ab 16 Jahre) ohne erziehungsbeauftragte Person haben bis 24:00 Uhr Zutritt bei o.g. Veranstaltungen.</p><p>Es gibt allerdings die Ausnahme, dass ihr mit dem &gt;&gt;&gt;<a href="http://download.party-san.com/pdf/PSOA2019_erziehungsberechtigte.pdf" title="Initiates file download" target="_blank">&nbsp;hier&nbsp;</a>&lt;&lt;&lt; zu ladenden Dokument einen Erziehungsbeauftragten benennen könnt. Füllt dazu das Dokument aus und lasst es von euren Eltern unterschreiben. Führt das Formular ständig mit euch und zeigt es auf Verlangen den Security -Mitarbeitern vor.</p><p>Die Zeiten, in denen ihr euch auf dem Festivalgelände aufhalten könnt, erhöhen sich dann wie folgt: bis 16 Jahre bis 24:00 Uhr / ab 16 Jahre bis euer Erziehungsbeauftragter euch den Aufenthalt untersagt.</p><p>Der Ausschank von alkoholischen Getränken an Kinder und Jugendliche unterliegt dem JuSchG. § 9.&nbsp;</p><p>In Begleitung von Erziehungsberechtigten haben Kinder und Jugendliche bis zum vollendeten 14. Lebensjahr freien Zutritt. Das heißt, wer 14 ist, muss bezahlen.&nbsp;</p></div>


<div id="c35" class="frame frame-default frame-type-text frame-layout-0"><header><h3 class="">
				Catering / Preise
			</h3></header><p>Eine Versorgung mit Getränken und Speisen ist ab Mittwochabend 20:00 Uhr bis Sonntagmorgen 11:00 Uhr möglich.<br>Wir achten streng darauf, nur Caterer zuzulassen, deren Produkte eine hohe Qualität besitzen. Die Versorgungspartner sind angewiesen, euch Speisen und Getränke zu einem vernünftigen Preis anzubieten. Der Getränkeausschank wird auch 2019 wieder von der alt bewerten Party.San-Crew sichergestellt.&nbsp;</p></div>

</div><div class="col-xs-12 col-sm-12 col-md-4">
<div id="c29" class="frame frame-default frame-type-text frame-layout-0"><header><h3 class="">
				Anreise Auto / Bahn
			</h3></header><p>Das Festivalgelände liegt ca. 20 km von den Autobahnanschlussstellen A38 (Abfahrt 10) - Sondershausen von Osten kommend und A38 (Abfahrt 6) - Leinefelde von Westen kommend.</p><p>Von Süden / Südwesten A71 (Abfahrt 4) - Erfurt Gispersleben - B4 bis Andisleben - L1042 bis Bad Langensalza - B84 bis Abzweig Schlotheim.</p><p>Die Anreise mit der Bahn ist auch kein Problem. Mühlhausen hat eine Direktverbindung nach Göttingen und Erfurt. Die ca. 15 km Strecke von Mühlhausen nach Schlotheim / Obermehler wird im Stundetakt durch den <a href="http://www.666tohell.de" title="Opens external link in new window" target="_blank" class="external-link-new-window">666 TO HELL</a> Bus und einen öffentlichen Überlandbus befahren. Der RIWA-Bus wird das gesamte Wochenende auch den Pendelverkehr zwischen Festivalgelände und Schlotheim übernehmen. Die&nbsp;<a href="/informationen/bus-shuttle/" title="Opens internal link in current window" class="internal-link">genauen Fahrzeiten</a>&nbsp;geben wir noch rechtzeitig auf der Internetseite bekannt. Es lässt sich aber schon absehen, dass dieser täglich um ca. 18:00 Uhr eingestellt wird und / oder noch einmal in der Nacht die Hotelschläfer nach Mühlhausen bringt.</p></div>


<div id="c778" class="frame frame-default frame-type-text frame-layout-0"><header><h3 class="">
				Mitfahrzentrale
			</h3></header><p>Fahrfahraway bietet euch die Möglichkeit kostengünstig und ohne eigenes Fahrzeug zum Festival zum kommen beziehungsweise euer fast leeres Auto mit Mitfahrern zu bestücken und eure Spritkosten zu senken. Kein Buchungssystem, keine Gebühren, Bargeldzahlung vor Ort - einfach, günstig &amp; gemeinsam reisen.</p><p><a href="https://fahrfahraway.com/event/59-partysan-metal-open-air" target="_blank">https://fahrfahraway.com/event/59-partysan-metal-open-air</a>&nbsp;</p></div>


<div id="c32" class="frame frame-default frame-type-text frame-layout-0"><header><h3 class="">
				Toiletten / Duschen / Versorgung
			</h3></header><p>Es werden ausreichend kostenlose Mobil -Toiletten vorhanden sein. Diese befinden sich gut sichtbar unmittelbar bei den Lichttürmen auf der Landebahn. Die Toiletten werden während des Festivals mehrmals täglich gereinigt. Wie auch im letzten Jahr wird es zwei Sanitärstützpunkte mit Spültoiletten und Duschen geben. Diese befinden sich ebenfalls gut sichtbar auf den Zeltplatzflächen (Süd). Es wird auch wieder das so genannte Flatrate- Ticket für die Benutzung der Toiletten und Duschen geben. Dieses könnt ihr direkt an den Servicepunkten erwerben.</p><p>Handwaschgelegenheiten und Wasserentnahmestellen wird es selbstverständlich auf dem Campinggelände in der Nähe der Servicepunkte geben.&nbsp;</p><p>Zwischen Festivaleinlass und Backstage- Einfahrt befindet sich zusätzlich zum bekannten Frühstückzelt ein Biergarten, der ab Mittwochabend geöffnet ist. Das Partyzelt ist ab Mittwoch,&nbsp; 07.08.2019, 20:00 Uhr geöffnet und wird, wie auch in den vergangenen Jahren, nicht mehr durchgehend geöffnet sein, sondern öffnet parallel zum Festivalgelände seine Tore. Natürlich wird es auch weiterhin die täglichen Aftershowparties geben, für die das Party.San- Partyzelt mittlerweile berüchtigt ist.</p></div>


<div id="c36" class="frame frame-default frame-type-text frame-layout-0"><header><h3 class="">
				Mitbringsel
			</h3></header><p>Waffen, Feuerwerkskörper, Artikel aus Glas sind absolut verboten. Es wird <br> dieses Jahr wieder bei Anreise kontrolliert. Bei erheblichen Verstößen kann ein Platzverweis ausgesprochen werden. Also lasst den Kram zu Hause!
</p><p>GASFLASCHEN:&nbsp; Gasflaschen sind auf dem Party.San Open Air nicht verboten. In Einzelfällen kann jedoch das Security - Personal &nbsp;mitgeführte Gasflaschen beschlagnahmen. Diese werden natürlich nach Ende der Veranstaltung an die Besitzer zurückgegeben. 
</p><p>&nbsp;</p><p>Dies gilt im Besonderen wenn : &nbsp;</p><ul><li>die Gasflasche eine größere Füllmenge als 5 Kg hat. Maximal eine Flasche pro Fahrzeug !!</li><li>die Gasflasche keine aktuelle TÜV - Prüfung hat (Stempel oder Schild an Gasflasche)</li><li>kein Druckregler oder Anschlussschläuche&nbsp; mit gültigen TÜV vorweisbar sind. (Stempel und /oder Aufdruck )</li><li>bei der betriebenen Gasanlagen keine funktionssichere Zündsicherung vorhanden ist.</li><li>bei Betrieb im Wohnwagen / Wohnmobilen keine gültige Gasprüfung vorliegt. &nbsp;(TÜV Plakette) &nbsp; &nbsp;</li></ul></div>

</div></div>
</body>
''';

class FAQ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final contentBase64 = base64Encode(const Utf8Encoder().convert(faq));
    final url = 'data:text/html;base64,$contentBase64';
    return Scaffold(
      drawer: const Menu(),
      appBar: AppBar(
        title: Text(
          'FAQ',
          style: FestivalTheme.appBarTextStyle,
        ),
      ),
      body: Center(
          child: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        navigationDelegate: (NavigationRequest request) {
          launch(request.url);
          return NavigationDecision.prevent;
        },
      )),
    );
  }
}
