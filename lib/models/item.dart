import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  String _id = "";
  String _barcode = "";
  String _productname = "";
  int _qty = 0;
  double _selprice = 0.0;
  double _suppprice = 0.0;
  String _mfgdate = "";
  DateTime? expdate;
  String _pdesc = "";
  int minqty = 1;

  Item(
    _barcode,
    _productname,
    _qty,
    _selprice,
    _suppprice,
    _mfgdate,
    expdate,
    _pdesc,
    minqty,
  );

  String get id => _id;

  String get barcode => _barcode;
  String get productname => _productname;
  int get qty => _qty;
  double get selprice => _selprice;
  double get suppprice => _suppprice;

  set id(String newId) {
    _id = newId;
  }

  set Productname(String newName) {
    if (newName.length <= 140) {
      _productname = newName;
    }
  }

  set Pdesc(String newDesc) {
    _pdesc = newDesc;
  }

  set Selprice(double newSelprice) {
    _selprice = newSelprice;
  }

  set Suppprice(double newsuppprice) {
    _suppprice = newsuppprice;
  }

  set totalStock(int newTotalStock) {
    _qty = newTotalStock;
  }

  // static List<Item> fromQuerySnapshot(QuerySnapshot snapshot) {
  //   List<Item> items = List<Item>();
  //   snapshot.documents.forEach((DocumentSnapshot doc) {
  //     Item item = Item.fromMapObject(doc.data);
  //     item.id = doc.documentID;
  //     items.add(item);
  //   });
  //   items.sort((a, b) {
  //     return b.used.compareTo(a.used);
  //   });
  //   return items;
  // }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = _id;
    map['productname'] = _productname;
    map['pdesc'] = _pdesc;
    map['selprice'] = _selprice;
    map['suppprice'] = _suppprice;
    map['qty'] = _qty;
    return map;
  }

  Item.fromMapObject(Map<String, dynamic> map) {
    _id = map['id'];
    _pdesc = map['pdesc'];
    _productname = map['productname'];
    _selprice = map['selprice'];
    _suppprice = map['suppprice'];
    _qty = map['qty'];
  }
}
