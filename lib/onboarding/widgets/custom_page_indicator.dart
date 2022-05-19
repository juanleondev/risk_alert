import 'package:flutter/material.dart';
import 'package:risk_alert/theme/colors.dart';

class CustomPageIndicator extends StatelessWidget {
  const CustomPageIndicator({
    Key? key,
    required this.length,
    required this.selectedIndex,
  }) : super(key: key);
  final int length;
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    final _primaryColor = Theme.of(context).primaryColor;
    return SizedBox(
      height: 10,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selectedIndex == index ? _primaryColor : grayColor,
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(
          width: 10,
        ),
        itemCount: length,
      ),
    );
  }
}
