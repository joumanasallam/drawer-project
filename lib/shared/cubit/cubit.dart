// ignore_for_file: non_constant_identifier_names

import 'package:complex_ui/shared/component/component.dart';
import 'package:complex_ui/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class Cubit1 extends Cubit<States>{
  Cubit1():super(InitState());


 static Cubit1 get(context)=>BlocProvider.of<Cubit1>(context);
   GoogleMapController? controller;
  Location currentLocation = Location();
  Set<Marker> markers={};
  bool showBottomSheet = true;

  void showBottom(){
   showBottomSheet=false;
   emit(CurrentState());
     }
 List<ditem> ditems =[

   ditem("Home", Icons.home,),
      ditem("Account",Icons.person,)

,
   ditem("Payment", Icons.payment,)
,
   ditem("Booking",Icons.book,)
,
   ditem("Offers",Icons.local_offer,)
,
   ditem("Bookmark", Icons.bookmark_add,)
,
   ditem("Feadback",Icons.text_decrease,)

,   ditem("About", Icons.abc_outlined,)





 ];


 
   
 void changehover(int i){
ditems[i].onclick=!ditems[i].onclick;
                      
 emit(CurrentState());
 }

void getLocation() async{
    var location = await currentLocation.getLocation();
    currentLocation.onLocationChanged.listen((LocationData loc){

      controller?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
        target: LatLng(loc.latitude ?? 0.0,loc.longitude?? 0.0),
        zoom: 12.0,
      )));
      print(loc.latitude);
      print(loc.longitude);
     
        markers.add(Marker(markerId: MarkerId('Home'),
            position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0)
        ));
      });
       emit(CurrentState());

      
  }
 

 
}