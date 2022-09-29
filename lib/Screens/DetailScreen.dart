

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentacar/Screens/BookNow.dart';
import 'package:rentacar/Screens/Widgets/OffersScreen.dart';
import 'package:rentacar/Screens/controllers/offerscontroller.dart';
import 'package:rentacar/Screens/models/cars_model.dart';
import 'dart:math';

import 'package:rentacar/Screens/models/offers_model.dart';


class DetailScreen extends StatelessWidget {

  Cars carsList;
  // var carList=['https://www.freepnglogos.com/uploads/mercedes-png/mercedes-amg-car-png-image-pngpix-9.png'
  //   ,'https://www.pngmart.com/files/5/Mercedes-Benz-PNG-Transparent.png',
  //   'https://i.pinimg.com/originals/49/17/c0/4917c017c89fcd6cb5fd6d7161daa5a8.png',
  //   'https://freepngimg.com/thumb/mercedes/9-2-mercedes-benz-png.png',
  //   ];
  var rnd = Random();
  var currPagePos=0.obs;

  RxBool _showFab = true.obs;

  var duration = Duration(milliseconds: 300);

  DetailScreen(this.carsList);

  final OffersController _p = Get.put(OffersController());

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690),minTextAdapt: true);

    TextTheme textTheme=Theme.of(context).textTheme;

    final PageController pagecontroller = PageController();

    // pagecontroller.addListener(() {
    //   print(pagecontroller.page);
    // });

    // pagecontroller.addListener(() {
    //   currPagePos.value=pagecontroller.page as int;
    //   print("s");
    // });

    return Scaffold(
        appBar: AppBar(),
      // bottomNavigationBar: Container(
      //   height: kToolbarHeight,
      //   width: double.infinity,
      //
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //
      //       Text("Packages",style: textTheme.headline5,),
      //       MaterialButton(
      //         color: Colors.blue,
      //         onPressed: () {  },
      //         child: Text(
      //           'Book Now',
      //           style: GoogleFonts.roboto(
      //             textStyle: textTheme.headline4,
      //             color: Colors.white
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      floatingActionButtonLocation:FloatingActionButtonLocation.centerFloat ,
      floatingActionButton: Obx(() => AnimatedSlide(
        duration: duration,
        offset: _showFab.value ? Offset.zero : Offset(0, 2),

        child: AnimatedOpacity(
          duration: duration,
          opacity: _showFab.value ? 1 : 0,
          child: MaterialButton(
            color: Colors.blue,
            height: 56.h,
            minWidth: 300.w,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
            onPressed: (){

              Get.to(()=>BookNow(carId: carsList.carId));

            },child: Text("Book Now",  style: GoogleFonts.roboto(
              textStyle: textTheme.headline4, color: Colors.white),),),
        ),
      )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final ScrollDirection direction = notification.direction;

                if (direction == ScrollDirection.reverse) {
                  _showFab.value = false;
                } else if (direction == ScrollDirection.forward) {
                  _showFab.value = true;
                }

              return true;
            },
            child: ListView(
              shrinkWrap: true,
              children: [

                //image slider
                Container(
                  height: 240.h,
                  width: double.infinity,
                  child:PageView(
                    controller: pagecontroller,
                    onPageChanged: (p)
                    {
                      currPagePos.value=p;
                    },
                    scrollDirection: Axis.horizontal,

                    children: carsList.carGallery.map((e) => Card(

                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                      elevation: 1,
                      child: CachedNetworkImage(
                        imageUrl: "${e.ciImage}",
                        placeholder: (context, url) => CupertinoActivityIndicator(radius: 25.r),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    )).toList(),
                  )
                ),

                //dots indicator
                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for(int i=0;i<carsList.carGallery.length;i++)
                        Obx(() => Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: CircleAvatar(
                              radius: 5.r,
                              backgroundColor: currPagePos.value==i?Colors.blue:Theme.of(context).hoverColor),))
                    ],
                  ),
                ),

                SizedBox(height: 10.h,),

                //title
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text("${carsList.carName}",maxLines: 2,style: GoogleFonts.roboto(
                        textStyle: textTheme.headline2,
                           fontWeight: FontWeight.w500

                      ),),
                    ),

                    Row(
                      children: [
                        Text("Rs ${carsList.carPrice}",style: GoogleFonts.roboto(
                        textStyle: textTheme.headline4,
                            fontWeight: FontWeight.w500
                        )),
                        Text("/day",style: GoogleFonts.roboto(
                            textStyle: textTheme.headline4,

                        )),
                      ],
                    )

                    ],
                ),

                SizedBox(height: 10.h,),

                //book rates
                Row(
                  children: [
                    Icon(Icons.star,color: Colors.orange,size: 14.h,),
                    Text(" ${rnd.nextInt(10)} Time's Booked",style: GoogleFonts.roboto(
                        textStyle: textTheme.caption,
                        color: Theme.of(context).hoverColor,
                    )),
                  ],
                ),

                SizedBox(height: 20.h,),

                //features

                Text("Features",style: GoogleFonts.roboto(textStyle: textTheme.headline2,fontWeight: FontWeight.w500),),
                SizedBox(height: 10.h,),

                Container(
                  width: double.infinity,
                  height: 80.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [

                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Column(
                          children: [
                            Container(
                              width: 50.w,
                              height: 50.h,
                              child: Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                elevation: 1,
                                child: Icon(Icons.drive_eta_rounded),
                              ),
                            ),
                            carsList.driver == "yes" ?
                            Text("With Driver",style: GoogleFonts.roboto(
                              textStyle: textTheme.caption,
                              color: Theme.of(context).hoverColor,

                            ),):
                            Text("Without Driver",style: GoogleFonts.roboto(
                              textStyle: textTheme.caption,
                              color: Theme.of(context).hoverColor,

                            ),)
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Column(
                          children: [
                            Container(
                              width: 50.w,
                              height: 50.h,
                              child: Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                elevation: 1,
                                child: Icon(Icons.water_drop),
                              ),
                            ),
                            Text("AC",style: GoogleFonts.roboto(
                              textStyle: textTheme.caption,
                              color: Theme.of(context).hoverColor,
                            ),)
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Column(
                          children: [
                            Container(
                              width: 50.w,
                              height: 50.h,
                              child: Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                elevation: 1,
                                child: Icon(Icons.door_sliding_outlined),
                              ),
                            ),
                            Text("${carsList.doors} Doors",style: GoogleFonts.roboto(
                              textStyle: textTheme.caption,
                              color: Theme.of(context).hoverColor,
                            ),)
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Column(
                          children: [
                            Container(
                              width: 50.w,
                              height: 50.h,
                              child: Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                elevation: 1,
                                child: Icon(Icons.event_seat_sharp),
                              ),
                            ),
                            Text("${carsList.seats} seats",style: GoogleFonts.roboto(
                              textStyle: textTheme.caption,
                              color: Theme.of(context).hoverColor,
                            ),)
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Column(
                          children: [
                            Container(
                              width: 50.w,
                              height: 50.h,
                              child: Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                elevation: 1,
                                child: Icon(Icons.settings),
                              ),
                            ),
                            Text("${carsList.transmission}",style: GoogleFonts.roboto(
                              textStyle: textTheme.caption,
                              color: Theme.of(context).hoverColor,
                            ),)
                          ],
                        ),
                      ),


                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Column(
                          children: [
                            Container(
                              width: 50.w,
                              height: 50.h,
                              child: Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                elevation: 1,
                                child: Icon(Icons.ev_station),
                              ),
                            ),
                            Text("${carsList.fuel}",style: GoogleFonts.roboto(
                              textStyle: textTheme.caption,
                              color: Theme.of(context).hoverColor,
                            ),)
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Column(
                          children: [
                            Container(
                              width: 50.w,
                              height: 50.h,
                              child: Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                elevation: 1,
                                child: Icon(Icons.speed),
                              ),
                            ),
                            Text("${carsList.speed} km/h",style: GoogleFonts.roboto(
                              textStyle: textTheme.caption,
                              color: Theme.of(context).hoverColor,
                            ),)
                          ],
                        ),
                      ),



                    ],
                  ),
                ),



                //offers
                Text("Offers",style: GoogleFonts.roboto(textStyle: textTheme.headline2,fontWeight: FontWeight.w500),),

                SizedBox(height: 8.h,),

                Container(
                  width: double.infinity,
                  height: 350.h,

                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10.0.h,right: 5.0.w, left: 5.0.w),
                    child: Obx(()=>
                        ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _p.offersList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return OffersScreen(_p.offersList[index]);
                          },)),
                  ),
                ),

                SizedBox(height: 10.h,),








              ],
            ),
          ),
        ),
      ),
    );
  }
}
