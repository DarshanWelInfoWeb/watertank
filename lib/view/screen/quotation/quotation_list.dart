import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:water_tank_clean_service/utill/app_constants.dart';
import 'package:water_tank_clean_service/utill/color_resources.dart';
import 'package:water_tank_clean_service/utill/dimensions.dart';
import 'package:water_tank_clean_service/utill/styles.dart';
import 'package:water_tank_clean_service/view/screen/quotation/add-quotation.dart';
import 'package:water_tank_clean_service/view/screen/quotation/pdf_view/pdfpreview.dart';

class QuotationList extends StatefulWidget {
  const QuotationList({super.key});

  @override
  State<QuotationList> createState() => _QuotationListState();
}

class _QuotationListState extends State<QuotationList> {
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
        title: Text("Quotation",style: montserratSemiBold.copyWith(color: ColorResources.WHITE,fontSize: Dimensions.FONT_SIZE_20),),
      ),
      floatingActionButton: DraggableFab(
        child: FloatingActionButton(
          // shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(100)
          // ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AddQuotation(),));
          },
          backgroundColor: ColorResources.LINE_BG,
          child: const Icon(Icons.add,size: 40,color: ColorResources.WHITE),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(AppConstants.itemHeight*0.01),
        padding: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.01,horizontal: AppConstants.itemWidth*0.01),
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
              padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.01,vertical: AppConstants.itemHeight*0.01),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    width: AppConstants.itemWidth*0.85,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("#34920",style: montserratSemiBold.copyWith(color: ColorResources.BLACK,fontSize: Dimensions.FONT_SIZE_14),),
                            Container(
                                alignment: Alignment.centerLeft,
                                width: AppConstants.itemWidth*0.40,
                                child: Text("Rajubhai",style: montserratSemiBold.copyWith(color: ColorResources.BLACK,fontSize: Dimensions.FONT_SIZE_14),)),
                            Text("\u20b9 5000",style: montserratSemiBold.copyWith(color: ColorResources.BLACK,fontSize: Dimensions.FONT_SIZE_14),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("04/12/2023",style: montserratSemiBold.copyWith(color: ColorResources.BLACK,fontSize: Dimensions.FONT_SIZE_14),),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => PdfPreviewPageMain(),));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: AppConstants.itemHeight*0.03,
                                padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_SMALL),
                                decoration: BoxDecoration(
                                  color: ColorResources.LINE_BG,
                                  borderRadius: BorderRadius.circular(05),
                                ),
                                child: Text('View',style: montserratSemiBold.copyWith(color: ColorResources.WHITE,fontSize: Dimensions.FONT_SIZE_15),maxLines: 1,
                                  overflow: TextOverflow.ellipsis,),
                              ),
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
                            const Icon(Icons.edit,color: ColorResources.BLACK,),
                            Text('Edit',style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: Dimensions.FONT_SIZE_15)),
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
            );
        },),
      ),
    );
  }
}
