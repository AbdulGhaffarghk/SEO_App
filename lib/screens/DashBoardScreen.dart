import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:seo/constants.dart';

class DashBoardScreen extends StatefulWidget {

  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _selectedIndex = 0;
  int _selectedCircleIndex = 0;

  var title = ["NTHP", "STHP", "FOUNDATION", "DIRECT TEST"];

  var titleIcons = [FontAwesomeIcons.paperPlane, FontAwesomeIcons.algolia, FontAwesomeIcons.heartPulse, FontAwesomeIcons.ellipsis];

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

  void _onCircleTapped(int index) {
    
    setState(() {
      _selectedCircleIndex = index;
    });
    
    if (index == 0) {
      Navigator.pushNamed(context, '/nthp');
    } else if (index == 1) {
      Navigator.pushNamed(context, '/courses');
    } else if (index == 2) {
      Navigator.pushNamed(context, '/inbox');
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
        Container(
          width: double.infinity,
          height: 230,
          child: Card(color: primaryBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          margin: EdgeInsets.all(30),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(flex: 2,),
                    Text("TODAYS SPECIAL", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),),

                    Spacer(flex: 1,),
                
                    Text("Hurry! Today's your last chance \nfor a discount.", style: TextStyle(fontSize: 14, color: Colors.white),),
                    Spacer(flex: 3,),
                  ],
                ),
              ),
                Spacer(),
                Text("75%", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),),
                SizedBox(width: 30,),
            ],
          ),),
        ),

        SizedBox(height: 10,),

        Container(
          width: double.infinity,
          height: 200,
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...List.generate(title.length, (index) => 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => _onCircleTapped(index),
                      child: CircleAvatar(
                        backgroundColor: primaryBlue.withAlpha(30), radius: 35,
                        child: FaIcon(titleIcons[index], color: primaryBlue, size: 30,),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(title[index], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textGrey),),
                  ],
                ),
              ),
            ],
          ),        
          ),
      
      ],),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryBlue,
        unselectedItemColor: textGrey,
        onTap: (value) => _onItemTapped(value),
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(Icons.home),
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
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}