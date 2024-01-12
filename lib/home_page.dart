import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:invasi/register.dart';
import 'package:invasi/bottom_navigation.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // checkLoginStatus();
  }

  // Future<void> checkLoginStatus() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  //   if (isLoggedIn) {
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => BottomNav()));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(232, 232, 230, 1),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.3,
                // ),
                Container(
                  margin: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(78, 130, 110, 1),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(175),
                      topRight: Radius.circular(175),
                      bottomRight: Radius.circular(175),
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(30),
                    padding: const EdgeInsets.all(40),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(232, 232, 230, 0.7),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(175),
                        topRight: Radius.circular(175),
                        bottomRight: Radius.circular(175),
                      ),
                    ),
                    child: Form(
                      child: Column(
                        children: [
                          TextField(
                            controller: usernameController,
                            cursorColor: const Color.fromRGBO(5, 3, 4, 1),
                            decoration: const InputDecoration(
                              labelText: 'Username',
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(5, 3, 4, 1)),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(5, 3, 4, 1)),
                              ),
                              labelStyle:
                                  TextStyle(color: Color.fromRGBO(5, 3, 4, 1)),
                            ),
                          ),
                          TextField(
                            obscureText: true,
                            cursorColor: const Color.fromRGBO(5, 3, 4, 1),
                            controller: passwordController,
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(5, 3, 4, 1)),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(5, 3, 4, 1)),
                              ),
                              labelStyle:
                                  TextStyle(color: Color.fromRGBO(5, 3, 4, 1)),
                              // Warna kursor
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  onPressed: _handleLogin,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromRGBO(5, 3, 4, 1),
                                  ),
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(
                                        color:
                                            Color.fromRGBO(232, 232, 230, 1)),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 10),
                                    const Text(
                                      "Don't have an account yet?",
                                      style: TextStyle(
                                          color: Color.fromRGBO(5, 3, 4, 1)),
                                    ),
                                    const SizedBox(height: 10),
                                    InkWell(
                                      onTap: () {
                                        //Get.to(const Register());
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const Register(),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        'Sign Up!',
                                        style: TextStyle(
                                          // fontSize: 24,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void _handleLogin() async {
    String username = usernameController.text;
    String password = passwordController.text;

    // Validasi sederhana
    if (username.isNotEmpty && password.isNotEmpty) {
      if (username == "1234" && password == "1234") {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('isLoggedIn', true);
        // Get.to(const Home());
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const BottomNav()));
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Login Gagal"),
              content: const Text("Username atau password tidak valid."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Tutup"),
                ),
              ],
            );
          },
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Login Gagal"),
            content: const Text("Username atau password tidak boleh kosong."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Tutup"),
              ),
            ],
          );
        },
      );
    }
  }
}
