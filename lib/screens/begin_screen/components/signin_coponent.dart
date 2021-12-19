import 'package:flutter/material.dart';
import 'package:movie_trailer/screens/main_screen/main_screen.dart';
import 'package:tlrt_lib/decoration_style/tlrt_container_txt_decoration.dart';
import 'package:tlrt_lib/decoration_style/tlrt_input_decoration.dart';
import 'package:tlrt_lib/validators/enums/Validator.dart';
import 'package:tlrt_lib/validators/tlrt_validator.dart';

class SigninComponent extends StatefulWidget {
  const SigninComponent({Key? key}) : super(key: key);

  @override
  _SigninComponentState createState() => _SigninComponentState();
}

class _SigninComponentState extends State<SigninComponent> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  bool isVisiblePassword = true;
  bool _isUserError = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(32),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 7,
                      color: Colors.black,
                      offset: Offset(1, 1), // c
                      spreadRadius: 3,
                    ),
                  ],
                ),
                child: Image.asset(
                  'assets/movie-logo.png',
                  scale: 2,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: EdgeInsets.only(
                  left: 16,
                  bottom: _isUserError ? 16 : 0,
                ),
                decoration: TlrtContainerTxtDecoration(
                  color: Colors.white,
                ),
                child: TextFormField(
                  controller: _usernameController,
                  decoration: TlrtInputDecoration(
                    hintText: 'Username',
                    isPassword: false,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      _isUserError = true;
                      return 'Please enter your username';
                    }

                    _isUserError = false;
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.only(left: 16),
                decoration: TlrtContainerTxtDecoration(color: Colors.white),
                child: TextFormField(
                  obscureText: isVisiblePassword,
                  decoration: TlrtInputDecoration(
                    hintText: 'Password',
                    isPassword: true,
                    suffixIcon: IconButton(
                      onPressed: () => setState(
                          () => isVisiblePassword = !isVisiblePassword),
                      icon: Icon(
                        isVisiblePassword
                            ? Icons.visibility_off_rounded
                            : Icons.visibility_rounded,
                      ),
                    ),
                  ),
                  validator: (value) => TlrtValidation(
                    validators: [
                      ValidatorRequire(),
                      ValidatorLength(8),
                    ],
                    value: value!,
                  ).validate(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).pushNamed(MainScreen.routeName);
                  }
                },
                child: const Text('Signin'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
