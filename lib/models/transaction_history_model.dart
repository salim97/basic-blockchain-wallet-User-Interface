import 'dart:convert';

import 'package:crypto/crypto.dart';

class TransactionHistoryModel {
  String transactionId;
  DateTime createdAt;
  String senderName;
  String receiverName;
  String amount;

  TransactionHistoryModel({
    required this.transactionId,
    required this.createdAt,
    required this.senderName,
    required this.receiverName,
    required this.amount,
  });
}

List<TransactionHistoryModel> assetsWalletList = [
  TransactionHistoryModel(
    senderName: "User A",
    receiverName: "User B",
    transactionId: sha256.convert(utf8.encode("transaction 3")).toString(),
    amount: "5 ETC",
    createdAt: DateTime.now(),
  ),
  TransactionHistoryModel(
    senderName: "User A",
    receiverName: "User B",
    transactionId: sha256.convert(utf8.encode("transaction 2")).toString(),
    amount: "8 ETC",
    createdAt: DateTime.now().subtract(Duration(days: 1)),
  ),
  TransactionHistoryModel(
    senderName: "User A",
    receiverName: "User B",
    transactionId: sha256.convert(utf8.encode("transaction 1")).toString(),
    amount: "1 ETC",
    createdAt: DateTime.now().subtract(Duration(days: 1)),
  ),
];
