import 'package:flutter/material.dart';
import 'package:tlrt_lib/text_contrast/text_contrast.dart';

class AccountWidget extends StatelessWidget {
  Color color;
  String name;

  AccountWidget({
    Key? key,
    required this.color,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: color,
          ),
          child: const Icon(
            Icons.account_circle_rounded,
            color: Colors.white,
            size: 48,
          ),
        ),
        TextContrast(
          backgroundColor: Colors.black,
          data: name,
        ),
      ],
    );
  }
}
