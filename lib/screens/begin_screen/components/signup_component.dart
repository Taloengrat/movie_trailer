import 'package:flutter/material.dart';
import 'package:tlrt_lib/decoration_style/tlrt_container_txt_decoration.dart';
import 'package:tlrt_lib/decoration_style/tlrt_input_decoration.dart';
import 'package:tlrt_lib/validators/enums/Validator.dart';
import 'package:tlrt_lib/validators/tlrt_validator.dart';

class SignupComponent extends StatefulWidget {
  const SignupComponent({Key? key}) : super(key: key);

  @override
  _SignupComponentState createState() => _SignupComponentState();
}

class _SignupComponentState extends State<SignupComponent> {
  final _formKey = GlobalKey<FormState>();
  bool isVisiblePassword = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.account_circle_rounded,
              size: 128,
              color: Colors.white,
            ),
            Container(
              padding: const EdgeInsets.only(left: 16),
              decoration: TlrtContainerTxtDecoration(color: Colors.white),
              child: TextFormField(
                decoration: TlrtInputDecoration(
                  hintText: 'Username',
                  isPassword: false,
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
                    onPressed: () =>
                        setState(() => isVisiblePassword = !isVisiblePassword),
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
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.only(left: 16),
              decoration: TlrtContainerTxtDecoration(color: Colors.white),
              child: TextFormField(
                obscureText: isVisiblePassword,
                decoration: TlrtInputDecoration(
                  hintText: 'Confirm Password',
                  isPassword: true,
                  suffixIcon: IconButton(
                    onPressed: () =>
                        setState(() => isVisiblePassword = !isVisiblePassword),
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
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {}
              },
              child: const Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
