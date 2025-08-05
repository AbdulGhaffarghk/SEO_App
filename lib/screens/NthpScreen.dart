import 'package:flutter/material.dart';
import 'package:seo/constants.dart';

class Nthpscreen extends StatefulWidget {

  const Nthpscreen({super.key});

  @override
  State<Nthpscreen> createState() => _NthpscreenState();
}

class _NthpscreenState extends State<Nthpscreen> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        actionsPadding: EdgeInsets.only(right: 10,),
        leadingWidth: 60,
        centerTitle: true,
        actions: [
          Icon(Icons.search,color: primaryBlue,),
          SizedBox(width: 10,),
          Icon(Icons.notifications,color: primaryBlue,),
          SizedBox(width: 10,),
        ],

        title: Text("NTHP",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: textBlack),),
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

        DropdownButton(
          hint: Text("Select Course"),
          items: ["hello"].map((course) {
            return DropdownMenuItem(
              value: course,
              child: Text(course),
            );
          }).toList(),
          icon: Icon(Icons.arrow_drop_down, color: primaryBlue,),
          iconSize: 30,
          style: TextStyle(color: textBlack, fontSize: 30),
          isExpanded: true,
          padding: EdgeInsets.all(20),
          
          isDense: true,  
          onChanged: (value) {  },),

      ],),
      
    );
  }
}