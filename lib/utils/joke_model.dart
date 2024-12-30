class Joke {
  final String joke;

  Joke({required this.joke});

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(joke: json['joke']);
  }

  Map<String, dynamic> toJson() {
    return {'joke': joke};
  }
}
