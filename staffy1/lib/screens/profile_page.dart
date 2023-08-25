import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:staffy/models/user_model.dart';
import 'package:staffy/screens/custom_widgets/custom_sizedbox.dart';
import 'package:staffy/screens/widgets/edit_profile_popup.dart';
import 'package:staffy/tools/constance.dart';
import 'package:staffy/view_model/profile_view_model.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => controller.loading.value
          ? const Center(
              child: CircularProgressIndicator(
                color: primarycolor,
              ),
            )
          : Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CustomSizedBox(height: 60),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(140),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 10,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                radius: 70,
                                backgroundImage: controller.userModel?.photo ==
                                        null
                                    ? const AssetImage(
                                        'lib/asstes/images/default_user.png')
                                    : controller.userModel?.photo == 'default'
                                        ? const AssetImage(
                                            'lib/asstes/images/default_user.png')
                                        : NetworkImage(
                                                controller.userModel!.photo)
                                            as ImageProvider<Object>,
                              ),
                            ),
                            Positioned(
                                bottom: 4,
                                right: 9,
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  child: InkWell(
                                    onTap: () {
                                      controller.selectImageAndUpdateFirestore(
                                          ImageSource.gallery);
                                    },
                                    child: Icon(
                                      Icons.add_a_photo,
                                      size: 15.0,
                                      color: Color(0xFF404040),
                                    ),
                                  ),
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                ))
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const CustomSizedBox(height: 20),
                            if (controller.userModel?.email != null)
                              Container(
                                child: Text(
                                  controller.userModel!.name,
                                  style: const TextStyle(
                                    color: blackcolor,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            const CustomSizedBox(height: 20),
                            if (controller.userModel?.email != null)
                              Container(
                                child: Text(
                                  controller.userModel!.profession,
                                  style: const TextStyle(
                                      color: blackcolor, fontSize: 17),
                                ),
                              ),
                            const CustomSizedBox(height: 10),
                            if (controller.userModel?.userid != null)
                              Container(
                                child: Text(
                                  "phone:  " +
                                      controller.userModel!.phoneNumber,
                                  style: const TextStyle(
                                      color: blackcolor, fontSize: 17),
                                ),
                              ),
                            const CustomSizedBox(height: 20),
                            if (controller.userModel?.email != null)
                              Row(
                                children: [
                                  const Text("company name:   ",
                                      style: TextStyle(color: blackcolor)),
                                  Container(
                                    child: Text(
                                      controller.userModel!.companyName,
                                      style:
                                          const TextStyle(color: primarycolor),
                                    ),
                                  ),
                                ],
                              ),
                            if (controller.userModel?.email != null)
                              Row(
                                children: [
                                  const Text("C,UID:",
                                      style: TextStyle(color: blackcolor)),
                                  Container(
                                    child: Text(
                                      controller.userModel!.companyUID,
                                      style:
                                          const TextStyle(color: primarycolor),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ],
                    ),
                    const CustomSizedBox(height: 100),
                    Container(
                      child: TextButton(
                        onPressed: () async {
                          var tim = DateTime.now().toString().substring(0, 10);
                          print(tim);

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return ProfilePopup();
                            },
                          );
                        },
                        child: const ListTile(
                          title: Text("edit profile"),
                          leading: Icon(
                            Icons.edit,
                            color: primarycolor,
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),
                    Container(
                      child: TextButton(
                        onPressed: () {},
                        child: const ListTile(
                          title: Text("you history"),
                          leading: Icon(
                            Icons.history,
                            color: primarycolor,
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),
                    Container(
                      child: TextButton(
                        onPressed: () {},
                        child: const ListTile(
                          title: Text("your Compay meating"),
                          leading: Icon(
                            Icons.meeting_room,
                            color: primarycolor,
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),
                    Container(
                      child: TextButton(
                        onPressed: () {
                          controller.signout();
                        },
                        child: const ListTile(
                          title: Text("logout"),
                          leading: Icon(
                            Icons.logout,
                            color: primarycolor,
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
