import 'package:flutter/material.dart';
import 'package:hzmarket/config/color_manager.dart';

class Transaction extends StatelessWidget {
  final String transactionType; // 'Sold' or 'Buy'
  final int number;
  final String productName;
  final String buyerOrSeller;

  Transaction({
    required this.transactionType,
    required this.number,
    required this.productName,
    required this.buyerOrSeller,
  });

  @override
  Widget build(BuildContext context) {
    // Determine the color and icon based on transactionType
    Color transactionColor = transactionType == 'Buy' ? Colors.red : Colors.green;
    IconData transactionIcon = transactionType == 'Buy' ? Icons.arrow_downward : Icons.arrow_upward;
     final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;


    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Grey circle with colored transaction icon
          Expanded(
            flex: 1,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: isDarkMode ?  ColorManager.darkGrey : ColorManager.lightGrey, // Custom colors
                
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  transactionIcon,
                  color: transactionColor,
                  size: 24,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(), // Add a spacer
          ),
          Expanded(
            flex: 2,
            child: Text(
              number.toString(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  buyerOrSeller,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
