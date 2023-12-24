import 'package:basic_blockchain_wallet/ui/pages/transaction/transaction_page.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../../../models/transaction_history_model.dart';
import 'wave_body_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    Size size = new Size(MediaQuery.of(context).size.width, 200.0);
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 225.0),
            child: Container(
                child: ListView.builder(
              shrinkWrap: true,
              primary: false,
              padding: EdgeInsets.only(top: 0.0),
              itemBuilder: (ctx, i) {
                return _card(assetsWalletList[i], ctx);
              },
              itemCount: assetsWalletList.length,
            )),
          ),
          Column(
            children: <Widget>[
              new Stack(
                children: <Widget>[
                  new WaveBodyWidget(size: size, xOffset: 0, yOffset: 0, color: Colors.red),
                  new Opacity(
                    opacity: 0.9,
                    child: new WaveBodyWidget(
                      size: size,
                      xOffset: 60,
                      yOffset: 10,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13.0, right: 13.0, top: 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Transaction Info",
                      style: TextStyle(color: Theme.of(context).hintColor, fontFamily: "Popins", fontSize: 14.0),
                    ),
                    Text(
                      "Value      ",
                      style: TextStyle(color: Theme.of(context).hintColor, fontFamily: "Popins", fontSize: 14.0),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _card(TransactionHistoryModel item, BuildContext ctx) {
    return Padding(
      padding: const EdgeInsets.only(top: 7.0),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              Get.to(() => TransactionPage());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          item.senderName + " to " + item.receiverName,
                          style: TextStyle(fontFamily: "Popins", fontSize: 16.5),
                        ),
                        Text(
                          "Date: " + DateFormat('yyyy-MM-dd').format(item.createdAt),
                          style: TextStyle(fontFamily: "Popins", fontSize: 11.5, color: Theme.of(ctx).hintColor),
                        ),
                        Text(
                          "Transaction id" + item.transactionId.substring(1, 30),
                          style: TextStyle(
                            fontFamily: "Popins",
                            fontSize: 11.5,
                            color: Theme.of(ctx).hintColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          item.amount,
                          style: TextStyle(fontFamily: "Popins", fontSize: 14.5, fontWeight: FontWeight.w600),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          size: 19.0,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 20.0, top: 6.0),
            child: Container(
              width: double.infinity,
              height: 0.5,
              decoration: BoxDecoration(color: Theme.of(ctx).hintColor.withOpacity(0.1)),
            ),
          )
        ],
      ),
    );
  }
}
