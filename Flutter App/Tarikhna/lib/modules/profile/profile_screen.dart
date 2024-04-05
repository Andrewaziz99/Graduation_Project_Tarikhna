import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/progress_bar.dart';

import 'colors.dart';

class profile extends StatelessWidget {

  bool isObscurePassword = true;
  String dropdownValue="one";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_rounded),
          onPressed:() {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProgressBar()));
          },
        color: Colors.black,),
        actions: [
          IconButton(onPressed: onNotification, icon: Icon(
            Icons.settings,
            color:Colors.black ,


          ))
        ],
          backgroundColor: AppColors.pink,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15,top: 20,right: 15),
        // child: GestureDetector(
        //   onTap: (){
        //     FocusScope.of(context).unfocus();
        //   },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                        height: 130,
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

                              //image: AssetImage('images/avatar.png'),
                              // image: AssetImage("icons/avatar.png"),

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


                    )

                  ],

                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                     onFieldSubmitted: (String value)
                     {
                       print(value);
                     },
                     onChanged: (String value)
                     {
                       print(value);
                     }

                ,
                      decoration:InputDecoration(
                        labelText: "Enter New Name",
                       border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.edit_note_outlined)

                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      keyboardType:TextInputType.visiblePassword ,
                      obscureText: true,
                      onFieldSubmitted: (String value)
                      {
                        print(value);
                      },
                      onChanged: (String value)
                      {
                        print(value);
                      }

                      ,
                      decoration:InputDecoration(
                        labelText: "Enter previous password",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: Icon(Icons.remove_red_eye),

                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      keyboardType:TextInputType.visiblePassword ,
                      obscureText: true,
                      onFieldSubmitted: (String value)
                      {
                        print(value);
                      },
                      onChanged: (String value)
                      {
                        print(value);
                      }

                      ,
                      decoration:InputDecoration(
                          labelText: "Enter New password",
                          border: OutlineInputBorder(),
                         prefixIcon: Icon(Icons.lock),
                        suffixIcon: Icon(Icons.remove_red_eye),

                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    Container(
                      child: TextFormField(
                        keyboardType:TextInputType.visiblePassword ,
                        obscureText: true,
                        onFieldSubmitted: (String value)
                        {
                          print(value);
                        },
                        onChanged: (String value)
                        {
                          print(value);
                        }

                        ,
                        decoration:InputDecoration(
                          labelText: "Update year",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.menu),
                          suffixIcon: PopupMenuButton<String>(
                              icon: Icon(Icons.arrow_drop_down),
                            itemBuilder: (BuildContext context) {
                                return <PopupMenuEntry<String>>[
                                   PopupMenuItem<String>(
                                       value: '4 primaire',
                                          child: Text('4 primaire'),


                                        ),
                                     PopupMenuItem<String>(
                                     value: '5 primaire',
                                    child: Text('5 primaire'),
                                          ),
                                         PopupMenuItem<String>(
                                         value: '6primaire',
                                   child: Text('6 primaire'),
                                ),

                               ];
                                    },
                            onSelected: (String value) {
                              // Handle dropdown item selection
                              print('Selected: $value');
                           //   _textEditingController.text = value;
                            },
                          ),




                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),



                  ],


                ),
              ),

              // buildTextField("Edit name", "Enter New name", false),
              // buildTextField("Edit password", "Enter New password", true),
              // buildTextField("Edit Year", "select new year", false),
              // SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(onPressed: () {},
                      child: Text(" CANCEL",
                        style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 2,
                          color: Colors.black
                        )
                      ),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    ),

                  ),
                  ElevatedButton( onPressed:() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProgressBar()));
                  },
                      child: Text("SAVE",style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 2,
                        color: Colors.white
                      )),
                      style:ElevatedButton.styleFrom(
                        primary: AppColors.pink,
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))


                      )
                  )


                ],
              )
            ],
          ),
        ),
      );


    // );
  }
 // Widget buildTextField(String labelText,String placeholder,bool isPasswordTextField){
 //    return Padding(
 //        padding: EdgeInsets.only(bottom: 40),
 //      child: TextField(
 //        obscureText: isPasswordTextField ? isObscurePassword : false,
 //        decoration: InputDecoration(
 //          suffixIcon: isPasswordTextField ?
 //          IconButton(
 //            icon: Icon(
 //           Icons.remove_red_eye,color: Colors.black),
 //      onPressed: () {}
 //        ): null,
 //       contentPadding: EdgeInsets.only(bottom:5 ),
 //       labelText: labelText,
 //         floatingLabelBehavior: FloatingLabelBehavior.always,
 //          hintText:placeholder,
 //          hintStyle: TextStyle(
 //         fontSize: 16,
 //         fontWeight:FontWeight.bold,
 //         color: Colors.grey
 //
 //   )
 //
 //      ),
 //      ),
 //    );

  }


  void onNotification(){
    print("notification clicked");}
  void onEdit(){
    print("Edit clicked");}

