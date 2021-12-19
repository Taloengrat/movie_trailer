import 'package:flutter/material.dart';
import 'package:tlrt_lib/text_contrast/text_contrast.dart';

class ListMenuWidget extends StatelessWidget {
  const ListMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {},
          selectedTileColor: Colors.black54,
          leading: Icon(Icons.check),
          title: TextContrast(data: 'My List', backgroundColor: Colors.black),
          selected: true,
          trailing: Icon(Icons.arrow_forward_ios_rounded),
        ),
        ListTile(
          onTap: () {},
          selectedTileColor: Colors.black54,
          leading: Icon(Icons.settings),
          title: TextContrast(data: 'Settings', backgroundColor: Colors.black),
          selected: true,
          trailing: Icon(Icons.arrow_forward_ios_rounded),
        ),
        ListTile(
          onTap: () {},
          selectedTileColor: Colors.black54,
          leading: Icon(Icons.help_outline_rounded),
          title: TextContrast(data: 'Help', backgroundColor: Colors.black),
          selected: true,
          trailing: Icon(Icons.arrow_forward_ios_rounded),
        ),
      ],
    );
  }
}
