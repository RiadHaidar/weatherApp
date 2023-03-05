
import 'package:flutter/material.dart';

Widget CustomizedCard (IconData iconData, String temp, String wind, String humidity,)=>   Card(
                                        //      elevation: 0,
                                        color: Colors.transparent,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Flexible( 
                                                flex: 1,
                                                child: Row(
                                              //    mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(top:4.0),
                                                      child: Icon(
                                                        
                                                        iconData, color: Colors.white, 
                                                      size: 20,
                                                                                                      //  textDirection: TextDirection.ltr,
                                                      ),
                                                    ),
                                                    SizedBox(width: 10,),
                                                    Text(temp,
                                                     style: TextStyle(fontSize: 20),),
                                                  ],
                                                ),
                                              ),
                                              Flexible( 
                                                flex: 2,
                                                child: Row(
                                                  children: [
                                                    Text(wind, style: TextStyle(fontSize: 30),),
                                                  ],
                                                ),
                                              ),
                                              Flexible( 
                                                flex: 1,
                                                child: Text(humidity,
                                                 style: TextStyle(fontSize: 17),),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    
                                                