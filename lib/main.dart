import 'dart:convert';

import 'package:dpay_flutter/CheckoutOptions.dart';
import 'package:dpay_flutter/dpay_flutter.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

const PRODUCTION_ORDERS_URL = "api.durianpay.id";

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  var durianpay;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Center(
        child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.all(25),
            child: FlatButton(
              child: Text(
                'Click here',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                loadCheckout();
              },
            ),
          ),
        ]),
      ),
    ));
  }

  void loadCheckout() {
    Durianpay durianpay = Durianpay.getInstance(context);
    DCheckoutOptions checkoutOptions = new DCheckoutOptions();
    checkoutOptions.locale = "en";
    checkoutOptions.environment = "production";
    checkoutOptions.siteName = "MovieTicket";
    checkoutOptions.customerId = "cus_jx9whHJePn5886";
    checkoutOptions.customerGivenName = "rida";
    checkoutOptions.customerEmail = "rida@sirka.io";
    checkoutOptions.amount = "10000";
    checkoutOptions.currency = "IDR";
    checkoutOptions.accessToken =
        "1d5429f198cdbed5fe14993b73e501d33f9c1ee37b54ceba846903192475cbb4";
    checkoutOptions.orderId = "ord_mZs3uRn9lS6824";
    durianpay.clear();
    durianpay.checkout(checkoutOptions);
  }
}
