import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentacar/Screens/models/offers_model.dart';

class OffersScreen extends StatefulWidget {
  final Offer offersList;
  const OffersScreen(this.offersList, {Key? key}) : super(key: key);

  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme=Theme.of(context).textTheme;
    Offer getOffer = widget.offersList;
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [

        Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
          child: Container(

            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                SizedBox(height: 5.h,),
                Text("${getOffer.offerTitle}",style: GoogleFonts.roboto(textStyle: textTheme.headline5,fontWeight: FontWeight.w500)),
                SizedBox(height: 5.h,),
                Text("Offer Includes/Excludes",style: GoogleFonts.roboto(textStyle: textTheme.headline6,fontWeight: FontWeight.w500)),

                SizedBox(height: 5.h,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for(int i=0; i< getOffer.includeExcludeList.length ; i++)

                    Row(
                      children: [
                        getOffer.includeExcludeList[i].ieType == "include" ?
                        Text("✓",style: TextStyle(color: Colors.green),)
                        :
                        Text("☓",style: TextStyle(color: Colors.red),),


                        Text("${getOffer.includeExcludeList[i].content}",style: GoogleFonts.roboto(
                            textStyle: textTheme.caption,
                            color: Theme.of(context).hoverColor

                        )),
                      ],
                    ),



                  ],
                ),
                SizedBox(height: 5.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Rs ",style: GoogleFonts.roboto(textStyle: textTheme.caption,fontWeight: FontWeight.w500),),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("${getOffer.offerPrice}",style: GoogleFonts.roboto(textStyle: textTheme.headline3,fontWeight: FontWeight.w600)),
                        Text(" /${getOffer.tenure} ",style: GoogleFonts.roboto(textStyle: textTheme.caption,color: Colors.green,fontWeight: FontWeight.w500),),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),




      ],
    )
    ;
  }
}
