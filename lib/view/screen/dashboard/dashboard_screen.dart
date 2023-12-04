import 'package:flutter/material.dart';
import 'package:watertankclening/utill/app_constants.dart';
import 'package:watertankclening/utill/color_resources.dart';
import 'package:watertankclening/utill/dimensions.dart';
import 'package:watertankclening/utill/images.dart';
import 'package:watertankclening/utill/styles.dart';

import 'widget/drawer_view.dart';
import 'widget/order_type_button_head.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  String radioButtonItem = 'Today';
  int id = 1;

  @override
    void initState() {
      // TODO: implement initState
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => AppConstants.onWillPop(context),
      child: Scaffold(
        key: _key,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: ColorResources.LINE_BG,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              _key.currentState?.openDrawer();
            },
            icon: const Icon(Icons.menu, color: ColorResources.WHITE),
          ),
          title: Text("Dashboard",style: montserratSemiBold.copyWith(color: ColorResources.WHITE,fontSize: Dimensions.FONT_SIZE_20),),
          actions: [
            PopupMenuButton(
              color: ColorResources.WHITE,
              elevation: 10,
              shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(child: Row(
                    children: [
                      Icon(Icons.report,color: ColorResources.BLACK,),
                      Text('Report & Error'),
                    ],
                  )),
                  PopupMenuItem(child: Row(
                    children: [
                      Icon(Icons.error,color: ColorResources.BLACK,),
                      Text('Help'),
                    ],
                  )),
                ];
              },
            )
          ],
        ),
        drawer: const Drawer_View(),
        body: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Radio(
                  value: 1,
                  groupValue: id,
                  activeColor: ColorResources.LINE_BG,
                  onChanged: (val) {
                    setState(() {
                      radioButtonItem = 'Today';
                      id = 1;
                    });
                  },
                ),
                Text(
                  'Today',
                  style: new TextStyle(fontSize: 17.0),
                ),

                Radio(
                  value: 2,
                  groupValue: id,
                  activeColor: ColorResources.LINE_BG,
                  onChanged: (val) {
                    setState(() {
                      radioButtonItem = 'Total';
                      id = 2;
                    });
                  },
                ),
                Text(
                  'Total',
                  style: new TextStyle(
                    fontSize: 17.0,
                  ),
                ),

              ],
            ),
            /* Today */
            id==1
                ?
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OrderTypeButtonHead(
                      image: Images.increase,
                      text: 'Today Sale',
                      amount: "\u20b9 549486",
                      static: "10 %",
                      id: "1",
                      onTap: const Dashboard(),
                    ),
                    OrderTypeButtonHead(
                      image: Images.bill,
                      text: 'Today Payment',
                      amount: "\u20b9 4948",
                      static: "30 %",
                      id: "2",
                      onTap: const Dashboard(),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OrderTypeButtonHead(
                      image: Images.due_payment,
                      text: 'Today Due',
                      amount: "\u20b9 246516",
                      static: "20 %",
                      id: "1",
                      onTap: const Dashboard(),
                    ),
                    OrderTypeButtonHead(
                      image: Images.accounting,
                      text: 'Today Expense',
                      amount: "\u20b9 200000",
                      static: "50 %",
                      id: "1",
                      onTap: const Dashboard(),
                    )
                  ],
                ),
              ],
            )
                :
            const SizedBox(),
            /* Total */
            id==2
                ?
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OrderTypeButtonHead(
                      image: Images.increase,
                      text: 'Total Sale',
                      amount: "\u20b9 549486",
                      static: "60 %",
                      id: "2",
                      onTap: const Dashboard(),
                    ),
                    OrderTypeButtonHead(
                      image: Images.bill,
                      text: 'Total Payment',
                      amount: "\u20b9 4948",
                      static: "30 %",
                      id: "2",
                      onTap: const Dashboard(),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OrderTypeButtonHead(
                      image: Images.due_payment,
                      text: 'Total Due',
                      amount: "\u20b9 246516",
                      static: "23 %",
                      id: "1",
                      onTap: const Dashboard(),
                    ),
                    OrderTypeButtonHead(
                      image: Images.accounting,
                      text: 'Total Expense',
                      amount: "\u20b9 200000",
                      static: "45 %",
                      id: "2",
                      onTap: const Dashboard(),
                    )
                  ],
                ),
              ],
            )
                :
            const SizedBox(),
            /* Line Chart */
/*            Padding(
              padding: EdgeInsets.only(top: AppConstants.itemHeight*0.02),
              child: const LineChartSample1(),
            ),
            *//* Bar Chart*//*
            Padding(
              padding: EdgeInsets.only(top: AppConstants.itemHeight*0.02),
              child: BarChartSample2(),
            ),
            *//* Pie Chart*//*
            const Pie_Chart(),*/

          ],
        ),
      ),
    );
  }
}
