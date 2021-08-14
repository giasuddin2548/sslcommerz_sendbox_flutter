import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sslcommerz/model/SSLCSdkType.dart';
import 'package:flutter_sslcommerz/model/SSLCTransactionInfoModel.dart';
import 'package:flutter_sslcommerz/model/SSLCommerzInitialization.dart';
import 'package:flutter_sslcommerz/model/SSLCurrencyType.dart';
import 'package:flutter_sslcommerz/sslcommerz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          payNow();
        },
        child: Icon(Icons.payment_outlined),
      ),
    );
  }

  Future<void> payNow() async{
    Sslcommerz sslcommerz = Sslcommerz(
        initializer: SSLCommerzInitialization(
            currency: SSLCurrencyType.BDT,
            product_category: "Food",
            sdkType: SSLCSdkType.TESTBOX,
            store_id: "mobil5fe45035efe16",
            store_passwd: "mobil5fe45035efe16@ssl",
            total_amount: 140.2,
            tran_id: "SSS1454784")
    );

    var result = await sslcommerz.payNow();
    if (result is PlatformException) {
      print("Sslcommerz MSG" + result.message.toString() + "Sslcommerz Code" + result.code);
    } else {
      SSLCTransactionInfoModel model = result;
      print('Sslcommerz Amount${model.amount}');
      print("Sslcommerz status:${model.status}");
    }
  }
}
