class PapFile {
  String xmlfileName;
  String name;
  int year;
  int from;
  int? to;

  PapFile(this.xmlfileName, this.year, this.from, this.to) {
    name = xmlfileName.replaceAll(".xml", "");
  }

  String getXmlfileName() {
    return xmlfileName;
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

