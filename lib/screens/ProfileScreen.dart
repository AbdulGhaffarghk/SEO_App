import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seo/constants.dart';

class ProfileScreen extends StatefulWidget {

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedIndex = 3;

  var title = ["Edit profile","Settings","Privacy Policy","invite Friends","Sign out"];

  var titleIcons = [Icons.person,Icons.settings,Icons.screen_lock_portrait,Icons.group,FontAwesomeIcons.rightFromBracket];

  void _onItemTapped(int index) {
    
    setState(() {
      selectedIndex = index;
    });
      if (index == 0) {
        Navigator.pushReplacementNamed(context, '/home');
      } else if (index == 1) {
        Navigator.pushReplacementNamed(context, '/courses');
      } else if (index == 2) {
        Navigator.pushReplacementNamed(context, '/jobs');
      } else if (index == 3) {
        Navigator.pushReplacementNamed(context, '/profile');
      }
  }

  void navigatorToButton(int index) {
    
    if (index == 0) {
      // Navigate to Edit Profile
      Navigator.pushNamed(context, '/editProfile');
    } else if (index == 1) {
      // Navigate to Settings
      Navigator.pushNamed(context, '/settings');
    } else if (index == 2) {
      // Navigate to Privacy Policy
      Navigator.pushNamed(context, '/privacyPolicy');
    } else if (index == 3) {
      // Navigate to Invite Friends
      Navigator.pushNamed(context, '/inviteFriends');
    } else if (index == 4) {
      // Sign out logic here
      Navigator.pushReplacementNamed(context, '/onboarding');

    }
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("My Profile", style: TextStyle(color: textBlack, fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      body: Column(children: [
        SizedBox(height: 10,),
        Center(
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage("assets/photo.jpg"),
          ),
        ),
        SizedBox(height: 10,),
          Text("Shahib Hussain", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textBlack),),
        SizedBox(height: 5,),
        Text("Shahibhussain482@gmail.com", style: TextStyle(fontSize: 16, color: textGrey),),
        SizedBox(height: 10,),

        Expanded(
          child: ListView.separated(itemBuilder: (context, index) {
          return ListTile(
            onTap: () => navigatorToButton(index),
            leading: CircleAvatar(
              backgroundColor: primaryBlue.withAlpha(35),
              child: FaIcon(titleIcons[index],
                color: title[index] != "Sign out" ? primaryBlue : Colors.redAccent,size: 18,),
            ),
            title: Text(title[index],style: TextStyle(color: title[index] == "Sign out" ? Colors.redAccent : textBlack,fontSize: 13,fontWeight: FontWeight.bold),),
            trailing: Icon(Icons.arrow_forward_ios,color: textGrey,size: 15,),
          );
                },  
                itemCount: title.length, separatorBuilder: (BuildContext context, int index) { 
          return Divider(height: 20,thickness: 0.1,color: textGrey,);
                 },
          
                ),
        )
      ],),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryBlue,
        unselectedItemColor: textGrey,
        onTap: (value) => _onItemTapped(value),
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(Icons.home_outlined,),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: FaIcon(Icons.book_outlined),
            label: 'My Courses',
          ),
          const BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.briefcase),
            label: 'Jobs',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}