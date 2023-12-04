import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:watertankclening/helper/preferenceutils.dart';
import 'package:watertankclening/utill/app_constants.dart';
import 'package:watertankclening/utill/color_resources.dart';
import 'package:watertankclening/utill/images.dart';
import 'package:watertankclening/utill/styles.dart';
import 'package:watertankclening/view/basewidget/confirm_dialog_view.dart';
import 'package:watertankclening/view/screen/auth/login_screen.dart';
import 'package:watertankclening/view/screen/dashboard/dashboard_screen.dart';
import 'package:watertankclening/view/screen/dashboard/widget/change_password.dart';
import 'package:watertankclening/view/screen/dashboard/widget/profile.dart';

class Drawer_View extends StatefulWidget {
  const Drawer_View({Key? key}) : super(key: key);

  @override
  State<Drawer_View> createState() => _Drawer_ViewState();
}

class _Drawer_ViewState extends State<Drawer_View> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20)),
        child: Drawer(
          child: Scaffold(
            body: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: AppConstants.itemHeight*0.25,
                      width:AppConstants.itemWidth,
                      child: ClipRRect(
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: "https://img.freepik.com/free-photo/calculator-money-notepad-keyboard-yellow-background-flat-lay_169016-24505.jpg",
                          placeholder: (context, url) => Icon(Icons.image),
                          errorWidget: (context, url, error) => Icon(Icons.image),
                        ),
                      ),
                    ),
                    Column(children: [
                      SizedBox(height: AppConstants.itemHeight*0.02),
                      GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(),)),
                        child: CircleAvatar(
                            radius: 60,
                            backgroundColor: ColorResources.transparant,
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl: "https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745",
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                    width: AppConstants.itemWidth * 0.3,
                                    height: AppConstants.itemWidth * 0.3,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                              placeholder: (context, url) => const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(ColorResources.LINE_BG)),
                              errorWidget: (context, url, error) =>
                              const Image(image: AssetImage(Images.logo),),
                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 05),
                        child: Text(PreferenceUtils.getString(AppConstants.companyName),
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            style: montserratSemiBold.copyWith(
                                color: ColorResources.BLACK,
                                fontSize: 17,
                                fontWeight: FontWeight.w600)),
                      ),
                    ],),
                  ],
                ),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    children: [
                      SizedBox(
                        height: AppConstants.itemHeight*0.07,
                        child: ListTile(
                          onTap:() {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Dashboard(),));
                          },
                          leading: const Icon(Icons.dashboard,color: ColorResources.LINE_BG,size: 30,),
                          title: Text("Dashboard",style: montserratSemiBold.copyWith(fontSize: 17),),),
                      ),
                      SizedBox(
                        height: AppConstants.itemHeight*0.07,
                        child: ListTile(
                          onTap:() {
                            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DailyUpdate(),));
                          },
                          leading: const Image(image: AssetImage(Images.update),color: ColorResources.LINE_BG,height: 30,width: 30),
                          title: Text("Daily Update",style: montserratSemiBold.copyWith(fontSize: 17),),),
                      ),
                      SizedBox(
                        height: AppConstants.itemHeight*0.07,
                        child: ListTile(
                          onTap:() {
                            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CustomerList(),));
                          },
                          leading: const Image(image: AssetImage(Images.team),color: ColorResources.LINE_BG,height: 30,width: 30),
                          title: Text("Manage Customer",style: montserratSemiBold.copyWith(fontSize: 17),),),
                      ),
                      SizedBox(
                        height: AppConstants.itemHeight*0.07,
                        child: ListTile(
                          onTap:() {
                            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchCustomer(),));
                          },
                          leading: const Icon(Icons.search,color: ColorResources.LINE_BG,size: 30,),
                          title: Text("Search Customer",style: montserratSemiBold.copyWith(fontSize: 17),),),
                      ),
                      SizedBox(
                        height: AppConstants.itemHeight*0.07,
                        child: ListTile(
                          onTap:() {
                            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const InvoiceList(),));
                          },
                          leading: const Image(image: AssetImage(Images.bookkeeping),color: ColorResources.LINE_BG,height: 30,width: 30),
                          title: Text("Manage Invoice",style: montserratSemiBold.copyWith(fontSize: 17),),),
                      ),
                      SizedBox(
                        height: AppConstants.itemHeight*0.07,
                        child: ListTile(
                          onTap:() {
                            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PaymentList(),));
                          },
                          leading: const Image(image: AssetImage(Images.payment),color: ColorResources.LINE_BG,height: 30,width: 30),
                          title: Text("Manage Temp Payment",style: montserratSemiBold.copyWith(fontSize: 17),),),
                      ),
                      SizedBox(
                        height: AppConstants.itemHeight*0.07,
                        child: ListTile(
                          onTap:() {
                            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => RouteList(""),));
                          },
                          leading: const Image(image: AssetImage(Images.route),color: ColorResources.LINE_BG,height: 30,width: 30),
                          title: Text("Route Master",style: montserratSemiBold.copyWith(fontSize: 17),),),
                      ),
                      SizedBox(
                        height: AppConstants.itemHeight*0.07,
                        child: ListTile(
                          onTap:() {
                            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => TempInvoiceList(""),));
                          },
                          leading: const Image(image: AssetImage(Images.bookkeeping),color: ColorResources.LINE_BG,height: 30,width: 30),
                          title: Text("Temp Invoice",style: montserratSemiBold.copyWith(fontSize: 17),),),
                      ),
                      SizedBox(
                        height: AppConstants.itemHeight*0.07,
                        child: ListTile(
                          onTap:() {
                            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Expense_List(),));
                          },
                          leading: const Image(image: AssetImage(Images.expense),color: ColorResources.LINE_BG,height: 30,width: 30),
                          title: Text("Expense",style: montserratSemiBold.copyWith(fontSize: 17),),),
                      ),
                      SizedBox(
                        height: AppConstants.itemHeight*0.07,
                        child: ListTile(
                          onTap:() {
                            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ItemList(),));
                          },
                          leading: const Image(image: AssetImage(Images.item),color: ColorResources.LINE_BG,height: 30,width: 30),
                          title: Text("Manage Item",style: montserratSemiBold.copyWith(fontSize: 17),),),
                      ),
                      SizedBox(
                        height: AppConstants.itemHeight*0.07,
                        child: ListTile(
                          onTap:() {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ChangePassword(),));
                          },
                          leading: const Image(image: AssetImage(Images.forgot_password),color: ColorResources.LINE_BG,height: 30,width: 30),
                          title: Text("Change Password",style: montserratSemiBold.copyWith(fontSize: 17),),),
                      ),
                      SizedBox(
                        height: AppConstants.itemHeight*0.065,
                        child: ListTile(
                          onTap:() {
                            onLogoutPop(context);
                          },
                          leading: const Icon(Icons.logout,color: ColorResources.LINE_BG,size: 30,),
                          title: Text("Log Out",style: montserratSemiBold.copyWith(fontSize: 17),),),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<bool> onLogoutPop(BuildContext context) {
    return showDialog<bool>(
        builder: (BuildContext context) {
          return ConfirmDialogView(
              description: "Are You Sure You Want To Log Out",
              leftButtonText: "No",
              rightButtonText: "Yes",
              onAgreeTap: () {
                PreferenceUtils.clear();
                PreferenceUtils.setlogin(AppConstants.isLoggedIn, false);
                Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
              });
        }, context: context).then((value) => value ?? false);
  }
}
