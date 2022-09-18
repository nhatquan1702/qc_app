import 'package:chat_app/mvvm/view/screen/auth/register/register_number_phone_screen.dart';
import 'package:chat_app/mvvm/view/screen/home/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  bool _isObscure = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController passController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  void updateStatus() {
    setState(
      () {
        _isObscure = !_isObscure;
      },
    );
  }

  bool changeButton = false;
  moveToHome(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 2));
      // ignore: use_build_context_synchronously
      await Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()));
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context);
    return Scaffold(
      backgroundColor: appColor.cardColor,
      resizeToAvoidBottomInset: false,
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Center(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage('assets/images/logo_chat_app.png'),
                        height: 144,
                        width: 144,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextFormField(
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          controller: phoneController,
                          decoration: InputDecoration(
                            floatingLabelStyle: TextStyle(
                                color: appColor.canvasColor.withOpacity(0.5)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: appColor.primaryColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: appColor.canvasColor.withOpacity(0.5),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            labelText: "Số điện thoại",
                            suffixStyle:
                                TextStyle(color: appColor.primaryColor),
                            labelStyle: TextStyle(
                                color: appColor.canvasColor.withOpacity(0.5)),
                            hintText: "Nhập số điện thoại",
                            hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: appColor.canvasColor.withOpacity(0.5)),
                          ),
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                              return "Số điện thoại không hợp lệ!";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: TextFormField(
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          controller: passController,
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                            floatingLabelStyle: TextStyle(
                                color: appColor.canvasColor.withOpacity(0.5)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: appColor.primaryColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: appColor.canvasColor.withOpacity(0.5),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            labelText: "Mật khẩu",
                            hintText: "Nhập mật khẩu",
                            hintStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () => updateStatus(),
                              icon: _isObscure
                                  ? Icon(
                                      Icons.visibility_off,
                                      color:
                                          appColor.canvasColor.withOpacity(0.5),
                                    )
                                  : Icon(
                                      Icons.visibility,
                                      color:
                                          appColor.canvasColor.withOpacity(0.5),
                                    ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                    .hasMatch(value)) {
                              return "Mật khẩu không hợp lệ!";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      //Custom button login animation by Quang Pham
                      Material(
                        color: appColor.primaryColor,
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 10),
                        child: InkWell(
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 2),
                            height: 50,
                            width: changeButton
                                ? 50
                                : MediaQuery.of(context).size.width - 32,
                            alignment: Alignment.center,
                            child: changeButton
                                ? Icon(
                                    Icons.done,
                                    color: appColor.cardColor,
                                  )
                                : Text(
                                    "Đăng nhập",
                                    style: TextStyle(
                                      color: appColor.cardColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: InkWell(
                          child: Text(
                            'Quên mật khẩu',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: appColor.canvasColor.withOpacity(0.5),
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 32,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      child: Text(
                        'Bạn chưa có tài khoản? ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: appColor.canvasColor.withOpacity(0.5),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) =>
                                const RegisterWithPhoneNumber()));
                      },
                      child: Text(
                        'Đăng ký',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: appColor.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
