import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:water_tank_clean_service/utill/app_constants.dart';
import 'package:water_tank_clean_service/utill/color_resources.dart';
import 'package:water_tank_clean_service/utill/dimensions.dart';
import 'package:water_tank_clean_service/utill/styles.dart';
import 'package:water_tank_clean_service/view/screen/expense/add_expense.dart';

class ExpenseList extends StatefulWidget {
  const ExpenseList({super.key});

  @override
  State<ExpenseList> createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
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
        title: Text("Expense",style: montserratSemiBold.copyWith(color: ColorResources.WHITE,fontSize: Dimensions.FONT_SIZE_20),),
      ),
      floatingActionButton: DraggableFab(
        child: FloatingActionButton(
          // shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(100)
          // ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AddExpense(),));
          },
          backgroundColor: ColorResources.LINE_BG,
          child: const Icon(Icons.add,size: 40,color: ColorResources.WHITE),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(AppConstants.itemHeight*0.01),
        padding: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.01),
        decoration: BoxDecoration(
          color: ColorResources.WHITE,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade400,
                offset: const Offset(2, 4),
                blurRadius: 3,
                spreadRadius: 1)
          ],
        ),
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.003),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Tank Cleaning",
                              style: montserratSemiBold.copyWith(
                                  color: ColorResources.BLACK,
                                  fontSize: Dimensions.FONT_SIZE_14),
                            )),
                        Text("04/12/2023",style: montserratSemiBold.copyWith(color: ColorResources.GREY,fontSize: Dimensions.FONT_SIZE_14),)
                      ],
                    ),
                    Text("\u20b9 5000",style: montserratBold.copyWith(color: ColorResources.BLACK,fontSize: Dimensions.FONT_SIZE_15),),
                  ],
                ),
                trailing: PopupMenuButton(
                  color: ColorResources.WHITE,
                  surfaceTintColor: ColorResources.WHITE,
                  elevation: 10,
                  shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  onSelected: (result) {
                    if (result == 0) {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => Edit_Expense(expense.expenseList[index].intId.toString(),expense.expenseList[index].expenseType.toString()),));
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
                                    // Provider.of<ExpenseProvider>(context, listen: false).getDeleteExpense(context,expense.expenseList[index].intId.toString()).then((value) {
                                    //   AppConstants.getToast("Deleted Successfully");
                                    //   Navigator.push(context, MaterialPageRoute(builder: (context) => Expense_List("","","Expense"),));
                                    // });
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
                    }
                  },
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(value: 0,child: Row(
                        children: [
                          const Icon(Icons.edit,color: ColorResources.BLACK,),
                          Text('Edit',style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: Dimensions.FONT_SIZE_15)),
                        ],
                      )),
                      PopupMenuItem(value: 1,child: Row(
                        children: [
                          const Icon(Icons.delete,color: ColorResources.BLACK,),
                          Text('Delete',style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: Dimensions.FONT_SIZE_15)),
                        ],
                      )),
                    ];
                  },
                  child: const Icon(Icons.more_vert,color: ColorResources.BLACK,),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
