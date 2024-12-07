import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:station_info/models/models.dart';

class TrainListItem extends StatelessWidget {
  final Train train;
  final bool isOval;

  const TrainListItem({
    super.key,
    required this.train,
    this.isOval = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
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
                    train.time,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  if (train.timeLeft != null)
                    Text(
                      train.timeLeft == 0
                          ? 'Train is approaching'
                          : '${train.timeLeft} mins Left',
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    color: Theme.of(context).colorScheme.outlineVariant,
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                    child: Text(
                      train.type.toShortString(),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Flexible(
                    child: SizedBox(
                      height: 45,
                      child: Marquee(
                        text: train.terminus,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                        scrollAxis: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        blankSpace: 100.0,
                        velocity: 60.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
