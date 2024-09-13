import 'package:flutter/material.dart';

class IconCircularSwitch extends StatelessWidget {
  final bool isOn;
  final ValueChanged<bool> onChanged;
  final IconData iconOn;
  final IconData iconOff;
  final Color activeColor;
  final Color inactiveColor;
  final Color activeIconColor;
  final Color inactiveIconColor;
  final Duration animationDuration;
  final double width;
  final double height;
  final double iconSize;

  IconCircularSwitch({
    required this.isOn,
    required this.onChanged,
    required this.iconOn,
    required this.iconOff,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.activeIconColor = Colors.white,
    this.inactiveIconColor = Colors.black,
    this.animationDuration = const Duration(milliseconds: 300),
    this.width = 60,
    this.height = 30,
    this.iconSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!isOn),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: isOn ? activeColor : inactiveColor,
          borderRadius: BorderRadius.circular(height / 2),
        ),
        child: Stack(
          children: [
            // Animated icon movement
            AnimatedAlign(
              alignment: isOn ? Alignment.centerRight : Alignment.centerLeft,
              duration: animationDuration,
              curve: Curves.easeInOut,
              child: Container(
                width: height, // Circular shape
                height: height,
                decoration: const BoxDecoration(
                  color: Colors.white, // Icon background circle color
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    isOn ? iconOn : iconOff,
                    color: isOn ? activeIconColor : inactiveIconColor,
                    size: iconSize,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
