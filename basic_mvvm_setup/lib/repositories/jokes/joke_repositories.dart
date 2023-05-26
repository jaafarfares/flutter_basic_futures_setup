import 'package:basic_mvvm_setup/models/joke_model.dart';

abstract class JokeRepository {
  Future<JokeModel> getjoke();
  Future<List<JokeModel>> getjokes();
}
