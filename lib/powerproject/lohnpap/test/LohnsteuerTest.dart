import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:xml/xml.dart';
import 'package:http/http.dart' as http;

import 'package:your_package/generator.dart'; // Adjust the import according to your package structure
import 'package:your_package/pap.dart'; // Adjust the import according to your package structure

class LohnsteuerTest {
  static const Type CURRENT = Lohnsteuer2024; // Adjust according to your Dart class
  static const String CURRENT_CODE = "2024ESSt"; // siehe BMF-Seite

  File tmp;

  static void start() {
    print(".........................................................");
  }

  static void stop() {
    print(".........................................................");
  }

  Future<void> setUp() async {
    tmp = await File('${Directory.systemTemp.path}/bmf.test.${DateTime.now().millisecondsSinceEpoch}.xml').create();
  }

  Future<void> tearDown() async {
    await tmp.delete();
    print('');
  }

  Future<void> checkDuplicateEntry() async {
    Set<String> values = {};

    bool first = true;

    for (var pf in Generator.PAP_FILES) {
      if (first) {
        first = false;
      } else {
        assert(pf.getTo() != null, "only first entry can be null");

        for (int i = pf.getFrom(); i <= pf.getTo(); i++) {
          String id = '${pf.getYear()} $i';
          assert(values.add(id), "duplicate entry $id");
        }
      }
    }
  }

//	@Test
//	public void check2006() throws Exception {
//		checkLohnsteuer(Lohnsteuer2006.class, "2006Version1", getDate(2006, 1, 1));
//	}
//
//	@Test
//	public void check2007() throws Exception {
//		checkLohnsteuer(Lohnsteuer2007.class, "2007Version1", getDate(2007, 1, 1));
//	}
//
//	@Test
//	public void check2008() throws Exception {
//		checkLohnsteuer(Lohnsteuer2008.class, "2008Version1", getDate(2008, 1, 1));
//	}
//
//	@Test
//	public void check2009() throws Exception {
//		checkLohnsteuer(Lohnsteuer2009.class, "2009Version1", getDate(2009, 1, 1));
//	}
//
//	@Test
//	public void check2010() throws Exception {
//		checkLohnsteuer(Lohnsteuer2010.class, "2010Version1", getDate(2010, 1, 1));
//	}
//
//	@Test
//	public void check2011() throws Exception {
//		checkLohnsteuer(Lohnsteuer2011.class, "2011bisNovVersion1", getDate(2011, 1, 1));
//	}
//
//	@Test
//	public void check2011Dezember() throws Exception {
//		checkLohnsteuer(Lohnsteuer2011Dezember.class, "2011DezVersion1", getDate(2011, 12, 1));
//	}
//
//	@Test
//	public void check2012() throws Exception {
//		checkLohnsteuer(Lohnsteuer2012.class, "2012Version1", getDate(2012, 1, 1));
//	}
//
//	@Test
//	public void check2013() throws Exception {
//		checkLohnsteuer(Lohnsteuer2013.class, "2013Version1", getDate(2013, 1, 1));
//	}
//
//	@Test
//	public void check2014() throws Exception {
//		checkLohnsteuer(Lohnsteuer2014.class, "2014Version1", getDate(2014, 1, 1));
//	}
//
//	@Test
//	public void check2015() throws Exception {
//		checkLohnsteuer(Lohnsteuer2015.class, "2015bisNovVersion1", getDate(2015, 1, 1));
//	}
//
//	@Test
//	public void check2015Dezember() throws Exception {
//		checkLohnsteuer(Lohnsteuer2015Dezember.class, "2015DezVersion1", getDate(2015, 12, 1));
//	}
//
//	@Test
//	public void check2016() throws Exception {
//		checkLohnsteuer(Lohnsteuer2016.class, "2016Version1", getDate(2016, 1, 1));
//	}
//
//	@Test
//	public void check2017() throws Exception {
//		checkLohnsteuer(Lohnsteuer2017.class, "2017Version1", getDate(2017, 1, 1));
//	}
//
//	@Test
//	public void check2018() throws Exception {
//		checkLohnsteuer(Lohnsteuer2018.class, "2018Version1", getDate(2018, 1, 1));
//	}
//
//	@Test
//	public void check2019() throws Exception {
//		checkLohnsteuer(Lohnsteuer2019.class, "2019Version1", getDate(2019, 1, 1));
//	}
//
//	@Test
//	public void check2020() throws Exception {
//		checkLohnsteuer(Lohnsteuer2020.class, "2020Version1", getDate(2020, 1, 1));
//	}
//
//	@Test
//	public void check2021() throws Exception {
//		checkLohnsteuer(Lohnsteuer2021.class, "2021Version1", getDate(2021, 1, 1));
//	}
//
//	@Test
//	public void check2022() throws Exception {
//		checkLohnsteuer(Lohnsteuer2022.class, "2022Version1", getDate(2022, 1, 1));
//	}


  Future<void> check2023() async {
    await checkLohnsteuer(Lohnsteuer2023, "2023BisJuniVersion1", getDate(2023, 1, 1));
  }

  Future<void> check2023AbJuli() async {
    await checkLohnsteuer(Lohnsteuer2023AbJuli, "2023AbJuliVersion1", getDate(2023, 7, 1));
  }

  Future<void> check2024() async {
    await checkLohnsteuer(Lohnsteuer2024, "2024Version1", getDate(2024, 1, 1));
  }

  Future<void> checkCurrent() async {
    print("Lohnsteuer current");
    printBlank("current");

    var pf = Generator.PAP_FILES[0];
    assert(pf.getTo() == null, "first entry must be null");
    assert(CURRENT == Type.getType("de.powerproject.lohnpap.pap.${pf.getName()}"));
    assert(CURRENT == Lohnsteuer.getInstance().runtimeType);

    print("...............................");
  }

  Future<void> checkFuture() async {
    print("Lohnsteuer future");
    printBlank("future");

    var year = DateTime.now().year + 3;

    assert(CURRENT == Lohnsteuer.getInstance(getDate(year, 1, 1)).runtimeType);

    print("...............................");
  }

  Future<void> checkInvalidDate() async {
    print("Lohnsteuer invalid");
    printBlank("invalid");
    print("...............................");

    Lohnsteuer.getInstance(getDate(2000, 1, 1));
  }

  void printBlank(String jsp) {
    print(' ' * (15 - jsp.length));
  }

  Future<void> checkLohnsteuer(Type c, String jsp, DateTime testDate) async {
    print("Lohnsteuer $jsp");
    printBlank(jsp);

    var li = Lohnsteuer.getInstance(testDate);
    assert(li != null);
    assert(c == li.runtimeType);

    for (int lohn = 5000; lohn <= 80000; lohn += 2500) {
      print(".");

      var re4 = BigDecimal(lohn * 100); // Angabe in Cent

      for (int stkl = 1; stkl <= 6; stkl++) {
        await check(c, jsp, 1, re4, stkl);
      }
    }
  }

  Future<void> check(Type c, String xhtml, int lzz, BigDecimal re4, int stkl) async {
    double anzKinder = stkl == 2 ? 1.5 : 0;

    var url = Uri.parse("https://www.bmf-steuerrechner.de/interface/$xhtml.xhtml?code=$CURRENT_CODE&LZZ=$lzz&RE4=${re4.toInt()}&STKL=$stkl&ZKF=$anzKinder");
    var response = await http.get(url);
    await tmp.writeAsBytes(response.bodyBytes);

    var document = XmlDocument.parse(await tmp.readAsString());

    // create instance of class
    var constructor = c.newInstance();
    LohnsteuerInterface ls = constructor();

    // fill instance
    ls.setLzz(lzz);
    ls.setRe4(re4);
    ls.setStkl(stkl);
    ls.setZkf(BigDecimal(anzKinder));

    // invoke main
    ls.main();

    // parse web service and verify with result
    var ausgaben = document.findAllElements("ausgabe");

    assert(ausgaben.isNotEmpty);

    for (var n in ausgaben) {
      String name = n.getAttribute("name");
      String value = n.getAttribute("value");

      try {
        var m = c.getDeclaredMethod("get${Generator.firstUpper(name)}");
        var o = m.invoke(ls);
        if (o != null) {
          o = o.toString();
        }

        assert(value == o, "Wert $name");
      } catch (e) {
        print("field $name missing!");
        throw e;
      }
    }
  }

  DateTime getDate(int year, int month, int day) {
    return DateTime(year, month, day);
  }
}

