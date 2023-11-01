import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wersomd_app/views/auth/sign_in.dart';
import 'package:wersomd_app/widgets/custom_app_bar.dart';
import 'package:wersomd_app/widgets/drawer/custom_drawer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final user = FirebaseAuth.instance.currentUser;

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  void _signIn() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SignInPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      appBar: CustomAppBar(
        scaffoldKey: _scaffoldKey,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 40),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Container(
                margin: const EdgeInsets.only(top: 80),
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(24.0),
                  border: Border.all(color: Colors.deepPurpleAccent, width: 2),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 80.0,
                      backgroundColor: Colors.deepPurpleAccent,
                      child: CircleAvatar(
                        radius: 76.0,
                        backgroundImage: AssetImage('assets/images/luvr.webp'),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: CircleAvatar(
                            backgroundColor: Colors.deepPurpleAccent,
                            radius: 24.0,
                            child: Icon(
                              Icons.camera_alt,
                              size: 22.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      user != null ? '${user!.displayName}' : 'Вы не вошли',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      user != null ? '${user!.email}' : ' ',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 5,
                right: 5,
              ),
              child: Container(
                margin: EdgeInsets.only(top: size.height / 3),
                height: size.height / 2.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  color: Colors.transparent,
                  border: Border.all(width: 2, color: Colors.deepPurpleAccent),
                ),
                child: Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 20, right: 16, left: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        user != null
                            ? ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(size.width, 60),
                                  backgroundColor: Colors.deepPurpleAccent,
                                  side: const BorderSide(
                                    color: Colors.white,
                                    width: 2.0,
                                  ),
                                ),
                                child: const Text(
                                  'Изменить',
                                  style: TextStyle(fontSize: 18),
                                ),
                              )
                            : Container(),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            user != null ? _signOut() : _signIn();
                          },
                          icon: const Icon(Icons.exit_to_app),
                          label: Text(
                            user != null ? 'Выйти' : 'Войти',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(size.width, 60),
                            elevation: 0,
                            backgroundColor: Colors.deepPurpleAccent,
                            side: const BorderSide(
                              width: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
