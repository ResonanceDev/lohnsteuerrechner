import 'dart:math';

class Lohnsteuer2024 {
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
    0.0, 0.4, 0.384, 0.368, 0.352, 0.336, 0.32, 0.304, 0.288, 0.272, 0.256, 0.24,
    0.224, 0.208, 0.192, 0.176, 0.16, 0.152, 0.144, 0.136, 0.128, 0.12, 0.112,
    0.104, 0.096, 0.088, 0.08, 0.072, 0.064, 0.056, 0.048, 0.04, 0.032, 0.024,
    0.016, 0.008, 0.0
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
}
/* TAB 4 fehlt
/** Tabelle fuer die Vomhundertsaetze des Altersentlastungsbetrags */
	protected static final BigDecimal[] TAB4 = {BigDecimal.valueOf (0.0), BigDecimal.valueOf (0.4), BigDecimal.valueOf (0.384),           BigDecimal.valueOf (0.368), BigDecimal.valueOf (0.352), BigDecimal.valueOf (0.336), BigDecimal.valueOf (0.32),            BigDecimal.valueOf (0.304), BigDecimal.valueOf (0.288), BigDecimal.valueOf (0.272), BigDecimal.valueOf (0.256),            BigDecimal.valueOf (0.24),  BigDecimal.valueOf (0.224), BigDecimal.valueOf (0.208), BigDecimal.valueOf (0.192),            BigDecimal.valueOf (0.176), BigDecimal.valueOf (0.16), BigDecimal.valueOf (0.152),  BigDecimal.valueOf (0.144),            BigDecimal.valueOf (0.136), BigDecimal.valueOf (0.128), BigDecimal.valueOf (0.12),  BigDecimal.valueOf (0.112),            BigDecimal.valueOf (0.104), BigDecimal.valueOf (0.096), BigDecimal.valueOf (0.088), BigDecimal.valueOf (0.08),            BigDecimal.valueOf (0.072), BigDecimal.valueOf (0.064), BigDecimal.valueOf (0.056), BigDecimal.valueOf (0.048),            BigDecimal.valueOf (0.04),  BigDecimal.valueOf (0.032), BigDecimal.valueOf (0.024), BigDecimal.valueOf (0.016),            BigDecimal.valueOf (0.008), BigDecimal.valueOf (0.0)};

*/


  static final List<BigInt> TAB5 = [
    BigInt.zero,
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
    BigInt.zero
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

  BigInt RE4 = BigInt.zero;
  BigInt PKPV = BigInt.zero;
  int af = 0;
  BigInt STERBE = BigInt.zero;
  int STKL = 0;
  double f = 0.0;
  int AJAHR = 0;
  BigInt JRE4ENT = BigInt.zero;
  int PVS = 0;
  int LZZ = 0;
  int KRV = 0;
  BigInt KVZ = BigInt.zero;
  BigInt JHINZU = BigInt.zero;
  int R = 0;
  int PVZ = 0;
  int ZMVB = 0;
  BigInt LZZHINZU = BigInt.zero;
  BigInt SONSTB = BigInt.zero;
  BigInt MBV = BigInt.zero;
  BigInt JVBEZ = BigInt.zero;
  BigInt VBEZM = BigInt.zero;
  BigInt VBS = BigInt.zero;
  int ALTER1 = 0;
  BigInt VBEZ = BigInt.zero;
  BigInt SONSTENT = BigInt.zero;
  BigInt ENTSCH = BigInt.zero;
  BigInt JFREIB = BigInt.zero;
  BigInt VKAPA = BigInt.zero;
  BigInt JRE4 = BigInt.zero;
  BigInt ZKF = BigInt.zero;
  BigInt LZZFREIB = BigInt.zero;
  int PKV = 0;
  BigInt PVA = BigInt.zero;
  int VJAHR = 0;
  BigInt VBEZS = BigInt.zero;
  BigInt VMT = BigInt.zero;

  void setRe4(BigInt arg0) {
    this.RE4 = arg0;
  }

  void setPkpv(BigInt arg0) {
    this.PKPV = arg0;
  }

  void setAf(int arg0) {
    this.af = arg0;
  }

  void setSterbe(BigInt arg0) {
    this.STERBE = arg0;
  }

  void setStkl(int arg0) {
    this.STKL = arg0;
  }

  void setF(double arg0) {
    this.f = arg0;
  }

  void setAjahr(int arg0) {
    this.AJAHR = arg0;
  }

  void setJre4ent(BigInt arg0) {
    this.JRE4ENT = arg0;
  }

  void setPvs(int arg0) {
    this.PVS = arg0;
  }

  void setLzz(int arg0) {
    this.LZZ = arg0;
  }

  void setKrv(int arg0) {
    this.KRV = arg0;
  }

  void setKvz(BigInt arg0) {
    this.KVZ = arg0;
  }

  void setJhinzu(BigInt arg0) {
    this.JHINZU = arg0;
  }

  void setR(int arg0) {
    this.R = arg0;
  }

  void setPvz(int arg0) {
    this.PVZ = arg0;
  }

  void setZmvb(int arg0) {
    this.ZMVB = arg0;
  }

  void setLzzhinzu(BigInt arg0) {
    this.LZZHINZU = arg0;
  }

  void setSonstb(BigInt arg0) {
    this.SONSTB = arg0;
  }

  void setMbv(BigInt arg0) {
    this.MBV = arg0;
  }

  void setJvbez(BigInt arg0) {
    this.JVBEZ = arg0;
  }

  void setVbezm(BigInt arg0) {
    this.VBEZM = arg0;
  }

  void setVbs(BigInt arg0) {
    this.VBS = arg0;
  }

  void setAlter1(int arg0) {
    this.ALTER1 = arg0;
  }

  void setVbez(BigInt arg0) {
    this.VBEZ = arg0;
  }

  void setSonstent(BigInt arg0) {
    this.SONSTENT = arg0;
  }

  void setEntsch(BigInt arg0) {
    this.ENTSCH = arg0;
  }

  void setJfreib(BigInt arg0) {
    this.JFREIB = arg0;
  }

  void setVkapa(BigInt arg0) {
    this.VKAPA = arg0;
  }

  void setJre4(BigInt arg0) {
    this.JRE4 = arg0;
  }

  void setZkf(BigInt arg0) {
    this.ZKF = arg0;
  }

  void setLzzfreib(BigInt arg0) {
    this.LZZFREIB = arg0;
  }

  void setPkv(int arg0) {
    this.PKV = arg0;
  }

  void setPva(BigInt arg0) {
    this.PVA = arg0;
  }

  void setVjahr(int arg0) {
    this.VJAHR = arg0;
  }

  void setVbezs(BigInt arg0) {
    this.VBEZS = arg0;
  }

  void setVmt(BigInt arg0) {
    this.VMT = arg0;
  }

  BigInt getLstlzz() {
    return this.LSTLZZ;
  }

  BigInt getVfrb() {
    return this.VFRB;
  }

  BigInt getBk() {
    return this.BK;
  }

  BigInt getSolzv() {
    return this.SOLZV;
  }

  BigInt getBks() {
    return this.BKS;
  }

  BigInt getBkv() {
    return this.BKV;
  }

  BigInt getSolzs() {
    return this.SOLZS;
  }

  BigInt getVfrbs2() {
    return this.VFRBS2;
  }

  BigInt getVfrbs1() {
    return this.VFRBS1;
  }

  BigInt getVkvlzz() {
    return this.VKVLZZ;
  }

  BigInt getWvfrbm() {
    return this.WVFRBM;
  }

  BigInt getSts() {
    return this.STS;
  }

  BigInt getStv() {
    return this.STV;
  }

  BigInt getVkvsonst() {
    return this.VKVSONST;
  }

  BigInt getWvfrb() {
    return this.WVFRB;
  }

  BigInt getSolzlzz() {
    return this.SOLZLZZ;
  }

  BigInt getWvfrbo() {
    return this.WVFRBO;
  }

  void main() {
    MPARA();
    MRE4JL();
    VBEZBSO = BigInt.zero;
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
        BBGRV = BigInt.from(90600);
      } else {
        BBGRV = BigInt.from(89400);
      }
      RVSATZAN = BigInt.from(93);
    } else {
      // Nichts zu tun
    }
    BBGKVPV = BigInt.from(62100);
    KVSATZAN = (KVZ / ZAHL2 / ZAHL100) + BigInt.from(7);
    KVSATZAG = BigInt.from(85) + BigInt.from(7);
    if (PVS == 1) {
      PVSATZAN = BigInt.from(22);
      PVSATZAG = BigInt.from(12);
    } else {
      PVSATZAN = BigInt.from(17);
      PVSATZAG = BigInt.from(17);
    }
    if (PVZ == 1) {
      PVSATZAN += BigInt.from(6);
    } else {
      PVSATZAN -= PVA * BigInt.from(25);
    }
    W1STKL5 = BigInt.from(13279);
    W2STKL5 = BigInt.from(33380);
    W3STKL5 = BigInt.from(222260);
    GFB = BigInt.from(11604);
    SOLZFREI = BigInt.from(18130);
  }

  void MRE4JL() {
    if (LZZ == 1) {
      ZRE4J = RE4 / ZAHL100;
      ZVBEZJ = VBEZ / ZAHL100;
      JLFREIB = LZZFREIB / ZAHL100;
      JLHINZU = LZZHINZU / ZAHL100;
    } else if (LZZ == 2) {
      ZRE4J = (RE4 * ZAHL12) / ZAHL100;
      ZVBEZJ = (VBEZ * ZAHL12) / ZAHL100;
      JLFREIB = (LZZFREIB * ZAHL12) / ZAHL100;
      JLHINZU = (LZZHINZU * ZAHL12) / ZAHL100;
    } else if (LZZ == 3) {
      ZRE4J = (RE4 * ZAHL360) / ZAHL700;
      ZVBEZJ = (VBEZ * ZAHL360) / ZAHL700;
      JLFREIB = (LZZFREIB * ZAHL360) / ZAHL700;
      JLHINZU = (LZZHINZU * ZAHL360) / ZAHL700;
    } else {
      ZRE4J = (RE4 * ZAHL360) / ZAHL100;
      ZVBEZJ = (VBEZ * ZAHL360) / ZAHL100;
      JLFREIB = (LZZFREIB * ZAHL360) / ZAHL100;
      JLHINZU = (LZZHINZU * ZAHL360) / ZAHL100;
    }
    if (af == 0) {
      f = 1;
    }
  }

  void MRE4() {
    if (ZVBEZJ == BigInt.zero) {
      FVBZ = BigInt.zero;
      FVB = BigInt.zero;
      FVBZSO = BigInt.zero;
      FVBSO = BigInt.zero;
    } else {
      if (VJAHR < 2006) {
        J = 1;
      } else if (VJAHR < 2040) {
        J = VJAHR - 2004;
      } else {
        J = 36;
      }
      if (LZZ == 1) {
        VBEZB = (VBEZM * BigInt.from(ZMVB)) + VBEZS;
        HFVB = TAB2[J] / ZAHL12 * BigInt.from(ZMVB);
        FVBZ = (TAB3[J] / ZAHL12 * BigInt.from(ZMVB)).toInt();
      } else {
        VBEZB = ((VBEZM * ZAHL12) + VBEZS).toInt();
        HFVB = TAB2[J];
        FVBZ = TAB3[J];
      }
      FVB = ((VBEZB * TAB1[J]) / ZAHL100).toInt();
      if (FVB > HFVB) {
        FVB = HFVB;
      }
      if (FVB > ZVBEZJ) {
        FVB = ZVBEZJ;
      }
      FVBSO = (FVB + ((VBEZBSO * TAB1[J]) / ZAHL100)).toInt();
      if (FVBSO > TAB2[J]) {
        FVBSO = TAB2[J];
      }
      HFVBZSO = (((VBEZB + VBEZBSO) / ZAHL100) - FVBSO).toInt();
      FVBZSO = (FVBZ + (VBEZBSO / ZAHL100)).toInt();
      if (FVBZSO > HFVBZSO) {
        FVBZSO = HFVBZSO.toInt();
      }
      if (FVBZSO > TAB3[J]) {
        FVBZSO = TAB3[J];
      }
      HFVBZ = ((VBEZB / ZAHL100) - FVB).toInt();
      if (FVBZ > HFVBZ) {
        FVBZ = HFVBZ.toInt();
      }
    }
    MRE4ALTE();
  }

  void MRE4ALTE() {
    if (ALTER1 == 0) {
      ALTE = BigInt.zero;
    } else {
      if (AJAHR < 2006) {
        K = 1;
      } else if (AJAHR < 2040) {
        K = AJAHR - 2004;
      } else {
        K = 36;
      }
      BMG = ZRE4J - ZVBEZJ;
      ALTE = (BMG * TAB4[K]).toInt();
      HBALTE = TAB5[K];
      if (ALTE > HBALTE) {
        ALTE = HBALTE;
      }
    }
  }

  void MRE4ABZ() {
    ZRE4 = (ZRE4J - FVB - ALTE - JLFREIB + JLHINZU).toInt();
    if (ZRE4 < BigInt.zero) {
      ZRE4 = BigInt.zero;
    }
    ZRE4VP = ZRE4J;
    if (KENNVMT == 2) {
      ZRE4VP = (ZRE4VP - (ENTSCH / ZAHL100)).toInt();
    }
    ZVBEZ = (ZVBEZJ - FVB).toInt();
    if (ZVBEZ < BigInt.zero) {
      ZVBEZ = BigInt.zero;
    }
  }

  void MBERECH() {
    MZTABFB();
    VFRB = ((ANP + FVB + FVBZ) * ZAHL100).toInt();
    MLSTJAHR();
    WVFRB = ((ZVE - GFB) * ZAHL100).toInt();
    if (WVFRB < BigInt.zero) {
      WVFRB = BigInt.zero;
    }
    LSTJAHR = (ST * BigInt.from(f)).toInt();
    UPLSTLZZ();
    UPVKVLZZ();
    if (ZKF > BigInt.zero) {
      ZTABFB = ZTABFB + KFB;
      MRE4ABZ();
      MLSTJAHR();
      JBMG = (ST * BigInt.from(f)).toInt();
    } else {
      JBMG = LSTJAHR;
    }
    MSOLZ();
  }

  void MZTABFB() {
    ANP = BigInt.zero;
    if (ZVBEZ >= BigInt.zero && ZVBEZ < FVBZ) {
      FVBZ = BigInt.from(ZVBEZ.toInt());
    }
    if (STKL < 6) {
      if (ZVBEZ > BigInt.zero) {
        if ((ZVBEZ - FVBZ) < BigInt.from(102)) {
          ANP = (ZVBEZ - FVBZ).toInt();
        } else {
          ANP = BigInt.from(102);
        }
      }
    } else {
      FVBZ = BigInt.zero;
      FVBZSO = BigInt.zero;
    }
    if (STKL < 6) {
      if (ZRE4 > ZVBEZ) {
        if ((ZRE4 - ZVBEZ) < BigInt.from(1230)) {
          ANP = ANP + (ZRE4 - ZVBEZ).toInt();
        } else {
          ANP = ANP + BigInt.from(1230);
        }
      }
    }
    KZTAB = 1;
    if (STKL == 1) {
      SAP = BigInt.from(36);
      KFB = (ZKF * BigInt.from(9312)).toInt();
    } else if (STKL == 2) {
      EFA = BigInt.from(4260);
      SAP = BigInt.from(36);
      KFB = (ZKF * BigInt.from(9312)).toInt();
    } else if (STKL == 3) {
      KZTAB = 2;
      SAP = BigInt.from(36);
      KFB = (ZKF * BigInt.from(9312)).toInt();
    } else if (STKL == 4) {
      SAP = BigInt.from(36);
      KFB = (ZKF * BigInt.from(4656)).toInt();
    } else if (STKL == 5) {
      SAP = BigInt.from(36);
      KFB = BigInt.zero;
    } else {
      KFB = BigInt.zero;
    }
    ZTABFB = (EFA + ANP + SAP + FVBZ).toInt();
  }

  void MLSTJAHR() {
    UPEVP();
    if (KENNVMT != 1) {
      ZVE = (ZRE4 - ZTABFB - VSP).toInt();
      UPMLST();
    } else {
      ZVE = (ZRE4 - ZTABFB - VSP - (VMT / ZAHL100) - (VKAPA / ZAHL100)).toInt();
      if (ZVE < BigInt.zero) {
        ZVE = (ZVE + (VMT / ZAHL100) + (VKAPA / ZAHL100)) / ZAHL5;
        UPMLST();
        ST = (ST * ZAHL5).toInt();
      } else {
        UPMLST();
        STOVMT = ST;
        ZVE = (ZVE + ((VMT + VKAPA) / ZAHL500)).toInt();
        UPMLST();
        ST = (((ST - STOVMT) * ZAHL5) + STOVMT).toInt();
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
        VKV = VSP2 * ZAHL100;
      } else {
        VKV = VSP3 * ZAHL100;
      }
    } else {
      VKV = BigInt.zero;
    }
  }

  void UPLSTLZZ() {
    JW = LSTJAHR * ZAHL100;
    UPANTEIL();
    LSTLZZ = ANTEIL1;
  }

  void UPMLST() {
    if (ZVE < ZAHL1) {
      ZVE = BigInt.zero;
      X = BigInt.zero;
    } else {
      X = (ZVE / BigInt.from(KZTAB)).toInt();
    }
    if (STKL < 5) {
      UPTAB24();
    } else {
      MST5_6();
    }
  }

  void UPEVP() {
    if (KRV > 1) {
      VSP1 = BigInt.zero;
    } else {
      if (ZRE4VP > BBGRV) {
        ZRE4VP = BBGRV;
      }
      VSP1 = (ZRE4VP * RVSATZAN).toInt();
    }
    VSP2 = (ZRE4VP * BigInt.from(12)).toInt();
    if (STKL == 3) {
      VHB = BigInt.from(3000);
    } else {
      VHB = BigInt.from(1900);
    }
    if (VSP2 > VHB) {
      VSP2 = VHB;
    }
    VSPN = (VSP1 + VSP2).toInt();
    MVSP();
    if (VSPN > VSP) {
      VSP = VSPN.toInt();
    }
  }

  void MVSP() {
    if (ZRE4VP > BBGKVPV) {
      ZRE4VP = BBGKVPV;
    }
    if (PKV > 0) {
      if (STKL == 6) {
        VSP3 = BigInt.zero;
      } else {
        VSP3 = PKPV * ZAHL12 / ZAHL100;
        if (PKV == 2) {
          VSP3 = (VSP3 - (ZRE4VP * (KVSATZAG + PVSATZAG))).toInt();
        }
      }
    } else {
      VSP3 = (ZRE4VP * (KVSATZAN + PVSATZAN)).toInt();
    }
    VSP = (VSP3 + VSP1).toInt();
  }

  void MST5_6() {
    ZZX = X;
    if (ZZX > W2STKL5) {
      ZX = W2STKL5;
      UP5_6();
      if (ZZX > W3STKL5) {
        ST = (ST + ((W3STKL5 - W2STKL5) * BigInt.from(42))).toInt();
        ST = (ST + ((ZZX - W3STKL5) * BigInt.from(45))).toInt();
      } else {
        ST = (ST + ((ZZX - W2STKL5) * BigInt.from(42))).toInt();
      }
    } else {
      ZX = ZZX;
      UP5_6();
      if (ZZX > W1STKL5) {
        VERGL = ST;
        ZX = W1STKL5;
        UP5_6();
        HOCH = (ST + ((ZZX - W1STKL5) * BigInt.from(42))).toInt();
        if (HOCH < VERGL) {
          ST = HOCH;
        } else {
          ST = VERGL;
        }
      }
    }
  }
}

  void UP5_6() {
    X = (ZX * BigInt.from(125) ~/ BigInt.from(100)).toSigned(2); // Änderung für 2024
    UPTAB24();
    ST1 = ST;
    X = (ZX * BigInt.from(75) ~/ BigInt.from(100)).toSigned(2); // Änderung für 2024
    UPTAB24();
    ST2 = ST;
    DIFF = (ST1 - ST2) * ZAHL2;
    MIST = (ZX * BigInt.from(14) ~/ BigInt.from(100)).toSigned(0);
    ST = (MIST > DIFF) ? MIST : DIFF;
  }

  void MSOLZ() {
    SOLZFREI = (SOLZFREI * KZTAB);
    if (JBMG > SOLZFREI) {
      SOLZJ = (JBMG * BigInt.from(55) ~/ ZAHL100).toSigned(2);
      SOLZMIN = ((JBMG - SOLZFREI) * BigInt.from(119) ~/ ZAHL100).toSigned(2); // Änderung für 2021
      if (SOLZMIN < SOLZJ) {
        SOLZJ = SOLZMIN;
      }
      JW = (SOLZJ * ZAHL100).toSigned(0);
      UPANTEIL();
      SOLZLZZ = ANTEIL1;
    } else {
      SOLZLZZ = BigInt.zero;
    }
    if (R > 0) {
      JW = JBMG * ZAHL100;
      UPANTEIL();
      BK = ANTEIL1;
    } else {
      BK = BigInt.zero;
    }
  }

  void UPANTEIL() {
    if (LZZ == 1) {
      ANTEIL1 = JW;
    } else if (LZZ == 2) {
      ANTEIL1 = JW ~/ ZAHL12;
    } else if (LZZ == 3) {
      ANTEIL1 = (JW * ZAHL7) ~/ ZAHL360;
    } else {
      ANTEIL1 = JW ~/ ZAHL360;
    }
  }

  void MSONST() {
    LZZ = 1;
    if (ZMVB == 0) {
      ZMVB = 12;
    }
    if (SONSTB == BigInt.zero && MBV == BigInt.zero) { // neu für 2022
      VKVSONST = BigInt.zero;
      LSTSO = BigInt.zero;
      STS = BigInt.zero;
      SOLZS = BigInt.zero;
      BK = BigInt.zero;
    } else {
      MOSONST();
      UPVKV();
      VKVSONST = VKV;
      ZRE4J = ((JRE4 + SONSTB) ~/ ZAHL100).toSigned(2);
      ZVBEZJ = ((JVBEZ + VBS) ~/ ZAHL100).toSigned(2);
      VBEZBSO = STERBE;
      MRE4SONST();
      MLSTJAHR();
      WVFRBM = (ZVE - GFB) * ZAHL100 ~/ BigInt.from(1).toSigned(2);
      if (WVFRBM < BigInt.zero) { // WVFRBM < 0
        WVFRBM = BigInt.zero;
      }
      UPVKV();
      VKVSONST = VKV - VKVSONST;
      LSTSO = ST * ZAHL100; // lt. PAP:  "Hinweis: negative Zahlen werden nach ihrem Betrag gerundet!"
      STS = (LSTSO - LSTOSO) * BigInt.from(f) ~/ ZAHL100 * ZAHL100; // Neu für 2022
      STSMIN();
    }
  }

  void STSMIN() {
    if (STS < BigInt.zero) { // STS < 0
      if (MBV == BigInt.zero) { // MBV = 0
        // absichtlich leer
      } else {
        LSTLZZ += STS;
        if (LSTLZZ < BigInt.zero) { // LSTLZZ < 0
          LSTLZZ = BigInt.zero;
        }
        SOLZLZZ += (STS * BigInt.from(55) ~/ ZAHL100).toSigned(0);
        if (SOLZLZZ < BigInt.zero) { // SOLZLZZ < 0
          SOLZLZZ = BigInt.zero;
        }
        BK += STS;
        if (BK < BigInt.zero) { // BK < 0
          BK = BigInt.zero;
        }
      }
      STS = BigInt.zero;
      SOLZS = BigInt.zero;
    } else {
      MSOLZSTS();
    }
    if (R > 0) {
      BKS = STS;
    } else {
      BKS = BigInt.zero;
    }
  }

  void MSOLZSTS() {
    if (ZKF > BigInt.zero) { // ZKF > 0
      SOLZSZVE = ZVE - KFB;
    } else {
      SOLZSZVE = ZVE;
    }
    if (SOLZSZVE < BigInt.one) { // SOLZSZVE < 1
      SOLZSZVE = BigInt.zero;
      X = BigInt.zero;
    } else {
      X = SOLZSZVE ~/ KZTAB;
    }
    if (STKL < 5) { // STKL < 5
      UPTAB24();
    } else {
      MST5_6();
    }
    SOLZSBMG = ST * BigInt.from(f).toSigned(0);
    if (SOLZSBMG > SOLZFREI) { // SOLZSBMG > SOLZFREI
      SOLZS = STS * BigInt.from(55) ~/ ZAHL100;
    } else {
      SOLZS = BigInt.zero;
    }
  }

  void MVMT() {
    if (VKAPA < BigInt.zero) {
      VKAPA = BigInt.zero;
    }
    if ((VMT + VKAPA) > BigInt.zero) {
      if (LSTSO == BigInt.zero) {
        MOSONST();
        LST1 = LSTOSO;
      } else {
        LST1 = LSTSO;
      }
      VBEZBSO = STERBE + VKAPA;
      ZRE4J = ((JRE4 + SONSTB + VMT + VKAPA) ~/ ZAHL100).toSigned(2);
      ZVBEZJ = ((JVBEZ + VBS + VKAPA) ~/ ZAHL100).toSigned(2);
      KENNVMT = 2;
      MRE4SONST();
      MLSTJAHR();
      LST3 = ST * ZAHL100;
      MRE4ABZ();
      ZRE4VP = ZRE4VP - (JRE4ENT ~/ ZAHL100) - (SONSTENT ~/ ZAHL100);
      KENNVMT = 1;
      MLSTJAHR();
      LST2 = ST * ZAHL100;
      STV = LST2 - LST1;
      LST3 = LST3 - LST1;
      if (LST3 < STV) {
        STV = LST3;
      }
      if (STV < BigInt.zero) {
        STV = BigInt.zero;
      } else {
        STV = STV * BigInt.from(f) ~/ ZAHL100 * ZAHL100;
      }
      SOLZVBMG = STV ~/ ZAHL100 + JBMG;
      if (SOLZVBMG > SOLZFREI) { // SOLZVBMG > SOLZFREI
        SOLZV = STV * BigInt.from(55) ~/ ZAHL100;
      } else {
        SOLZV = BigInt.zero;
      }
      if (R > 0) {
        BKV = STV;
      } else {
        BKV = BigInt.zero;
      }
    } else {
      STV = BigInt.zero;
      SOLZV = BigInt.zero;
      BKV = BigInt.zero;
    }
  }

  void MOSONST() {
    ZRE4J = (JRE4 ~/ ZAHL100).toSigned(2);
    ZVBEZJ = (JVBEZ ~/ ZAHL100).toSigned(2);
    JLFREIB = JFREIB ~/ ZAHL100;
    JLHINZU = JHINZU ~/ ZAHL100;
    MRE4();
    MRE4ABZ();
    ZRE4VP = ZRE4VP - (JRE4ENT ~/ ZAHL100);
    MZTABFB();
    VFRBS1 = ((ANP + FVB + FVBZ) * ZAHL100).toSigned(2);
    MLSTJAHR();
    WVFRBO = ((ZVE - GFB) * ZAHL100).toSigned(2);
    if (WVFRBO < BigInt.zero) {
      WVFRBO = BigInt.zero;
    }
    LSTOSO = ST * ZAHL100;
  }

  void MRE4SONST() {
    MRE4();
    FVB = FVBSO;
    MRE4ABZ(); // Änderung für 2022
    ZRE4VP = ZRE4VP + (MBV ~/ ZAHL100) - (JRE4ENT ~/ ZAHL100) - (SONSTENT ~/ ZAHL100);
    FVBZ = FVBZSO;
    MZTABFB();
    VFRBS2 = (((ANP + FVB + FVBZ) * ZAHL100) - VFRBS1);
  }

  void UPTAB24() {
    if (X < (GFB + ZAHL1)) {
      ST = BigInt.zero;
    } else if (X < BigInt.from(17006)) { // Geändert für 2024
      var Y = (X - GFB) ~/ ZAHL10000;
      var RW = Y * BigInt.from(92298) ~/ BigInt.from(100); // Geändert für 2024
      RW += BigInt.from(1400);
      ST = (RW * Y).toSigned(0);
    } else if (X < BigInt.from(66761)) { // Geändert für 2024
      var Y = (X - BigInt.from(17005)) ~/ ZAHL10000; // Geändert für 2024
      var RW = Y * BigInt.from(18119) ~/ BigInt.from(100); // Geändert für 2024
      RW += BigInt.from(2397);
      RW *= Y;
      ST = (RW + BigInt.from(102538)) ~/ BigInt.from(100); // Geändert für 2024
    } else if (X < BigInt.from(277826)) { // Geändert für 2022
      ST = ((X * BigInt.from(42) ~/ BigInt.from(100)) - BigInt.from(1060213)) ~/ BigInt.from(100); // Geändert für 2024
    } else {
      ST = ((X * BigInt.from(45) ~/ BigInt.from(100)) - BigInt.from(1893688)) ~/ BigInt.from(100); // Geändert für 2024
    }
    ST = ST * KZTAB;
  }
}

