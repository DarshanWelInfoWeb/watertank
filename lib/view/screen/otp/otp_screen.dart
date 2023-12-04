import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:watertankclening/provider/otp_provider.dart';
import 'package:watertankclening/utill/app_constants.dart';
import 'package:watertankclening/utill/color_resources.dart';
import 'package:watertankclening/utill/dimensions.dart';
import 'package:watertankclening/utill/styles.dart';
import 'package:watertankclening/view/basewidget/bezierContainer.dart';
import 'package:watertankclening/view/basewidget/custom_button.dart';
import 'package:watertankclening/view/screen/auth/new_password.dart';

class OTP_Screen extends StatefulWidget {
String? email;

OTP_Screen(this.email);

  @override
  State<OTP_Screen> createState() => _OTP_ScreenState();
}

class _OTP_ScreenState extends State<OTP_Screen> {
  String _verificationCode = '';

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black,size: 35),
            ),
            Text('Back',
                style: montserratSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_17, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("mobile::::::${widget.email}");
    Provider.of<OTPProvider>(context, listen: false).setReStart(context);
    Provider.of<OTPProvider>(context, listen: false).startTimer(context);
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Provider.of<OTPProvider>(context, listen: false).setStopTime();
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        backgroundColor: ColorResources.WHITE,
        body: Consumer<OTPProvider>(builder: (context, otp_provider, child) {
          return Stack(
          children: <Widget>[
            Positioned(
                top: -AppConstants.itemHeight * .15,
                right: -MediaQuery.of(context).size.width * .4,
                child: const BezierContainer()),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: AppConstants.itemHeight * .3),
                    Text("OTP",style: montserratBold.copyWith(color: ColorResources.RED, fontSize: 30,fontWeight: FontWeight.w700),),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: AppConstants.itemHeight*0.03),
                      child: Text("Enter the 4-digit OTP sent to this ${widget.email} email id",
                          textAlign: TextAlign.start,
                          style: montserratSemiBold.copyWith(
                            color: ColorResources.BLACK,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                    SizedBox(height: AppConstants.itemHeight*0.05),
                    /*---OTP Text BOX---*/
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: PinCodeTextField(
                        length: 4,
                        appContext: context,
                        obscureText: false,
                        showCursor: true,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          fieldHeight: 45,
                          fieldWidth: 45,
                          borderWidth: 1,
                          fieldOuterPadding: const EdgeInsets.only(left: 20,right: 20),
                          borderRadius: BorderRadius.circular(05),
                          selectedColor: Theme.of(context).primaryColor,
                          selectedFillColor: Colors.white,
                          inactiveFillColor: ColorResources.TEXT_COLOR.withOpacity(0.39),
                          inactiveColor: const Color(0x30192D6B),
                          activeColor: const Color(0x50192D6B),
                          activeFillColor: const Color(0xFFF4F7FC),
                        ),
                        animationDuration: const Duration(milliseconds: 300),
                        backgroundColor: Colors.transparent,
                        enableActiveFill: true,
                        onChanged: (value) => _verificationCode = value,
                        beforeTextPaste: (text) {
                          return true;
                        },
                      ),
                    ),
                    // Timer
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 20,right: 10),
                      child: Row(
                        children: [
                          Visibility(
                            visible: otp_provider.start == 0 ? false : true,
                            child: Center(
                              child: Text(
                                  'Seconds Remaining : ${Provider.of<OTPProvider>(context, listen: false).start}',
                                  style: montserratRegular.copyWith(
                                      color: const Color(0xffA3A2A7),
                                      fontWeight: FontWeight.w700,
                                      fontSize: Dimensions.FONT_SIZE_14)),
                            ),
                          ),
                          // Resend OTP
                          Visibility(
                            visible: otp_provider.start == 0 ? true : false,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Did’t not receive OTP ?',
                                    style: montserratRegular.copyWith(
                                        color: const Color(0xffA3A2A7),
                                        fontWeight: FontWeight.w700,
                                        fontSize: Dimensions.FONT_SIZE_14)),
                                const SizedBox(width: 05,),

                                InkWell(
                                  onTap: () {
                                    setState(()  {
                                    });
                                  },
                                  child: Text('Resend OTP',
                                      style: montserratRegular.copyWith(
                                          color: ColorResources.LINE_BG,
                                          decoration: TextDecoration.underline,
                                          decorationColor: ColorResources.BLACK,
                                          fontWeight: FontWeight.w700,
                                          fontSize: Dimensions.FONT_SIZE_14)),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: AppConstants.itemHeight*0.10),
                      child: CustomButtonFuction(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => NewPassword(),));
                          },
                          buttonText: "Continue"),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: _backButton()),
          ],
        );
        }),
      ),
    );
  }
}
