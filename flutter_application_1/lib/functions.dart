String? gewaehltZahlType;
String? eingegebeneZahl;
int? ergebnissAsInt;
List<int>? ergebnissAsList;
List? ergebnissAsListString;
String ausgabeType = '';
List<int> stringZuListInt(String? zahl) {
  List<int> result = [];
  if (zahl != null) {
    for (int i = 0; i < zahl.length; i++) {
      if (int.tryParse(zahl[i]) != null) {
        result.add(int.parse(zahl[i]));
      }
    }
  }

  return result;
}

List zahlAsList = stringZuListInt(eingegebeneZahl);

int? binaereZuDezimal(String? eingabe) {
  int result = 0;
  int stufe = 1;
  List<int> zahl = stringZuListInt(eingabe);
  for (int i = zahl.length - 1; i > -1; i--) {
    result += zahl[i] * stufe;
    stufe *= 2;
  }
  return result;
}

List<int>? dezimalZuBinaere(String? eingabe) {
  int zahl = int.parse(eingabe!);
  List<int> result = [0];
  while (zahl > 0) {
    int element = 0;

    if (result[element] == 0) {
      result[element] = 1;
      zahl--;
    } else {
      while (result.length > element + 1 && result[element] != 0) {
        result[element] = 0;
        element++;
      }
      if (result.length == element + 1) {
        result.add(1);
        result[element] = 0;
      } else {
        result[element] = 1;
      }
      zahl--;
    }
  }
  List<int>? resu = result.reversed.toList();
  return resu;
}

List<String> stringZuListString(String? hexaZahl) {
  List<String> result = [];
  if (hexaZahl != null) {
    for (int i = 0; i < hexaZahl.length; i++) {
      result.add(hexaZahl[i]);
    }
  }
  return result;
}

List<int>? hexaZuBinaery(String? eingabe) {
  List<String>? hexaZahl = stringZuListString(eingabe);
  if (hexaZahl == null) {
    hexaZahl = [];
  }
  List<int> result = [];
  for (int i = hexaZahl.length - 1; i > -1; i--) {
    if (int.tryParse(hexaZahl[i]) != null) {
      List<int>? hilfList = dezimalZuBinaere('${hexaZahl[i]}');
      while (hilfList!.length < 4) {
        hilfList.insert(0, 0);
      }
      result = [...hilfList, ...result];
    } else {
      List<int>? hilfList = [];
      if (hexaZahl[i] == 'A') {
        hilfList = dezimalZuBinaere('10');
      }
      if (hexaZahl[i] == 'B') {
        hilfList = dezimalZuBinaere('11');
      }
      if (hexaZahl[i] == 'C') {
        hilfList = dezimalZuBinaere('12');
      }
      if (hexaZahl[i] == 'D') {
        hilfList = dezimalZuBinaere('13');
      }
      if (hexaZahl[i] == 'E') {
        hilfList = dezimalZuBinaere('14');
      }
      if (hexaZahl[i] == 'F') {
        hilfList = dezimalZuBinaere('15');
      }
      result = [...hilfList!, ...result];
    }
  }
  while (result.length > 1 && result[0] == 0) {
    result.removeAt(0);
  }
  return result;
}

List<String>? binaeryZuHexa(String? eingabe) {
  List<String>? result = [];
  List<int> biZahl = stringZuListInt(eingabe);
  while (biZahl.isNotEmpty) {
    List<int> hilfList = [];
    int? hilfInt = 0;
    while (biZahl.isNotEmpty && hilfList.length < 4) {
      hilfList.insert(0, biZahl.last);
      biZahl.removeLast();
    }

    hilfInt = binaereZuDezimal(hilfList.toString());
    if (hilfInt! < 10) {
      result.insert(0, '$hilfInt');
    } else if (hilfInt == 10) {
      result.insert(0, 'A');
    } else if (hilfInt == 11) {
      result.insert(0, 'B');
    } else if (hilfInt == 12) {
      result.insert(0, 'C');
    } else if (hilfInt == 13) {
      result.insert(0, 'D');
    } else if (hilfInt == 14) {
      result.insert(0, 'E');
    } else if (hilfInt == 15) {
      result.insert(0, 'F');
    }
  }
  while (result.length > 1 && result[0] == '0') {
    result.removeAt(0);
  }
  return result;
}

int? heaxaZuDezimal(String? hexaZahl) {
  int? result = binaereZuDezimal(hexaZuBinaery(hexaZahl).toString());
  return result;
}

List<String>? dezimalZuHexa(String zahl) {
  List<String>? result = [];
  result = binaeryZuHexa(dezimalZuBinaere(zahl).toString());
  return result;
}

bool dezimalFreundlich(String eingabe) {
  bool result = true;
  for (int i = 0; i < eingabe.length; i++) {
    if (int.tryParse(eingabe[i]) == null) {
      result = false;
    }
  }
  return result;
}

bool binaerFreundlich(String eingabe) {
  bool result = true;
  List binaerList = ['0', '1'];
  for (int i = 0; i < eingabe.length; i++) {
    if (!binaerList.contains(eingabe[i])) {
      result = false;
    }
  }
  return result;
}
bool hexaFreundlich(String eingabe) {
  bool result = true;
  List hexaList = ['0', '1','3','4','5','6','7','8','9','A','B','C','D','E','F'];
  for (int i = 0; i < eingabe.length; i++) {
    if (!hexaList.contains(eingabe[i])) {
      result = false;
    }
  }
  return result;
}

