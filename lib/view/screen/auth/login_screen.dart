import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watertankclening/data/model/body/login_body.dart';
import 'package:watertankclening/helper/preferenceutils.dart';
import 'package:watertankclening/provider/auth_provider.dart';
import 'package:watertankclening/utill/app_constants.dart';
import 'package:watertankclening/utill/color_resources.dart';
import 'package:watertankclening/utill/dimensions.dart';
import 'package:watertankclening/utill/styles.dart';
import 'package:watertankclening/view/basewidget/bezierContainer.dart';
import 'package:watertankclening/view/basewidget/custom_password_textfield.dart';
import 'package:watertankclening/view/basewidget/custom_textfield.dart';
import 'package:watertankclening/view/screen/auth/forgot_password.dart';
import 'package:watertankclening/view/screen/auth/social_login_widget.dart';
import 'package:watertankclening/view/screen/dashboard/dashboard_screen.dart';

import '../../basewidget/custom_button.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode nameCode = FocusNode();
  FocusNode passwordCode = FocusNode();
  LoginBody loginBody = LoginBody();

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
          text: 'Lo',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: ColorResources.RED
          ),
          children: [
            TextSpan(
              text: 'g',
              style: TextStyle(color: ColorResources.RED, fontSize: 30),
            ),
            TextSpan(
              text: 'in',
              style: TextStyle(color: ColorResources.RED, fontSize: 30),
            ),
          ]),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 01),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2),
            child: Text('Or',style: montserratSemiBold.copyWith(color: ColorResources.BLACK,fontSize: Dimensions.FONT_SIZE_15),),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 01),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  _login(){
    if (nameController.text == '') {
      AppConstants.getToast("Please Enter Email Id");
    }else if(AppConstants.isNotValid(nameController.text)){
      AppConstants.getToast("Please Enter Valid Email Id");
    }else if(passwordController.text == ''){
      AppConstants.getToast("Please Enter Password");
    }else{
      loginBody.email = nameController.text;
      loginBody.password = passwordController.text;
      Provider.of<AuthProvider>(context, listen: false).login(loginBody,route);
      AppConstants.closeKeyboard();
    }
  }

  route(isRoute,String msg, dynamic errorMessage){
    if (isRoute) {
      if (errorMessage == null) {
        print("object:::1:::");
        AppConstants.getToast("This Email Id is not Found");
        nameController.clear();
        passwordController.clear();
      } else {
        print("object:::1:0: $msg::::$errorMessage");
        errorMessage == null?print("object:::Home::"):print("object::Dash::");
        PreferenceUtils.setlogin(AppConstants.isLoggedIn, true);
        errorMessage == null?AppConstants.getToast("This Email Id is not Found"):AppConstants.getToast("Login Successfull");
        Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard(),));
      }
    } else{
      print("object:::2:::");
      AppConstants.getToast("This Email Id is not Found");
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => AppConstants.onWillPop(context),
      child: SafeArea(
        child: Scaffold(
          body: Container(
            height: AppConstants.itemHeight,
            child: Stack(
              children: <Widget>[
                Positioned(
                    top: -AppConstants.itemHeight * .15,
                    right: -MediaQuery.of(context).size.width * .4,
                    child: const BezierContainer()),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: AppConstants.itemHeight * .27),
                        _title(),
                        const SizedBox(height: 50),
                        Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03),
                            child: Text("Email Id",style: montserratSemiBold.copyWith(color: ColorResources.BLACK),)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.02,vertical: AppConstants.itemHeight*0.01),
                          child: CustomTextField(
                            controller: nameController,
                            focusNode: nameCode,
                            nextNode: passwordCode,
                            hintText: "Email Id",
                            isPhoneNumber: false,
                            textInputType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03),
                            child: Text("Password",style: montserratSemiBold.copyWith(color: ColorResources.BLACK),)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.02,vertical: AppConstants.itemHeight*0.01),
                          child: CustomPasswordTextField(
                            controller: passwordController,
                            focusNode: passwordCode,
                            nextNode: null,
                            hintTxt: "Password",
                            textInputType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword(),));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            alignment: Alignment.centerRight,
                            child: const Text('Forgot Password ?',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500)),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Provider.of<AuthProvider>(context).isLoading
                            ? Center(
                          child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                            :
                        CustomButtonFuction(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard(),)),
                            buttonText: "Login"),
                        _divider(),
                        Social_Login_Screen(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
