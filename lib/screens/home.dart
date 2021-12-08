import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uenr_estate/controllers/authentication.dart';

import 'package:uenr_estate/controllers/user_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final userController = Get.put(UserController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 65,
                          height: 65,
                          child: CircleAvatar(
                            child: GetX<UserController>(builder: (controller) {
                              return Text(
                                controller.user,
                                style: const TextStyle(
                                  fontSize: 25,
                                  letterSpacing: 5,
                                ),
                              );
                            }),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Authentication.userLogout();
                              Navigator.of(context)
                                  .popAndPushNamed('/authenticateUser');
                            },
                            child: const Text('Logout'))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text('Welcome to Uenr Estate',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                  const Text(
                    '',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomCard(
                    label: 'Notice',
                    icon: Icons.calendar_today_outlined,
                    onpressed: () {
                      Navigator.of(context).pushNamed('/notice');
                    },
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomCard(
                        label: 'Complaint',
                        icon: Icons.question_answer,
                        onpressed: () {
                          Navigator.of(context).pushNamed('/complaint');
                        },
                      ),
                      const SizedBox(width: 15),
                      CustomCard(
                        label: 'Allowance',
                        icon: Icons.monetization_on_outlined,
                        onpressed: () {
                          Navigator.of(context).pushNamed('/allowance');
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    ));
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.icon,
    required this.label,
    this.count = 0,
    required this.onpressed,
  }) : super(key: key);
  final int count;
  final String label;
  final IconData icon;
  final Function onpressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      height: 180,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      shape: BoxShape.circle),
                  child: IconButton(
                    onPressed: () => onpressed(),
                    icon: const Icon(Icons.add),
                  ),
                ),
              ),
              Container(width: double.infinity, height: 50, color: Colors.blue),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      child: Icon(icon),
                    ),
                    const SizedBox(height: 15),
                    Text(label,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 20),
                    // Text(count.toString())
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
