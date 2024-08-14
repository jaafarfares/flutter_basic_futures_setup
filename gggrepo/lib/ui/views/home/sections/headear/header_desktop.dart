import 'package:flutter/material.dart';
import 'package:get/get.dart';




class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     // key: key,
      height: 700 ,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('bg/bg2.jpeg'),
          fit: BoxFit.cover,
        ),
        
      ),
      child: Row(
        children: [
          Container(
            color: Colors.black.withOpacity(0.5),
            width: Get.width / 1.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const Text(
                  'Welcome to',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              const  Text(
                  'G-Tech',
                  style: TextStyle(
                    fontSize: 80,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
               const Text(
                  'Define Your future with us',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                  //  Get.toNamed('/contact');
                  },
                  style: ElevatedButton.styleFrom(
                 //   primary: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20,
                    ),
                  ),
                  child: const Text(
                    'Contact Us',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
         
        ],
      ),
    );
  }
}