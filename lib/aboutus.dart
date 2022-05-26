import 'package:flutter/material.dart';

class AboutusPage extends StatelessWidget {
  AboutusPage({Key? key}) : super(key: key);
  final List _aboutMe = [
    {
      'title':
          'This app is a fully secure inventory management app for retailer and wholesaler both.',
      'body': '-----------------'
    },
    {
      'title': 'Simple and easy to use with helping guidelines and videos.',
      'body': '-----------------'
    },
    {
      'title': ' Fully secure database with internal backup feature.',
      'body': '-----------------'
    },
    {
      'title': ' Add product with images and full description.',
      'body': '-----------------'
    },
    {'title': 'Barcode scanner integrated.', 'body': '-----------------'},
    {
      'title': 'Manage all vendors and customers with full detail.',
      'body': '-----------------'
    },
    {
      'title':
          'Specify transaction type cash/credit while entering sales and purchase.',
      'body': '-----------------'
    },
    {
      'title': 'Get monthly stock on hand of particular items.',
      'body': '-----------------'
    },
    {
      'title':
          ' Get monthly profit/loss with all the parameters like monthly opening stock, purchase, sales, stock on hand.',
      'body': '-----------------'
    },
    {
      'title':
          'You can change app currency format as followed by your country.',
      'body': '-----------------'
    },
    {
      'title':
          'All the backups are stored in internal storage SMS backup folder.',
      'body': '-----------------'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text('About App'),
        centerTitle: true,
        brightness: Brightness.dark,
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(height: 5),
              Text(
                  'Welcome to  Pharmacy Inventory\nInventory is the raw materials used to produce goods as well as the goods that are available for sale.'),
              Divider(height: 5),
              Expanded(
                child: ListView.builder(
                    itemCount: _aboutMe.length,
                    itemBuilder: (BuildContext context, int i) {
                      print(
                          '${MediaQuery.of(context).size.height},${MediaQuery.of(context).size.width},');
                      return ListTile(
                        leading: Icon(Icons.donut_large),
                        title: Text(_aboutMe[i]['title']),
                        subtitle: Text(_aboutMe[i]['body']),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
