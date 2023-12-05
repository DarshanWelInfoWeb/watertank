import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:water_tank_clean_service/data/model/response/quotationdb.dart';
import 'package:water_tank_clean_service/helper/database.dart';
import 'package:water_tank_clean_service/utill/app_constants.dart';
import 'package:water_tank_clean_service/utill/color_resources.dart';
import 'package:water_tank_clean_service/utill/dimensions.dart';
import 'package:water_tank_clean_service/utill/styles.dart';
import 'package:water_tank_clean_service/view/basewidget/custom_button.dart';
import 'package:water_tank_clean_service/view/basewidget/custom_password_textfield.dart';
import 'package:water_tank_clean_service/view/basewidget/custom_textfield.dart';

class AddQuotation extends StatefulWidget {
  const AddQuotation({super.key});

  @override
  State<AddQuotation> createState() => _AddQuotationState();
}

class _AddQuotationState extends State<AddQuotation> {
  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController tankSizeController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  FocusNode dateCode = FocusNode();
  FocusNode nameCode = FocusNode();
  FocusNode mobileCode = FocusNode();
  FocusNode addressCode = FocusNode();
  FocusNode tankSizeCode = FocusNode();
  FocusNode amountCode = FocusNode();

  late String formattedDate = '';
  late String date_shcedule = '';
  TimeOfDay selectedTime = TimeOfDay.now();

  String radioButtonItem = 'Concrete';
  int tankTypeId = -1;

  var waterTypeList = [
    'Mineral Water',
    'Sparking Water'
  ];

  String? waterType;

  QuotationDb quotationDb = QuotationDb();
  List<InsertQuotationBody> quotationList = [];
  InsertQuotationBody? insertQuotationBody;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DateTime today = DateTime.now();
    formattedDate = DateFormat('dd/MM/yyyy').format(today);
    dateController.text = formattedDate;
    setState(() {
      quotationDb = QuotationDb();
      quotationDb.getModelList().then((value) {
        setState(() {
          quotationList.addAll(value);
          quotationList = value;
          print("object:1:¥::$quotationList");
        });
      });
    });
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
        title: Text("Add Quotation",style: montserratSemiBold.copyWith(color: ColorResources.WHITE,fontSize: Dimensions.FONT_SIZE_20),),
      ),
      body: ListView(
        children: [
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: AppConstants.itemHeight*0.01),
              padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03),
              child: Row(
                children: [
                  Text("Quotation Date",style: montserratBold.copyWith(color: ColorResources.BLACK),),
                  Text("*",style: montserratBold.copyWith(color: ColorResources.RED_1),)
                ],
              )),
          GestureDetector(
            onTap: () {
              _datePicSchedule();
              print("object:::$date_shcedule");
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.02,vertical: AppConstants.itemHeight*0.01),
              child: CustomDateTextField(
                controller: dateController,
                focusNode: dateCode,
                nextNode: nameCode,
              ),
            ),
          ),
          Container(
              alignment: Alignment.centerLeft,
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
              nextNode: addressCode,
              hintText: "Mobile Number",
              isPhoneNumber: true,
              textInputType: TextInputType.phone,
              textInputAction: TextInputAction.next,
            ),
          ),
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03),
              child: Row(
                children: [
                  Text("Address",style: montserratBold.copyWith(color: ColorResources.BLACK),),
                  Text("*",style: montserratBold.copyWith(color: ColorResources.RED_1),)
                ],
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.02,vertical: AppConstants.itemHeight*0.01),
            child: CustomTextField(
              controller: addressController,
              focusNode: addressCode,
              nextNode: tankSizeCode,
              hintText: "Address",
              isPhoneNumber: false,
              textInputType: TextInputType.streetAddress,
              textInputAction: TextInputAction.next,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.01),
            child: const Divider(
              thickness: 0.5,
              color: ColorResources.GREY,
            ),
          ),
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03),
              child: Text("Tank Size",style: montserratBold.copyWith(color: ColorResources.BLACK),)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.02,vertical: AppConstants.itemHeight*0.01),
            child: CustomTextField(
              controller: tankSizeController,
              focusNode: tankSizeCode,
              nextNode: null,
              hintText: "Tank Size",
              isPhoneNumber: true,
              textInputType: TextInputType.phone,
              textInputAction: TextInputAction.done,
            ),
          ),
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03),
              child: Text("Tank Type",style: montserratBold.copyWith(color: ColorResources.BLACK),)),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: tankTypeId,
                activeColor: ColorResources.LINE_BG,
                onChanged: (val) {
                  setState(() {
                    radioButtonItem = 'Concrete';
                    tankTypeId = 1;
                  });
                },
              ),
              Text(
                'Concrete',
                style: new TextStyle(fontSize: 17.0),
              ),

              Radio(
                value: 2,
                groupValue: tankTypeId,
                activeColor: ColorResources.LINE_BG,
                onChanged: (val) {
                  setState(() {
                    radioButtonItem = 'PVC';
                    tankTypeId = 2;
                  });
                },
              ),
              Text(
                'PVC',
                style: new TextStyle(
                  fontSize: 17.0,
                ),
              ),
            ],
          ),
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03),
              child: Text("Water Type",style: montserratBold.copyWith(color: ColorResources.BLACK),)),
          Container(
            width: AppConstants.itemWidth*0.50,
            margin: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.02,vertical: AppConstants.itemHeight*0.01),
            padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.02,vertical: AppConstants.itemHeight*0.005),
            decoration: BoxDecoration(
              color: ColorResources.GREY.withOpacity(0.05),
              borderRadius:BorderRadius.circular(10),
            ),
            child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: waterType,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  hint: Text("Select Water Type",style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: Dimensions.FONT_SIZE_14),),
                  items: waterTypeList.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  borderRadius: BorderRadius.circular(20),
                  alignment: Alignment.center,
                  onChanged: (String? newValue) {
                    setState(() {
                      waterType = newValue!;
                    });
                  },
                ),
            ),
          ),
          CustomButtonFuction(
            onTap: (){
              if(tankSizeController.text == ''){
                AppConstants.getToast("Please Enter Tank Size");
              }else if(tankTypeId == -1){
                AppConstants.getToast("Please Select Tank Type");
              }else if(waterType == null){
                AppConstants.getToast("Please Select Water Type");
              }else{
                setState(() {
                  insertQuotationBody = InsertQuotationBody(
                    tankSize: int.parse(tankSizeController.text),
                    tankType: tankTypeId,
                    tankTypename: radioButtonItem,
                    waterType: waterType,
                  );
                  EasyLoading.show();
                  quotationDb.insertModel(insertQuotationBody!).then((value) {
                    EasyLoading.dismiss();
                  });
                  tankSizeController.clear();
                  tankTypeId = -1;
                  waterType = null;
                });
              }
            },
            buttonText: "Add",
          ),
          FutureBuilder(
              future: quotationDb.getModelList(),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  quotationList = snapshot.data as List<InsertQuotationBody>;
                  return
                      quotationList.isEmpty
                          ?
                      const SizedBox()
                          :
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: DataTable(
                          dividerThickness: 1,
                          columnSpacing: AppConstants.itemWidth*0.085,
                          dataRowHeight: AppConstants.itemHeight*0.04,
                          headingRowHeight: AppConstants.itemHeight*0.04,
                          decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
                          columns: [
                            const DataColumn(label: SizedBox()),
                            DataColumn(label: _verticalDivider),
                            DataColumn(label: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(05),
                              child: Text('Tank Size',
                                  style: montserratBold.copyWith(color: ColorResources.BLACK)),
                            )),
                            DataColumn(label: _verticalDivider),
                            DataColumn(label: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(05),
                              child: Text('Water Type',
                                  style: montserratBold.copyWith(color: ColorResources.BLACK)),
                            )),
                            DataColumn(label: _verticalDivider),
                            DataColumn(label: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(05),
                              child: Text('Tank Type',
                                  style: montserratBold.copyWith(color: ColorResources.BLACK)),
                            )),
                          ],
                          rows: List.generate(quotationList.length, (index) {
                            InsertQuotationBody model = quotationList[index];
                            model = quotationList[index];
                            return DataRow(
                                cells: <DataCell>[
                                  DataCell(GestureDetector(
                                    onTap: (){
                                      showDialog<bool>(
                                          barrierDismissible: false,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              content: const Text("Are You Sure You Want to Delete ?"),
                                              contentTextStyle: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: Dimensions.FONT_SIZE_16),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      EasyLoading.show();
                                                      quotationDb.deleteModel(quotationList[index]).then((value) => EasyLoading.dismiss());
                                                      // dbManager.deleteModel(modelList[index]).then((value) {
                                                      //   Navigator.push(context, MaterialPageRoute(builder: (context) => AddRouteMaster(routeNameController.text,vehicleNumberController.text.toUpperCase(),dateController.text,int.parse(driverDropdwon.toString()),int.parse(helperDropdwon.toString()),"item"),));
                                                      // });
                                                      // itemsDropdownValue = "Select Item";
                                                      // itemsDropdownName = "";
                                                      // qtyController.text = "";
                                                      Navigator.pop(context);
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
                                                    // itemsDropdownValue = "Select Item";
                                                    // itemsDropdownName = "";
                                                    // qtyController.text = "";
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
                                        alignment: Alignment.centerRight,
                                        child: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        )),
                                  )),
                                  DataCell(Container(child: _verticalDivider)),
                                  DataCell(Container(
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.all(05),
                                      child: Text(
                                        "${model.tankSize}",
                                        style: montserratRegular.copyWith(
                                            color: ColorResources.BLACK),
                                        textAlign: TextAlign.center,
                                      ))),
                                  DataCell(Container(child: _verticalDivider)),
                                  DataCell(Container(
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.all(05),
                                      child: Text(
                                        "${model.waterType}",
                                        style: montserratBold.copyWith(
                                            color: ColorResources.BLACK),
                                        textAlign: TextAlign.center,
                                      ))),
                                  DataCell(Container(child: _verticalDivider)),
                                  DataCell(Container(
                                      alignment: Alignment.centerLeft,
                                      padding: const EdgeInsets.all(05),
                                      child: Text(
                                        "${model.tankTypename}",
                                        style: montserratBold.copyWith(
                                            color: ColorResources.BLACK),
                                        textAlign: TextAlign.center,
                                      ))),
                                ],
                            );
                          }),
                        ),
                      );
                }
                return const Center(child: CircularProgressIndicator(color: ColorResources.LINE_BG));
              },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.01),
            child: const Divider(
              thickness: 0.5,
              color: ColorResources.GREY,
            ),
          ),
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03),
              child: Text("Amount",style: montserratBold.copyWith(color: ColorResources.BLACK),)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.02,vertical: AppConstants.itemHeight*0.01),
            child: CustomTextField(
              controller: amountController,
              focusNode: amountCode,
              nextNode: null,
              hintText: "Amount",
              isPhoneNumber: true,
              textInputType: TextInputType.phone,
              textInputAction: TextInputAction.done,
            ),
          ),
          CustomButtonFuction(onTap: () {}, buttonText: "Save"),
        ],
      ),
    );
  }

  void _datePicSchedule() {
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

  final Widget _verticalDivider = const VerticalDivider(
    color: Colors.black12,
    thickness: 1,
  );
}
