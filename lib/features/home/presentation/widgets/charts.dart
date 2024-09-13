

import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hzmarket/config/color_manager.dart';
import 'package:hzmarket/config/styles_manager.dart';
import 'package:hzmarket/features/home/presentation/widgets/transaction.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:card_slider/card_slider.dart';
import 'package:fl_chart/fl_chart.dart';



import 'package:flutter/material.dart';

class PieChartSample1 extends StatefulWidget {
  const PieChartSample1({super.key});

  @override
  State<StatefulWidget> createState() => PieChartSample1State();
}

class PieChartSample1State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 28,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Indicator(
                color: ColorManager.chartcolor1,
                text: 'oran',
                isSquare: false,
                size: touchedIndex == 0 ? 18 : 16,
                textColor: touchedIndex == 0
                    ? ColorManager.white
                    : ColorManager.black,
              ),
              Indicator(
                color: ColorManager.chartcolor2,
                text: 'alger',
                isSquare: false,
                size: touchedIndex == 1 ? 18 : 16,
                textColor: touchedIndex == 1
                    ? ColorManager.white
                    : ColorManager.black,
              ),
              Indicator(
                color: ColorManager.chartcolor3,
                text: 'setif',
                isSquare: false,
                size: touchedIndex == 2 ? 18 : 16,
                textColor: touchedIndex == 2
                    ? ColorManager.white
                    : ColorManager.black,
              ),
              Indicator(
                color: ColorManager.chartcolor4,
                text: 'eulma',
                isSquare: false,
                size: touchedIndex == 3 ? 18 : 16,
                textColor: touchedIndex == 3
                    ? ColorManager.white
                    : ColorManager.black,
              ),
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  startDegreeOffset: 180,
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 1,
                  centerSpaceRadius: 0,
                  sections: showingSections(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
List<PieChartSectionData> showingSections() {
  return List.generate(
    4,
    (i) {
      final isTouched = i == touchedIndex;
      const double sectionRadius = 70; // Equal radius for all sections
      const double sectionValue = 25; // Equal value for all sections
      const double titlePositionPercentage = 0.55;

      const color0 = ColorManager.chartcolor1;
      const color1 = ColorManager.chartcolor2;
      const color2 = ColorManager.chartcolor3;
      const color3 = ColorManager.chartcolor4;

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: color0,
            value: 40,
            title: '',
            radius: sectionRadius,
            titlePositionPercentageOffset: titlePositionPercentage,
            borderSide: isTouched
                ? const BorderSide(color: ColorManager.white, width: 6)
                : BorderSide(color: ColorManager.white.withOpacity(0)),
          );
        case 1:
          return PieChartSectionData(
            color: color1,
            value: 20,
            title: '',
            radius: sectionRadius,
            titlePositionPercentageOffset: titlePositionPercentage,
            borderSide: isTouched
                ? const BorderSide(color: ColorManager.white, width: 6)
                : BorderSide(color: ColorManager.white.withOpacity(0)),
          );
        case 2:
          return PieChartSectionData(
            color: color2,
            value: 30,
            title: '',
            radius: sectionRadius,
            titlePositionPercentageOffset: titlePositionPercentage,
            borderSide: isTouched
                ? const BorderSide(color: ColorManager.white, width: 6)
                : BorderSide(color: ColorManager.white.withOpacity(0)),
          );
        case 3:
          return PieChartSectionData(
            color: color3,
            value: 30,
            title: '',
            radius: sectionRadius,
            titlePositionPercentageOffset: titlePositionPercentage,
            borderSide: isTouched
                ? const BorderSide(color: ColorManager.white, width: 6)
                : BorderSide(color: ColorManager.white.withOpacity(0)),
          );
        default:
          throw Error();
      }
    },
  );
}

}


class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.color,
    required this.text,
    required this.isSquare,
    this.size = 16,
    this.textColor,
  });
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        )
      ],
    );
  }
}