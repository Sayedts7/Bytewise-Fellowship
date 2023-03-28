/// name : "Afghanistan"
/// topLevelDomain : [".af"]
/// alpha2Code : "AF"
/// alpha3Code : "AFG"
/// callingCodes : ["93"]
/// capital : "Kabul"
/// altSpellings : ["AF","Afġānistān"]
/// subregion : "Southern Asia"
/// region : "Asia"
/// population : 40218234
/// latlng : [33.0,65.0]
/// demonym : "Afghan"
/// area : 652230.0
/// timezones : ["UTC+04:30"]
/// borders : ["IRN","PAK","TKM","UZB","TJK","CHN"]
/// nativeName : "افغانستان"
/// numericCode : "004"
/// flags : {"svg":"https://upload.wikimedia.org/wikipedia/commons/5/5c/Flag_of_the_Taliban.svg","png":"https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_the_Taliban.svg/320px-Flag_of_the_Taliban.svg.png"}
/// currencies : [{"code":"AFN","name":"Afghan afghani","symbol":"؋"}]
/// languages : [{"iso639_1":"ps","iso639_2":"pus","name":"Pashto","nativeName":"پښتو"},{"iso639_1":"uz","iso639_2":"uzb","name":"Uzbek","nativeName":"Oʻzbek"},{"iso639_1":"tk","iso639_2":"tuk","name":"Turkmen","nativeName":"Türkmen"}]
/// translations : {"br":"Afghanistan","pt":"Afeganistão","nl":"Afghanistan","hr":"Afganistan","fa":"افغانستان","de":"Afghanistan","es":"Afganistán","fr":"Afghanistan","ja":"アフガニスタン","it":"Afghanistan","hu":"Afganisztán"}
/// flag : "https://upload.wikimedia.org/wikipedia/commons/5/5c/Flag_of_the_Taliban.svg"
/// regionalBlocs : [{"acronym":"SAARC","name":"South Asian Association for Regional Cooperation"}]
/// cioc : "AFG"
/// independent : true

class WorldDataModel {
  WorldDataModel({
      String? name, 
      List<String>? topLevelDomain, 
      String? alpha2Code, 
      String? alpha3Code, 
      List<String>? callingCodes, 
      String? capital, 
      List<String>? altSpellings, 
      String? subregion, 
      String? region, 
      num? population, 
      List<num>? latlng, 
      String? demonym, 
      num? area, 
      List<String>? timezones, 
      List<String>? borders, 
      String? nativeName, 
      String? numericCode, 
      Flags? flags, 
      List<Currencies>? currencies, 
      List<Languages>? languages, 
      Translations? translations, 
      String? flag, 
      List<RegionalBlocs>? regionalBlocs, 
      String? cioc, 
      bool? independent,}){
    _name = name;
    _topLevelDomain = topLevelDomain;
    _alpha2Code = alpha2Code;
    _alpha3Code = alpha3Code;
    _callingCodes = callingCodes;
    _capital = capital;
    _altSpellings = altSpellings;
    _subregion = subregion;
    _region = region;
    _population = population;
    _latlng = latlng;
    _demonym = demonym;
    _area = area;
    _timezones = timezones;
    _borders = borders;
    _nativeName = nativeName;
    _numericCode = numericCode;
    _flags = flags;
    _currencies = currencies;
    _languages = languages;
    _translations = translations;
    _flag = flag;
    _regionalBlocs = regionalBlocs;
    _cioc = cioc;
    _independent = independent;
}

  WorldDataModel.fromJson(dynamic json) {
    _name = json['name'];
    _topLevelDomain = json['topLevelDomain'] != null ? json['topLevelDomain'].cast<String>() : [];
    _alpha2Code = json['alpha2Code'];
    _alpha3Code = json['alpha3Code'];
    _callingCodes = json['callingCodes'] != null ? json['callingCodes'].cast<String>() : [];
    _capital = json['capital'];
    _altSpellings = json['altSpellings'] != null ? json['altSpellings'].cast<String>() : [];
    _subregion = json['subregion'];
    _region = json['region'];
    _population = json['population'];
    _latlng = json['latlng'] != null ? json['latlng'].cast<num>() : [];
    _demonym = json['demonym'];
    _area = json['area'];
    _timezones = json['timezones'] != null ? json['timezones'].cast<String>() : [];
    _borders = json['borders'] != null ? json['borders'].cast<String>() : [];
    _nativeName = json['nativeName'];
    _numericCode = json['numericCode'];
    _flags = json['flags'] != null ? Flags.fromJson(json['flags']) : null;
    if (json['currencies'] != null) {
      _currencies = [];
      json['currencies'].forEach((v) {
        _currencies?.add(Currencies.fromJson(v));
      });
    }
    if (json['languages'] != null) {
      _languages = [];
      json['languages'].forEach((v) {
        _languages?.add(Languages.fromJson(v));
      });
    }
    _translations = json['translations'] != null ? Translations.fromJson(json['translations']) : null;
    _flag = json['flag'];
    if (json['regionalBlocs'] != null) {
      _regionalBlocs = [];
      json['regionalBlocs'].forEach((v) {
        _regionalBlocs?.add(RegionalBlocs.fromJson(v));
      });
    }
    _cioc = json['cioc'];
    _independent = json['independent'];
  }
  String? _name;
  List<String>? _topLevelDomain;
  String? _alpha2Code;
  String? _alpha3Code;
  List<String>? _callingCodes;
  String? _capital;
  List<String>? _altSpellings;
  String? _subregion;
  String? _region;
  num? _population;
  List<num>? _latlng;
  String? _demonym;
  num? _area;
  List<String>? _timezones;
  List<String>? _borders;
  String? _nativeName;
  String? _numericCode;
  Flags? _flags;
  List<Currencies>? _currencies;
  List<Languages>? _languages;
  Translations? _translations;
  String? _flag;
  List<RegionalBlocs>? _regionalBlocs;
  String? _cioc;
  bool? _independent;
WorldDataModel copyWith({  String? name,
  List<String>? topLevelDomain,
  String? alpha2Code,
  String? alpha3Code,
  List<String>? callingCodes,
  String? capital,
  List<String>? altSpellings,
  String? subregion,
  String? region,
  num? population,
  List<num>? latlng,
  String? demonym,
  num? area,
  List<String>? timezones,
  List<String>? borders,
  String? nativeName,
  String? numericCode,
  Flags? flags,
  List<Currencies>? currencies,
  List<Languages>? languages,
  Translations? translations,
  String? flag,
  List<RegionalBlocs>? regionalBlocs,
  String? cioc,
  bool? independent,
}) => WorldDataModel(  name: name ?? _name,
  topLevelDomain: topLevelDomain ?? _topLevelDomain,
  alpha2Code: alpha2Code ?? _alpha2Code,
  alpha3Code: alpha3Code ?? _alpha3Code,
  callingCodes: callingCodes ?? _callingCodes,
  capital: capital ?? _capital,
  altSpellings: altSpellings ?? _altSpellings,
  subregion: subregion ?? _subregion,
  region: region ?? _region,
  population: population ?? _population,
  latlng: latlng ?? _latlng,
  demonym: demonym ?? _demonym,
  area: area ?? _area,
  timezones: timezones ?? _timezones,
  borders: borders ?? _borders,
  nativeName: nativeName ?? _nativeName,
  numericCode: numericCode ?? _numericCode,
  flags: flags ?? _flags,
  currencies: currencies ?? _currencies,
  languages: languages ?? _languages,
  translations: translations ?? _translations,
  flag: flag ?? _flag,
  regionalBlocs: regionalBlocs ?? _regionalBlocs,
  cioc: cioc ?? _cioc,
  independent: independent ?? _independent,
);
  String? get name => _name;
  List<String>? get topLevelDomain => _topLevelDomain;
  String? get alpha2Code => _alpha2Code;
  String? get alpha3Code => _alpha3Code;
  List<String>? get callingCodes => _callingCodes;
  String? get capital => _capital;
  List<String>? get altSpellings => _altSpellings;
  String? get subregion => _subregion;
  String? get region => _region;
  num? get population => _population;
  List<num>? get latlng => _latlng;
  String? get demonym => _demonym;
  num? get area => _area;
  List<String>? get timezones => _timezones;
  List<String>? get borders => _borders;
  String? get nativeName => _nativeName;
  String? get numericCode => _numericCode;
  Flags? get flags => _flags;
  List<Currencies>? get currencies => _currencies;
  List<Languages>? get languages => _languages;
  Translations? get translations => _translations;
  String? get flag => _flag;
  List<RegionalBlocs>? get regionalBlocs => _regionalBlocs;
  String? get cioc => _cioc;
  bool? get independent => _independent;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['topLevelDomain'] = _topLevelDomain;
    map['alpha2Code'] = _alpha2Code;
    map['alpha3Code'] = _alpha3Code;
    map['callingCodes'] = _callingCodes;
    map['capital'] = _capital;
    map['altSpellings'] = _altSpellings;
    map['subregion'] = _subregion;
    map['region'] = _region;
    map['population'] = _population;
    map['latlng'] = _latlng;
    map['demonym'] = _demonym;
    map['area'] = _area;
    map['timezones'] = _timezones;
    map['borders'] = _borders;
    map['nativeName'] = _nativeName;
    map['numericCode'] = _numericCode;
    if (_flags != null) {
      map['flags'] = _flags?.toJson();
    }
    if (_currencies != null) {
      map['currencies'] = _currencies?.map((v) => v.toJson()).toList();
    }
    if (_languages != null) {
      map['languages'] = _languages?.map((v) => v.toJson()).toList();
    }
    if (_translations != null) {
      map['translations'] = _translations?.toJson();
    }
    map['flag'] = _flag;
    if (_regionalBlocs != null) {
      map['regionalBlocs'] = _regionalBlocs?.map((v) => v.toJson()).toList();
    }
    map['cioc'] = _cioc;
    map['independent'] = _independent;
    return map;
  }

}

/// acronym : "SAARC"
/// name : "South Asian Association for Regional Cooperation"

class RegionalBlocs {
  RegionalBlocs({
      String? acronym, 
      String? name,}){
    _acronym = acronym;
    _name = name;
}

  RegionalBlocs.fromJson(dynamic json) {
    _acronym = json['acronym'];
    _name = json['name'];
  }
  String? _acronym;
  String? _name;
RegionalBlocs copyWith({  String? acronym,
  String? name,
}) => RegionalBlocs(  acronym: acronym ?? _acronym,
  name: name ?? _name,
);
  String? get acronym => _acronym;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['acronym'] = _acronym;
    map['name'] = _name;
    return map;
  }

}

/// br : "Afghanistan"
/// pt : "Afeganistão"
/// nl : "Afghanistan"
/// hr : "Afganistan"
/// fa : "افغانستان"
/// de : "Afghanistan"
/// es : "Afganistán"
/// fr : "Afghanistan"
/// ja : "アフガニスタン"
/// it : "Afghanistan"
/// hu : "Afganisztán"

class Translations {
  Translations({
      String? br, 
      String? pt, 
      String? nl, 
      String? hr, 
      String? fa, 
      String? de, 
      String? es, 
      String? fr, 
      String? ja, 
      String? it, 
      String? hu,}){
    _br = br;
    _pt = pt;
    _nl = nl;
    _hr = hr;
    _fa = fa;
    _de = de;
    _es = es;
    _fr = fr;
    _ja = ja;
    _it = it;
    _hu = hu;
}

  Translations.fromJson(dynamic json) {
    _br = json['br'];
    _pt = json['pt'];
    _nl = json['nl'];
    _hr = json['hr'];
    _fa = json['fa'];
    _de = json['de'];
    _es = json['es'];
    _fr = json['fr'];
    _ja = json['ja'];
    _it = json['it'];
    _hu = json['hu'];
  }
  String? _br;
  String? _pt;
  String? _nl;
  String? _hr;
  String? _fa;
  String? _de;
  String? _es;
  String? _fr;
  String? _ja;
  String? _it;
  String? _hu;
Translations copyWith({  String? br,
  String? pt,
  String? nl,
  String? hr,
  String? fa,
  String? de,
  String? es,
  String? fr,
  String? ja,
  String? it,
  String? hu,
}) => Translations(  br: br ?? _br,
  pt: pt ?? _pt,
  nl: nl ?? _nl,
  hr: hr ?? _hr,
  fa: fa ?? _fa,
  de: de ?? _de,
  es: es ?? _es,
  fr: fr ?? _fr,
  ja: ja ?? _ja,
  it: it ?? _it,
  hu: hu ?? _hu,
);
  String? get br => _br;
  String? get pt => _pt;
  String? get nl => _nl;
  String? get hr => _hr;
  String? get fa => _fa;
  String? get de => _de;
  String? get es => _es;
  String? get fr => _fr;
  String? get ja => _ja;
  String? get it => _it;
  String? get hu => _hu;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['br'] = _br;
    map['pt'] = _pt;
    map['nl'] = _nl;
    map['hr'] = _hr;
    map['fa'] = _fa;
    map['de'] = _de;
    map['es'] = _es;
    map['fr'] = _fr;
    map['ja'] = _ja;
    map['it'] = _it;
    map['hu'] = _hu;
    return map;
  }

}

/// iso639_1 : "ps"
/// iso639_2 : "pus"
/// name : "Pashto"
/// nativeName : "پښتو"

class Languages {
  Languages({
      String? iso6391, 
      String? iso6392, 
      String? name, 
      String? nativeName,}){
    _iso6391 = iso6391;
    _iso6392 = iso6392;
    _name = name;
    _nativeName = nativeName;
}

  Languages.fromJson(dynamic json) {
    _iso6391 = json['iso639_1'];
    _iso6392 = json['iso639_2'];
    _name = json['name'];
    _nativeName = json['nativeName'];
  }
  String? _iso6391;
  String? _iso6392;
  String? _name;
  String? _nativeName;
Languages copyWith({  String? iso6391,
  String? iso6392,
  String? name,
  String? nativeName,
}) => Languages(  iso6391: iso6391 ?? _iso6391,
  iso6392: iso6392 ?? _iso6392,
  name: name ?? _name,
  nativeName: nativeName ?? _nativeName,
);
  String? get iso6391 => _iso6391;
  String? get iso6392 => _iso6392;
  String? get name => _name;
  String? get nativeName => _nativeName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['iso639_1'] = _iso6391;
    map['iso639_2'] = _iso6392;
    map['name'] = _name;
    map['nativeName'] = _nativeName;
    return map;
  }

}

/// code : "AFN"
/// name : "Afghan afghani"
/// symbol : "؋"

class Currencies {
  Currencies({
      String? code, 
      String? name, 
      String? symbol,}){
    _code = code;
    _name = name;
    _symbol = symbol;
}

  Currencies.fromJson(dynamic json) {
    _code = json['code'];
    _name = json['name'];
    _symbol = json['symbol'];
  }
  String? _code;
  String? _name;
  String? _symbol;
Currencies copyWith({  String? code,
  String? name,
  String? symbol,
}) => Currencies(  code: code ?? _code,
  name: name ?? _name,
  symbol: symbol ?? _symbol,
);
  String? get code => _code;
  String? get name => _name;
  String? get symbol => _symbol;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['name'] = _name;
    map['symbol'] = _symbol;
    return map;
  }

}

/// svg : "https://upload.wikimedia.org/wikipedia/commons/5/5c/Flag_of_the_Taliban.svg"
/// png : "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_the_Taliban.svg/320px-Flag_of_the_Taliban.svg.png"

class Flags {
  Flags({
      String? svg, 
      String? png,}){
    _svg = svg;
    _png = png;
}

  Flags.fromJson(dynamic json) {
    _svg = json['svg'];
    _png = json['png'];
  }
  String? _svg;
  String? _png;
Flags copyWith({  String? svg,
  String? png,
}) => Flags(  svg: svg ?? _svg,
  png: png ?? _png,
);
  String? get svg => _svg;
  String? get png => _png;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['svg'] = _svg;
    map['png'] = _png;
    return map;
  }

}