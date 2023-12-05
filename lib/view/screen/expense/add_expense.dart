import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:water_tank_clean_service/utill/app_constants.dart';
import 'package:water_tank_clean_service/utill/color_resources.dart';
import 'package:water_tank_clean_service/utill/dimensions.dart';
import 'package:water_tank_clean_service/utill/styles.dart';
import 'package:water_tank_clean_service/view/basewidget/custom_button.dart';
import 'package:water_tank_clean_service/view/basewidget/custom_password_textfield.dart';
import 'package:water_tank_clean_service/view/basewidget/custom_textfield.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController onlineController = TextEditingController();
  TextEditingController cashController = TextEditingController();
  FocusNode titleCode = FocusNode();
  FocusNode descriptionCode = FocusNode();
  FocusNode amountCode = FocusNode();
  FocusNode dateCode = FocusNode();
  FocusNode onlineCode = FocusNode();
  FocusNode cashCode = FocusNode();

  late String formattedDate = '';
  late String date_shcedule = '';
  TimeOfDay selectedTime = TimeOfDay.now();

  File? files;
  ImageCropper imagecropp = ImageCropper();
  File imageFile = File('');
  File profileimageFile = File('');
  File documnetimageFile = File('');
  final picker = ImagePicker();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DateTime today = DateTime.now();
    formattedDate = DateFormat('dd/MM/yyyy').format(today);
    dateController.text = formattedDate;
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
        title: Text("Add Expense",style: montserratSemiBold.copyWith(color: ColorResources.WHITE,fontSize: Dimensions.FONT_SIZE_20),),
      ),
      body: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.02),
        children: [
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: AppConstants.itemHeight*0.02),
              padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03),
              child: Row(
                children: [
                  Text("Title",style: montserratBold.copyWith(color: ColorResources.BLACK)),
                  Text("*",style: montserratBold.copyWith(color: ColorResources.RED_1))
                ],
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.02,vertical: AppConstants.itemHeight*0.01),
            child: CustomTextField(
              controller: titleController,
              focusNode: titleCode,
              nextNode: descriptionCode,
              hintText: "Title",
              isPhoneNumber: false,
              maxLine: 1,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
            ),
          ),
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03),
              child: Text("Description",style: montserratBold.copyWith(color: ColorResources.BLACK))),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.02,vertical: AppConstants.itemHeight*0.01),
            child: CustomTextField(
              controller: descriptionController,
              focusNode: descriptionCode,
              nextNode: amountCode,
              hintText: "Description",
              isPhoneNumber: false,
              maxLine: 3,
              textInputType: TextInputType.multiline,
              textInputAction: TextInputAction.newline,
            ),
          ),

          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03),
              child: Row(
                children: [
                  Text("Date",style: montserratBold.copyWith(color: ColorResources.BLACK),),
                  Text("*",style: montserratBold.copyWith(color: ColorResources.RED_1),)
                ],
              )),
          GestureDetector(
            onTap: () {
              _date_pik_shcedule();
              print("object:::$date_shcedule");
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.02,vertical: AppConstants.itemHeight*0.01),
              child: CustomDateTextField(
                controller: dateController,
                focusNode: dateCode,
                nextNode: onlineCode,
              ),
            ),
          ),
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03),
              child: Row(
                children: [
                  Text("Amount",style: montserratBold.copyWith(color: ColorResources.BLACK)),
                  Text("*",style: montserratBold.copyWith(color: ColorResources.RED_1))
                ],
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.02,vertical: AppConstants.itemHeight*0.01),
            child: CustomTextField(
              controller: amountController,
              focusNode: amountCode,
              nextNode: dateCode,
              hintText: "Amount",
              isPhoneNumber: true,
              maxLine: 1,
              textInputType: TextInputType.number,
              textInputAction: TextInputAction.next,
            ),
          ),
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03),
              child: Row(
                children: [
                  Text("Image",style: montserratBold.copyWith(color: ColorResources.BLACK),),
                  // Text("*",style: montserratBold.copyWith(color: ColorResources.RED_1),)
                ],
              )),
          Container(
            alignment: Alignment.centerLeft,
            height: AppConstants.itemHeight*0.065,
            margin: EdgeInsets.only(left: AppConstants.itemWidth*0.02,right: AppConstants.itemWidth*0.02,top: AppConstants.itemHeight*0.01),
            padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.02),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(05),
                border: Border.all(color: ColorResources.BLACK)
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () => profile_Image(),
                  child: Container(
                      alignment: Alignment.center,
                      height: AppConstants.itemHeight*0.04,
                      width: AppConstants.itemWidth*0.20,
                      decoration: BoxDecoration(
                          color: ColorResources.GREY.withOpacity(0.10),
                          borderRadius: BorderRadius.circular(05),
                          border: Border.all(color: ColorResources.BLACK)
                      ),
                      child: Text('Pick File',style: montserratBold.copyWith(color: ColorResources.BLACK))),
                ),
                // Container(
                //     width: AppConstants.itemWidth * 0.65,
                //     margin: EdgeInsets.only(left: AppConstants.itemWidth * 0.01),
                //     child: Text(imageFile.path != null ? imageFile.path : 'Pick File',
                //       style: montserratBold.copyWith(color: ColorResources.BLACK),
                //     ))
              ],
            ),
          ),
          imageFile.path == ''?SizedBox():
          GestureDetector(
            onTap: () {
              showDialog(context: context, builder: (context) {
                return Dialog(
                  child: Container(
                    height: AppConstants.itemHeight*0.45,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: FileImage(imageFile),fit: BoxFit.fill)
                    ),
                  ),
                );
              },);
            },
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: AppConstants.itemHeight*0.35,
                  width: AppConstants.itemWidth*0.70,
                  padding: EdgeInsets.only(bottom: AppConstants.itemHeight*0.30,left: AppConstants.itemWidth*0.60),
                  margin: EdgeInsets.only(top: AppConstants.itemHeight*0.01),
                  decoration: BoxDecoration(image: DecorationImage(image: FileImage(imageFile),fit: BoxFit.fill)),
                  child: GestureDetector(
                    onTap: () {
                      showDialog<bool>(
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: const Text("Are You Sure You Want to Remove ?"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      imageFile = File('');
                                      AppConstants.getToast("Image Remove Successfully.");
                                      Navigator.pop(context);
                                      print("imagePath::${imageFile.path}");
                                    });
                                  },
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(ColorResources.LINE_BG),
                                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(05))))
                                  ),
                                  child: Text('Yes',style: montserratRegular.copyWith(color: ColorResources.WHITE),),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(ColorResources.LINE_BG),
                                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(05))))
                                  ),
                                  child: Text('No',style: montserratRegular.copyWith(color: ColorResources.WHITE),),
                                ),
                              ],
                            );
                          },context: context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: AppConstants.itemHeight*0.01),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorResources.WHITE,
                      ),
                      child: Icon(Icons.clear,color: ColorResources.LINE_BG,size:27),
                    ),
                  ),
                ),
              ],
            ),
          ),
          CustomButtonFuction(
              onTap: (){},
              buttonText: "Add"
          ),
        ],
      ),
    );
  }

  void _date_pik_shcedule() {
    showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: ColorResources.LINE_BG, // header background color
                onPrimary: ColorResources.WHITE, // header text color
                onSurface: ColorResources.BLACK, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: ColorResources.LINE_BG, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1970),
        lastDate: DateTime(2040))
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
        dateController.text = formattedDate;
      });
    });
  }

  Future profile_Image() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    File? file = File(profileimageFile.path);

    print("image:::${profileimageFile.path}");
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        print("object:::${pickedFile.path}");
      });
      print('Image file Path:::::::::${imageFile.path}');
    }
    return file;
  }
}
