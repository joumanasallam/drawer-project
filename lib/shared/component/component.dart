

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../cubit/cubit.dart';

Widget icons (

@required BuildContext context,
@required int index



){
  return   Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(width: 200,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: Cubit1.get(context).ditems[index].onclick ? Colors.white :Colors.blue,
                      ),
                    
                        
                        child:InkWell(onTap: (){
                          Cubit1.get(context).changehover(index);
                         
                          

                        },child: Row(
                          children: [
                            Icon( Cubit1.get(context).ditems[index].icon,color: Cubit1.get(context).ditems[index].onclick ? Colors.blue :Colors.white),
                            Text(Cubit1.get(context).ditems[index].text,style:TextStyle(color:Cubit1.get(context).ditems[index].onclick ? Colors.blue :Colors.white)),
                          ],
                        ),)
                      ),
                    ),
                  ],
                );
}
class ditem {
  late String text;
  late IconData icon;
  late bool onclick=false;
  ditem(
    this.text,
    this.icon
  );

}
