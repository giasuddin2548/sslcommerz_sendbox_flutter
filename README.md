# SSLCommerz Flutter

![N|Solid](https://www.sslcommerz.com/wp-content/uploads/2019/11/footer_logo.png)

## Official doc.
[Read More](https://github.com/sslcommerz/SSLCommerz-Flutter)

## Installation 

#Step-1
add a line like this to your package's pubspec.yaml
```dart
dependencies:
  flutter_sslcommerz: ^2.0.0-nullsafety.0
```

#Step-2
add those lines on build.gradle 
```dart
    buildTypes {
        release {
            signingConfig signingConfigs.debug
            shrinkResources false
            minifyEnabled false
        }
    }

```

#Step-3
add those lines on build.gradle 
```dart
    buildTypes {
        release {
            signingConfig signingConfigs.debug
            shrinkResources false
            minifyEnabled false
        }
    }

```


#Step-4
Add this line on your manifest 
```dart
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    package="com.example.ssl">

```

#Step-5
Add those two lines on your manifest 
```dart
   <application
       tools:replace="android:label"
       android:usesCleartextTraffic="true"
          </application>
```



#Step-6
Finally call the method from your widget
```dart
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
```




