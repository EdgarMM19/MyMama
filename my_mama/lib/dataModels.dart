class ConfigActivity {
  String name;
  String genre;
  int span;

  ConfigActivity({this.name, this.genre, this.span});

  ConfigActivity.fromJson(Map<String, dynamic> json) {
    this.name = json["name"] as String;
    this.genre = json["genre"] as String;
    this.span = json["span"] as int;
  }

  Map<String, dynamic> toJson() =>
      {"name": this.name, "genre": this.genre, "span": span, "type": 0};
}

class ConfigFixedActivity extends ConfigActivity {
  List<int> whenMinut;
  List<int> whenDia;

  ConfigFixedActivity(
      {String name, String genre, int span, this.whenMinut, this.whenDia})
      : super(name: name, genre: genre, span: span);

  ConfigFixedActivity.fromJson(Map<String, dynamic> json) {
    this.name = json["name"] as String;
    this.genre = json["genre"] as String;
    this.span = json["span"] as int;
    this.whenMinut = json["whenMinut"] as List<int>;
    this.whenDia = json["whenDia"] as List<int>;
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "genre": genre,
        "span": span,
        "type": 1,
        "whenMinut": whenMinut,
        "whenDia": whenDia,
      };
}

class ConfigFixedActivityFreeHour extends ConfigActivity {
  List<int> whenDia;

  ConfigFixedActivityFreeHour(
      {String name, String genre, int span, this.whenDia})
      : super(name: name, genre: genre, span: span);

  ConfigFixedActivityFreeHour.fromJson(Map<String, dynamic> json) {
    this.name = json["name"] as String;
    this.genre = json["genre"] as String;
    this.span = json["span"] as int;
    this.whenDia = json["whenDia"] as List<int>;
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "genre": genre,
        "span": span,
        "type": 2,
        "whenDia": whenDia,
      };
}

class ConfigActivityFreeHour extends ConfigActivity {
  String name;
  String genre;
  int span;

  ConfigActivityFreeHour({this.name, this.genre, this.span});

  ConfigActivityFreeHour.fromJson(Map<String, dynamic> json) {
    this.name = json["name"] as String;
    this.genre = json["genre"] as String;
    this.span = json["span"] as int;
  }

  Map<String, dynamic> toJson() =>
      {"name": this.name, "genre": this.genre, "span": span, "type": 3};
}

class Activity {
  ConfigActivity config;
  int start;
  Activity({this.config, this.start});
}
