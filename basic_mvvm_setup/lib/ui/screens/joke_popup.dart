import 'package:basic_mvvm_setup/models/joke_model.dart';
import 'package:basic_mvvm_setup/repositories/jokes/joke_repositories.dart';
import 'package:basic_mvvm_setup/repositories/jokes/jokes_api.dart';
import 'package:basic_mvvm_setup/view_models/joke_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:basic_mvvm_setup/ui/screens/home_page.dart';

class JokePopUp extends StatelessWidget {
  const JokePopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var jokeViewModel = JokeViewModel();

    return Container(
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(20),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: FutureBuilder<JokeModel?>(
            future: jokeViewModel.fetchjoke(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (snapshot.hasData) {
                JokeModel? joke = snapshot.data;
                return Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(Icons.close),
                        splashRadius: 10.0,
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Joke:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            joke?.setup ?? '',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Punchline:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            joke?.punchline ?? '',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return Center(
                  child: Text('No joke available.'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}







/* class JokePopUp extends StatelessWidget {
  const JokePopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var joke = JokeViewModel();

    return Container(
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(20),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  splashRadius: 10.0,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Center(
                child: Text(joke.fetchjokes().toString()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
 */
