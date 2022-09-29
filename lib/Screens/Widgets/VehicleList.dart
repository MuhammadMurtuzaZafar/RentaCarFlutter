import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentacar/Screens/controllers/carscontroller.dart';

import '../DetailScreen.dart';


class VehicleList extends StatefulWidget {
  final String carmake;
  const VehicleList({required this.carmake , Key? key}) : super(key: key);

  @override
  State<VehicleList> createState() => _VehicleListState();
}

class _VehicleListState extends State<VehicleList> {

  final CarsController carsController = Get.put(CarsController());



  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme;
    carsController.updateMake(""+widget.carmake);
    return Obx(() =>
        ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: carsController.carsList.length,
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                height: 150.h,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.infinity,
                        height: 120.h,
                        alignment: Alignment.bottomLeft,
                        margin: EdgeInsets.symmetric(horizontal: 2.w),
                        padding: EdgeInsets.only(left: 20.w),
                        decoration: BoxDecoration(
                            color: Theme.of(context).indicatorColor,
                            borderRadius: BorderRadius.all(Radius.circular(20.r)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 1.r,
                                  spreadRadius: 1.h,
                                  offset: Offset(1,1)
                              )
                            ]

                        ),
                        child:Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Text("${carsController.carsList[index].carPrice}",style: textTheme.headline2,),
                            Text(" Rs/day",style: GoogleFonts.roboto(
                                textStyle: textTheme.headline3,
                                color: Colors.grey,
                                fontSize: 16.sp
                            ),),

                            Expanded(
                              child: InkWell(
                                onTap: (){

                                  Get.to(DetailScreen(carsController.carsList[index]));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: 150.w,
                                      height: 40.h,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(20.r),topLeft: Radius.circular(20.r)),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black26,
                                                blurRadius: 1.r,
                                                spreadRadius: 1.h,
                                                offset: Offset(1,1)
                                            )
                                          ]

                                      ),
                                      child: Text("Details",style: GoogleFonts.roboto(
                                        textStyle: textTheme.headline5,
                                        color: Colors.white,
                                      ),),

                                    )
                                  ],
                                ),
                              ),
                            )



                          ],
                        ),

                      ),
                    ),

                    Container(
                      width: double.infinity,
                      height: 120.h,
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        children: [
                       //   Image.asset("assets/images/mybg.png",width: 150.w,height:130.h,fit: BoxFit.fill,),
                          CachedNetworkImage(imageUrl: "${carsController.carsList[index].carGallery.first.ciImage}",
                            width: 150.w,height:130.h,fit: BoxFit.fill,),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(" ${carsController.carsList[index].carName}",style: textTheme.headline4,textAlign: TextAlign.left),
                                Text(" ${carsController.carsList[index].carModel}",style:GoogleFonts.roboto(
                                    textStyle: textTheme.headline6,
                                    color: Colors.grey,
                                    fontSize: 16.sp
                                ),textAlign: TextAlign.right),


                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),

              );
            }

        )
       
    );
  }
}

