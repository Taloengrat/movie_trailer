import 'package:flutter/material.dart';
import 'package:movie_trailer/screens/account_screen/widgets/account_widget.dart';
import 'package:movie_trailer/screens/account_screen/widgets/edit_profile_button_widget.dart';
import 'package:movie_trailer/screens/account_screen/widgets/list_menu_widget.dart';
import 'package:tlrt_lib/text_contrast/text_contrast.dart';

class AccountScreen extends StatelessWidget {
  static const routeName = '/account-screen';
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              AccountWidget(
                color: Colors.redAccent,
                name: 'name1',
              ),
              AccountWidget(
                color: Colors.greenAccent,
                name: 'name2',
              ),
              AccountWidget(
                color: Colors.blueGrey,
                name: 'name3',
              ),
              AccountWidget(
                color: Colors.orangeAccent,
                name: 'name4',
              ),
              AccountWidget(
                color: Colors.blue,
                name: 'name5',
              ),
            ],
          ),
          const EditProfileButtonWidget(),
          const ListMenuWidget(),
        ],
      ),
    );
  }
}
