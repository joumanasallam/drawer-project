import 'package:complex_ui/modules/drrwer.dart';
import 'package:flutter/material.dart';

import 'modules/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: mainpage()
    );
  }
}
class mainpage extends StatefulWidget {
  @override
  _mainpageState createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  late double xaxis ;
    late double yaxis ;

  late double scalefactor ;
  bool isdagging=false;
  late bool isdraweropen;
  void initState(){
    super.initState();
    openDrawer();
  }
  void openDrawer(){
    setState(() {
       xaxis=230;
    yaxis=150;
    scalefactor=0.6;
    isdraweropen=true;
    });
   
  }
  void closeDrawer(){
    setState(() {
       xaxis=0;
    yaxis=0;
    scalefactor=1;
        isdraweropen=false;

    });
   
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      buileddrawer(),
      builedpage()
      ],
      
    );
  }
  Widget builedpage(){



  return WillPopScope(
      onWillPop: ()async { 
        if(isdraweropen){
          closeDrawer();
          return false;
        }else return true;
       },
      child: GestureDetector(
      onTap: closeDrawer,
      onHorizontalDragStart: (details) => isdagging=true,
      onHorizontalDragUpdate:  (details) {
        if(!isdagging)return;
        const delta=1;
        if(details.delta.dx>delta){
          openDrawer();
        }else if (details.delta.dx<-delta){
          closeDrawer();
        }
        isdagging=true;
      },
        child: AnimatedContainer(
        transform: Matrix4.translationValues(xaxis, yaxis, 0)..scale(scalefactor),
        
        duration: Duration(milliseconds: 250),
        child: AbsorbPointer(
          absorbing: isdraweropen,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(isdraweropen?20:0),
                                child: Container(
                    color: isdraweropen?Colors.white12:Colors.blue,
                    child: Home(openDrawer: () {
            openDrawer();
          },),
                  ),
                ),
        )
      ),
    ),
  );
}
Widget buileddrawer(){
  return Menu();
}
}
