import 'package:flutter/material.dart';
import 'package:water_tank_clean_service/utill/app_constants.dart';
import 'package:water_tank_clean_service/utill/color_resources.dart';
import 'package:water_tank_clean_service/utill/dimensions.dart';
import 'package:water_tank_clean_service/utill/styles.dart';
import 'package:water_tank_clean_service/view/basewidget/custom_button.dart';
import 'package:water_tank_clean_service/view/basewidget/custom_textfield.dart';

class AddInquiry extends StatefulWidget {
  const AddInquiry({super.key});

  @override
  State<AddInquiry> createState() => _AddInquiryState();
}

class _AddInquiryState extends State<AddInquiry> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  FocusNode nameCode = FocusNode();
  FocusNode mobileCode = FocusNode();
  FocusNode emailCode = FocusNode();
  FocusNode areaCode = FocusNode();
  FocusNode descriptionCode = FocusNode();

  addInquiry(){
    if(nameController.text == ''){
      AppConstants.getToast("Please Enter Name");
    }else if(mobileController.text == ''){
      AppConstants.getToast("Please Enter Mobile Number");
    }else if(mobileController.text.length != 10){
      AppConstants.getToast("Please Enter Valid Mobile Number");
    }else if(areaController.text == ''){
      AppConstants.getToast("Please Enter Area");
    }else if(descriptionController.text == ''){
      AppConstants.getToast("Please Enter Description");
    }else{

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorResources.LINE_BG,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back, color: ColorResources.WHITE),
        ),
        title: Text("Add Inquiry",style: montserratSemiBold.copyWith(color: ColorResources.WHITE,fontSize: Dimensions.FONT_SIZE_20),),
      ),
      body: ListView(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.02),
        children: [
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: AppConstants.itemHeight*0.02),
              padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03),
              child: Row(
                children: [
                  Text("Name",style: montserratBold.copyWith(color: ColorResources.BLACK),),
                  Text("*",style: montserratBold.copyWith(color: ColorResources.RED_1),)
                ],
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.02,vertical: AppConstants.itemHeight*0.01),
            child: CustomTextField(
              controller: nameController,
              focusNode: nameCode,
              nextNode: mobileCode,
              hintText: "Name",
              isPhoneNumber: false,
              textInputType: TextInputType.name,
              textInputAction: TextInputAction.next,
            ),
          ),
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03),
              child: Row(
                children: [
                  Text("Mobile Number",style: montserratBold.copyWith(color: ColorResources.BLACK),),
                  Text("*",style: montserratBold.copyWith(color: ColorResources.RED_1),)
                ],
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.02,vertical: AppConstants.itemHeight*0.01),
            child: CustomTextField(
              controller: mobileController,
              focusNode: mobileCode,
              nextNode: emailCode,
              hintText: "Mobile Number",
              isPhoneNumber: true,
              textInputType: TextInputType.phone,
              textInputAction: TextInputAction.next,
            ),
          ),
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03),
              child: Text("Email Id",style: montserratBold.copyWith(color: ColorResources.BLACK),)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.02,vertical: AppConstants.itemHeight*0.01),
            child: CustomTextField(
              controller: emailController,
              focusNode: emailCode,
              nextNode: areaCode,
              hintText: "Email Id (Optional)",
              isPhoneNumber: false,
              textInputType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
          ),
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03),
              child: Row(
                children: [
                  Text("Area",style: montserratBold.copyWith(color: ColorResources.BLACK),),
                  Text("*",style: montserratBold.copyWith(color: ColorResources.RED_1),)
                ],
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.02,vertical: AppConstants.itemHeight*0.01),
            child: CustomTextField(
              controller: areaController,
              focusNode: areaCode,
              nextNode: descriptionCode,
              hintText: "Area",
              isPhoneNumber: false,
              textInputType: TextInputType.streetAddress,
              textInputAction: TextInputAction.next,
            ),
          ),
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03),
              child: Row(
                children: [
                  Text("Description",style: montserratBold.copyWith(color: ColorResources.BLACK),),
                  Text("*",style: montserratBold.copyWith(color: ColorResources.RED_1),)
                ],
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.02,vertical: AppConstants.itemHeight*0.01),
            child: CustomTextField(
              controller: descriptionController,
              focusNode: descriptionCode,
              nextNode: null,
              maxLine: 4,
              hintText: "Description",
              isPhoneNumber: false,
              textInputType: TextInputType.streetAddress,
              textInputAction: TextInputAction.newline,
            ),
          ),
          CustomButtonFuction(onTap: () => addInquiry(), buttonText: "Add"),
        ],
      ),
    );
  }
}
