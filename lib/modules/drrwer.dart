import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../shared/component/component.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    return BlocProvider(
          create: (BuildContext context) { return Cubit1(); },
          child: BlocConsumer<Cubit1,States>(
        listener: (context, state) {} ,
            builder: ((context, state) {
              return Scaffold(
         
          body: Container(
            width:double.infinity,
            height: 1000,
            color: Colors.blue,
            child:
            Column(
             
              children: [
                Stack(
                      children:[
                         WaveWidget( //user Stack() widget to overlap content and waves
                  config: CustomConfig(
                      colors: [ 
                          Colors.blue.withOpacity(0.3),
                          Colors.blue,
                        
                          //the more colors here, the more wave will be
                      ],
                      durations: [4000, 5000], 
                      //durations of animations for each colors,
                      // make numbers equal to numbers of colors
                      heightPercentages: [0.05, 0.010],
                      //height percentage for each colors.
                      blur: MaskFilter.blur(BlurStyle.solid, 5),
                      //blur intensity for waves
                  ),
                  waveAmplitude: 60.00, //depth of curves
                  waveFrequency: 2, //number of curves in waves
                  backgroundColor: Colors.white, //background colors
                  size: Size(
                      400,
                     100,
                  )
                         ),
                        
                       Padding(
                         padding: const EdgeInsets.all(15.0),
                         child: Container(
                           width: double.infinity,
                           height: 70,
                           
                           decoration: BoxDecoration(
                             boxShadow: null
                           ),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.close,size: 40.0,color: Colors.white,),
                  SizedBox(width:15),
                 Row(
                    children: [
                const Text("joumana sallam",style: TextStyle(fontSize: 20,color: Colors.white)),
                SizedBox(width:5),
                  Container(
                width: 50,
                height: 50,
                    decoration: BoxDecoration(
                           shape:BoxShape.circle,
                    
                           image: const DecorationImage(image: NetworkImage("https://googleflutter.com/sample_image.jpg"),
                    
                             fit: BoxFit.fill
                           ),
                            
                            
                            ),
                  )
                
                    ],
                 )
                ],
              ),
                         ),
                       )

              ]
            ),
                
             
              Expanded(
                              child: Container(
                 
                  child: ListView.builder(
                    itemCount:  Cubit1.get(context).ditems.length,
                     itemBuilder: (BuildContext context, int index) { 
                       return icons( 
                       context, index
                       ); },


                  ),
                ),
              )
              
              
              ],


            )
          ),
        );
            }),
      ),
    );
  }
}
