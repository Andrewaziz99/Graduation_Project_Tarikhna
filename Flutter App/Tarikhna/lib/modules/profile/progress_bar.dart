import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/profile_screen.dart';

import 'colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';




class ProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child: SafeArea(
          child:Column(
            children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              IconButton(
                icon: Icon(Icons.arrow_back_rounded),onPressed:onNotification ,
              ),
              IconButton(
                icon: Icon(Icons.settings),onPressed:onNotification ,
              ),
            ],
          ) ,

         Stack(
          children: [
            
            Container(
                padding: EdgeInsets.only(top: 20),
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(width: 4,color: Colors.white),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 2,
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.1)
                    )
                  ],
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://media.istockphoto.com/id/1433346041/photo/cute-girl-iconic-character-with-glasses-isolated-white-background-3d-rendering.jpg?s=612x612&w=is&k=20&c=9jGKRehgcxvBrrLV-YwN5371DAa0XhFbumb5fr8EZwg='
                    ),
                    // image: AssetImage('assets/Icon1.jpeg'),
                  ),
                )

            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    shape:BoxShape.circle,
                    border: Border.all(
                        width: 4,
                        color: Colors.white
                    ),
                    color:AppColors.pink
                ),
                child: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed:onEdit ,
                ),
              ),
            ),



          ] ) ,

              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Name:yara wael', style: TextStyle(fontSize: 20 )),

                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed:() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => profile()));
                          }
                    ),

                  SizedBox(height: 30),

                ],

              ),
              // SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Email:yarawael@hotmail.com', style: TextStyle(fontSize: 20 ) ),

                  IconButton(
                    icon: Icon(Icons.email),
                    onPressed:onEdit) ,
                ],

              ),


              // SizedBox(height: 10),
              // Row(
              //   children: [
              //     Text(" Email:yarawael@hotmail.com" ,
              //     )
              //    IconButton(onPressed: onNotification, icon: Icon(Icons.edit)),
              //   ],
              // ),

              // SizedBox(height: 100),

              Padding(padding:
                   const EdgeInsets.all(20.0),),
              Container(
                child: Column(
                 // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CircularPercentIndicator(
                        animation: true,
                        animationDuration: 500,
                        radius:150,
                        lineWidth: 20,
                        percent: 0.4,
                        progressColor: Colors.deepPurple,
                        backgroundColor:Colors.deepPurple.shade100 ,
                        circularStrokeCap: CircularStrokeCap.round,
                        center: Text("40%",style: TextStyle(fontSize: 40),),


                      ),
                    ),

                    Padding(padding:
                    const EdgeInsets.all(10.0),),
                    // Padding(
                    //   padding: const EdgeInsets.all(15.0),
                    //   child: LinearPercentIndicator(
                    //     animation: true,
                    //     animationDuration: 500,
                    //     lineHeight: 30,
                    //     percent: 0.5,
                    //     progressColor: Colors.deepPurple,
                    //     backgroundColor: Colors.deepPurple.shade200,
                    //     linearStrokeCap: LinearStrokeCap.roundAll,
                    //
                    //
                    //
                    //
                    //   ),
                    // )
                  ],
                ),

              )

           ],


        ),


          )

           ),
    )
    ;




}
  void onNotification(){
    print("notification clicked");}
  void onEdit(){
    print("Edit clicked");}

}