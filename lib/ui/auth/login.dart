import 'package:flutter/material.dart';
import 'package:nyalcf/dio/auth.dart';
import 'package:nyalcf/ui/model/AppbarActions.dart';

import '../../model/UserInfo.dart';
import '../model/FloatingActionButton.dart';

class Login extends StatefulWidget {
  const Login({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _LoginState(title: title);
}

class _LoginState extends State<Login> {
  _LoginState({required this.title});

  final title;

  final userController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    userController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Text("$title - 登录", style: const TextStyle(color: Colors.white)),
          backgroundColor: Colors.pink[100],
          actions: AppbarActions(context: context).actions(),
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(40.0),
            constraints: const BoxConstraints(maxWidth: 400.0),
            child: Column(children: <Widget>[
              const Text(
                "登录到LocyanFrp",
                style: TextStyle(fontSize: 30),
              ),
              Form(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(6.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "用户名",
                          icon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                        controller: userController,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(6.0),
                      child: TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "密码",
                          icon: Icon(Icons.key),
                          border: OutlineInputBorder(),
                        ),
                        controller: passwordController,
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () => {_login()}, child: Text("登录"))),
                  ],
                ),
              ),
            ]),
          ),
        ),
        floatingActionButton: FloatingActionButtonX().button());
  }

  _login() async {
    if (userController.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('请输入用户名'),
      ));
    } else if (passwordController.text == "") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('请输入密码'),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('正在登录...'),
      ));
      final res = await Auth()
          .requestLogin(userController.text, passwordController.text);
      if (res is UserInfo) {
        //UserInfoCache.info = res;
        //print(UserInfoCache.info);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('登录成功，欢迎您 ${res.UserName}'),
        ));
        Navigator.of(context).pushNamed("/panel/home");
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('登陆失败：${res}'),
        ));
      }
    }
  }
}