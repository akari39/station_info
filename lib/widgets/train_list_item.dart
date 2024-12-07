import 'package:flutter/material.dart';

class TrainListItem extends StatelessWidget {
  final String time;
  final String type;
  final String terminus;
  final String? timeLeft;
  final bool isOval;

  const TrainListItem({
    super.key,
    required this.time,
    required this.type,
    required this.terminus,
    this.timeLeft,
    this.isOval = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Ink(
        color: isOval ? Theme.of(context).colorScheme.onSurfaceVariant : null,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '12:59',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                if (timeLeft != null)
                  Text(
                    '4 mins Left',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.tertiaryFixedDim,
                      fontSize: 24,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Theme.of(context).colorScheme.outlineVariant,
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                  child: Text(
                    'Local',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Narita Airport',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
