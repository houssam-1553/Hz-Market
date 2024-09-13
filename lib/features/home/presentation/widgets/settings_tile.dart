import 'package:flutter/material.dart';
import 'package:hzmarket/config/color_manager.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailing,
  }) : super(key: key);

  final IconData icon;
  final String title, subtitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 25,
        color: ColorManager.primary, // Assuming you have a primary color defined
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          // The color will be set by the theme
        ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: 15,
          // The color will be set by the theme
        ),
      ),
      trailing: trailing,
    );
  }
}
