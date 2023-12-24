import 'package:basic_blockchain_wallet/ui/pages/transaction/tabs/deposit_tab.dart';
import 'package:basic_blockchain_wallet/ui/pages/transaction/tabs/withdraw_tab.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatefulWidget {
  TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        centerTitle: true,
        title: Text(
          "Transaction",
          style: TextStyle(
            color: TextSelectionTheme.of(context).selectionColor,
            fontFamily: "Gotik",
            fontWeight: FontWeight.w600,
            fontSize: 18.5,
          ),
        ),
        iconTheme: IconThemeData(color: TextSelectionTheme.of(context).selectionColor),
        elevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 5.0,
          ),
          Expanded(
            child: DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: new Scaffold(
                backgroundColor: Colors.transparent,
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(42.0), // here the desired height
                  child: new AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                    centerTitle: true,
                    automaticallyImplyLeading: false,
                    title: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)), border: Border.all(color: Colors.black54), color: Colors.black26),
                      child: new TabBar(
                        indicatorColor: Theme.of(context).accentColor,
                        labelColor: Theme.of(context).accentColor,
                        unselectedLabelColor: Theme.of(context).hintColor,
                        indicator: ShapeDecoration.fromBoxDecoration(
                            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15.0)), color: Theme.of(context).canvasColor)),
                        tabs: [
                          new Tab(
                            child: Text(
                              "Deposit",
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          new Tab(
                              child: Text(
                            "Withdraw",
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
                body: new TabBarView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                      child: DepositTab(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                      child: WithdrawTab(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
