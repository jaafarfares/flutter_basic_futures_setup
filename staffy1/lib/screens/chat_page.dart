import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:staffy/view_model/chat_view_model.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatViewModel>(
      init: ChatViewModel(),
      builder: (controller) => Scaffold(
          appBar: AppBar(
            title: Text(controller.name),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Center(
                child: Text(controller.name),
              ),
              ElevatedButton(
                  onPressed: () {
                    controller.dosomething();
                  },
                  child: Text("change name")),
            ],
          )),
    );
  }
}
