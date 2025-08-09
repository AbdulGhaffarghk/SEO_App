import 'package:flutter/material.dart';
import 'package:seo/constants.dart';

class FourButtonScreen extends StatefulWidget {

  const FourButtonScreen(this.s, {super.key});
  final String s;

  @override
  State<FourButtonScreen> createState() => _FourButtonScreenState();
}

class _FourButtonScreenState extends State<FourButtonScreen> {

  String titleName = "";
  var title = ["Lessonwise Material","Sample Papers","Past Papers","Quizes"];

  @override
  void initState() {
    super.initState();
    titleName = widget.s;
  }


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

        title: Text(titleName,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: textBlack),),
      ),
      
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: double.infinity,
            height: 230,
            
            decoration: BoxDecoration(      
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
              gradient: RadialGradient(colors: [primaryBlue.withAlpha(250), primaryBlue,]
                  , center: Alignment.bottomLeft, radius: 1, focal: Alignment.bottomLeft, focalRadius: 0.2, stops: [0.0, 1.0]),
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
            ),
          ),
        
          SizedBox(height: 10,),
        
        ...List.generate(4, (index) =>
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:   16, vertical: 8),
                  child: Container(        
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          
                        ),
                      ],
                      gradient: RadialGradient(colors: [primaryBlue, primaryBlue.withAlpha(0)]
                        , center: Alignment.topLeft, radius: 1, focal: Alignment.topRight, focalRadius: 0.2, stops: [0.0, 1.0]),
                    ),
                    
                    child: ExpansionTile(
                      
                      backgroundColor: primaryBlue.withAlpha(200),
                      collapsedBackgroundColor: primaryBlue.withAlpha(200),
                      iconColor: Colors.white,
                      collapsedIconColor: Colors.white,
                      collapsedShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.white, width: 1),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.white, width: 1),
                      ),

                      title: Text(title[index], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
                      children: [
                        
                        ...List.generate(3, (i) => 
                          Column(
                            children: [
                              ListTile(
                                leading: Image(image: AssetImage("assets/download.png"), width: 50, height: 50,),
                                title: Text("Hello $i", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                subtitle: Text("This is a subtitle for the first item.", style: TextStyle(color: Colors.white70,fontSize: 10),),
                                trailing: Icon(Icons.download, color: Colors.white, size: 20,),
                              ),
                              Divider(color: Colors.white, height: 1, thickness: 1, indent: 0, endIndent: 0),
                            ],
                          ),
                        ),
                                        
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        
        ],
            ),
      ));
  }
}