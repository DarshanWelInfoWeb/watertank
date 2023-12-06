import 'package:cached_network_image/cached_network_image.dart';
import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:water_tank_clean_service/utill/app_constants.dart';
import 'package:water_tank_clean_service/utill/color_resources.dart';
import 'package:water_tank_clean_service/utill/dimensions.dart';
import 'package:water_tank_clean_service/utill/images.dart';
import 'package:water_tank_clean_service/utill/styles.dart';
import 'package:water_tank_clean_service/view/basewidget/no_internet_screen.dart';
import 'package:water_tank_clean_service/view/screen/inquiry/add_inquiry.dart';

class InquiryList extends StatefulWidget {
  const InquiryList({super.key});

  @override
  State<InquiryList> createState() => _InquiryListState();
}

class _InquiryListState extends State<InquiryList> {
  TextEditingController inquiryController = TextEditingController();
  int isDelete = -1;
  bool isLoading = true;

  makingPhoneCall(mobile) async {
    var url = Uri.parse("tel: $mobile");

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print("object");
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      customerFiltered = isLoading
          ? items
          : items
          .where((item) => item.name.toUpperCase().contains("") ||
          item.name.toLowerCase().contains("") ||
          item.mobile.toUpperCase().contains("") ||
          item.mobile.toLowerCase().contains(""))
          .toList();
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
        title: Text("Inquiry",style: montserratSemiBold.copyWith(color: ColorResources.WHITE,fontSize: Dimensions.FONT_SIZE_20),),
      ),
      floatingActionButton: DraggableFab(
        child: FloatingActionButton(
          // shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(100)
          // ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AddInquiry(),));
          },
          backgroundColor: ColorResources.LINE_BG,
          child: const Icon(Icons.add,size: 40,color: ColorResources.WHITE),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            // width: AppConstants.itemWidth*0.70,
            height: AppConstants.itemHeight * 0.06,
            margin: EdgeInsets.symmetric(horizontal: AppConstants.itemHeight*0.01,vertical: AppConstants.itemHeight*0.01),
            decoration: BoxDecoration(
              color: ColorResources.WHITE,
              borderRadius:BorderRadius.circular(10),
              border: Border.all(color: ColorResources.GREY),
            ),
            child: TextFormField(
              controller: inquiryController,
              maxLines: 1,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              cursorColor: ColorResources.LINE_BG,
              style: montserratRegular.copyWith(fontWeight: FontWeight.w500,color: ColorResources.BLACK,fontSize: 17),
              enableSuggestions: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search,color: ColorResources.GREY,size: 25),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.cancel,color: ColorResources.GREY,size: 25),
                  onPressed: () {
                    setState(() {
                      inquiryController.clear();
                      customerFiltered = items;
                      AppConstants.closeKeyboard();
                    });
                  },
                ),
                hintText: "Search Inquiry",
                hintStyle: montserratSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_16),
                focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
                border: InputBorder.none,
                fillColor: ColorResources.WHITE,
                contentPadding: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.02, horizontal: AppConstants.itemWidth*0.006),
              ),
              onChanged: (value) => _onSearchTextChanged(inquiryController.text),
            ),
          ),
          Flexible(
              child:
                  customerFiltered.isNotEmpty
                      ?
                  ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth * 0.01),
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: customerFiltered.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Container(
                    // padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.02,vertical: AppConstants.itemHeight*0.005),
                    decoration: BoxDecoration(
                        color: index.isEven ? ColorResources.WHITE : Colors.grey.shade100,
                        border: Border.symmetric(horizontal: BorderSide(color: index == 0 ?ColorResources.WHITE:ColorResources.BLACK,width: 0.02))
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.005),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            width: AppConstants.itemWidth*0.87,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                        radius: 25,
                                        backgroundColor: ColorResources.transparant,
                                        child: CachedNetworkImage(
                                          fit: BoxFit.fill,
                                          imageUrl: "https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745",
                                          imageBuilder: (context, imageProvider) =>
                                              Container(
                                                width: AppConstants.itemWidth * 0.25,
                                                height: AppConstants.itemWidth * 0.25,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.fill),
                                                ),
                                              ),
                                          placeholder: (context, url) => const Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(ColorResources.LINE_BG))),
                                          errorWidget: (context, url, error) => const Image(image: AssetImage(Images.logo)),
                                        )),
                                    SizedBox(width: AppConstants.itemWidth*0.01),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          width: AppConstants.itemWidth*0.58,
                                          child: Text(customerFiltered[index].name,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: montserratSemiBold.copyWith(
                                                  color: ColorResources.BLACK,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: Dimensions.FONT_SIZE_18)),
                                        ),
                                        SizedBox(height: AppConstants.itemHeight * 0.01),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            const Icon(Icons.phone,color: ColorResources.GREY,size: 14),
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              width: AppConstants.itemWidth*0.23,
                                              child: Text(customerFiltered[index].mobile,
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: montserratRegular.copyWith(
                                                      color: ColorResources.BLACK,
                                                      fontSize: Dimensions.FONT_SIZE_14)),
                                            ),
                                            // SizedBox(width: AppConstants.itemWidth * 0.005),
                                            const Icon(Icons.location_on_outlined,color: ColorResources.GREY,size: 14),
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              width: AppConstants.itemWidth*0.3,
                                              child: Text(customerFiltered[index].address,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: montserratRegular.copyWith(
                                                      color: ColorResources.BLACK,
                                                      fontSize: Dimensions.FONT_SIZE_14)),
                                            ),
                                            // SizedBox(width: AppConstants.itemWidth * 0.005),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Container(
                                      alignment: Alignment.centerRight,
                                      width: AppConstants.itemWidth*0.10,
                                      child: IconButton(onPressed: () => makingPhoneCall(customerFiltered[index].mobile), icon: const Icon(Icons.call,color: ColorResources.LINE_BG,size: 20)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          PopupMenuButton(
                            color: ColorResources.WHITE,
                            surfaceTintColor: ColorResources.WHITE,
                            elevation: 10,
                            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                            onSelected: (value) {
                              if(value == 0){

                              }else{
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
                                                items.remove(item);
                                                Navigator.of(context).pop();
                                              });
                                              // Provider.of<InvoiceProvider>(context, listen: false).getDeleteMainInvoice(context,"${invoice.mainInvoiceList[index].intid}").then((value) {
                                              //   AppConstants.getToast("Deleted Successfully");
                                              //   Navigator.push(context, MaterialPageRoute(builder: (context) => InvoiceList("","",customerDropDown.toString(),"Invoice")));
                                              // });
                                            },
                                            style: const ButtonStyle(
                                                backgroundColor: MaterialStatePropertyAll(ColorResources.LINE_BG),
                                                shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(05))))
                                            ),
                                            child: Text('Yes',style: montserratRegular.copyWith(color: ColorResources.WHITE)),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            style: const ButtonStyle(
                                                backgroundColor: MaterialStatePropertyAll(ColorResources.LINE_BG),
                                                shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(05))))
                                            ),
                                            child: Text('No',style: montserratRegular.copyWith(color: ColorResources.WHITE)),
                                          ),
                                        ],
                                      );
                                    },context: context);
                              }
                            },
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(value: 0,child: Row(
                                  children: [
                                    const Icon(Icons.done,color: ColorResources.BLACK,),
                                    Text('Completed',style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: Dimensions.FONT_SIZE_15)),
                                  ],
                                )),
                                PopupMenuItem(value: 1,child: Row(
                                  children: [
                                    const Icon(Icons.delete,color: ColorResources.BLACK),
                                    Text('Delete',style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: Dimensions.FONT_SIZE_15)),
                                  ],
                                )),
                              ];
                            },
                            child: const Icon(Icons.more_vert,color: ColorResources.BLACK,),
                          ),
                        ],
                      ),
                    )
                  );
                },
              )
                      :
                  DataNotFoundScreen("No Data Found"),
          ),
        ],
      ),
    );
  }

  final List<Item> items = [
    Item("9767456780","Rajubhai","Surat"),
    Item("9386156780","Maheshbhai","Surat"),
    Item("9386156780","Rajubhai","Surat"),
    Item("9386132159","Govindbhai","Surat"),
    Item("9386156780","Rajubhai","Surat"),
    Item("9386156780","Rajubhai","Surat"),
    Item("9386132159","Govindbhai","Surat"),
    Item("9386156780","Rajubhai","Surat"),
    Item("9386109873","Movlikbhai","Surat"),
    Item("9386109873","Movlikbhai","Surat"),
  ];

  List<Item> customerFiltered = [];
  
  void _onSearchTextChanged(String text) {
    setState(() {
      print("search::$text");
      customerFiltered = text.isEmpty
          ? items
          : items
          .where((item) => item.name.toUpperCase().contains(text.toUpperCase()) ||
          item.name.toLowerCase().contains(text.toLowerCase()) ||
          item.mobile.toUpperCase().contains(text) ||
          item.mobile.toLowerCase().contains(text))
          .toList();
    });
  }
}


class Item {
  String mobile;
  String name;
  String address;

  Item(this.mobile, this.name,this.address);
}
