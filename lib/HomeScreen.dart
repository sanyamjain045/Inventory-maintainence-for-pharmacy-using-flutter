import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_anybarcodescan/aboutus.dart';
import 'package:flutter_anybarcodescan/change_password.dart';
import 'package:flutter_anybarcodescan/contactus.dart';
import 'package:flutter_anybarcodescan/customers.dart';
import 'package:flutter_anybarcodescan/faq.dart';
import 'package:flutter_anybarcodescan/feedback.dart';
import 'package:flutter_anybarcodescan/login.dart';
import 'package:flutter_anybarcodescan/profile.dart';
import 'package:flutter_anybarcodescan/sales.dart';
import 'package:flutter_anybarcodescan/search.dart';
import 'package:flutter_anybarcodescan/stocks.dart';
import 'add_product.dart';
import 'list_product.dart';
import 'list_product_expired.dart';
import 'list_sales.dart';
import 'list_total_stocks.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _controllerName = TextEditingController();

  TextEditingController _controllerEmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pharmacy Inventory"),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: Wrap(
                  spacing: 20,
                  runSpacing: 5.0,
                  children: <Widget>[
                    SizedBox(
                      width: 150.0,
                      height: 150.0,
                      child: new InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StocksPage()),
                          );
                        },
                        child: Card(
                          color: Color.fromARGB(255, 255, 255, 255),
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  "assets/mstock.png",
                                  height: 80,
                                  width: 80,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "Stocks",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                              ],
                            ),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150.0,
                      height: 150.0,
                      child: new InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListProductPage()),
                          );
                        },
                        child: Card(
                          color: Color.fromARGB(255, 255, 255, 255),
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  "assets/AVAIL.png",
                                  height: 80,
                                  width: 80,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "Available",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                              ],
                            ),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150.0,
                      height: 150.0,
                      child: new InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => add_sales()),
                          );
                        },
                        child: Card(
                          color: Color.fromARGB(255, 255, 255, 255),
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  "assets/SAL.png",
                                  height: 80,
                                  width: 80,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "Sales",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                              ],
                            ),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150.0,
                      height: 150.0,
                      child: new InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListExpiredProductPage()),
                          );
                        },
                        child: Card(
                          color: Color.fromARGB(255, 255, 255, 255),
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  "assets/STOCK.png",
                                  height: 80,
                                  width: 80,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "Expired Stock",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                              ],
                            ),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150.0,
                      height: 150.0,
                      child: new InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CustomersPage()),
                          );
                        },
                        child: Card(
                          color: Color.fromARGB(255, 255, 255, 255),
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  "assets/CUSTOMER.png",
                                  height: 80,
                                  width: 80,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "Customers",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                              ],
                            ),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150.0,
                      height: 150.0,
                      child: new InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListTotalStocksPage()),
                          );
                        },
                        child: Card(
                          color: Color.fromARGB(255, 255, 255, 255),
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  "assets/INHAND.png",
                                  height: 80,
                                  width: 80,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "Total Stock",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                              ],
                            ),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150.0,
                      height: 150.0,
                      child: new InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AboutusPage()), //AboutusPage
                          );
                        },
                        child: Card(
                          color: Color.fromARGB(255, 255, 255, 255),
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  "assets/ABOUT.PNG",
                                  height: 80,
                                  width: 80,
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  "About",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                              ],
                            ),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150.0,
                      height: 150.0,
                      child: new InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListSalesPage()),
                          );
                        },
                        child: Card(
                          color: Color.fromARGB(255, 255, 255, 255),
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  "assets/LIST.png",
                                  height: 80,
                                  width: 80,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "Sales List",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0),
                                ),
                                SizedBox(
                                  height: 0.0,
                                ),
                              ],
                            ),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(_controllerName.text),
                accountEmail: Text(_controllerEmail.text),
                currentAccountPicture: CircleAvatar(
                  backgroundColor:
                      Theme.of(context).platform == TargetPlatform.iOS
                          ? Colors.blue
                          : Colors.white,
                  child: Image.asset("assets/logo.png"),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new HomeScreen()));
                },
              ),
              ListTile(
                leading: Icon(Icons.verified_user_rounded),
                title: Text("Profile"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new ProfilePage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.contacts),
                title: Text("Contact Us"),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);

                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new ContactusPage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: const Text('About Us'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new AboutusPage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.feedback),
                title: const Text('Feedback'),
                onTap: () {
                  Navigator.pop(context);
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new FeedbackPage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.question_mark),
                title: const Text('FAQ'),
                onTap: () {
                  Navigator.pop(context);
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new FAQPage()));
                },
              ),
              // ListTile(
              //   leading: Icon(Icons.wifi_password),
              //   title: const Text('Change password'),
              //   onTap: () {
              //     //here clear firebase
              //     Navigator.push(
              //         context,
              //         new MaterialPageRoute(
              //             builder: (context) => new ChangePassword()));
              //   },
              // ),
              ListTile(
                leading: Icon(Icons.logout),
                title: const Text('Logout'),
                onTap: () async {
                  Navigator.pop(context);

                  await FirebaseAuth.instance.signOut();

                  //here clear firebase
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) => new login()));
                },
              ),
            ],
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
    final String uid = FirebaseAuth.instance.currentUser!.uid;
    final String email = FirebaseAuth.instance.currentUser!.email.toString();
    User? user = FirebaseAuth.instance.currentUser;

    _controllerName.text = "Your Email";
    _controllerEmail.text = email;
  }

  void dispose() {
    // focusNodeName.dispose();
    // focusNodeEmail.dispose();
    // focusNodePhone.dispose();

    super.dispose();
  }
}
