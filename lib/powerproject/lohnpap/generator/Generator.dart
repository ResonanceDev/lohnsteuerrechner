import 'dart:convert';
import 'dart:io';
import 'package:xml/xml.dart';

class PapFile {
  final String xmlfileName;
  final int year;
  final int from;
  final int? to;

  PapFile(this.xmlfileName, this.year, this.from, this.to);
}

class Generator {
  static final List<PapFile> PAP_FILES = [
    PapFile("Lohnsteuer2024.xml", 2024, 1, null),
    PapFile("Lohnsteuer2023AbJuli.xml", 2023, 7, 12),
    PapFile("Lohnsteuer2023.xml", 2023, 1, 6),
    PapFile("Lohnsteuer2022.xml", 2022, 1, 12),
    PapFile("Lohnsteuer2021.xml", 2021, 1, 12),
    PapFile("Lohnsteuer2020.xml", 2020, 1, 12),
    PapFile("Lohnsteuer2019.xml", 2019, 1, 12),
    PapFile("Lohnsteuer2018.xml", 2018, 1, 12),
    PapFile("Lohnsteuer2017.xml", 2017, 1, 12),
    PapFile("Lohnsteuer2016.xml", 2016, 1, 12),
    PapFile("Lohnsteuer2015Dezember.xml", 2015, 12, 12),
    PapFile("Lohnsteuer2015.xml", 2015, 1, 11),
    PapFile("Lohnsteuer2014.xml", 2014, 1, 12),
    PapFile("Lohnsteuer2013.xml", 2013, 1, 12),
    PapFile("Lohnsteuer2012.xml", 2012, 1, 12),
    PapFile("Lohnsteuer2011Dezember.xml", 2011, 12, 12),
    PapFile("Lohnsteuer2011.xml", 2011, 1, 11),
    PapFile("Lohnsteuer2010.xml", 2010, 1, 12),
    PapFile("Lohnsteuer2009.xml", 2009, 1, 12),
    PapFile("Lohnsteuer2008.xml", 2008, 1, 12),
    PapFile("Lohnsteuer2007.xml", 2007, 1, 12),
    PapFile("Lohnsteuer2006.xml", 2006, 1, 12),
  ];

  static final Map<String, String> inputInterfaceVars = {};
  static final Map<String, String> outputInterfaceVars = {};
  static bool interfaceGenerated = false;

  static void main(List<String> args) async {
    String projectDir = Directory.current.path;
    Directory targetDir = getDirectory(projectDir, ['src', 'de', 'powerproject', 'lohnpap']);

    for (PapFile pf in PAP_FILES) {
      Generator g = Generator(pf, targetDir);
      await g.parse();
    }

    PapWrapperWriter pw = PapWrapperWriter(getFilePath(targetDir.path, ['pap', 'Lohnsteuer.java']));
    await pw.close();
  }

  static String getFilePath(String... elems) {
    return elems.join(Platform.pathSeparator);
  }

  static Directory getDirectory(String... elems) {
    return Directory(getFilePath(elems));
  }

  static String firstUpper(String s) {
    if (s != null && s.isNotEmpty) {
      if (s.length == 1) {
        return s.toUpperCase();
      } else if (s.length > 1) {
        return s[0].toUpperCase() + s.substring(1).toLowerCase();
      }
    }
    return s;
  }

  late File path;
  late PapFile pf;
  late PapWriter pw;
  late PapInterfaceWriter piw;

  bool failed = false;

  Generator(PapFile pf, Directory path) {
    this.pf = pf;
    this.path = File(path.path);

    if (pf.to == null) {
      if (interfaceGenerated) {
        throw Exception("interface generation only for current version! check config");
      }

      interfaceGenerated = true;
      piw = PapInterfaceWriter(getFilePath(path.path, ['pap', 'LohnsteuerInterface.java']));
    }
  }

  Future<void> parse() async {
    print("parse file ${pf.xmlfileName}");

    File file = File(getFilePath(path.path, ['xml', pf.xmlfileName]));

    String xmlString = await file.readAsString();
    XmlDocument document = XmlDocument.parse(xmlString);

    PapHandler h = PapHandler();
    h.parse(document);

    if (piw != null) {
      await piw.close();
    }

    if (failed) {
      throw IOException("error occurred");
    }
  }

  bool variables = false, constants = false, methods = false, method = false;
  final Map<String, String> inputVars = {};
  final Map<String, String> outputVars = {};
  final Map<String, String> internalVars = {};
  String? lastComment;

  void printLastComment(AbstractWriter writer) {
    if (lastComment != null) {
      if (writer != null && lastComment!.isNotEmpty) {
        writer.appendln();
        writer.writeln("/** $lastComment */");
      }
      lastComment = null;
    }
  }

  class PapHandler {
    void startElement(XmlElement element) {
      try {
        String qName = element.name.local;
        if (qName == "PAP") {
          String internalName = element.getAttribute('name') ?? '';
          pw = PapWriter(pf, path, internalName);
        } else if (qName == "VARIABLES") {
          variables = true;
        } else if (qName == "CONSTANTS") {
          constants = true;
          pw.appendln();
          pw.writeln("/* KONSTANTEN */");
        } else if (qName == "METHODS") {
          methods = true;

          pw.writeln("/* SETTER */");

          for (var e in inputVars.entries) {
            pw.appendln();
            if (inputInterfaceVars.containsKey(e.key)) {
              pw.writeln("@Override");
            }
            pw.writeln(e.value);
          }
          for (var e in inputInterfaceVars.entries) {
            String name = e.key;
            if (!inputVars.containsKey(name)) {
              pw.appendln();
              pw.writeln("@Override");
              if (internalVars.containsKey(name)) {
                pw.writeln(e.value + " { this.${internalVars[name]} = arg0 }");
              } else {
                pw.writeln(e.value + " { /* required for newer calculator */ }");
              }
            }
          }

          pw.appendln();
          pw.writeln("/* GETTER */");

          for (var e in outputVars.entries) {
            pw.appendln();
            if (outputInterfaceVars.containsKey(e.key)) {
              pw.writeln("@Override");
            }
            pw.writeln(e.value);
          }
          for (var e in outputInterfaceVars.entries) {
            String name = e.key;
            if (!outputVars.containsKey(name)) {
              pw.appendln();
              pw.writeln("@Override");
              if (internalVars.containsKey(name)) {
                pw.writeln(e.value + " { return ${internalVars[name]}; }");
              } else {
                pw.writeln(e.value + " { /* required for newer calculator */ return null; }");
              }
            }
          }

          pw.appendln();
        } else if (qName == "INPUT" || qName == "OUTPUT" || qName == "INTERNAL") {
          if (variables) {
            String type = element.getAttribute('type') ?? '';
            String name = element.getAttribute('name') ?? '';
            String def = element.getAttribute('default') ?? '';
            if (def.isEmpty) {
              if (type == "BigDecimal") {
                def = "BigDecimal.zero";
              } else {
                def = "0";
              }
            }
            if (type == "BigDecimal") {
              if (!def.contains("BigDecimal")) {
                def = "BigDecimal.parse('$def')";
              }
            } else if (type == "int") {
              def = (double.parse(def).toInt()).toString();
            }

            if (qName == "INTERNAL") {
              internalVars[firstUpper(name)] = name;
              printLastComment(pw);
            }

            pw.writeln("protected $type $name = $def;");

            if (qName == "INPUT") {
              String uname = firstUpper(name);
              String pre = "public void set$uname($type arg0)";
              inputVars[uname] = pre + " { this.$name = arg0; }";
              printLastComment(piw);
              if (piw != null) {
                piw.writeln(pre + ";");
                inputInterfaceVars[uname] = pre;
              }
            } else if (qName == "OUTPUT") {
              String uname = firstUpper(name);
              String pre = "public $type get$uname()";
              outputVars[uname] = pre + " { return this.$name; }";
              printLastComment(piw);
              if (piw != null) {
                piw.writeln(pre + ";");
                outputInterfaceVars[uname] = pre;
              }
            }
          }
        } else if (qName == "CONSTANT") {
          if (constants) {
            String type = element.getAttribute('type') ?? '';
            String name = element.getAttribute('name') ?? '';
            String value = element.getAttribute('value') ?? '';
            pw.writeln("protected static final $type $name = $value;");
          }
        } else if (qName == "MAIN") {
          if (methods) {
            pw.writeln("@Override");
            pw.writeln("public void main() {");
            pw.incIndent();
          }
        } else if (qName == "EXECUTE") {
          String method = element.getAttribute('method') ?? '';
          pw.appendln();
          pw.write(method + "();");
        } else if (qName == "METHOD") {
          String methodName = element.getAttribute('name') ?? '';
          pw.writeln("protected void $methodName() {");
          method = true;
          pw.incIndent();
        } else if (qName == "EVAL") {
          String exec = element.getAttribute('exec') ?? '';
          pw.appendln();
          pw.write(exec + ";");
        } else if (qName == "IF") {
          String expr = element.getAttribute('expr') ?? '';
          pw.appendln();
          pw.write("if($expr) ");
        } else if (qName == "THEN") {
          pw.append("{");
          pw.incIndent();
        } else if (qName == "ELSE") {
          pw.append(" else {");
          pw.incIndent();
        }
      } catch (e) {
        print(e);
        failed = true;
      }
    }

    void endElement(XmlElement element) {
      try {
        String qName = element.name.local;
        if (qName == "PAP") {
          pw.close();
        } else if (qName == "VARIABLES") {
          variables = false;
        } else if (qName == "CONSTANTS") {
          constants = false;
          pw.appendln();
        } else if (qName == "METHODS") {
          methods = false;
        } else if (qName == "METHOD") {
          pw.decIndent();
          method = false;
          pw.appendln();
          pw.writeln("}");
          pw.appendln();
        } else if (qName == "MAIN") {
          pw.decIndent();
          pw.appendln();
          pw.writeln("}");
          pw.appendln();
          methods = false;
        } else if (qName == "THEN" || qName == "ELSE") {
          pw.decIndent();
          pw.appendln();
          pw.write("}");
        }
      } catch (e) {
        print(e);
        failed = true;
      }
    }

    void parse(XmlDocument document) {
      for (var element in document.findAllElements()) {
        startElement(element);
        endElement(element);
      }
    }
  }

  class PAPCommentReader {
    int count = 0;

    void comment(String comment) {
      try {
        comment = comment.trim();

        if (comment.isNotEmpty) {
          count++;

          if (lastComment != null) {
            printComment(lastComment!);
            lastComment = null;
          }

          comment = comment.replaceAll("\n", "<br>\n");

          if (count > 1) {
            if (variables) {
              lastComment = comment;
              return;
            }
          }

          printComment(comment);
        }
      } catch (e) {
        print(e);
        failed = true;
      }
    }

    void printComment(String comment) {
      if (["EINGABEPARAMETER", "AUSGABEPARAMETER", "AUSGABEPARAMETER DBA"].contains(comment)) {
        pw.appendln();
        pw.writeln("/* $comment */");
        pw.appendln();
      } else if (comment == "INTERNE FELDER") {
        pw.appendln();
        pw.writeln("/* $comment */");
      } else if (method) {
        pw.append("/** $comment */");
      } else if (constants) {
        pw.appendln();
        pw.writeln("/** $comment */");
      } else {
        pw.writeln("/** $comment */");
      }
    }
  }
}

class PapInterfaceWriter extends AbstractWriter {
  PapInterfaceWriter(String fileName) : super(fileName) {
    writeln("package de.powerproject.lohnpap.pap;");
    writeln();
    writeln("import 'dart:math';");
    writeln();
    writeln("/**");
    writeln(" * ");
    writeln(" * @author Marcel Lehmann (https://github.com/MarcelLehmann/Lohnsteuer) ");
    writeln(" * @date ${DateTime.now()}");
    writeln(" * ");
    writeln(" */");
    writeln();
    writeln("abstract class LohnsteuerInterface {");

    incIndent();

    writeln();
    writeln("void main();");
  }

  @override
  Future<void> close() async {
    decIndent();

    writeln("}");

    await super.close();
  }
}

class PapWrapperWriter extends AbstractWriter {
  PapWrapperWriter(String fileName) : super(fileName) {
    writeln("package de.powerproject.lohnpap.pap;");
    writeln();
    writeln("import 'dart:core';");
    writeln();
    writeln("/**");
    writeln(" * ");
    writeln(" * @author Marcel Lehmann (https://github.com/MarcelLehmann/Lohnsteuer)");
    writeln(" * @date ${DateTime.now()}");
    writeln(" * ");
    writeln(" */");
    writeln();
    writeln("class Lohnsteuer {");
    appendln();
    incIndent();

    writeln("static LohnsteuerInterface getInstance() {");
    writeln("  return getInstance(null);");
    writeln("}");

    appendln();

    writeln("static LohnsteuerInterface getInstance(DateTime? date) {");
    incIndent();
    appendln();
    writeln("if (date != null) {");
    incIndent();

    appendln();

    writeln("DateTime cal = date;");
    writeln("int year = cal.year;");
    writeln("int month = cal.month;");

    appendln();

    PapFile? last;

    for (PapFile pap in Generator.PAP_FILES) {
      if (pap.to == null) {
        last = pap;

        writeln("if ((year == ${pap.year} && month >= ${pap.from}) || year > ${pap.year}) {");
        writeln("  return ${pap.name}();");
        writeln("}");
      } else if (pap.from == pap.to) {
        writeln("if (year == ${pap.year} && month == ${pap.from}) {");
        writeln("  return ${pap.name}();");
        writeln("}");
      } else {
        writeln("if (year == ${pap.year} && month >= ${pap.from} && month <= ${pap.to}) {");
        writeln("  return ${pap.name}();");
        writeln("}");
      }
    }

    writeln("throw IllegalArgumentException('Illegal Date \$date');");

    decIndent();
    writeln("}");
    appendln();
    writeln("return ${last!.name}();");
    decIndent();
    writeln("}");
  }

  @override
  Future<void> close() async {
    decIndent();

    write("}");

    await super.close();
  }
}

class PapWriter extends AbstractWriter {
  late String className, internalName;

  PapWriter(PapFile p, File targetDir, String internalName) : super('${targetDir.path}${Platform.pathSeparator}pap${Platform.pathSeparator}${p.name}.java') {
    this.className = p.name;
    this.internalName = internalName;

    writeln("package de.powerproject.lohnpap.pap;");
    writeln();
    writeln("import 'dart:math';");
    writeln();
    writeln("/**");
    writeln(" * ");
    writeln(" * @author Marcel Lehmann (https://github.com/MarcelLehmann/Lohnsteuer) ");
    writeln(" * @date ${DateTime.now()}");
    writeln(" * ");
    writeln(" */");
    writeln();
    writeln("class ${p.name} implements LohnsteuerInterface {");
    appendln();
    incIndent();
  }

  @override
  void write(String s, bool tab, bool newLine) {
    if (s != null && internalName != null) {
      s = s.replaceAll(internalName, className);
    }

    super.write(s, tab, newLine);
  }

  @override
  Future<void> close() async {
    decIndent();

    write("}");

    await super.close();
  }
}

abstract class AbstractWriter {
  late FileWriter fw;
  int indent = 0;

  AbstractWriter(String fileName) {
    fw = FileWriter(fileName);
  }

  void writeln([String? s]) {
    write(s, true, true);
  }

  void write(String s, [bool tab = true, bool newLine = false]) {
    if (tab) {
      for (int i = 0; i < indent; i++) {
        fw.write('\t');
      }
    }

    if (s != null) {
      fw.write(s);
    }

    if (newLine) {
      fw.write('\n');
    }
  }

  void append(String s) {
    write(s, false, false);
  }

  void appendln() {
    write(null, false, true);
  }

  void incIndent() {
    indent++;
  }

  void decIndent() {
    indent--;
  }

  Future<void> close() async {
    await fw.close();
  }
}

class FileWriter {
  final IOSink _sink;

  FileWriter(String path) : _sink = File(path).openWrite();

  void write(String data) {
    _sink.write(data);
  }

  Future<void> close() async {
    await _sink.close();
  }
}

