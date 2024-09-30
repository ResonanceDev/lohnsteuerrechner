class PapFile {
  String xmlFileName;
  String name = "";
  int year;
  int from;
  int? to;

  PapFile(this.xmlFileName, this.year, this.from, this.to) {
    name = xmlFileName.replaceAll(".xml", "");

  }

  String getXmlFileName() {
    return xmlFileName;
  }

  String getName() {
    return name;
  }

  int getYear() {
    return year;
  }

  int getFrom() {
    return from;
  }

  int? getTo() {
    return to;
  }
}

