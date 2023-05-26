import 'package:basic_mvvm_setup/models/joke_model.dart';
import 'package:basic_mvvm_setup/repositories/jokes/joke_repositories.dart';
import 'package:dio/dio.dart';

class JokesApi extends JokeRepository {
  @override
  Future<JokeModel> getjoke() async {
    JokeModel joke = JokeModel();
    try {
      var response =
          await Dio().get('https://official-joke-api.appspot.com/random_joke');
      var jsonData = response.data;
      joke = JokeModel.fromJson(jsonData);
    } catch (e) {
      print(e);
    }

    return joke;
  }

  @override
  Future<List<JokeModel>> getjokes() async {
    List<JokeModel> jokes = [];
    try {
      var response =
          await Dio().get('https://official-joke-api.appspot.com/random_ten');
      var jsonData = response.data as List;
      jokes = jsonData.map((joke) => JokeModel.fromJson(joke)).toList();
    } catch (e) {
      print(e);
    }
    print('/*************///');

    print(jokes);
    print('/*************///');

    return jokes;
  }
}
