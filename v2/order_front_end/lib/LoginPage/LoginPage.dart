import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_front_end/LoginPage/GetX_LoginPage.dart';
import 'package:order_front_end/OrderMainPage/OrderMainPage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var LoginPageGet = LoginPageGetx();

    final idController = TextEditingController(text: '127.0.0.1');
    final pwController = TextEditingController(text: '12345678');
    final pwFocus = FocusNode();

    @override
    void dispose() {
      idController.dispose();
      pwController.dispose();
      pwFocus.dispose();
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 40,
                  )),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: Column(
                children: [
                  Expanded(flex: 2, child: Container()),
                  Expanded(
                    flex: 4,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      // color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Column(
                            children: [
                              Center(
                                  child: TextFormField(
                                controller: idController,
                                onFieldSubmitted: (_) => FocusScope.of(context)
                                    .requestFocus(pwFocus),
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  labelText: 'ID',
                                  labelStyle: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                              Center(
                                child: TextFormField(
                                  controller: pwController,
                                  obscureText: true,
                                  focusNode: pwFocus,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    labelText: 'Password',
                                    labelStyle: TextStyle(
                                        color: Colors.white, fontSize: 25),
                                  ),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    color: Colors.white,
                                    child: TextButton(
                                        onPressed: () async {
                                          LoginPageGet.postLoginData(
                                              idController.text,
                                              pwController.text);
                                          await Future.delayed(
                                              Duration(milliseconds: 500));
                                          if (LoginPageGet.loginDetect ==
                                              true) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      OrderMainPage()),
                                            );
                                          }
                                        },
                                        child: Text(
                                          '登入',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 30),
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(flex: 4, child: Container()),
                ],
              )),
        ),
      ),
    );
  }
}
