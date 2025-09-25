import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        ListTile(
          leading: Icon(Icons.color_lens),
          title: Text("Theme"),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text("Notifications"),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {},
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.lock),
          title: Text("Privacy"),
          trailing: Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {},
        ),
      ],
    );
  }
}
