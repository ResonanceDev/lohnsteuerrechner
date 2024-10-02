import 'package:big_decimal/big_decimal.dart';
import 'package:lohnsteuer/src/LohnsteuerInterface.dart';

class Lohnsteuer2024 implements LohnsteuerInterface {
  // EINGABEPARAMETER
  int af = 1;
  int AJAHR = 0;
  int ALTER1 = 0;
  double ENTSCH = 0.0;
  double f = 1.0;
  double JFREIB = 0.0;
  double JHINZU = 0.0;
  double JRE4 = 0.0;
  double JVBEZ = 0.0;
  int KRV = 0;
  double KVZ = 0.0;
  int LZZ = 0;
  double LZZFREIB = 0.0;
  double LZZHINZU = 0.0;
  double MBV = 0.0;
  double PKPV = 0.0;
  int PKV = 0;
  double PVA = 0.0;
  int PVS = 0;
  int PVZ = 0;
  int R = 0;
  double RE4 = 0.0;
  double SONSTB = 0.0;
  double STERBE = 0.0;
  int STKL = 0;
  double VBEZ = 0.0;
  double VBEZM = 0.0;
  double VBEZS = 0.0;
  double VBS = 0.0;
  int VJAHR = 0;
  double VKAPA = 0.0;
  double VMT = 0.0;
  double ZKF = 0.0;
  int ZMVB = 0;
  double JRE4ENT = 0.0;
  double SONSTENT = 0.0;

  // AUSGABEPARAMETER
  double BK = 0.0;
  double BKS = 0.0;
  double BKV = 0.0;
  double LSTLZZ = 0.0;
  double SOLZLZZ = 0.0;
  double SOLZS = 0.0;
  double SOLZV = 0.0;
  double STS = 0.0;
  double STV = 0.0;
  double VKVLZZ = 0.0;
  double VKVSONST = 0.0;

  // AUSGABEPARAMETER DBA
  double VFRB = 0.0;
  double VFRBS1 = 0.0;
  double VFRBS2 = 0.0;
  double WVFRB = 0.0;
  double WVFRBO = 0.0;
  double WVFRBM = 0.0;

  // INTERNE FELDER
  double ALTE = 0.0;
  double ANP = 0.0;
  double ANTEIL1 = 0.0;
  double BMG = 0.0;
  double BBGKVPV = 0.0;
  double BBGRV = 0.0;
  double DIFF = 0.0;
  double EFA = 0.0;
  double FVB = 0.0;
  double FVBSO = 0.0;
  double FVBZ = 0.0;
  double FVBZSO = 0.0;
  double GFB = 0.0;
  double HBALTE = 0.0;
  double HFVB = 0.0;
  double HFVBZ = 0.0;
  double HFVBZSO = 0.0;
  int J = 0;
  double JBMG = 0.0;
  double JLFREIB = 0.0;
  double JLHINZU = 0.0;
  double JW = 0.0;
  int K = 0;
  int KENNVMT = 0;
  double KFB = 0.0;
  double KVSATZAG = 0.0;
  double KVSATZAN = 0.0;
  int KZTAB = 0;
  double LSTJAHR = 0.0;
  double LST1 = 0.0;
  double LST2 = 0.0;
  double LST3 = 0.0;
  double LSTOSO = 0.0;
  double LSTSO = 0.0;
  double MIST = 0.0;
  double PVSATZAG = 0.0;
  double PVSATZAN = 0.0;
  double RVSATZAN = 0.0;
  double RW = 0.0;
  double SAP = 0.0;
  double SOLZFREI = 0.0;
  double SOLZJ = 0.0;
  double SOLZMIN = 0.0;
  double SOLZSBMG = 0.0;
  double SOLZSZVE = 0.0;
  double SOLZVBMG = 0.0;
  double ST = 0.0;
  double ST1 = 0.0;
  double ST2 = 0.0;
  double STOVMT = 0.0;
  double TBSVORV = 0.0;
  double VBEZB = 0.0;
  double VBEZBSO = 0.0;
  double VHB = 0.0;
  double VSP = 0.0;
  double VSPN = 0.0;
  double VSP1 = 0.0;
  double VSP2 = 0.0;
  double VSP3 = 0.0;
  double W1STKL5 = 0.0;
  double W2STKL5 = 0.0;
  double W3STKL5 = 0.0;
  double VSPMAX1 = 0.0;
  double VSPMAX2 = 0.0;
  double VSPO = 0.0;
  double VSPREST = 0.0;
  double VSPVOR = 0.0;
  double X = 0.0;
  double Y = 0.0;
  double ZRE4 = 0.0;
  double ZRE4J = 0.0;
  double ZRE4VP = 0.0;
  double ZTABFB = 0.0;
  double ZVBEZ = 0.0;
  double ZVBEZJ = 0.0;
  double ZVE = 0.0;
  double ZX = 0.0;
  double ZZX = 0.0;
  double HOCH = 0.0;
  double VERGL = 0.0;
  double VKV = 0.0;

  // KONSTANTEN
  static final List<double> TAB1 = [
    0.0,
    0.4,
    0.384,
    0.368,
    0.352,
    0.336,
    0.32,
    0.304,
    0.288,
    0.272,
    0.256,
    0.24,
    0.224,
    0.208,
    0.192,
    0.176,
    0.16,
    0.152,
    0.144,
    0.136,
    0.128,
    0.12,
    0.112,
    0.104,
    0.096,
    0.088,
    0.08,
    0.072,
    0.064,
    0.056,
    0.048,
    0.04,
    0.032,
    0.024,
    0.016,
    0.008,
    0.0
  ];

  static final List<double> TAB2 = [
    0, 3000, 2880, 2760, 2640, 2520, 2400, 2280, 2160, 2040, 1920, 1800, 1680,
    1560, 1440, 1320, 1200, 1140, 1080, 1020, 960, 900, 840, 780, 720, 660, 600,
    540, 480, 420, 360, 300, 240, 180, 120, 60, 0
  ];

  static final List<double> TAB3 = [
    0, 900, 864, 828, 792, 756, 720, 684, 648, 612, 576, 540, 504, 468, 432,
    396, 360, 342, 324, 306, 288, 270, 252, 234, 216, 198, 180, 162, 144, 126,
    108, 90, 72, 54, 36, 18, 0
  ];

  /// Tabelle fuer die Vomhundertsaetze des Altersentlastungsbetrags

  static final List<BigDecimal> TAB4 =
  [
    BigDecimal.parse("0.0"),
    BigDecimal.parse("0.4"),
    BigDecimal.parse("0.384"),
    BigDecimal.parse("0.368"),
    BigDecimal.parse("0.352"),
    BigDecimal.parse("0.336"),
    BigDecimal.parse("0.32"),
    BigDecimal.parse("0.304"),
    BigDecimal.parse("0.288"),
    BigDecimal.parse("0.272"),
    BigDecimal.parse("0.256"),
    BigDecimal.parse("0.24"),
    BigDecimal.parse("0.224"),
    BigDecimal.parse("0.208"),
    BigDecimal.parse("0.192"),
    BigDecimal.parse("0.176"),
    BigDecimal.parse("0.16"),
    BigDecimal.parse("0.152"),
    BigDecimal.parse("0.144"),
    BigDecimal.parse("0.136"),
    BigDecimal.parse("0.128"),
    BigDecimal.parse("0.12"),
    BigDecimal.parse("0.112"),
    BigDecimal.parse("0.104"),
    BigDecimal.parse("0.096"),
    BigDecimal.parse("0.088"),
    BigDecimal.parse("0.08"),
    BigDecimal.parse("0.072"),
    BigDecimal.parse("0.064"),
    BigDecimal.parse("0.056"),
    BigDecimal.parse("0.048"),
    BigDecimal.parse("0.04"),
    BigDecimal.parse("0.032"),
    BigDecimal.parse("0.024"),
    BigDecimal.parse("0.016"),
    BigDecimal.parse("0.008"),
    BigDecimal.parse("0.0")
  ];

  static final List<BigInt> TAB5 = [
    (BigInt.zero),
    BigInt.from(1900),
    BigInt.from(1824),
    BigInt.from(1748),
    BigInt.from(1672),
    BigInt.from(1596),
    BigInt.from(1520),
    BigInt.from(1444),
    BigInt.from(1368),
    BigInt.from(1292),
    BigInt.from(1216),
    BigInt.from(1140),
    BigInt.from(1064),
    BigInt.from(988),
    BigInt.from(912),
    BigInt.from(836),
    BigInt.from(760),
    BigInt.from(722),
    BigInt.from(684),
    BigInt.from(646),
    BigInt.from(608),
    BigInt.from(570),
    BigInt.from(532),
    BigInt.from(494),
    BigInt.from(456),
    BigInt.from(418),
    BigInt.from(380),
    BigInt.from(342),
    BigInt.from(304),
    BigInt.from(266),
    BigInt.from(228),
    BigInt.from(190),
    BigInt.from(152),
    BigInt.from(114),
    BigInt.from(76),
    BigInt.from(38),
    (BigInt.zero)
  ];

  static final BigInt ZAHL1 = BigInt.one;
  static final BigInt ZAHL2 = BigInt.from(2);
  static final BigInt ZAHL5 = BigInt.from(5);
  static final BigInt ZAHL7 = BigInt.from(7);
  static final BigInt ZAHL12 = BigInt.from(12);
  static final BigInt ZAHL100 = BigInt.from(100);
  static final BigInt ZAHL360 = BigInt.from(360);
  static final BigInt ZAHL500 = BigInt.from(500);
  static final BigInt ZAHL700 = BigInt.from(700);
  static final BigInt ZAHL1000 = BigInt.from(1000);
  static final BigInt ZAHL10000 = BigInt.from(10000);

  @override
  void setRe4(BigDecimal arg0) {
    RE4 = arg0.toDouble();
  }

  @override
  void setPkpv(BigDecimal arg0) {
    PKPV = arg0.toDouble();
  }

  @override
  void setAf(int arg0) {
    af = arg0;
  }

  @override
  void setSterbe(BigDecimal arg0) {
    STERBE = arg0.toDouble();
  }

  @override
  void setStkl(int arg0) {
    STKL = arg0;
  }

  @override
  void setF(double arg0) {
    f = arg0;
  }

  @override
  void setAjahr(int arg0) {
    AJAHR = arg0;
  }

  @override
  void setJre4ent(BigDecimal arg0) {
    JRE4ENT = arg0.toDouble();
  }

  @override
  void setPvs(int arg0) {
    PVS = arg0;
  }

  @override
  void setLzz(int arg0) {
    LZZ = arg0;
  }

  @override
  void setKrv(int arg0) {
    KRV = arg0;
  }

  @override
  void setKvz(BigDecimal arg0) {
    KVZ = arg0.toDouble();
  }

  @override
  void setJhinzu(BigDecimal arg0) {
    JHINZU = arg0.toDouble();
  }

  @override
  void setR(int arg0) {
    R = arg0;
  }

  @override
  void setPvz(int arg0) {
    PVZ = arg0;
  }

  @override
  void setZmvb(int arg0) {
    ZMVB = arg0;
  }

  @override
  void setLzzhinzu(BigDecimal arg0) {
    LZZHINZU = arg0.toDouble();
  }

  @override
  void setSonstb(BigDecimal arg0) {
    SONSTB = arg0.toDouble();
  }

  @override
  void setMbv(BigDecimal arg0) {
    MBV = arg0.toDouble();
  }

  @override
  void setJvbez(BigDecimal arg0) {
    JVBEZ = arg0.toDouble();
  }

  @override
  void setVbezm(BigDecimal arg0) {
    VBEZM = arg0.toDouble();
  }

  @override
  void setVbs(BigDecimal arg0) {
    VBS = arg0.toDouble();
  }

  @override
  void setAlter1(int arg0) {
    ALTER1 = arg0;
  }

  @override
  void setVbez(BigDecimal arg0) {
    VBEZ = arg0.toDouble();
  }

  @override
  void setSonstent(BigDecimal arg0) {
    SONSTENT = arg0.toDouble();
  }

  @override
  void setEntsch(BigDecimal arg0) {
    ENTSCH = arg0.toDouble();
  }

  @override
  void setJfreib(BigDecimal arg0) {
    JFREIB = arg0.toDouble();
  }

  @override
  void setVkapa(BigDecimal arg0) {
    VKAPA = arg0.toDouble();
  }

  @override
  void setJre4(BigDecimal arg0) {
    JRE4 = arg0.toDouble();
  }

  @override
  void setZkf(BigDecimal arg0) {
    ZKF = arg0.toDouble();
  }

  @override
  void setLzzfreib(BigDecimal arg0) {
    LZZFREIB = arg0.toDouble();
  }

  @override
  void setPkv(int arg0) {
    PKV = arg0;
  }

  @override
  void setPva(BigDecimal arg0) {
    PVA = arg0.toDouble();
  }

  @override
  void setVjahr(int arg0) {
    VJAHR = arg0;
  }

  @override
  void setVbezs(BigDecimal arg0) {
    VBEZS = arg0.toDouble();
  }

  @override
  void setVmt(BigDecimal arg0) {
    VMT = arg0.toDouble();
  }

  @override
  BigDecimal getLstlzz() {
    return BigDecimal.parse(LSTLZZ.toString());
  }

  @override
  BigDecimal getVfrb() {
    return BigDecimal.parse(VFRB.toString());
  }

  @override
  BigDecimal getBk() {
    return BigDecimal.parse(BK.toString());
  }

  @override
  BigDecimal getSolzv() {
    return BigDecimal.parse(SOLZV.toString());
  }

  @override
  BigDecimal getBks() {
    return BigDecimal.parse(BKS.toString());
  }

  @override
  BigDecimal getBkv() {
    return BigDecimal.parse(BKV.toString());
  }

  @override
  BigDecimal getSolzs() {
    return BigDecimal.parse(SOLZS.toString());
  }

  @override
  BigDecimal getVfrbs2() {
    return BigDecimal.parse(VFRBS2.toString());
  }

  @override
  BigDecimal getVfrbs1() {
    return BigDecimal.parse(VFRBS1.toString());
  }

  @override
  BigDecimal getVkvlzz() {
    return BigDecimal.parse(VKVLZZ.toString());
  }

  @override
  BigDecimal getWvfrbm() {
    return BigDecimal.parse(WVFRBM.toString());
  }

  @override
  BigDecimal getSts() {
    return BigDecimal.parse(STS.toString());
  }

  @override
  BigDecimal getStv() {
    return BigDecimal.parse(STV.toString());
  }

  @override
  BigDecimal getVkvsonst() {
    return BigDecimal.parse(VKVSONST.toString());
  }

  @override
  BigDecimal getWvfrb() {
    return BigDecimal.parse(WVFRB.toString());
  }

  @override
  BigDecimal getSolzlzz() {
    return BigDecimal.parse(SOLZLZZ.toString());
  }

  @override
  BigDecimal getWvfrbo() {
    return BigDecimal.parse(WVFRBO.toString());
  }

  @override
  void main() {
    MPARA();
    MRE4JL();
    VBEZBSO = (BigInt.zero.toDouble());
    KENNVMT = 0;
    MRE4();
    MRE4ABZ();
    MBERECH();
    MSONST();
    MVMT();
  }

  void MPARA() {
    if (KRV < 2) {
      if (KRV == 0) {
        BBGRV = BigInt.from(90600).toDouble();
      } else {
        BBGRV = BigInt.from(89400).toDouble();
      }
      RVSATZAN = BigInt.from(93).toDouble();
    } else {
      // Nichts zu tun
    }
    BBGKVPV = BigInt.from(62100).toDouble();
    KVSATZAN = (KVZ / (ZAHL2.toDouble()) / (ZAHL100.toDouble())) +
        (BigInt.from(7).toDouble());
    KVSATZAG = (BigInt.from(85) + BigInt.from(7)).toDouble();
    if (PVS == 1) {
      PVSATZAN = BigInt.from(22).toDouble();
      PVSATZAG = BigInt.from(12).toDouble();
    } else {
      PVSATZAN = BigInt.from(17).toDouble();
      PVSATZAG = BigInt.from(17).toDouble();
    }
    if (PVZ == 1) {
      PVSATZAN += BigInt.from(6).toDouble();
    } else {
      PVSATZAN -= PVA * (BigInt.from(25).toDouble());
    }
    W1STKL5 = BigInt.from(13279).toDouble();
    W2STKL5 = BigInt.from(33380).toDouble();
    W3STKL5 = BigInt.from(222260).toDouble();
    GFB = BigInt.from(11604).toDouble();
    SOLZFREI = BigInt.from(18130).toDouble();
  }

  void MRE4JL() {
    if (LZZ == 1) {
      ZRE4J = RE4 / (ZAHL100.toDouble());
      ZVBEZJ = VBEZ / (ZAHL100.toDouble());
      JLFREIB = LZZFREIB / (ZAHL100.toDouble());
      JLHINZU = LZZHINZU / (ZAHL100.toDouble());
    } else if (LZZ == 2) {
      ZRE4J = (RE4 * (ZAHL12.toDouble())) / (ZAHL100.toDouble());
      ZVBEZJ = (VBEZ * (ZAHL12.toDouble())) / (ZAHL100.toDouble());
      JLFREIB = (LZZFREIB * (ZAHL12.toDouble())) / (ZAHL100.toDouble());
      JLHINZU = (LZZHINZU * (ZAHL12.toDouble())) / (ZAHL100.toDouble());
    } else if (LZZ == 3) {
      ZRE4J = (RE4 * (ZAHL360.toDouble())) / (ZAHL700.toDouble());
      ZVBEZJ = (VBEZ * (ZAHL360.toDouble())) / (ZAHL700.toDouble());
      JLFREIB = (LZZFREIB * (ZAHL360.toDouble())) / (ZAHL700.toDouble());
      JLHINZU = (LZZHINZU * (ZAHL360.toDouble())) / (ZAHL700.toDouble());
    } else {
      ZRE4J = (RE4 * (ZAHL360.toDouble())) / (ZAHL100.toDouble());
      ZVBEZJ = (VBEZ * (ZAHL360.toDouble())) / (ZAHL100.toDouble());
      JLFREIB = (LZZFREIB * (ZAHL360.toDouble())) / (ZAHL100.toDouble());
      JLHINZU = (LZZHINZU * (ZAHL360.toDouble())) / (ZAHL100.toDouble());
    }
    if (af == 0) {
      f = 1;
    }
  }

  void MRE4() {
    if (ZVBEZJ == (BigInt.zero.toDouble())) {
      FVBZ = (BigInt.zero.toDouble());
      FVB = (BigInt.zero.toDouble());
      FVBZSO = (BigInt.zero.toDouble());
      FVBSO = (BigInt.zero.toDouble());
    } else {
      if (VJAHR < 2006) {
        J = 1;
      } else if (VJAHR < 2040) {
        J = VJAHR - 2004;
      } else {
        J = 36;
      }
      if (LZZ == 1) {
        VBEZB = (VBEZM * (BigInt.from(ZMVB).toDouble()) + VBEZS);
        HFVB = TAB2[J] / (ZAHL12.toDouble()) * (BigInt.from(ZMVB).toDouble());
        FVBZ = (TAB3[J] / (ZAHL12.toDouble()) * (BigInt.from(ZMVB).toDouble()))
            .toInt().toDouble();
      } else {
        VBEZB = ((VBEZM * (ZAHL12.toDouble())) + VBEZS).toInt().toDouble();
        HFVB = TAB2[J];
        FVBZ = TAB3[J];
      }
      FVB = ((VBEZB * TAB1[J]) / (ZAHL100.toDouble())).toInt().toDouble();
      if (FVB > HFVB) {
        FVB = HFVB;
      }
      if (FVB > ZVBEZJ) {
        FVB = ZVBEZJ;
      }
      FVBSO =
      (FVB + ((VBEZBSO * TAB1[J]) / (ZAHL100.toDouble()))).toInt().toDouble();
      if (FVBSO > TAB2[J]) {
        FVBSO = TAB2[J];
      }
      HFVBZSO =
      (((VBEZB + VBEZBSO) / (ZAHL100.toDouble())) - FVBSO).toInt().toDouble();
      FVBZSO = (FVBZ + (VBEZBSO / (ZAHL100.toDouble()))).toInt().toDouble();
      if (FVBZSO > HFVBZSO) {
        FVBZSO = HFVBZSO.toInt().toDouble();
      }
      if (FVBZSO > TAB3[J]) {
        FVBZSO = TAB3[J];
      }
      HFVBZ = ((VBEZB / (ZAHL100.toDouble())) - FVB).toInt().toDouble();
      if (FVBZ > HFVBZ) {
        FVBZ = HFVBZ.toInt().toDouble();
      }
    }
    MRE4ALTE();
  }

  void MRE4ALTE() {
    if (ALTER1 == 0) {
      ALTE = (BigInt.zero.toDouble());
    } else {
      if (AJAHR < 2006) {
        K = 1;
      } else if (AJAHR < 2040) {
        K = AJAHR - 2004;
      } else {
        K = 36;
      }
      BMG = ZRE4J - ZVBEZJ;
      ALTE = (BMG * (TAB4[K].toDouble())).toInt().toDouble();
      HBALTE = TAB5[K].toDouble();
      if (ALTE > HBALTE) {
        ALTE = HBALTE;
      }
    }
  }

  void MRE4ABZ() {
    ZRE4 = (ZRE4J - FVB - ALTE - JLFREIB + JLHINZU).toInt().toDouble();
    if (ZRE4 < (BigInt.zero.toDouble())) {
      ZRE4 = (BigInt.zero.toDouble());
    }
    ZRE4VP = ZRE4J;
    if (KENNVMT == 2) {
      ZRE4VP = (ZRE4VP - (ENTSCH / (ZAHL100.toDouble()))).toInt().toDouble();
    }
    ZVBEZ = (ZVBEZJ - FVB).toInt().toDouble();
    if (ZVBEZ < (BigInt.zero.toDouble())) {
      ZVBEZ = (BigInt.zero.toDouble());
    }
  }

  void MBERECH() {
    MZTABFB();
    VFRB = ((ANP + FVB + FVBZ) * (ZAHL100.toDouble())).toInt().toDouble();
    MLSTJAHR();
    WVFRB = ((ZVE - GFB) * (ZAHL100.toDouble())).toInt().toDouble();
    if (WVFRB < (BigInt.zero.toDouble())) {
      WVFRB = (BigInt.zero.toDouble());
    }
    LSTJAHR = (ST * (BigInt.from(f).toDouble())).toInt().toDouble();
    UPLSTLZZ();
    UPVKVLZZ();
    if (ZKF > (BigInt.zero.toDouble())) {
      ZTABFB = ZTABFB + KFB;
      MRE4ABZ();
      MLSTJAHR();
      JBMG = (ST * (BigInt.from(f).toDouble())).toInt().toDouble();
    } else {
      JBMG = LSTJAHR;
    }
    MSOLZ();
  }

  void MZTABFB() {
    ANP = (BigInt.zero.toDouble());
    if (ZVBEZ >= (BigInt.zero.toDouble()) && ZVBEZ < FVBZ) {
      FVBZ = BigInt.from(ZVBEZ.toInt()).toDouble();
    }
    if (STKL < 6) {
      if (ZVBEZ > (BigInt.zero.toDouble())) {
        if ((ZVBEZ - FVBZ) < (BigInt.from(102).toDouble())) {
          ANP = (ZVBEZ - FVBZ).toInt().toDouble();
        } else {
          ANP = BigInt.from(102).toDouble();
        }
      }
    } else {
      FVBZ = (BigInt.zero.toDouble());
      FVBZSO = (BigInt.zero.toDouble());
    }
    if (STKL < 6) {
      if (ZRE4 > ZVBEZ) {
        if ((ZRE4 - ZVBEZ) < (BigInt.from(1230).toDouble())) {
          ANP = ANP + (ZRE4 - ZVBEZ).toInt();
        } else {
          ANP = ANP + (BigInt.from(1230).toDouble());
        }
      }
    }
    KZTAB = 1;
    if (STKL == 1) {
      SAP = BigInt.from(36).toDouble();
      KFB = (ZKF * (BigInt.from(9312).toDouble())).toInt().toDouble();
    } else if (STKL == 2) {
      EFA = BigInt.from(4260).toDouble();
      SAP = BigInt.from(36).toDouble();
      KFB = (ZKF * (BigInt.from(9312).toDouble())).toInt().toDouble();
    } else if (STKL == 3) {
      KZTAB = 2;
      SAP = BigInt.from(36).toDouble();
      KFB = (ZKF * (BigInt.from(9312).toDouble())).toInt().toDouble();
    } else if (STKL == 4) {
      SAP = BigInt.from(36).toDouble();
      KFB = (ZKF * (BigInt.from(4656).toDouble())).toInt().toDouble();
    } else if (STKL == 5) {
      SAP = BigInt.from(36).toDouble();
      KFB = (BigInt.zero.toDouble());
    } else {
      KFB = (BigInt.zero.toDouble());
    }
    ZTABFB = (EFA + ANP + SAP + FVBZ).toInt().toDouble();
  }

  void MLSTJAHR() {
    UPEVP();
    if (KENNVMT != 1) {
      ZVE = (ZRE4 - ZTABFB - VSP).toInt().toDouble();
      UPMLST();
    } else {
      ZVE = (ZRE4 - ZTABFB - VSP - (VMT / (ZAHL100.toDouble())) -
          (VKAPA / (ZAHL100.toDouble()))).toInt().toDouble();
      if (ZVE < (BigInt.zero.toDouble())) {
        ZVE = (ZVE + (VMT / (ZAHL100.toDouble())) +
            (VKAPA / (ZAHL100.toDouble()))) / (ZAHL5.toDouble());
        UPMLST();
        ST = (ST * (ZAHL5.toDouble())).toInt().toDouble();
      } else {
        UPMLST();
        STOVMT = ST;
        ZVE = (ZVE + ((VMT + VKAPA) / (ZAHL500.toDouble()))).toInt().toDouble();
        UPMLST();
        ST = (((ST - STOVMT) * (ZAHL5.toDouble())) + STOVMT).toInt().toDouble();
      }
    }
  }

  void UPVKVLZZ() {
    UPVKV();
    JW = VKV;
    UPANTEIL();
    VKVLZZ = ANTEIL1;
  }

  void UPVKV() {
    if (PKV > 0) {
      if (VSP2 > VSP3) {
        VKV = VSP2 * (ZAHL100.toDouble());
      } else {
        VKV = VSP3 * (ZAHL100.toDouble());
      }
    } else {
      VKV = (BigInt.zero.toDouble());
    }
  }

  void UPLSTLZZ() {
    JW = LSTJAHR * (ZAHL100.toDouble());
    UPANTEIL();
    LSTLZZ = ANTEIL1;
  }

  void UPMLST() {
    if (ZVE < (ZAHL1.toDouble())) {
      ZVE = (BigInt.zero.toDouble());
      X = (BigInt.zero.toDouble());
    } else {
      X = (ZVE / (BigInt.from(KZTAB).toDouble())).toInt().toDouble();
    }
    if (STKL < 5) {
      UPTAB24();
    } else {
      MST5_6();
    }
  }

  void UPEVP() {
    if (KRV > 1) {
      VSP1 = (BigInt.zero.toDouble());
    } else {
      if (ZRE4VP > BBGRV) {
        ZRE4VP = BBGRV;
      }
      VSP1 = (ZRE4VP * RVSATZAN).toInt().toDouble();
    }
    VSP2 = (ZRE4VP * (BigInt.from(12).toDouble())).toInt().toDouble();
    if (STKL == 3) {
      VHB = BigInt.from(3000).toDouble();
    } else {
      VHB = BigInt.from(1900).toDouble();
    }
    if (VSP2 > VHB) {
      VSP2 = VHB;
    }
    VSPN = (VSP1 + VSP2).toInt().toDouble();
    MVSP();
    if (VSPN > VSP) {
      VSP = VSPN.toInt().toDouble();
    }
  }

  void MVSP() {
    if (ZRE4VP > BBGKVPV) {
      ZRE4VP = BBGKVPV;
    }
    if (PKV > 0) {
      if (STKL == 6) {
        VSP3 = (BigInt.zero.toDouble());
      } else {
        VSP3 = PKPV * (ZAHL12.toDouble()) / (ZAHL100.toDouble());
        if (PKV == 2) {
          VSP3 = (VSP3 - (ZRE4VP * (KVSATZAG + PVSATZAG))).toInt().toDouble();
        }
      }
    } else {
      VSP3 = (ZRE4VP * (KVSATZAN + PVSATZAN)).toInt().toDouble();
    }
    VSP = (VSP3 + VSP1).toInt().toDouble();
  }

  void MST5_6() {
    ZZX = X;
    if (ZZX > W2STKL5) {
      ZX = W2STKL5;
      UP5_6();
      if (ZZX > W3STKL5) {
        ST = ST + ((W3STKL5 - W2STKL5) * ((BigInt.from(42)).toDouble()))
            .toInt();
        ST = ST + ((ZZX - W3STKL5) * ((BigInt.from(45)).toDouble()))
            .toInt();
      } else {
        ST = ST + ((ZZX - W2STKL5) * ((BigInt.from(42)).toDouble()))
            .toInt();
      }
    } else {
      ZX = ZZX;
      UP5_6();
      if (ZZX > W1STKL5) {
        VERGL = ST;
        ZX = W1STKL5;
        UP5_6();
        HOCH = ST + ((ZZX - W1STKL5) * ((BigInt.from(42)).toDouble()))
            .toInt();
        if (HOCH < VERGL) {
          ST = HOCH;
        } else {
          ST = VERGL;
        }
      }
    }
  }

  void UP5_6() {
    X = (ZX * (BigInt.from(125).toDouble()) ~/ (BigInt.from(100).toDouble()))
        .toSigned(2).toDouble(); // Änderung für 2024
    UPTAB24();
    ST1 = ST;
    X =
    (ZX * (BigInt.from(75).toDouble()) ~/ (BigInt.from(100).toDouble())).toSigned(
        2).toDouble(); // Änderung für 2024
    UPTAB24();
    ST2 = ST;
    DIFF = (ST1 - ST2) * (ZAHL2.toDouble());
    MIST =
    (ZX * (BigInt.from(14).toDouble()) ~/ (BigInt.from(100).toDouble())).toSigned(
        0).toDouble();
    ST = (MIST > DIFF) ? MIST : DIFF;
  }

  void MSOLZ() {
    SOLZFREI = (SOLZFREI * KZTAB);
    if (JBMG > SOLZFREI) {
      SOLZJ = (JBMG * (BigInt.from(55).toDouble()) ~/
          (ZAHL100.toSigned(2).toDouble())).toDouble();
      SOLZMIN = ((JBMG - SOLZFREI) * (BigInt.from(119).toDouble()) ~/
          (ZAHL100.toSigned(2).toDouble()).toDouble()).toDouble(); // Änderung für 2021
      if (SOLZMIN < SOLZJ) {
        SOLZJ = SOLZMIN;
      }
      JW = (SOLZJ * (ZAHL100.toSigned(0).toDouble()));
      UPANTEIL();
      SOLZLZZ = ANTEIL1;
    } else {
      SOLZLZZ = (BigInt.zero.toDouble());
    }
    if (R > 0) {
      JW = JBMG * (ZAHL100.toDouble());
      UPANTEIL();
      BK = ANTEIL1;
    } else {
      BK = (BigInt.zero.toDouble());
    }
  }

  void UPANTEIL() {
    if (LZZ == 1) {
      ANTEIL1 = JW;
    } else if (LZZ == 2) {
      ANTEIL1 = (JW ~/ (ZAHL12.toDouble())).toDouble();
    } else if (LZZ == 3) {
      ANTEIL1 = ((JW * (ZAHL7.toDouble())) ~/ (ZAHL360.toDouble())).toDouble();
    } else {
      ANTEIL1 = (JW ~/ (ZAHL360.toDouble())).toDouble();
    }
  }

  void MSONST() {
    LZZ = 1;
    if (ZMVB == 0) {
      ZMVB = 12;
    }
    if (SONSTB == (BigInt.zero.toDouble()) &&
        MBV == (BigInt.zero.toDouble())) { // neu für 2022
      VKVSONST = (BigInt.zero.toDouble());
      LSTSO = (BigInt.zero.toDouble());
      STS = (BigInt.zero.toDouble());
      SOLZS = (BigInt.zero.toDouble());
      BK = (BigInt.zero.toDouble());
    } else {
      MOSONST();
      UPVKV();
      VKVSONST = VKV;
      ZRE4J = ((JRE4 + SONSTB) ~/ (ZAHL100.toDouble())).toSigned(2).toDouble();
      ZVBEZJ = ((JVBEZ + VBS) ~/ (ZAHL100.toDouble())).toSigned(2).toDouble();
      VBEZBSO = STERBE;
      MRE4SONST();
      MLSTJAHR();
      WVFRBM = ((ZVE - GFB) * (ZAHL100.toDouble()) ~/
          (BigInt.from(1).toSigned(2).toDouble()).toDouble()).toDouble();
      if (WVFRBM < (BigInt.zero.toDouble())) { // WVFRBM < 0
        WVFRBM = (BigInt.zero.toDouble());
      }
      UPVKV();
      VKVSONST = VKV - VKVSONST;
      LSTSO = ST *
          (ZAHL100.toDouble()); // lt. PAP:  "Hinweis: negative Zahlen werden nach ihrem Betrag gerundet!"
      STS =
          (LSTSO - LSTOSO) * (BigInt.from(f).toDouble()) ~/ (ZAHL100.toDouble()) *
              (ZAHL100.toDouble()); // Neu für 2022
      STSMIN();
    }
  }

  void STSMIN() {
    if (STS < (BigInt.zero.toDouble())) { // STS < 0
      if (MBV == (BigInt.zero.toDouble())) { // MBV = 0
        // absichtlich leer
      } else {
        LSTLZZ += STS;
        if (LSTLZZ < (BigInt.zero.toDouble())) { // LSTLZZ < 0
          LSTLZZ = (BigInt.zero.toDouble());
        }
        SOLZLZZ +=
            (STS * (BigInt.from(55).toDouble()) ~/ (ZAHL100.toDouble())).toSigned(
                0);
        if (SOLZLZZ < (BigInt.zero.toDouble())) { // SOLZLZZ < 0
          SOLZLZZ = (BigInt.zero.toDouble());
        }
        BK += STS;
        if (BK < (BigInt.zero.toDouble())) { // BK < 0
          BK = (BigInt.zero.toDouble());
        }
      }
      STS = (BigInt.zero.toDouble());
      SOLZS = (BigInt.zero.toDouble());
    } else {
      MSOLZSTS();
    }
    if (R > 0) {
      BKS = STS;
    } else {
      BKS = (BigInt.zero.toDouble());
    }
  }

  void MSOLZSTS() {
    if (ZKF > (BigInt.zero.toDouble())) { // ZKF > 0
      SOLZSZVE = ZVE - KFB;
    } else {
      SOLZSZVE = ZVE;
    }
    if (SOLZSZVE < (BigInt.one.toDouble())) { // SOLZSZVE < 1
      SOLZSZVE = (BigInt.zero.toDouble());
      X = (BigInt.zero.toDouble());
    } else {
      X = (SOLZSZVE ~/ KZTAB).toDouble();
    }
    if (STKL < 5) { // STKL < 5
      UPTAB24();
    } else {
      MST5_6();
    }
    SOLZSBMG = ST * (BigInt.from(f).toSigned(0).toDouble());
    if (SOLZSBMG > SOLZFREI) { // SOLZSBMG > SOLZFREI
      SOLZS =
      (STS * (BigInt.from(55).toDouble()) ~/ (ZAHL100.toDouble())).toDouble();
    } else {
      SOLZS = (BigInt.zero.toDouble());
    }
  }

  void MVMT() {
    if (VKAPA < (BigInt.zero.toDouble())) {
      VKAPA = (BigInt.zero.toDouble());
    }
    if ((VMT + VKAPA) > (BigInt.zero.toDouble())) {
      if (LSTSO == (BigInt.zero.toDouble())) {
        MOSONST();
        LST1 = LSTOSO;
      } else {
        LST1 = LSTSO;
      }
      VBEZBSO = STERBE + VKAPA;
      ZRE4J = ((JRE4 + SONSTB + VMT + VKAPA) ~/ (ZAHL100.toDouble())).toSigned(
          2).toDouble();
      ZVBEZJ =
      ((JVBEZ + VBS + VKAPA) ~/ (ZAHL100.toDouble())).toSigned(2).toDouble();
      KENNVMT = 2;
      MRE4SONST();
      MLSTJAHR();
      LST3 = ST * (ZAHL100.toDouble());
      MRE4ABZ();
      ZRE4VP = ZRE4VP - (JRE4ENT ~/ (ZAHL100.toDouble())) -
          (SONSTENT ~/ (ZAHL100.toDouble()));
      KENNVMT = 1;
      MLSTJAHR();
      LST2 = ST * (ZAHL100.toDouble());
      STV = LST2 - LST1;
      LST3 = LST3 - LST1;
      if (LST3 < STV) {
        STV = LST3;
      }
      if (STV < (BigInt.zero.toDouble())) {
        STV = (BigInt.zero.toDouble());
      } else {
        STV = STV * (BigInt.from(f).toDouble()) ~/ (ZAHL100.toDouble()) *
            (ZAHL100.toDouble());
      }
      SOLZVBMG = STV ~/ (ZAHL100.toDouble()) + JBMG;
      if (SOLZVBMG > SOLZFREI) { // SOLZVBMG > SOLZFREI
        SOLZV =
        (STV * (BigInt.from(55).toDouble()) ~/ (ZAHL100.toDouble())).toDouble();
      } else {
        SOLZV = (BigInt.zero.toDouble());
      }
      if (R > 0) {
        BKV = STV;
      } else {
        BKV = (BigInt.zero.toDouble());
      }
    } else {
      STV = (BigInt.zero.toDouble());
      SOLZV = (BigInt.zero.toDouble());
      BKV = (BigInt.zero.toDouble());
    }
  }

  void MOSONST() {
    ZRE4J = (JRE4 ~/ (ZAHL100.toDouble())).toSigned(2).toDouble();
    ZVBEZJ = (JVBEZ ~/ (ZAHL100.toDouble())).toSigned(2).toDouble();
    JLFREIB = (JFREIB ~/ (ZAHL100.toDouble())).toDouble();
    JLHINZU = (JHINZU ~/ (ZAHL100.toDouble())).toDouble();
    MRE4();
    MRE4ABZ();
    ZRE4VP = ZRE4VP - (JRE4ENT ~/ (ZAHL100.toDouble()));
    MZTABFB();
    VFRBS1 = ((ANP + FVB + FVBZ) * (ZAHL100.toSigned(2).toDouble()));
    MLSTJAHR();
    WVFRBO = ((ZVE - GFB) * (ZAHL100.toSigned(2).toDouble()));
    if (WVFRBO < (BigInt.zero.toDouble())) {
      WVFRBO = (BigInt.zero.toDouble());
    }
    LSTOSO = ST * (ZAHL100.toDouble());
  }

  void MRE4SONST() {
    MRE4();
    FVB = FVBSO;
    MRE4ABZ(); // Änderung für 2022
    ZRE4VP = ZRE4VP + (MBV ~/ (ZAHL100.toDouble())) -
        (JRE4ENT ~/ (ZAHL100.toDouble())) - (SONSTENT ~/ (ZAHL100.toDouble()));
    FVBZ = FVBZSO;
    MZTABFB();
    VFRBS2 = (((ANP + FVB + FVBZ) * (ZAHL100.toDouble())) - VFRBS1);
  }

  void UPTAB24() {
    if (X < (GFB + (ZAHL1.toDouble()))) {
      ST = (BigInt.zero.toDouble());
    } else if (X < (BigInt.from(17006).toDouble())) { // Geändert für 2024
      var Y = (X - GFB) ~/ (ZAHL10000.toDouble());
      var RW = Y * (BigInt.from(92298).toDouble()) ~/
          (BigInt.from(100).toDouble()); // Geändert für 2024
      RW += BigInt.from(1400) as int;
      ST = ((RW * Y).toSigned(0).toDouble());
    } else if (X < (BigInt.from(66761).toDouble())) { // Geändert für 2024
      var Y = (X - (BigInt.from(17005).toDouble())) ~/
          (ZAHL10000.toDouble()); // Geändert für 2024
      var RW = Y * (BigInt.from(18119).toDouble()) ~/
          (BigInt.from(100).toDouble()); // Geändert für 2024
      RW += (BigInt.from(2397).toDouble()) as int;
      RW *= Y;
      ST = ((RW + (BigInt.from(102538).toDouble())) ~/
          (BigInt.from(100).toDouble()).toDouble()).toDouble(); // Geändert für 2024
    } else if (X < (BigInt.from(277826).toDouble())) { // Geändert für 2022
      ST = (X * ((BigInt.from(42).toDouble()) ~/ (BigInt.from(100).toDouble()))) -
          ((BigInt.from(1060213).toDouble()) ~/
              (BigInt.from(100).toDouble())); // Geändert für 2024
    } else {
      ST = (X * ((BigInt.from(45).toDouble()) ~/ (BigInt.from(100).toDouble())) -
          ((BigInt.from(1893688).toDouble()) ~/
              (BigInt.from(100).toDouble()))); // Geändert für 2024
    }
    ST = ST * KZTAB;
  }
}


