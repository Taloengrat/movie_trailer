import 'package:flutter/material.dart';
import 'package:tlrt_lib/text_contrast/text_contrast.dart';

class EditProfileButtonWidget extends StatelessWidget {
  const EditProfileButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.edit,
            color: Colors.white,
          ),
          SizedBox(
            width: 8,
          ),
          TextContrast(
            data: 'Edit Profile',
            backgroundColor: Colors.black,
          )
        ],
      ),
    );
  }
}
