import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_controller.dart' as carouselSlider;
import 'package:carousel_slider/carousel_slider.dart'as carouselSlider;
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hzmarket/config/color_manager.dart';
import 'package:hzmarket/config/styles_manager.dart';
import 'package:hzmarket/features/home/presentation/screens/home_screen/tabs/transactions_tab.dart';
import 'package:hzmarket/features/home/presentation/widgets/charts.dart';
import 'package:hzmarket/features/home/presentation/widgets/line_chart.dart';
import 'package:hzmarket/features/home/presentation/widgets/transaction.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:card_slider/card_slider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<_SalesData> data;
  late List<_PieData> pieData;
   late List<Transaction> transactions;

  @override
  void initState() {
    super.initState();
    data = [
      _SalesData('may', 25),
      _SalesData('june', 12),
      _SalesData('july', 24),
      _SalesData('augest', 18),
      _SalesData('september', 30)
    ];
    
    pieData = [
      _PieData('Alger', 35, 'Alger: 35%'),
      _PieData('Sba', 28, 'Sba: 28%'),
      _PieData('Oran', 34, 'Oran: 34%'),
      _PieData('Blida', 52, 'Blida: 52%')
    ];
      transactions = [
      Transaction(transactionType: 'Sold', number: 10, productName: 'Product A', buyerOrSeller: 'Buyer: John Doe'),
      Transaction(transactionType: 'Buy', number: 5, productName: 'Product B', buyerOrSeller: 'Seller: Jane Smith'),
      Transaction(transactionType: 'Buy', number: 5, productName: 'Product B', buyerOrSeller: 'Seller: Jane Smith'),
      Transaction(transactionType: 'Buy', number: 5, productName: 'Product B', buyerOrSeller: 'Seller: Jane Smith'),
      Transaction(transactionType: 'Buy', number: 5, productName: 'Product B', buyerOrSeller: 'Seller: Jane Smith'),
      Transaction(transactionType: 'Buy', number: 5, productName: 'Product B', buyerOrSeller: 'Seller: Jane Smith'),

      // Add more transactions here
    ];
  }

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    List<Widget> valuesWidget = [
      
          Card(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
  ),
 
 margin: EdgeInsets.all(15),
  elevation: 0,
  child: Padding(
    padding: const EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Stors Overview', // Title of the card
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 5),
        Flexible(
          child: PieChartSample1(),
        ),
      ],
    ),
  ),
)
/* SfCartesianChart(
              
            margin:EdgeInsets.all(width*0.05),
              
              

            
              primaryXAxis: const CategoryAxis(),
              // Chart title
              title: const ChartTitle(text: 'Half yearly sales analysis'),
              // Enable legend
              legend: const Legend(isVisible: true),
              // Enable tooltip
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <CartesianSeries<_SalesData, String>>[
                LineSeries<_SalesData, String>(
                  dataSource: data,
                  xValueMapper: (_SalesData sales, _) => sales.year,
                  yValueMapper: (_SalesData sales, _) => sales.sales,
                  name: 'Sales',
                  // Enable data label
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                )
              ],
            ), */
          ,
           Card(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
  ),
  
  margin: EdgeInsets.all(15),
  elevation: 0,
  child: Padding(
    padding: const EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Sales Overview', // Title of the card
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10),
        Flexible(
          child: LineChart1(isShowingMainData: true),
        ),
      ],
    ),
  ),
)

          ];
    return Container(
      color: Theme.of(context).colorScheme.background,

      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height*0.03),
            const Row (children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 12)
              ,child: 
              Text("Main Stats",style: TextStyle(fontSize: 22,fontFamily:"Inter bold",fontWeight: bold),)
            ,)
            ],),
          carouselSlider.CarouselSlider(
            options: carouselSlider.CarouselOptions(
              autoPlay: true,
            aspectRatio: 1,
              height: height*0.35,
         //     padEnds: false,
              
             
            ),
            items: 
            valuesWidget,
              
          ),
            SizedBox(height: height*0.02),
            Row (children: [
              const Padding(padding: EdgeInsets.symmetric(horizontal: 12)
              ,child: 
              Text("Last Transactions",style: TextStyle(fontSize: 22,fontFamily:"Inter bold",fontWeight: bold),)
            ,), 
             new Spacer(), 
               Padding(padding: EdgeInsets.symmetric(horizontal: 12)
              ,child: 
   TextButton(
  onPressed: () => Get.to(()=> TransactionsTab()) ,
  child: Text(
    "See all",
    style: TextStyle(
      fontSize: 16,
      fontFamily: "Inter",
      
      // Normal (light) font weight
      // Underline the text
    ),
  ),
)

            ,), 
      
      
            ],),
             SizedBox(height: height*0.01),
             Column(
              children: transactions.map((transaction) => transaction).toList(),
            ),
           
          ],
          
        ),
      ),
    );
  }
}

class _SalesData {
  const _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

class _PieData {
  const _PieData(this.xData, this.yData, [this.text]);

  final String xData;
  final num yData;
  final String? text;
}
class SalesChart extends StatelessWidget {
  const SalesChart({required this.data, required this.width});

  final List<_SalesData> data;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 0,
      color: Colors.grey.shade200,
      margin: EdgeInsets.all(width * 0.05),
      child: SfCartesianChart(
        margin: EdgeInsets.all(width * 0.05),
        primaryXAxis: const CategoryAxis(),
        title: const ChartTitle(text: 'Half yearly sales analysis'),
        legend: const Legend(isVisible: true),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <CartesianSeries<_SalesData, String>>[
          LineSeries<_SalesData, String>(
            dataSource: data,
            xValueMapper: (_SalesData sales, _) => sales.year,
            yValueMapper: (_SalesData sales, _) => sales.sales,
            name: 'Sales',
            dataLabelSettings: const DataLabelSettings(isVisible: true),
          )
        ],
      ),
    );
  }
}

class PieChart extends StatelessWidget {
  const PieChart({required this.pieData, required this.width});

  final List<_PieData> pieData;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Colors.grey.shade200,
      elevation: 0,
      margin: EdgeInsets.all(width * 0.05),
      child: SfCircularChart(
        margin: EdgeInsets.all(width * 0.05),
        title: const ChartTitle(text: 'Sales by Store'),
        legend: const Legend(isVisible: true),
        series: <PieSeries<_PieData, String>>[
          PieSeries<_PieData, String>(
            explode: true,
            explodeIndex: 0,
            dataSource: pieData,
            xValueMapper: (_PieData data, _) => data.xData,
            yValueMapper: (_PieData data, _) => data.yData,
            dataLabelMapper: (_PieData data, _) => data.text,
            dataLabelSettings: const DataLabelSettings(isVisible: true),
          )
        ],
      ),
    );
  }
}
