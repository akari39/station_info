import 'package:flutter/material.dart';
import 'package:station_info/platform.dart';
import 'package:station_info/styles/colors.dart';

class PlatformListItem extends StatelessWidget {
  final int platformNo;
  final String lineName;
  final String bound;
  final bool isOval;

  const PlatformListItem({
    super.key,
    required this.platformNo,
    required this.lineName,
    required this.bound,
    this.isOval = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (builder) => PlatformPage(),
        ),
      ),
      child: Ink(
        color: isOval
            ? Theme.of(context).colorScheme.surfaceContainerHighest
            : MyColors.backgroundColor,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Platform',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '01',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  color: isOval
                      ? Colors.white
                      : Theme.of(context).colorScheme.surfaceContainerHighest,
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                  child: Text(
                    'Keisei Main Line',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(
                      'Ueno',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Bound for',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
