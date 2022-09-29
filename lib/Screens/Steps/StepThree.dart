import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Step StepThree(context)
{
  TextTheme textTheme=Theme.of(context).textTheme;

  return  Step(
    title:  Text('User Details',style:GoogleFonts.roboto(
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
                            hintText: "John@abc.com",
                            hintStyle: textTheme.headline6,
                            labelText: 'Email Address',

                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue,),
                              gapPadding: 12.w,

                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Theme.of(context).hoverColor, ),
                            ),

                            prefixIcon: Icon(Icons.alternate_email)
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
                            hintText: "John",
                            hintStyle: textTheme.headline6,
                            labelText: 'First Name',

                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue,),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Theme.of(context).hoverColor, ),
                            ),

                            prefixIcon: Icon(Icons.account_box_outlined)
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
                            hintText: "Doe",
                            hintStyle: textTheme.headline6,
                            labelText: 'Last Name',

                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue,),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Theme.of(context).hoverColor, ),
                            ),

                            prefixIcon: Icon(Icons.account_box_outlined)
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
                            hintText: "+10222333444555",
                            hintStyle: textTheme.headline6,
                            labelText: 'Contact Number',

                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue,),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Theme.of(context).hoverColor, ),
                            ),

                            prefixIcon: Icon(Icons.add_ic_call_outlined)
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
                    TextFormField(
                      textInputAction: TextInputAction.next,

                      decoration: InputDecoration(
                          hintText: "abc street, xyz house",
                          hintStyle: textTheme.headline6,
                          labelText: 'Address',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue,),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Theme.of(context).hoverColor, ),
                          ),

                          prefixIcon: Icon(Icons.apartment_outlined)
                      ),

                      keyboardType: TextInputType.datetime,
                      minLines: 1,
                      validator: (v)
                      {
                        return v==null?"Fill First":null;
                      },

                    ),





                  ],
                ))


          ],
        )),
  );
}