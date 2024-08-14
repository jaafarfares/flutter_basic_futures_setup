import 'package:flutter/material.dart';
import 'package:pneusshop_web/ui/views/home/sections/about_us/about_us_desktop.dart';
import 'package:pneusshop_web/ui/views/home/sections/contact_us/contact_us_desktop.dart';
import 'package:pneusshop_web/ui/views/home/sections/headear/header_desktop.dart';
import 'package:pneusshop_web/ui/views/home/sections/services/services_desktop.dart';
import 'package:pneusshop_web/ui/views/home/sections/stories/client_stories_desktop.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';

class HomeViewDesktop extends ViewModelWidget<HomeViewModel> {
  const HomeViewDesktop({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Desktop UI"),
        actions: [
          TextButton(
            onPressed: () => viewModel.scrollToSection(viewModel.homeKey),
            child: const Text('Home'),
          ),
          TextButton(
            onPressed: () => viewModel.scrollToSection(viewModel.aboutKey),
            child: const Text('About us'),
          ),
          TextButton(
            onPressed: () => viewModel.scrollToSection(viewModel.servicesKey),
            child: const Text('Services'),
          ),
          TextButton(
            onPressed: () => viewModel.scrollToSection(viewModel.clientStoriesKey),
            child: const Text('Client Stories'),
          ),
          TextButton(
            onPressed: () => viewModel.scrollToSection(viewModel.contactKey),
            child: const Text('Contact us'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: viewModel.scrollController,
        child: Column(
          children: [
            const HeaderDesktop(),
            ClientStoriesDesktop(key: viewModel.clientStoriesKey),
            ServicesDesktop(key: viewModel.servicesKey),
            ContactUsDesktop(key: viewModel.contactKey),
            AboutUsDesktop(key: viewModel.aboutKey),

            //Section(key: viewModel.homeKey, title: 'Home', color: Colors.blue),
            //Section(key: viewModel.aboutKey, title: 'About us', color: Colors.green),
            //Section(key: viewModel.servicesKey, title: 'Services', color: Colors.red),
            //Section(key: viewModel.clientStoriesKey, title: 'Client Stories / Startups Studio', color: Colors.orange),
            //Section(key: viewModel.contactKey, title: 'Contact us', color: Colors.purple),
          ],
        ),
      ),
    );
  }
}

/* class Section extends StatelessWidget {
  final GlobalKey key;
  final String title;
  final Color color;

  const Section({
    required this.key,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      height: 600, 
      color: color,
      child: Center(child: Text(title, style: TextStyle(fontSize: 32, color: Colors.white))),
    );
  }
} */
