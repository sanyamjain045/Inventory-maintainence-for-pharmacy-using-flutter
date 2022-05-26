import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class add_product extends StatefulWidget {
  add_product({Key? key}) : super(key: key);

  @override
  _add_productState createState() => _add_productState();
}

Future<void> startBarcodeScanStream() async {
  FlutterBarcodeScanner.getBarcodeStreamReceiver(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
      .listen((barcode) => print(barcode));
}

class _add_productState extends State<add_product> {
  bool _checkbox = false;
  String _scanBarcode = 'Unknown';
  final _formKey = GlobalKey<FormState>();
  var barcode = "";
  var productname = "";
  int qty = 1;
  double selprice = 0.0;
  double suppprice = 0.0;
  var mfgdate = "";
  DateTime? expdate;
  var pdesc = "";
  bool isFlag = false;
  int minqty = 1;
  final barcodeController = TextEditingController();
  final pnameController = TextEditingController();

  final qtyController = TextEditingController();
  final selpriceController = TextEditingController();
  final supppriceController = TextEditingController();
  final mfgdateController = TextEditingController();
  final expdateController = TextEditingController();
  final pdescController = TextEditingController();
  //final isFlagController =TextCheckboxController() ;
  final minqtyController = TextEditingController();
  TextEditingController dateinput = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    barcodeController.dispose();
    pnameController.dispose();
    qtyController.dispose();
    selpriceController.dispose();
    supppriceController.dispose();
    mfgdateController.dispose();
    expdateController.dispose();
    pdescController.dispose();
    //isFlagController.dispose();
    minqtyController.dispose();
  }

  clearText() {
    barcodeController.clear();
    pnameController.clear();
    qtyController.clear();
    selpriceController.clear();
    supppriceController.clear();
    mfgdateController.clear();
    expdateController.clear();
    pdescController.clear();
    //isFlagController.clear();
    minqtyController.clear();
  }

  void getfromData() {
    barcode = barcodeController.text;
    productname = pnameController.text;
    selprice = double.tryParse(selpriceController.text)!;
    qty = int.tryParse(qtyController.text)!;
    suppprice = double.tryParse(supppriceController.text)!;
    mfgdate = mfgdateController.text;
    expdate = DateTime.parse(expdateController.text);
    pdesc = pdescController.text;
    //isFlag = isFlagController.text;
    minqty = int.tryParse(minqtyController.text)!;
  }

// Adding Product
  CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  Future<void> addUser() {
    return products
        .add({
          'barcode': barcode,
          'productname': productname,
          'qty': qty,
          'selprice': selprice,
          'suppprice': suppprice,
          'mfgdate': mfgdate,
          'expdate': expdate,
          'pdesc': pdesc,
          'minqty': minqty,
          'isFlag': _checkbox
        })
        .then((value) => _displayDialog(context))
        .catchError((error) => print('Failed to Add Customer: $error'));
  }

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            setState(() {
              getfromData();
              addUser();
              clearText();
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
                        keyboardType: TextInputType.number,
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
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: selpriceController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Sell Price';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.account_balance_wallet,
                            color: Colors.black,
                          ),
                          // filled: true,
                          labelText: 'Sell Price',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          // hintText: 'EMAIL',
                          // hintStyle: ,
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent)),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        controller: supppriceController,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Supplier Price';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.account_balance_wallet,
                            color: Colors.black,
                          ),
                          // filled: true
                          labelText: 'Supplier Price',
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
                        controller: mfgdateController,

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Mfg. Date';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            icon:
                                Icon(Icons.calendar_today), //icon of text field
                            labelText: "Mfg. Date" //label text of field
                            ),
                        readOnly:
                            true, //set it true, so that user will not able to edit text
                        onTap: () async {
                          var pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(
                                  2000), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            print(
                                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(
                                formattedDate); //formatted date output using intl package =>  2021-03-16
                            //you can implement different kind of Date Format here according to your requirement

                            setState(() {
                              mfgdateController.text =
                                  formattedDate; //set output date to TextField value.
                            });
                          } else {
                            print("Date is not selected");
                          }
                        },
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        // controller: dateinput,
                        controller:
                            expdateController, //editing controller of this TextField
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Exp. Date';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            icon:
                                Icon(Icons.calendar_today), //icon of text field
                            labelText: "Exp. Date" //label text of field
                            ),
                        readOnly:
                            true, //set it true, so that user will not able to edit text
                        onTap: () async {
                          var pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(
                                  2000), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            print(
                                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            print(formattedDate);

                            setState(() {
                              expdateController.text =
                                  formattedDate; //set output date to TextField value.
                            });
                          } else {
                            print("Date is not selected");
                          }
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        controller: pdescController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Product Description';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.description,
                            color: Colors.black,
                          ),
                          labelText: 'Product Description ',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent)),
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: _checkbox,
                            onChanged: (value) {
                              setState(() {
                                _checkbox = !_checkbox;
                              });
                            },
                          ),
                          Text('Low stock Alert on this Product?'),
                        ],
                      ),
                      SizedBox(height: 0.0),
                      TextFormField(
                        controller: minqtyController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Minimum quantity';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.notifications,
                            color: Colors.black,
                          ),
                          labelText: 'Minimum quantity for alert',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent)),
                        ),
                      ),
                      Text('Scan result : $_scanBarcode\n',
                          style: TextStyle(fontSize: 20))
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
      print(barcodeScanRes);
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
            title: Text('Product Added'),
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
