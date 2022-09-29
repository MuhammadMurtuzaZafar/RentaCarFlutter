import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Step StepTwo(context)
{
  TextTheme textTheme=Theme.of(context).textTheme;

  return  Step(
    title:  Text('Drop-Off',style:GoogleFonts.roboto(
        textStyle: textTheme.headline4,
        fontWeight: FontWeight.w500
    ) ,),
    content: Container(
        alignment: Alignment.centerLeft,
        child: Column(
          children: [


            Form(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,

                        decoration: InputDecoration(
                            hintText: "05/06/2022",
                            labelText: 'Drop-off Location',
                            hintStyle: textTheme.headline6,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue,),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Theme.of(context).hoverColor, ),
                            ),

                            prefixIcon: Icon(Icons.location_searching_outlined)
                        ),
                        keyboardType: TextInputType.datetime,
                        minLines: 1,
                        validator: (v)
                        {
                          return v==null?"Fill First":null;
                        },
                      ),
                    ),
                    SizedBox(height: 15.h,),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,

                        decoration: InputDecoration(
                            hintText: "05/06/2022",
                            labelText: 'Date',
                            hintStyle: textTheme.headline6,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue,),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Theme.of(context).hoverColor, ),
                            ),

                            prefixIcon: Icon(Icons.calendar_month)
                        ),
                        keyboardType: TextInputType.datetime,
                        minLines: 1,
                        validator: (v)
                        {
                          return v==null?"Fill First":null;
                        },
                      ),
                    ),
                    SizedBox(height: 15.h,),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
                        textInputAction: TextInputAction.next,

                        decoration: InputDecoration(
                            hintText: "06:00",
                            labelText: 'Time',
                            hintStyle: textTheme.headline6,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue,),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Theme.of(context).hoverColor, ),
                            ),

                            prefixIcon: Icon(Icons.access_time)
                        ),

                        keyboardType: TextInputType.datetime,
                        minLines: 1,
                        validator: (v)
                        {
                          return v==null?"Fill First":null;
                        },

                      ),
                    ),





                  ],
                ))


          ],
        )),
  );
}