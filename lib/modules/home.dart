import 'package:complex_ui/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


import '../shared/cubit/cubit.dart';
import 'drrwer.dart';

class Home extends StatelessWidget {
  final VoidCallback openDrawer;

  const Home ({
    required this.openDrawer
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
          create: (BuildContext context) { return Cubit1(); },
          child: BlocConsumer<Cubit1,States>(
        listener: (context, state) {
          Cubit1.get(context).getLocation();
        },
            builder:(context, state){ return  Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                leading:IconButton(onPressed: openDrawer, icon:Icon( Icons.menu,color: Colors.blue,))
              ),
          drawer: Drawer(
            child: Menu(),
          ),
          
            body: GoogleMap(
                initialCameraPosition:  CameraPosition(
                    target: LatLng(-33.852, 151.211), zoom: 11.0),
                     onMapCreated: (GoogleMapController controller){
            Cubit1.get(context).controller = controller;
          },
          markers: Cubit1.get(context).markers,
                    ),
            bottomSheet: Cubit1.get(context).showBottomSheet
              ? BottomSheet(
                  elevation: 10,
                  backgroundColor: Colors.white,
                  enableDrag: false,
                  onClosing: () {},
                  builder: (BuildContext ctx) => Container(
                        width: double.infinity,
                        height: 250,
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          child: const Text(
                            'Joumana sallam',
                          ),
                          onPressed: () {
                          Cubit1.get(context).showBottom();
                            
                          }
                        ),
                      ))
                       : null,
            
            );
            }
      ),
    );
    
    
    
         
    
    
    
                
  
  }
}
