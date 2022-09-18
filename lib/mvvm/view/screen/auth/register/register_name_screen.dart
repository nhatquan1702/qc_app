import 'package:chat_app/mvvm/view/component/base_button.dart';
import 'package:flutter/material.dart';

class RegisterName extends StatefulWidget {
  const RegisterName({Key? key}) : super(key: key);

  @override
  RegisterNameState createState() => RegisterNameState();
}

class RegisterNameState extends State<RegisterName> {
  double appBar = AppBar().preferredSize.height;

  var formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: appBar,
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.fromLTRB(22, 0, 0, 0),
            child: const Text(
              "Tên",
              style: TextStyle(fontSize: 17),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.fromLTRB(22, 10, 0, 0),
            child: const Text(
              "Nên sử dụng tên thật để giúp bạn bè dễ nhận ra bạn.",
              style: TextStyle(fontSize: 13),
            ),
          ),
          const SizedBox(
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Form(
              key: formKey,
              child: TextFormField(
                  controller: email,
                  autofocus: false,
                  style: const TextStyle(
                    fontSize: 22,
                  ),
                  decoration: const InputDecoration(
                      hintText: "Gồm 2-40 kí tự",
                      hintStyle: TextStyle(color: Colors.grey)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'あなたのメールアドレスを入力してください';
                    } else if (!RegExp(
                            r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                        .hasMatch(value)) {
                      return '無効なメール';
                    }
                    return null;
                  }),
            ),
          ),
          BaseButtonFilled(
            title: "Tiếp tục",
            color: Colors.purpleAccent,
            rootContext: context,
            onTap: () {
              //Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegisterNumberPhone()));
            },
          )
        ],
      ),
    );
  }

  void handler(BuildContext context, Function() a) {
    if (formKey.currentState!.validate()) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => a()));
    }
  }
}
