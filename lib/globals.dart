library my_prj.globals;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:mutuo_mobile_app/templates/body_it_select_graph_layout.dart';

Map userEntry = {};
Map dataTable = {};
// String finalResponse = "";
// String baseurl = "https://mutuo-mobile-server.vercel.app"; // PRODUCTION
String baseurl =
    "https://mutuo-mobile-server-git-develop-ottoxotto.vercel.app"; // DEV

// String baseurl = "http://127.0.0.1:5000"; //localhost

String appLanguage = "";

// String splashImage = "assets/icons/png/AppLogoback.png";
String splashImage = "assets/icons/png/AppLogoback2.png";

List<GlobalKey<FormState>> formKeysITrata = [
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>()
];
String dropdownValue = "Prima Casa da Privato";
List<GlobalKey<FormState>> formKeysITspese = [
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>()
];
List<GlobalKey<FormState>> formKeysDErata = [
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>()
];
// String dropdownValue = "Prima Casa da Privato";
List<GlobalKey<FormState>> formKeysDEspese = [
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
  // GlobalKey<FormState>()
];
// List<FlSpot>? plotData = [];
// DataLabel dataLabel = [] as DataLabel;
List<FlSpot>? globplotData = [];
DataLabel globdataLabel = DataLabel([], []);

List<double> maxMinPlot = [0, 100, 0, 100];

Map<String, dynamic> labelTitlesIT = {
  "Homepage": "Dove stai comprando?",
  "TitleSelectPageIT": "Mutuo in Italia",
  "TitleSelectPageDE": "Mutuo in Germania",
  "BtnCalcolaRata": "Calcola Rata",
  "BtnCalcolaSpese": "Calcola Spese",
  "BtnGrafici": "Grafici",
  "TitleCalcRataPage": "Tipologie di Calcolo",
  "BtnRataXAnni": "Calcola su X Anni",
  "BtnRataFissa": "Fissa la Rata",
  "BtnRimborsoCap": "Fissa l'Ammortamento",
  "TitleCalcRataXAnniPage": "Calcola su X Anni",
  "InputFinanziamento" : "Finanziamento",
  "InputTasso" : "Tasso di Interesse",
  "InputAnniCalc" : "Anni per Calcolo Mutuo",
  "InputAnniTassoFisso" : "Anni Tasso Fisso",
  "OutputRata" : "Rata Mensile",
  "TitleCalcRataRataFissaPage": "Rata Fissa",
  "InputRata" : "Rata",
  "TitleCalcRataRimbCapPage": "Ammortamento Fissato",
  "InputRimbCap" : "Tasso di Ammortamento",
  "TitleCalcSpesePage": "Spese di Acquisto",
  "InputPrezzo" : "Prezzo Immobile",
  "InputPercMutuo" : "Percentuale Mutuo",
  "InputPercAgenzia" : "Percentuale Agenzia",
  "InputIstruttoria" : "Spese di Istruttoria",
  "InputAssicurazioni" : "Assicurazioni",
  "InputPerizia" : "Spese di Perizia",
  "OutputAnticipo" : "Anticipo Mutuo",
  "OutputSpese" : "Spese Iniziali",
  "OutputUsciteTot" : "Tot. Uscite Iniziali",
  "InputMaxiRata" : "Maxi-Rata Annuale",
  "InputMeseMaxiRata" : "N° Mensilitá prima della Maxi-Rata",
  "InputGrunderwerbsteuer" : "Grunderwerbsteuer",
  "InputGrundbuchkosten" : "Grundbuchkosten",
  "InputNotarkosten" : "Notarkosten",
  "InputMaklergebühren" : "Maklergebühren",


};

Map<String, dynamic> labelTitlesEN = {
  "Homepage": "Where are you buying?",
  "TitleSelectPageIT": "Mortgage in Italy",
  "TitleSelectPageDE": "Mortgage in Germany",
  "BtnCalcolaRata": "Calculate Monthly Payment",
  "BtnCalcolaSpese": "Calculate Expenses",
  "BtnGrafici": "Graphs",
  "TitleCalcRataPage": "Calculation Methods",
  "BtnRataXAnni": "Calculate over X Years",
  "BtnRataFissa": "Fix the Monthly Payment",
  "BtnRimborsoCap": "Fix the Amortization Rate",
  "TitleCalcRataXAnniPage": "Calculate on X Years",
  "InputFinanziamento" : "Financing Amount",
  "InputTasso" : "Interest Rate",
  "InputAnniCalc" : "N° of Years for Calculation",
  "InputAnniTassoFisso" : "Fixed-term Duration",
  "OutputRata" : "Monthly Payment",
  "TitleCalcRataRataFissaPage": "Fixed Monthly Payment",
  "InputRata" : "Monthly Payment",
  "TitleCalcRataRimbCapPage": "Fixed Amortization Rate",
  "InputRimbCap" : "Amortization Rate",
  "TitleCalcSpesePage": "Acquisition Costs",
  "InputPrezzo" : "Buying Price",
  "InputPercMutuo" : "Loan-to-Value Ratio",
  "InputPercAgenzia" : "Real Estate Agent Fees",
  "InputIstruttoria" : "Processing Fees",
  "InputAssicurazioni" : "Insurance Fees",
  "InputPerizia" : "Valuation Fees",
  "OutputAnticipo" : "Down Payment",
  "OutputSpese" : "Purchasing fees",
  "OutputUsciteTot" : "Initial Tot. Expenses",
  "InputMaxiRata" : "Yearly Lump Payment",
  "InputMeseMaxiRata" : "N° of Months before the Lump Sum",
  "InputGrunderwerbsteuer" : "Grunderwerbsteuer",
  "InputGrundbuchkosten" : "Grundbuchkosten",
  "InputNotarkosten" : "Notarkosten",
  "InputMaklergebühren" : "Maklergebühren",
 


};