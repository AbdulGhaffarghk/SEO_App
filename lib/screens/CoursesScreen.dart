import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seo/constants.dart';

class CoursesScreen extends StatefulWidget {

  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  int _selectedIndex = 1;

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
        // backgroundColor: Colors.amberAccent,
      ),
      ),
      body: Column(children: [
        
      ],),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryBlue,
        unselectedItemColor: textGrey,
        selectedLabelStyle: TextStyle(color: primaryBlue),
        onTap: (value) => _onItemTapped(value),
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(Icons.home_outlined,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: const FaIcon(Icons.book,),
            label: 'My Courses',
          ),
          const BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.briefcase),
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