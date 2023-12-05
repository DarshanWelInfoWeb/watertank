import 'package:flutter/material.dart';
import 'package:water_tank_clean_service/utill/app_constants.dart';
import 'package:water_tank_clean_service/utill/color_resources.dart';
import 'package:water_tank_clean_service/utill/dimensions.dart';
import 'package:water_tank_clean_service/utill/styles.dart';

class OrderTypeButtonHead extends StatelessWidget {
  final String text;
  final String? id;
  final String? image;
  final String amount;
  final String static;
  final Widget onTap;
  OrderTypeButtonHead({required this.text,this.id,this.image ,required this.amount,required this.static,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => onTap)),
      child: Container(
        margin: EdgeInsets.all(AppConstants.itemWidth*0.02),
        decoration: BoxDecoration(
            color: ColorResources.WHITE,
            borderRadius: BorderRadius.circular(10),
            boxShadow: <BoxShadow>[
        BoxShadow(
        color: Colors.grey.shade400,
            offset: Offset(2, 4),
            blurRadius: 3,
            spreadRadius: 1)
        ],
        ),
        child: Container(
          alignment: Alignment.center,
          width: AppConstants.itemWidth*0.45,
          height: AppConstants.itemHeight*0.12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(image!,height: AppConstants.itemWidth * 0.10, width: AppConstants.itemWidth * 0.10,color: ColorResources.LINE_BG,),
              SizedBox(width: AppConstants.itemWidth*0.01),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(text,
                      textAlign: TextAlign.center,
                      style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: Dimensions.FONT_SIZE_14,fontWeight: FontWeight.w600)),
                  SizedBox(height: AppConstants.itemHeight*0.01),
                  Text(amount,
                      textAlign: TextAlign.center,
                      style: montserratRegular.copyWith(color: ColorResources.GREY,fontSize: Dimensions.FONT_SIZE_14,fontWeight: FontWeight.w600)),
                  Row(
                    children: [
                      Icon(id=="1"?Icons.arrow_upward:Icons.arrow_downward,size: 20,color: id=="1"?ColorResources.GREEN:Colors.red,),
                      Text(static,
                          textAlign: TextAlign.center,
                          style: montserratRegular.copyWith(color: id=="1"?ColorResources.GREEN:Colors.red,fontSize: Dimensions.FONT_SIZE_14,fontWeight: FontWeight.w600)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
