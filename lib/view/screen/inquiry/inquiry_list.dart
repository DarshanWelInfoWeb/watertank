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
      body: Container(
        margin: EdgeInsets.all(AppConstants.itemHeight*0.01),
        // padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.01),
        // decoration: BoxDecoration(
        //   color: ColorResources.WHITE,
        //   borderRadius: const BorderRadius.all(Radius.circular(10)),
        //   boxShadow: <BoxShadow>[
        //     BoxShadow(
        //         color: Colors.grey.shade400,
        //         offset: const Offset(2, 4),
        //         blurRadius: 3,
        //         spreadRadius: 1)
        //   ],
        // ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.01,vertical: AppConstants.itemHeight*0.0),
              padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.02,vertical: AppConstants.itemHeight*0.005),
              decoration: BoxDecoration(
                color: ColorResources.GREY.withOpacity(0.05),
                borderRadius:BorderRadius.circular(10),
              ),
              child: DropdownButtonHideUnderline(
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        width: AppConstants.itemWidth*0.80,
                        height: AppConstants.itemHeight*0.05,
                        padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.02,vertical: AppConstants.itemHeight*.005),
                        child: TypeAheadFormField(
                          textFieldConfiguration: TextFieldConfiguration(
                            controller: inquiryController,
                            keyboardType: TextInputType.text,
                            onTap: () {
                              // customerController.clear();
                              // customerName = "";
                            },
                            cursorColor: ColorResources.LINE_BG,
                            style: montserratRegular.copyWith(fontWeight: FontWeight.w600,color: ColorResources.BLACK),
                            decoration: InputDecoration(
                              hintText: 'Search Inquiry',
                              hintStyle: montserratRegular.copyWith(fontWeight: FontWeight.w600,color: ColorResources.BLACK),
                              border: InputBorder.none,
                            ),
                          ),
                          suggestionsCallback: (pattern) {
                            return [];
                          },
                          itemBuilder: (context, suggestion) {
                            return Container(
                              alignment: Alignment.centerLeft,
                              height: AppConstants.itemHeight*0.05,
                              padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.02),
                              child: Text(suggestion.srtFullName.toString(),style: montserratRegular.copyWith(fontWeight: FontWeight.w600,color: ColorResources.BLACK)),
                            );
                          },
                          suggestionsBoxDecoration: SuggestionsBoxDecoration(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )
                          ),
                          onSuggestionSelected: (suggestion) {
                            // setState(() {
                            //   customerName = suggestion.srtFullName!;
                            //   customerDropDown = suggestion.intId!;
                            //   customerController.text = customerName!;
                            //   AppConstants.closeKeyboard();
                            //   Provider.of<InvoiceProvider>(context, listen: false).getMainInvoiceList(context,PreferenceUtils.getString("${AppConstants.companyId}"),start_date,end_date,customerDropDown.toString()).then((value) {
                            //     setState(() {
                            //       is_loading = false;
                            //     });
                            //   });
                            // });
                          },
                          noItemsFoundBuilder: (context) {
                            return DataNotFoundScreen("No Item Found");
                          },
                        ),
                      ),
                      const Icon(Icons.arrow_drop_down_outlined,color: ColorResources.GREY),
                    ],
                  )
              ),
            ),
            Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      // padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.02,vertical: AppConstants.itemHeight*0.005),
                      decoration: BoxDecoration(
                          color: index.isEven ? ColorResources.WHITE : Colors.grey.shade100,
                          border: Border.symmetric(horizontal: BorderSide(color: index == 0 ?ColorResources.WHITE:ColorResources.BLACK,width: 0.02))
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(AppConstants.itemHeight*0.0),
                        title: Row(
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
                            SizedBox(width: AppConstants.itemWidth*0.02),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  width: AppConstants.itemWidth*0.58,
                                  child: Text("Name",
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
                                      child: Text("9866564523",
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
                                      child: Text(" Ahmedabad",
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
                          ],
                        ),
                        trailing: Container(
                          alignment: Alignment.centerRight,
                          width: AppConstants.itemWidth*0.14,
                          child: Row(
                            children: [
                              IconButton(onPressed: () => makingPhoneCall("9866564523"), icon: const Icon(Icons.call,color: ColorResources.LINE_BG,size: 20)),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
            ),
          ],
        ),
      ),
    );
  }
}
