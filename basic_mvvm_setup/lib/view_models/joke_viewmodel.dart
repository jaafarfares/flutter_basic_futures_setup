import 'package:basic_mvvm_setup/models/joke_model.dart';
import 'package:basic_mvvm_setup/repositories/jokes/joke_repositories.dart';
import 'package:basic_mvvm_setup/repositories/jokes/jokes_api.dart';
import 'package:dio/dio.dart';

class JokeViewModel {
  Future<JokeModel?> fetchjokes() async {
    return JokesApi().getjoke();
  }
}
/* class JokeViewModel {
  JokeModel? jokemodel;
  JokeViewModel({this.jokemodel});

  get id => jokemodel?.id;
  get type => jokemodel?.type;
  get punchline => jokemodel?.punchline;
  get setup => jokemodel?.setup;
} */
