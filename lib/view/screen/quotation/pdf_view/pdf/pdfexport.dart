import 'dart:io';
import 'dart:typed_data';
import 'package:number_to_words_english/number_to_words_english.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf/widgets.dart' as p;
import 'package:flutter/services.dart' show rootBundle;
import 'package:water_tank_clean_service/utill/app_constants.dart';
import 'package:water_tank_clean_service/utill/images.dart';

Future<Uint8List> makePdfMain() async {
  final pdf = Document();
  final imageLogo = MemoryImage((await rootBundle.load(Images.logo)).buffer.asUint8List());

  pdf.addPage(
    MultiPage(
      build: (context) {
        return [
            Divider(),
            SizedBox(height: AppConstants.itemHeight*0.005),
            Table(
              border: TableBorder.all(color: PdfColors.black),
              children: [
                TableRow(
                  children: [
                    paddedText('INVOICE NO : 23456'),
                    paddedText('Date : 04/12/2023')
                  ],
                ),
                TableRow(
                  children: [
                    paddedText('Sir/Ma`am : Rajubhai'),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: AppConstants.itemWidth*0.40,
                      padding: const EdgeInsets.all(05),
                      child: Text('ADDRESS : Surat',),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: AppConstants.itemHeight*0.005),
            p.Table(
                border: TableBorder.all(color: PdfColors.black),
                children: [
                  p.TableRow(
                    children: [
                      p.Container(
                        alignment: p.Alignment.center,
                        width: AppConstants.itemWidth*0.10,
                        padding: const p.EdgeInsets.all(05),
                        child: p.Text('No.',style: const p.TextStyle(fontSize: 10))
                      ),
                      p.Container(
                          alignment: p.Alignment.center,
                          padding: const EdgeInsets.all(05),
                          child: p.Text('Tank Size',style: const p.TextStyle(fontSize: 10))
                      ),
                      p.Container(
                          alignment: p.Alignment.center,
                          padding: const p.EdgeInsets.all(05),
                          child: p.Text('Liter',style: const p.TextStyle(fontSize: 10))
                      ),
                      p.Container(
                          alignment: p.Alignment.center,
                          padding: const p.EdgeInsets.all(05),
                          child: p.Text('Water Type',style: const p.TextStyle(fontSize: 10))
                      ),
                      p.Container(
                          alignment: p.Alignment.center,
                          padding: const p.EdgeInsets.all(05),
                          child: p.Text('Tank Type',style: const p.TextStyle(fontSize: 10))
                      ),
                    ],
                  ),
                  p.TableRow(
                    children: [
                      p.Container(
                          alignment: p.Alignment.center,
                          width: AppConstants.itemWidth*0.10,
                          padding: const p.EdgeInsets.all(05),
                          child: p.Text('No.',style: const p.TextStyle(fontSize: 10,color: PdfColors.white))
                      ),
                      p.Container(
                          alignment: p.Alignment.center,
                          padding: const EdgeInsets.all(05),
                          child: p.Text('',style: const p.TextStyle(fontSize: 10))
                      ),
                      p.Container(
                          alignment: p.Alignment.center,
                          padding: const p.EdgeInsets.all(05),
                          child: p.Text('',style: const p.TextStyle(fontSize: 10))
                      ),
                      p.Container(
                          alignment: p.Alignment.center,
                          padding: const p.EdgeInsets.all(05),
                          child: p.Text('',style: const p.TextStyle(fontSize: 10))
                      ),
                      p.Container(
                          alignment: p.Alignment.center,
                          padding: const p.EdgeInsets.all(05),
                          child: p.Text('',style: const p.TextStyle(fontSize: 10))
                      ),
                    ],
                  ),
                  p.TableRow(
                    children: [
                      p.Container(
                          alignment: p.Alignment.center,
                          width: AppConstants.itemWidth*0.10,
                          padding: const p.EdgeInsets.all(05),
                          child: p.Text('No.',style: const p.TextStyle(fontSize: 10,color: PdfColors.white))
                      ),
                      p.Container(
                          alignment: p.Alignment.center,
                          padding: const EdgeInsets.all(05),
                          child: p.Text('',style: const p.TextStyle(fontSize: 10))
                      ),
                      p.Container(
                          alignment: p.Alignment.center,
                          padding: const p.EdgeInsets.all(05),
                          child: p.Text('',style: const p.TextStyle(fontSize: 10))
                      ),
                      p.Container(
                          alignment: p.Alignment.center,
                          padding: const p.EdgeInsets.all(05),
                          child: p.Text('',style: const p.TextStyle(fontSize: 10))
                      ),
                      p.Container(
                          alignment: p.Alignment.center,
                          padding: const p.EdgeInsets.all(05),
                          child: p.Text('',style: const p.TextStyle(fontSize: 10))
                      ),
                    ],
                  ),
                  p.TableRow(
                    children: [
                      p.Container(
                          alignment: p.Alignment.center,
                          width: AppConstants.itemWidth*0.10,
                          padding: const p.EdgeInsets.all(05),
                          child: p.Text('No.',style: const p.TextStyle(fontSize: 10,color: PdfColors.white))
                      ),
                      p.Container(
                          alignment: p.Alignment.center,
                          padding: const EdgeInsets.all(05),
                          child: p.Text('',style: const p.TextStyle(fontSize: 10))
                      ),
                      p.Container(
                          alignment: p.Alignment.center,
                          padding: const p.EdgeInsets.all(05),
                          child: p.Text('',style: const p.TextStyle(fontSize: 10))
                      ),
                      p.Container(
                          alignment: p.Alignment.center,
                          padding: const p.EdgeInsets.all(05),
                          child: p.Text('',style: const p.TextStyle(fontSize: 10))
                      ),
                      p.Container(
                          alignment: p.Alignment.center,
                          padding: const p.EdgeInsets.all(05),
                          child: p.Text('',style: const p.TextStyle(fontSize: 10))
                      ),
                    ],
                  ),
                ]
            ),
          SizedBox(height: AppConstants.itemHeight*0.005),
          Table(border: TableBorder.all(color: PdfColors.black), children: [
            TableRow(children: [
              paddedText('Service Detail :'),
              paddedText('Water Tank Cleaning'),
            ]),
            TableRow(children: [
              paddedText('Team Arrive Time :'),
              paddedText('10:45 AM'),
            ]),
            TableRow(children: [
              paddedText('Team Members :'),
              paddedText('3'),
            ]),
            TableRow(children: [
              paddedText('Darin Time :'),
              paddedText('11:00 AM'),
            ]),
            TableRow(children: [
              paddedText('Tank Cleaning Time :'),
              paddedText('02:00 Hour'),
            ]),
          ]),
          SizedBox(height: AppConstants.itemHeight*0.005),
          Table(border: TableBorder.all(color: PdfColors.black), children: [
            TableRow(children: [
              paddedText('Payment Detail :'),
              paddedText('5000'),
            ]),
            TableRow(children: [
              paddedText('Rupees (In Words) :'),
              paddedText('${NumberToWordsEnglish.convert(5000).toUpperCase()} -/ Only'),
            ]),
            TableRow(children: [
              paddedText('Check Number : '),
              paddedText('Date :'),
            ]),
          ]),
          SizedBox(height: AppConstants.itemHeight*0.005),
          Table(border: TableBorder.all(color: PdfColors.black), children: [
            TableRow(children: [
              paddedText('Applicant`s opinion :'),
              paddedText(''),
            ]),
            TableRow(children: [
              paddedText('Name of Applicant :'),
              paddedText('Signature :               '),
            ]),
          ]),
          SizedBox(height: AppConstants.itemHeight*0.015),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Certified that the particulars given above are\ntrue and correct",
                  style: Theme.of(context).header5,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "For ",
                          style: Theme.of(context).header5,
                        ),
                        Text(
                          "A-ONE TANK Cleaner",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: AppConstants.itemHeight*0.02),
                        ),
                      ]
                    ),
                    Container(
                      height: AppConstants.itemHeight*0.05,
                      width: AppConstants.itemWidth*0.10,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: imageLogo,fit: BoxFit.fill)
                      ),
                    ),
                    Text(
                      "Authorise Signature",
                      style: Theme.of(context).header5,
                    ),
                  ]
                ),
              ],
            ),
          ];
      },
      header: (context) {
        return Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Text("A-ONE TANK Cleaner",style: TextStyle(fontSize: AppConstants.itemHeight*0.05,fontWeight: FontWeight.bold)),
            ),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: AppConstants.itemHeight*0.005),
                child: Text("Mob.: 90992 54063 ",style: TextStyle(fontSize: AppConstants.itemHeight*0.020))
            ),
          ]
        );
      },
    ),
  );

  final directory = await getExternalStorageDirectory();
  final file = File("${directory?.path}/test.pdf");

  final pdfBytes = await pdf.save();
  await file.writeAsBytes(pdfBytes.toList());

  print("Directory::::$directory");
  print("SavePDF::::$file");

  return pdf.save();
}

Widget paddedText(final String text, {final TextAlign align = TextAlign.left}) =>
    Padding(
      padding: const EdgeInsets.all(05),
      child: Text(
        text,
        textAlign: align,
      ),
    );
