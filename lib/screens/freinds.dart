import 'package:flutter/material.dart';
import 'package:seo/constants.dart';

class InviteFriendsScreen extends StatefulWidget {
  @override
  _InviteFriendsScreenState createState() => _InviteFriendsScreenState();
}

class _InviteFriendsScreenState extends State<InviteFriendsScreen> {
  final List<Map<String, dynamic>> friends = [
    {"name": "Yousuf Ahmed", "invited": false},
    {"name": "Ali Hassan", "invited": false},
    {"name": "Tariq Omar", "invited": true},
    {"name": "Imran Bilal", "invited": false},
    {"name": "Salman Zain", "invited": true},
    {"name": "Rashid Saif", "invited": false},
    {"name": "Fahad Mustafa", "invited": false},
    {"name": "Abdullah Khalid", "invited": true},
  ];

  void _inviteFriend(int index) {
    setState(() {
      friends[index]["invited"] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Invite Friends"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: friends.length,
        itemBuilder: (context, index) {
          final friend = friends[index];
          return ListTile(
            leading: CircleAvatar(child: Icon(Icons.person,color: primaryBlue,),backgroundColor: primaryBlue.withAlpha(30),),
            title: Text(friend["name"],style: TextStyle(color: textBlack),),
            subtitle: Text("Facebook friend",style: TextStyle(color: textGrey),),
            trailing: friend["invited"]
                ? OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(primaryBlue.withAlpha(30)),
                    foregroundColor: WidgetStateProperty.all(Colors.grey),
                  ),
                    onPressed: null,
                    child: Text("Invited"),
                  )
                : ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor: WidgetStateProperty.all(Colors.white),
                    ),
                    onPressed: () => _inviteFriend(index),
                    child: Text("Invite",style: TextStyle(color: primaryBlue),),
                  ),
          );
        },
      ),
    );
  }
}

