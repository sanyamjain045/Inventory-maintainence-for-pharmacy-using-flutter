import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';

class add_sales extends StatefulWidget {
  add_sales({Key? key}) : super(key: key);

  @override
  _aadd_salesState createState() => _aadd_salesState();
}

Future<void> startBarcodeScanStream() async {
  FlutterBarcodeScanner.getBarcodeStreamReceiver(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
      .listen((barcode) => print(barcode));
}

class _aadd_salesState extends State<add_sales> {
  String _scanBarcode = 'Unknown';
  void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Color.fromARGB(255, 56, 51, 45),
        textColor: Colors.white,
        fontSize: 12.0);
  }

  void successmessage() {
    showToast("Successful sales");
    clearText();
  }

  void Errormsg(String msg) {
    Fluttertoast.showToast(
        msg: msg.toString(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Color.fromARGB(255, 199, 107, 115),
        textColor: Colors.white,
        fontSize: 12.0);
  }

  final _formKey = GlobalKey<FormState>();
  var barcode = "";
  var productname = "";
  int qty = 1;
  double selprice = 0.0;

  var pdesc = "";

  int minqty = 1;
  final barcodeController = TextEditingController();
  final pnameController = TextEditingController();

  final qtyController = TextEditingController();
  final selpriceController = TextEditingController();

  final pdescController = TextEditingController();
  //final isFlagController =TextCheckboxController() ;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    barcodeController.dispose();
    pnameController.dispose();
    qtyController.dispose();
    selpriceController.dispose();

    pdescController.dispose();
    //isFlagController.dispose();
  }

  clearText() {
    barcodeController.clear();
    pnameController.clear();
    qtyController.clear();
    selpriceController.clear();

    pdescController.clear();
  }

  void getfromData() {
    barcode = barcodeController.text;
    productname = pnameController.text;
    selprice = double.tryParse(selpriceController.text)!;
    qty = int.tryParse(qtyController.text)!;
    pdesc = pdescController.text;
  }

// Adding Product
  CollectionReference products = FirebaseFirestore.instance.collection('sales');
  // CollectionReference productsListMaster =
  //     FirebaseFirestore.instance.collection('products');

  Future<void> addSales() {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);

    return products
        .add({
          'barcode': barcode,
          'productname': productname,
          'qty': qty,
          'selprice': selprice,
          'pdesc': pdesc,
          'custmob': 1,
          'salesdate': formattedDate
        })
        .then((value) => successmessage())
        .catchError((error) => Errormsg('Failed to Add Sales: $error'));
  }

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Sale Product'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            setState(() {
              getfromData();
              addSales();
            });
          }
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.check),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(top: 0.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: barcodeController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Barcode';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.scanner,
                            color: Colors.black,
                          ),
                          // filled: true,
                          labelText: 'Barcode',
                          //_controller.value =$_scanBarcode ,
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent)),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () => scanBarcodeNormal(),
                          child: Text('Start barcode scan')),
                      SizedBox(height: 20.0),
                      TextFormField(
                        controller: pnameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter ProductName';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.sell,
                            color: Colors.black,
                          ),
                          // filled: true,
                          labelText: 'Product Name ',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent)),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: qtyController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter qty';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.storage,
                            color: Colors.black,
                          ),
                          // filled: true,
                          labelText: 'Quantity',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent)),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: selpriceController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Selling Price';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.account_balance_wallet,
                            color: Colors.black,
                          ),
                          // filled: true,
                          labelText: 'Price',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          // hintText: 'EMAIL',
                          // hintStyle: ,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent)),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: pdescController,
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.description,
                            color: Colors.black,
                          ),
                          labelText: 'Sales Description ',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent)),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      showToast(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
      barcodeController.text = _scanBarcode;
    });
  }

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Product Sale'),
            actions: <Widget>[
              new FlatButton(
                child: new Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
