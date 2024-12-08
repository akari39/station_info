import 'package:flutter/material.dart';
import 'package:station_info/models/models.dart';

import 'blinking_text.dart';
import 'conditional_marquee_text.dart';

class TrainListItem extends StatelessWidget {
  final Train train;
  final bool isOval;
  final bool detailMode;
  final void Function()? onTap;

  const TrainListItem({
    super.key,
    required this.train,
    this.isOval = false,
    this.detailMode = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Ink(
          color: isOval
              ? Theme.of(context).colorScheme.onSecondaryFixedVariant
              : null,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    train.time,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  if (train.timeLeft != null)
                    train.timeLeft == 0
                        ? BlinkingText(
                            text: 'Train is approaching',
                            strokeColor: Theme.of(context).colorScheme.error,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.surface,
                              fontSize: 24,
                            ),
                          )
                        : Text(
                            '${train.timeLeft} mins Left',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context)
                                  .colorScheme
                                  .tertiaryFixedDim,
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
                    color: train.getTypeColor(context),
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                    child: Text(
                      train.typeText ?? '',
                      style: TextStyle(
                        color: train.type == TrainType.limitedExpress
                            ? Colors.white
                            : Theme.of(context).colorScheme.onSurface,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Flexible(
                    child: SizedBox(
                      height: 45,
                      child: ConditionalMarqueeText(
                        text: train.terminus,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
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
