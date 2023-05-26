import 'package:basic_mvvm_setup/models/joke_model.dart';
import 'package:basic_mvvm_setup/repositories/jokes/joke_repositories.dart';

class JokesLocal extends JokeRepository{
  @override
  Future<JokeModel> getjoke() {
    // TODO: implement getjoke
    throw UnimplementedError();
  }
    @override
  Future<List<JokeModel>> getjokes() {
    // TODO: implement getjoke
    throw UnimplementedError();
  }
  
}
