import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:watertankclening/view/basewidget/confirm_dialog_view.dart';


class AppConstants {

  static const String APP_NAME = 'Water Tank Cleaning';
  static const String BASE_URL = 'http://api.welinfoweb.in/';
  static const String LOGIN_URI = 'Api/Login/UserLogin';
  /* Customer */
  static const String PAYMENT_URI = 'Api/profile/GasDetailByMobile';
  static const String ADD_CUSTOMER_URI = 'api/ManageCustomer/InsertCustomer';
  static const String DELETE_CUSTOMER_URI = 'api/ManageCustomer/DeleteCustomer';
  static const String UPDATE_CUSTOMER_URI = 'api/ManageCustomer/UpdateCustomer';
  static const String CUSTOMER_LIST_URI = 'api/ManageCustomer/GetCustomerlist';
  static const String EDIT_CUSTOMER_URI = 'api/ManageCustomer/EditCustomerlist';
  /* Route */
  static const String ADD_ROUTE_URI = 'Api/Client/InsertClient';
  static const String InsertStockAndQty_URI = 'Api/Client/InsertStockAndQty';
  static const String StockAndQty_LIST_URI = 'Api/Client/RouteStockWiseDetails?intRouteId=';
  static const String DeleteStockAndQty_URI = 'Api/Client/DeleteStockAndQty';
  static const String ITEM_LIST_URI = 'Api/Client/Selectlist';
  static const String DRIVER_LIST_URI = 'Api/Client/GetUserlist';
  static const String ROUTE_LIST_URI = 'Api/Client/RouteUserList?intComapnyId=';
  static const String DELETE_ROUTE_LIST_URI = 'Api/Client/DeleteClient';
  static const String ROUTE_DETAIL_LIST_URI = 'Api/Client/GetStockByID';
  static const String SELECT_ROUTE_URI = 'Api/TempInvoice/SelectRouteList?intCompanyId=';
  /* Temp Invoice */
  static const String ADD_TEMP_INVOICE_URI = 'Api/TempInvoice/InsertInvoice';
  static const String DELETE_TEMP_INVOICE_URI = 'Api/TempInvoice/DeleteInvoice';
  static const String TEMP_INVOICE_LIST_URI = 'Api/TempInvoice/GetInvoicelist';
  static const String EDIT_INVOICE_LIST_URI = 'Api/TempInvoice/EditInvoice';
  static const String ADD_INVOICE_STOCK_URI = 'Api/TempInvoice/MstItemsDetails';
  static const String INVOICE_STOCK_LIST_URI = 'Api/TempInvoice/ItemDetails/?inttempinvoiceId=';
  static const String DELETE_INVOICE_STOCK_URI = 'Api/TempInvoice/DeleteDetails';
  /* Payment */
  static const String ADD_PAYMENT_URI = 'Api/Payments/InsertPayment';
  static const String DELETE_PAYMENT_URI = 'Api/Payments/DeletePayment';
  static const String PAYMENT_LIST_URI = 'Api/Payments/Selectlist';
  static const String UPDATE_PAYMENT_LIST_URI = 'Api/Payments/UpdatePayment';
  static const String EDIT_PAYMENT_LIST_URI = 'Api/Payments/EditList';

  static const String THEME = 'theme';
  static const String TOKEN = 'token';

  static String isLoggedIn = "isLoggedIn";
  static const String INTRO = 'intro';
  static const String password = 'Password';
  static const String email = 'email';
  static const int userId = 0;
  static const String mobile = 'mobile';
  static const String fName = 'fname';
  static const String lName = 'lname';
  static const String companyName = 'cname';
  static const int companyId = 0;

  static var screenSize;
  static double itemHeight=0.0;
  static double itemWidth=0.0;


  static bool isNotValid(String email) {
    return !RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  // Close KeyBoard
  static closeKeyboard() {
    return SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  static getToast(String msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16
    );
  }

  static date_formate_change(String date){
    DateTime parseDate =DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(date,true);
    var inputDate = DateTime.parse(parseDate.toLocal().toString());
    var outputFormat = DateFormat("dd-MM-yyyy");
    // var outputFormat = DateFormat("dd-MM-yyyy hh:mm a");
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  static date_change(String date){
    DateTime parseDate =DateFormat("dd/MM/yyy").parse(date,true);
    var inputDate = DateTime.parse(parseDate.toLocal().toString());
    var outputFormat = DateFormat("yyyy-MM-dd");
    // var outputFormat = DateFormat("dd-MM-yyyy hh:mm a");
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }


  static Future<bool> onWillPop(BuildContext context) {
    return showDialog<bool>(
        builder: (BuildContext context) {
          return ConfirmDialogView(
              description: "Do You Really Want To Quit?",
              leftButtonText: "CANCEL",
              rightButtonText: "OK",
              onAgreeTap: () {
                SystemNavigator.pop();
              });
        }, context: context).then((value) => value ?? false);
  }
}
