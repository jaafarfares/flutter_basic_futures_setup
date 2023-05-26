class JokeModel {
  int? id;
  String? type;
  String? setup;
  String? punchline;

  JokeModel({this.id, this.punchline, this.setup, this.type});

  factory JokeModel.fromJson(Map<String, dynamic> json) {
    return JokeModel(
      id: json['id'],
      type: json['type'],
      setup: json['setup'],
      punchline: json['punchline'],
    );
  }

  @override
  String toString() {
    return 'Joke: $setup\nPunchline: $punchline';
  }
}
