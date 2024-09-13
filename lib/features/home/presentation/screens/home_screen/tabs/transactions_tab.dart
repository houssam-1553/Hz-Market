import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart' as fpdart;
import 'package:get/get.dart';
import 'package:hzmarket/config/styles_manager.dart';

import 'package:hzmarket/custom_text_input.dart';
import 'package:hzmarket/features/home/presentation/widgets/profile_top.dart';
import 'package:hzmarket/features/home/presentation/widgets/transaction.dart';
import 'package:hzmarket/generated/l10n.dart'; // Import the generated localization file
import 'package:hzmarket/config/color_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:profile_photo/profile_photo.dart';

class TransactionsTab extends StatefulWidget {
  @override
  State<TransactionsTab> createState() => _TransactionsTabState();
}

class _TransactionsTabState extends State<TransactionsTab> {
  late List<Transaction> transactions;

  @override
  void initState() {
    super.initState();

    transactions = [
      Transaction(
          transactionType: 'Sold',
          number: 10,
          productName: 'Product A',
          buyerOrSeller: 'Buyer: John Doe'),
      Transaction(
          transactionType: 'Buy',
          number: 5,
          productName: 'Product B',
          buyerOrSeller: 'Seller: Jane Smith'),
            Transaction(
          transactionType: 'Buy',
          number: 5,
          productName: 'Product B',
          buyerOrSeller: 'Seller: Jane Smith'),  Transaction(
          transactionType: 'Buy',
          number: 5,
          productName: 'Product B',
          buyerOrSeller: 'Seller: Jane Smith'),
           Transaction(
          transactionType: 'Sold',
          number: 10,
          productName: 'Product A',
          buyerOrSeller: 'Buyer: John Doe'), Transaction(
          transactionType: 'Sold',
          number: 10,
          productName: 'Product A',
          buyerOrSeller: 'Buyer: John Doe'), Transaction(
          transactionType: 'Sold',
          number: 10,
          productName: 'Product A',
          buyerOrSeller: 'Buyer: John Doe'), Transaction(
          transactionType: 'Sold',
          number: 10,
          productName: 'Product A',
          buyerOrSeller: 'Buyer: John Doe'), Transaction(
          transactionType: 'Sold',
          number: 10,
          productName: 'Product A',
          buyerOrSeller: 'Buyer: John Doe'), Transaction(
          transactionType: 'Sold',
          number: 10,
          productName: 'Product A',
          buyerOrSeller: 'Buyer: John Doe'), Transaction(
          transactionType: 'Sold',
          number: 10,
          productName: 'Product A',
          buyerOrSeller: 'Buyer: John Doe'), Transaction(
          transactionType: 'Sold',
          number: 10,
          productName: 'Product A',
          buyerOrSeller: 'Buyer: John Doe'),
      // Add more transactions here
    ];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    final bodyMediumStyle = Theme.of(context).textTheme.bodyMedium;

    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Get.back(), icon: Icon(Iconsax.arrow_left)),
          title: Text(
            "Transaction List",
            style: TextStyle(fontFamily: "inter bold"),
          ),
          centerTitle: true,
          bottom:PreferredSize(
            preferredSize: Size.fromHeight(height*0.05), // Adjust the height for space
            child:  Column(
              children: [
              
                TabBar(
                  dividerColor: Colors.transparent,
                  // Remove the underline
                   tabs: [
                    Tab(
                      child: Text(
                        "Today",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "This month",
                        style: TextStyle(
                          fontFamily: "inter ",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "This year",
                        style: TextStyle(
                          fontFamily: "inter",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  children: transactions.map((transaction) => transaction).toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  children: transactions.map((transaction) => transaction).toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  children: transactions.map((transaction) => transaction).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
