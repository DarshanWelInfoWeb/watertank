import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:water_tank_clean_service/utill/color_resources.dart';
import 'package:water_tank_clean_service/utill/dimensions.dart';
import 'package:water_tank_clean_service/utill/styles.dart';
import 'package:printing/printing.dart';
import 'pdf/pdfexport.dart';
import 'package:pdf/pdf.dart';

class PdfPreviewPageMain extends StatelessWidget {
  PdfPreviewPageMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.LINE_BG,
        centerTitle: true,
        leading: IconButton(onPressed: () {
          Navigator.of(context).pop();
        }, icon: const Icon(Icons.arrow_back_ios_new_outlined,color: ColorResources.WHITE,size: 25,)),
        title: Text("PDF Preview",style: montserratSemiBold.copyWith(color: ColorResources.WHITE,fontSize: Dimensions.FONT_SIZE_20),),
      ),
      body: PdfPreview(
            build: (context) => makePdfMain(),
            pdfFileName: 'Invoice',
            initialPageFormat: PdfPageFormat.standard,
            canChangePageFormat: false,
            canChangeOrientation: false,
            canDebug: false,
            allowPrinting: true,
            allowSharing: false,
            actions: [
              IconButton(onPressed: () {
                print("object::1::");
                makePdfMain().then((value) async {
                  print("object:::2:::");
                  final box = context.findRenderObject() as RenderBox?;
                  String link = "http://support.welinfoweb.com/company";
                  final directory = await getExternalStorageDirectory();
                  try {
                    await Share.shareFiles(
                      ['${directory?.path}/test.pdf'],
                      text: "Thank you for doing business with us !!!\nMake invoices like this with WELMART INDIA\n\nRegister with WELMART INDIA now- $link",
                      subject: "test Invoice PDF",
                      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
                    );
                  } catch (e) {
                    print('Error sharing to WhatsApp: $e');
                  }
                  // Share.shareFiles(
                  //     ['${directory?.path}/$customerName.pdf'],
                  //     text: "Thank you for doing business with us !!!\nMake invoice like this with WELMART INDIA\n\nRegister with WELMART INDIA now- $link",
                  //     subject: "$customerName Invoice PDF",
                  //     sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
                });
              }, icon: const Icon(Icons.share))
            ],
            loadingWidget: const CircularProgressIndicator(color: ColorResources.LINE_BG),
        )
    );
  }
}

