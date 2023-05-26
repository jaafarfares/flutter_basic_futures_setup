# Basic MVVM Setup

 a simple Flutter application that demonstrates the implementation of the Model-View-ViewModel (MVVM) architectural pattern. The MVVM pattern promotes separation of concerns by dividing the application into three components: the Model, the View, and the ViewModel

The project includes the following components:

* Models: The JokeModel represents a joke, consisting of a setup and a punchline. It is responsible for encapsulating the joke data.
* ViewModels: The JokeViewModel acts as the intermediary between the Model and the View. It retrieves joke data from the repository and provides it to the View for display. It also handles any business logic related to jokes.
* Repositories: The JokeRepository defines the contract for retrieving joke data. In this project, it is implemented by the JokesApi class, which uses the Dio package to make HTTP requests to an external API and retrieve jokes.
* Screens: The HomePage serves as the main screen of the application. It includes two buttons: the "press the button to get one joke " button fetches a random joke from the repository every time the user clicks it, while the "Get a List of jokes" button fetches a list of new jokes from the repository every time the user clicks it. The jokes are displayed using popup dialogs.
* Popups: The JokePopUp is a dialog that displays a joke fetched from the repository using the JokeViewModel. It includes an exit button to close the dialog, also The JokesLIts is a dialog that displays a list of jokes fetched from the repository using the JokeViewModel. It includes an exit button to close the dialog.

The project demonstrates the flow of data between the Model, ViewModel, and View using asynchronous operations and the FutureBuilder widget for handling asynchronous data retrieval. It also showcases the use of dependency injection to provide dependencies to the ViewModel and repository.

Overall, the "Basic MVVM Setup" project serves as a starting point for understanding and implementing the MVVM pattern in Flutter applications, showcasing the separation of concerns, efficient management of data flow.