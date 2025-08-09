import 'package:flutter/material.dart';
import 'package:seo/constants.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.language,color: primaryBlue,),
            title: Text("Language",style: TextStyle(color: textBlack),),
            trailing: Icon(Icons.arrow_forward_ios, size: 16,color: textGrey,),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.notifications,color: primaryBlue,),
            title: Text("Notifications",style: TextStyle(color: textBlack),),
            trailing: Icon(Icons.arrow_forward_ios, size: 16,color: textGrey,),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.lock,color: primaryBlue,),
            title: Text("Change Password",style: TextStyle(color: textBlack),),
            trailing: Icon(Icons.arrow_forward_ios, size: 16,color: textGrey,),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

