import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(232, 232, 230, 1),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Username',
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Full Name',
                          ),
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromRGBO(5, 3, 4, 1),
                                ),
                                child: const Text(
                                  "Register",
                                  style: TextStyle(
                                      color: Color.fromRGBO(232, 232, 230, 1)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
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
