import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListSalesPage extends StatefulWidget {
  ListSalesPage({Key? key}) : super(key: key);

  @override
  _ListSalesPageState createState() => _ListSalesPageState();
}

class _ListSalesPageState extends State<ListSalesPage> {
  final Stream<QuerySnapshot> studentsStream =
      FirebaseFirestore.instance.collection('sales').snapshots();

  // For Deleting User
  CollectionReference students = FirebaseFirestore.instance.collection('sales');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: studentsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Something went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final List storedocs = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            storedocs.add(a);
            a['id'] = document.id;
          }).toList();
          return Scaffold(
            appBar: AppBar(
              title: Text("Sales List"),
            ),
            body: ListView(
              children: [
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Table(
                      border: TableBorder.all(),
                      columnWidths: const <int, TableColumnWidth>{
                        1: FixedColumnWidth(140),
                      },
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      children: [
                        TableRow(
                          children: [
                            TableCell(
                              child: Container(
                                color: Colors.greenAccent,
                                child: Center(
                                  child: Text(
                                    'P.Name',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                color: Colors.greenAccent,
                                child: Center(
                                  child: Text(
                                    'Qty',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            TableCell(
                              child: Container(
                                color: Colors.greenAccent,
                                child: Center(
                                  child: Text(
                                    'S.Date',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        for (var i = 0; i < storedocs.length; i++) ...[
                          TableRow(
                            children: [
                              TableCell(
                                child: Center(
                                    child: Text(storedocs[i]['productname'],
                                        style: TextStyle(fontSize: 18.0))),
                              ),
                              TableCell(
                                child: Center(
                                    child: Text(
                                        storedocs[i]['qty']?.toString() ?? "",
                                        style: TextStyle(fontSize: 18.0))),
                              ),
                              TableCell(
                                child: Center(
                                    child: Text(storedocs[i]['salesdate'],
                                        style: TextStyle(fontSize: 18.0))),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
