import 'package:basic_mvvm_setup/models/joke_model.dart';
import 'package:basic_mvvm_setup/repositories/jokes/joke_repositories.dart';
import 'package:dio/dio.dart';

class JokesApi extends JokeRepository {
  @override
  Future<JokeModel> getjoke() async {
    JokeModel joke = JokeModel(); // Empty JokeModel object as default value
    try {
      var response =
          await Dio().get('https://official-joke-api.appspot.com/random_joke');
      var jsonData = response.data;
      joke = JokeModel.fromJson(jsonData);
    } catch (e) {
      print(e);
    }
    print('/*************///');

    print(joke);
    print('/*************///');

    return joke;
  }
}
