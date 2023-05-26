import 'package:basic_mvvm_setup/models/joke_model.dart';
import 'package:basic_mvvm_setup/view_models/joke_viewmodel.dart';
import 'package:flutter/material.dart';

class JokesList extends StatelessWidget {
  const JokesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var jokeViewModel = JokeViewModel();

    return Dialog(
      clipBehavior: Clip.none,
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(20),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close),
                splashRadius: 10.0,
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<JokeModel>>(
                future: jokeViewModel.fetchjokes(),
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
                    List<JokeModel> jokes = snapshot.data!;
                    return ListView.builder(
                      itemCount: jokes.length,
                      itemBuilder: (context, index) {
                        JokeModel joke = jokes[index];
                        return ListTile(
                          title: Text(joke.setup!),
                          subtitle: Text(joke.punchline!),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: Text('No jokes available.'),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
