import 'dart:async';

import 'package:beplay/bloc/class/class_bloc.dart';
import 'package:beplay/bloc/register/register_bloc.dart';
import 'package:beplay/components/main_app_bar.dart';
import 'package:beplay/const.dart';
import 'package:beplay/data_dummy.dart';
import 'package:beplay/model/classes2.dart';
import 'package:beplay/pages/payment_screen.dart';
import 'package:beplay/pages/promo_screen.dart';
import 'package:beplay/pages/proof_screen.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutScreen extends StatefulWidget {
  CheckoutScreen({this.item});

  final Classes2 item;

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  var bcaInfo = '9000 5000 9000';
  var ovoInfo = '0896-7984-4250';
  var trainerInfo = 'PT. Wellness';
  var _paymentWith = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MainAppBar(
        title: "Checkout",
      ),
      body: BlocListener<ClassBloc, ClassState>(
        listener: (context, state) {
          if (state is ReviewsSuccess) {
            Timer(Duration(seconds: 3), () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PaymentScreen(success: true,);
              }));
            });
          }
          if (state is InvoiceFailed) {
            Timer(Duration(seconds: 3), () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PaymentScreen(success: true,);
              }));
            });
          }
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'No. ${widget.item.id}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Parent(
                          gesture: Gestures()..onTap(() {}),
                          child: Icon(
                            Icons.delete,
                            color: bShadowColor,
                          ),
                        )
                      ],
                    ),
                    Text(
                      widget.item.nama,
                      style: TextStyle(
                        fontSize: 13,
                        color: bLightTextColor,
                      ),
                    ),
                    Text(
                      "Rp. 200.000",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: bPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Divider(
                color: bInactiveColor,
              ),
              SizedBox(height: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    "Rp. 600.000",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: bPrimaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Payment Method",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                children: <Widget>[
                  Radio(
                    groupValue: _paymentWith,
                    value: 0,
                    toggleable: true,
                    autofocus: true,
                    activeColor: bPrimaryColor,
                    onChanged: (newValue) =>
                        setState(() => _paymentWith = newValue),
                  ),
                  Image(
                    image: NetworkImage(
                      'https://cdn.freebiesupply.com/logos/thumbs/2x/bca-bank-central-asia-logo.png',
                    ),
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  Radio(
                    groupValue: _paymentWith,
                    value: 1,
                    toggleable: true,
                    activeColor: bPrimaryColor,
                    onChanged: (newValue) =>
                        setState(() => _paymentWith = newValue),
                  ),
                  Image(
                    image: NetworkImage(
                      'https://livewatchstore.com/wp-content/uploads/2019/11/ovo-logo-png-6.png',
                    ),
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              SizedBox(height: 15),
              Text(
                (_paymentWith == 0)
                    ? "Bank BCA: " + bcaInfo + "\n" + widget.item.trainer.nama
                    : "Nomor OVO: " + ovoInfo + "\n" + widget.item.trainer.nama,
                style: TextStyle(
                  fontSize: 16,
                  color: bLightTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Promo Code",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Txt(
                    "+ Insert promo code",
                    gesture: Gestures()
                      ..onTap(() {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return PromoScreen();
                        }));
                      }),
                    style: TxtStyle()
                      ..textColor(bPrimaryColor)
                      ..fontSize(16)
                      ..bold(),
                  ),
                ],
              ),
              SizedBox(height: 35),
              Txt(
                'PAY',
                gesture: Gestures()
                  ..onTap(() {
                    context.bloc<ClassBloc>().add(PostInvoice(id: widget.item.id, nominal: 200000));
                  }),
                style: TxtStyle()
                  ..width(double.infinity)
                  ..background.color(bPrimaryColor)
                  ..alignmentContent.center()
                  ..textColor(Colors.white)
                  ..fontSize(16)
                  ..bold()
                  ..padding(all: 20)
                  ..borderRadius(all: 100),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
