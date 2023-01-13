import 'package:flutter/material.dart';
import 'package:flutter_application_1/functions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zahlen Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Zahlen Converter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController zahl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            margin: EdgeInsets.only(right: 50),
            child: IconButton(
              onPressed: () {
                setState(() {
                  eingegebeneZahl = null;
                  gewaehltZahlType = null;
                  ergebnissAsInt = null;
                  ergebnissAsList = [];
                  ergebnissAsListString = [];
                  zahl.text = '';
                  ausgabeType = '';
                });
              },
              icon: Icon(Icons.refresh),
            ),
          )
        ],
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, top: 20),
            alignment: Alignment.topLeft,
            child: Text(
              'Eingegbene Zahltype wählen',
            ),
          ),
          RadioListTile(
            title: Text('Binaere Zahl'),
            value: 'Binaere',
            groupValue: gewaehltZahlType,
            onChanged: (value) {
              setState(() {
                gewaehltZahlType = value;
              });
            },
          ),
          RadioListTile(
            title: Text('Dezimal Zahl'),
            value: 'Dezimal',
            groupValue: gewaehltZahlType,
            onChanged: (value) {
              setState(() {
                gewaehltZahlType = value;
              });
            },
          ),
          RadioListTile(
            title: Text('Hexadezimal Zahl'),
            value: 'Hexadezimal',
            groupValue: gewaehltZahlType,
            onChanged: (value) {
              setState(() {
                gewaehltZahlType = value;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              maxLength: 15,
              onTap: () {
                setState(() {
                  eingegebeneZahl = zahl.text;
                });
              },
              readOnly: gewaehltZahlType == null ? true : false,
              controller: zahl,
            ),
          ),
          eingegebeneZahl == null || eingegebeneZahl == ''
              ? Container()
              : (gewaehltZahlType == 'Dezimal' && !dezimalFreundlich(eingegebeneZahl!)) ||
                      (gewaehltZahlType == 'Binaere' && !binaerFreundlich(eingegebeneZahl!)) ||
                      (gewaehltZahlType == 'Hexadezimal' && !hexaFreundlich(eingegebeneZahl!))
                  ? Container(
                      child: Text(
                        'Falsche eingabe !',
                        style: TextStyle(color: Colors.red, fontSize: 40),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (gewaehltZahlType == 'Dezimal') {
                                    ergebnissAsList = dezimalZuBinaere(eingegebeneZahl);
                                  } else if (gewaehltZahlType == 'Binaere') {
                                    ergebnissAsList = stringZuListInt(eingegebeneZahl);
                                  } else if (gewaehltZahlType == 'Hexadezimal') {
                                    ergebnissAsList = hexaZuBinaery(eingegebeneZahl);
                                  }
                                  ausgabeType = 'Binaere';
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ausgabeType == 'Binaere' ? Colors.amber[600] : Colors.blue,
                              ),
                              child: Text('Zu Binaere')),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (gewaehltZahlType == 'Binaere') {
                                    ergebnissAsInt = binaereZuDezimal(eingegebeneZahl);
                                  } else if (eingegebeneZahl != null && gewaehltZahlType == 'Dezimal') {
                                    ergebnissAsInt = int.tryParse(eingegebeneZahl!);
                                  } else if (gewaehltZahlType == 'Hexadezimal') {
                                    ergebnissAsInt = heaxaZuDezimal(eingegebeneZahl);
                                  }
                                  ausgabeType = 'Dezimal';
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ausgabeType == 'Dezimal' ? Colors.amber[600] : Colors.blue,
                              ),
                              child: Text('Zu Dezimal')),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ausgabeType == 'Hexadezimal' ? Colors.amber[600] : Colors.blue,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (gewaehltZahlType == 'Hexadezimal') {
                                    ergebnissAsListString = stringZuListString(eingegebeneZahl);
                                  } else if (gewaehltZahlType == 'Binaere') {
                                    ergebnissAsListString = binaeryZuHexa(eingegebeneZahl);
                                  } else if (gewaehltZahlType == 'Dezimal') {
                                    ergebnissAsListString = dezimalZuHexa(eingegebeneZahl!);
                                  }
                                  ausgabeType = 'Hexadezimal';
                                });
                              },
                              child: Text('Zu Hexadezimal')),
                        )
                      ],
                    ),
          (ergebnissAsInt == null &&
                      (ergebnissAsList == null || ergebnissAsList!.isEmpty) &&
                      (ergebnissAsListString == null || ergebnissAsListString!.isEmpty)) ||
                  ((gewaehltZahlType == 'Dezimal' && !dezimalFreundlich(eingegebeneZahl!)) ||
                      (gewaehltZahlType == 'Binaere' && !binaerFreundlich(eingegebeneZahl!)) ||
                      (gewaehltZahlType == 'Hexadezimal' && !hexaFreundlich(eingegebeneZahl!)))
              ? Container()
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ausgabeType == 'Binaere'
                      ? Text(
                          '$ergebnissAsList',
                          style: TextStyle(color: Colors.blue, fontSize: 30),
                        )
                      : ausgabeType == 'Dezimal'
                          ? Text(
                              '$ergebnissAsInt',
                              style: TextStyle(color: Colors.blue, fontSize: 30),
                            )
                          : ausgabeType == 'Hexadezimal'
                              ? Text(
                                  '$ergebnissAsListString',
                                  style: TextStyle(color: Colors.blue, fontSize: 30),
                                )
                              : Container())
        ],
      ),
    );
  }
}
