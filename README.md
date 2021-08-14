# sslcommerz payment gateway flutter implementation

A new Flutter project.

### Getting Started

<  Future<void> payNow() async{
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
   // await sslcommerz.payNow();


    var result = await sslcommerz.payNow();
    if (result is PlatformException) {
      print("Sslcommerz MSG" + result.message.toString() + "Sslcommerz Code" + result.code);
    } else {
      SSLCTransactionInfoModel model = result;
      print('Sslcommerz Amount${model.amount}');
      print("Sslcommerz status:${model.status}");
    }
  }>
