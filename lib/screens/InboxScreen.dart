import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seo/constants.dart';

class InboxScreen extends StatefulWidget {

  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    
    setState(() {
      _selectedIndex = index;
    });
      if (index == 0) {
        Navigator.pushReplacementNamed(context, '/home');
      } else if (index == 1) {
        Navigator.pushReplacementNamed(context, '/courses');
      } else if (index == 2) {
        Navigator.pushReplacementNamed(context, '/inbox');
      } else if (index == 3) {
        Navigator.pushNamed(context, '/profile');
      }
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        actionsPadding: EdgeInsets.only(right: 10,),
        leadingWidth: 60,
        
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: CircleAvatar(backgroundImage: AssetImage("assets/photo.jpg"), radius: 30, backgroundColor: Colors.transparent,),
        ),
        actions: [
          Icon(Icons.search,color: primaryBlue,),
          SizedBox(width: 10,),
          Icon(Icons.notifications,color: primaryBlue,),
          SizedBox(width: 10,),
        ],

        title:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Good Morning",style: TextStyle(fontSize: 14,color: textGrey),),
          Text("Shahib Hussain",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: textBlack),),
        ]
      ),
      ),
      body: Column(children: [
        
      ],),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
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
            // ignore: deprecated_member_use
            icon: FaIcon(FontAwesomeIcons.briefcaseClock),
            label: 'Jobs',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}