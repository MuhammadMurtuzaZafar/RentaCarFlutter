import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentacar/Screens/Steps/StepThree.dart';
import 'package:rentacar/Screens/Steps/StepTwo.dart';
import 'package:rentacar/Screens/controllers/BookFormController.dart';


class BookNow extends GetView<BookFormController>{

  BookFormController _controller = Get.put(BookFormController());
  late TextTheme textTheme;
  String carId;
  BookNow({required this.carId});
  @override
  Widget build(BuildContext context) {

    textTheme=Theme.of(context).textTheme;
    _controller.carid.value = carId;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Book Easy Four Steps"),),
      body: SafeArea(
        child: Obx(()=>Stepper(
          currentStep: _controller.currentStep.value,
          elevation: 0,
          controlsBuilder:
              (BuildContext context, ControlsDetails details) {
            return Row(
              children: [],
            );},
          onStepTapped: (index){
            _controller.currentStep.value = index;
            print(_controller.currentStep.value);
          },
          steps: [
            //Step 1
            Step(
              title:  Text('Pick-Up',style:GoogleFonts.roboto(
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

                                  controller: _controller.puLocation,

                                  textInputAction: TextInputAction.next,

                                  decoration: InputDecoration(
                                      hintText: "Street 123 ABC Area",

                                      labelText: 'Pick-up Location',
                                      labelStyle: textTheme.headline6,
                                      hintStyle: textTheme.headline6,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.blue,),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Theme.of(context).hoverColor, ),
                                      ),

                                      prefixIcon: Icon(Icons.location_searching_outlined, color: Theme.of(context).hoverColor,)
                                  ),
                                  keyboardType: TextInputType.text,
                                  minLines: 1,

                                ),
                              ),
                              SizedBox(height: 15.h,),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  controller: _controller.puDate,
                                  decoration: InputDecoration(
                                      hintText: "05/06/2022",
                                      labelText: 'Date',
                                      labelStyle: textTheme.headline6,
                                      hintStyle: textTheme.headline6,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.blue,),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Theme.of(context).hoverColor, ),
                                      ),

                                      prefixIcon: Icon(Icons.calendar_month, color: Theme.of(context).hoverColor,)
                                  ),
                                  keyboardType: TextInputType.datetime,
                                  minLines: 1,

                                ),
                              ),
                              SizedBox(height: 15.h,),

                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: TextFormField(
                                  controller: _controller.puTime,
                                  textInputAction: TextInputAction.next,

                                  decoration: InputDecoration(
                                      hintText: "06:00",
                                      labelText: 'Time',
                                      hintStyle: textTheme.headline6,
                                      labelStyle: textTheme.headline6,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.blue,),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Theme.of(context).hoverColor, ),
                                      ),

                                      prefixIcon: Icon(Icons.access_time, color: Theme.of(context).hoverColor,)
                                  ),

                                  keyboardType: TextInputType.datetime,
                                  minLines: 1,


                                ),
                              ),





                            ],
                          ))


                    ],
                  )),
            ),
            //Step 2
            Step(
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
                                  controller: _controller.doLocation,
                                  decoration: InputDecoration(
                                      hintText: "Street 456 XYZ Area",
                                      labelText: 'Drop-off Location',
                                      labelStyle: textTheme.headline6,
                                      hintStyle: textTheme.headline6,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.blue,),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Theme.of(context).hoverColor, ),
                                      ),

                                      prefixIcon: Icon(Icons.location_searching_outlined, color: Theme.of(context).hoverColor,)
                                  ),
                                  keyboardType: TextInputType.text,
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
                                  controller: _controller.doDate,
                                  decoration: InputDecoration(
                                      hintText: "05/06/2022",
                                      labelText: 'Date',
                                      labelStyle: textTheme.headline6,
                                      hintStyle: textTheme.headline6,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.blue,),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Theme.of(context).hoverColor, ),
                                      ),

                                      prefixIcon: Icon(Icons.calendar_month, color: Theme.of(context).hoverColor,)
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
                                  controller: _controller.doTime,
                                  decoration: InputDecoration(
                                      hintText: "06:00",
                                      labelText: 'Time',
                                      hintStyle: textTheme.headline6,
                                      labelStyle: textTheme.headline6,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.blue,),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Theme.of(context).hoverColor, ),
                                      ),

                                      prefixIcon: Icon(Icons.access_time, color: Theme.of(context).hoverColor,)
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
            ),
            //Step 3
            Step(
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
                                  controller: _controller.emailAddress,
                                  textInputAction: TextInputAction.next,

                                  decoration: InputDecoration(

                                      hintText: "John@abc.com",
                                      hintStyle: textTheme.headline6,
                                      labelStyle: textTheme.headline6,
                                      labelText: 'Email Address',

                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.blue,),
                                        gapPadding: 12.w,

                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Theme.of(context).hoverColor, ),
                                      ),

                                      prefixIcon: Icon(Icons.alternate_email, color: Theme.of(context).hoverColor,)
                                  ),
                                  keyboardType: TextInputType.text,
                                  minLines: 1,
                                  validator: (value)
                                  {
                                    String myval = "";
                                    if (value == null){
                                      myval =  "Please this field must be filled";
                                    }else if(!value.contains("@")){
                                      myval =  "Please enter a valid email";
                                    }else if(!value.contains(".com")){
                                      myval =  "Please enter a valid email";
                                    }
                                    print("ZZZ "+myval);
                                    return myval;
                                  },
                                ),
                              ),
                              SizedBox(height: 15.h,),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: TextFormField(
                                  controller: _controller.fname,
                                  textInputAction: TextInputAction.next,

                                  decoration: InputDecoration(
                                      hintText: "John",
                                      hintStyle: textTheme.headline6,
                                      labelText: 'First Name',
                                      labelStyle: textTheme.headline6,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.blue,),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Theme.of(context).hoverColor, ),
                                      ),

                                      prefixIcon: Icon(Icons.account_box_outlined, color: Theme.of(context).hoverColor,)
                                  ),
                                  keyboardType: TextInputType.text,
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
                                  controller: _controller.lname,
                                  textInputAction: TextInputAction.next,

                                  decoration: InputDecoration(
                                      hintText: "Doe",
                                      hintStyle: textTheme.headline6,
                                      labelText: 'Last Name',
                                      labelStyle: textTheme.headline6,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.blue,),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Theme.of(context).hoverColor, ),
                                      ),

                                      prefixIcon: Icon(Icons.account_box_outlined, color: Theme.of(context).hoverColor,)
                                  ),
                                  keyboardType: TextInputType.text,
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
                                  controller: _controller.phone,
                                  textInputAction: TextInputAction.next,

                                  decoration: InputDecoration(
                                      hintText: "+10222333444555",
                                      hintStyle: textTheme.headline6,
                                      labelText: 'Contact Number',
                                      labelStyle: textTheme.headline6,
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.blue,),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Theme.of(context).hoverColor, ),
                                      ),

                                      prefixIcon: Icon(Icons.add_ic_call_outlined, color: Theme.of(context).hoverColor,)
                                  ),
                                  keyboardType: TextInputType.text,
                                  minLines: 1,
                                  validator: (v)
                                  {
                                    return v==null?"Fill First":null;
                                  },
                                ),
                              ),
                              SizedBox(height: 15.h,),
                              TextFormField(
                                controller: _controller.address,
                                textInputAction: TextInputAction.next,

                                decoration: InputDecoration(
                                    hintText: "abc street, xyz house",
                                    hintStyle: textTheme.headline6,
                                    labelStyle: textTheme.headline6,
                                    labelText: 'Address',
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.blue,),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Theme.of(context).hoverColor, ),
                                    ),

                                    prefixIcon: Icon(Icons.apartment_outlined, color: Theme.of(context).hoverColor,)
                                ),

                                keyboardType: TextInputType.text,
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
            ),

            // Step 4

            Step(
              title:  Text('Confirmation',style:GoogleFonts.roboto(
                  textStyle: textTheme.headline4,
                  fontWeight: FontWeight.w500
              ) ,),
              content: Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Column(

                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("By clicking ",style: textTheme.headline6,),
                              Text("Book Now ",style: textTheme.headline5,),
                            ],
                          ),
                          Text("You agree to our Terms and Conditions. ",style: textTheme.headline6,),

                          SizedBox(height: 15.h,),



                            MaterialButton(
                              color: Colors.blue,
                              height: 56.h,
                              minWidth: 300.w,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
                              onPressed: (){

                                _controller.sendData();

                              },child: Text("Book Now",  style: GoogleFonts.roboto(
                                textStyle: textTheme.headline4, color: Colors.white),),),


                        ],
                      ),
                    ],
                  )
              ),
            )
          ],

        ),)
      ),
    );
  }

}