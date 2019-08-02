import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'festival_config.dart';
import 'i18n.dart';
import 'menu.dart';

const String html = '''
<link href="https://fonts.googleapis.com/css?family=Pirata+One&display=swap" rel="stylesheet">

<style>
td,th {
  text-align: center;
} 
table {
  border:none;
  border-collapse: collapse;
  width: 100%;
}

table td {
  border-left: 1px solid #000;
  border-right: 1px solid #000;
}

table td:first-child {
  border-left: none;
  // background-color: #ffffff;
}
table td:last-child {
  border-right: none;
  background-color: #ffffff;
}
table tr:nth-of-type(even) {
  background-color: #eeeeee;
}
h2 {
  font-family: 'Pirata One';
  font-size: 27px;
}
body {
  margin: 20px;
}

</style>
   <header>
      <h2 class="">
         P.S:O:A -&gt; Bhf. Mühlhausen
      </h2>
   </header>
   <table class="table table-responsive table-striped table-hover ce-table">
      <tbody>
         <tr>
            <td>
               &nbsp;
            </td>
            <td>
               Mi 7.8.
            </td>
            <td>
               Do 8.8.
            </td>
            <td>
               Fr 9.8.
            </td>
            <td>
               Sa 10.8.
            </td>
            <td>
               So 11.8.
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               Uhr
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               1
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               30*
            </td>
            <td>
               30*
            </td>
            <td>
               30*
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               4
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               15
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               5
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               45
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               6
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               45
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               7
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               45
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               8
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               30
            </td>
            <td>
               45
            </td>
            <td>
               45
            </td>
            <td>
               45
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               9
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               45
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               10
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               30
            </td>
            <td>
               45
            </td>
            <td>
               45
            </td>
            <td>
               45
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               11
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               45
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               12
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               30
            </td>
            <td>
               45
            </td>
            <td>
               45
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               13
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               00**
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               14
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               30
            </td>
            <td>
               45
            </td>
            <td>
               45
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               16
            </td>
            <td>
               30
            </td>
            <td>
               30
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               18
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               30
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               20
            </td>
            <td>
               30
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
      </tbody>
   </table>
   <header>
      <h2 class="">
         Bhf. Mühlhausen -&gt; P.S:O:A
      </h2>
   </header>
   <table class="table table-responsive table-striped table-hover ce-table">
      <tbody>
         <tr>
            <td>
               &nbsp;
            </td>
            <td>
               Mi.7.8.
            </td>
            <td>
               Do 8.8.
            </td>
            <td>
               Fr 9.8.
            </td>
            <td>
               Sa 10.8.
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               Uhr
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               9
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               15
            </td>
            <td>
               15
            </td>
            <td>
               15
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               11
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               15
            </td>
            <td>
               15
            </td>
            <td>
               15
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               13
            </td>
            <td>
               15
            </td>
            <td>
               15
            </td>
            <td>
               15
            </td>
            <td>
               15
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               15
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               15
            </td>
            <td>
               15
            </td>
            <td>
               15
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               17
            </td>
            <td>
               15
            </td>
            <td>
               15
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               19
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               15
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               21
            </td>
            <td>
               15
            </td>
            <td>
               15
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
      </tbody>
   </table>
   <header>
      <h2 class="">
         P.S:O:A -&gt; Schlotheim
      </h2>
   </header>
   <table class="table table-responsive table-striped table-hover ce-table">
      <tbody>
         <tr>
            <td>
               &nbsp;
            </td>
            <td>
               Mi.7.8.
            </td>
            <td>
               Do 8.8.
            </td>
            <td>
               Fr 9.8.
            </td>
            <td>
               Sa 10.8.
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               Uhr
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               9
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               30
            </td>
            <td>
               30
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               10
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               30
            </td>
            <td>
               00 30
            </td>
            <td>
               00 30
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               11
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               00 30
            </td>
            <td>
               00 30
            </td>
            <td>
               00 30
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               12
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               00 30
            </td>
            <td>
               00 30
            </td>
            <td>
               00 30
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               13
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               14
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               00 30
            </td>
            <td>
               00 30
            </td>
            <td>
               00 30
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               15
            </td>
            <td>
               00 30
            </td>
            <td>
               00 30
            </td>
            <td>
               00 30
            </td>
            <td>
               0 0
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               16
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               0 0
            </td>
            <td>
               0 0
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               17
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               18
            </td>
            <td>
               30
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               19
            </td>
            <td>
               0 0
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
      </tbody>
   </table>
   <header>
      <h2 class="">
         Schlotheim -&gt; P.S:O:A
      </h2>
   </header>
   <table class="table table-responsive table-striped table-hover ce-table">
      <tbody>
         <tr>
            <td>
               &nbsp;
            </td>
            <td>
               Mi.7.8.
            </td>
            <td>
               Do 8.8.
            </td>
            <td>
               Fr 9.8.
            </td>
            <td>
               Sa 10.8.
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               Uhr
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               9
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               45
            </td>
            <td>
               45
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               10
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               45
            </td>
            <td>
               15 45
            </td>
            <td>
               15 45
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               11
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               15 45
            </td>
            <td>
               15 45
            </td>
            <td>
               15 45
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               12
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               15 45
            </td>
            <td>
               15 45
            </td>
            <td>
               15 45
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               13
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               15
            </td>
            <td>
               15
            </td>
            <td>
               15
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               14
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               15 45
            </td>
            <td>
               15 45
            </td>
            <td>
               15 45
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               15
            </td>
            <td>
               15 45
            </td>
            <td>
               15 45
            </td>
            <td>
               15 45
            </td>
            <td>
               45
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               16
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               45
            </td>
            <td>
               45
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               17
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               18
            </td>
            <td>
               45
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
         <tr>
            <td>
               19
            </td>
            <td>
               45
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
            <td>
               &nbsp;
            </td>
         </tr>
      </tbody>
   </table>
''';

class Drive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final contentBase64 = base64Encode(const Utf8Encoder().convert(html));
    final url = 'data:text/html;base64,$contentBase64';
    final i18n = AppLocalizations.of(context);
    return Scaffold(
      drawer: const Menu(),
      appBar: AppBar(
        title: Text(
          i18n.drive,
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
