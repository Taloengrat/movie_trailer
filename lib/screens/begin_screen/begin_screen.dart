import 'package:flutter/material.dart';
import 'package:movie_trailer/screens/begin_screen/components/signin_coponent.dart';
import 'package:tlrt_lib/text_contrast/text_contrast.dart';

import 'components/signup_component.dart';

class BeginScreen extends StatefulWidget {
  static const routeName = '/';
  const BeginScreen({Key? key}) : super(key: key);

  @override
  State<BeginScreen> createState() => _BeginScreenState();
}

class _BeginScreenState extends State<BeginScreen> {
  bool isSignup = false;

  bool signupIsPress = false;
  bool signinIsPress = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child:
                  isSignup ? const SignupComponent() : const SigninComponent(),
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Row(
          children: [
            Expanded(
              child: Listener(
                onPointerDown: (detail) => setState(() => signinIsPress = true),
                onPointerUp: (detail) => setState(() => signinIsPress = false),
                child: ElevatedButton(
                  onPressed: () => setState(() => isSignup = false),
                  child: TextContrast(
                    data: 'Signin',
                    backgroundColor:
                        signinIsPress ? Colors.white : Colors.black,
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.white;
                        }

                        return Colors.black; // Use the component's default.
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Listener(
                onPointerDown: (detail) => setState(() => signupIsPress = true),
                onPointerUp: (detail) => setState(() => signupIsPress = false),
                child: ElevatedButton(
                  onPressed: () => setState(() => isSignup = true),
                  child: TextContrast(
                    data: 'Signup',
                    backgroundColor:
                        signupIsPress ? Colors.black : Colors.white,
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.black;
                        }

                        return Colors.white; // Use the component's default.
                      },
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
