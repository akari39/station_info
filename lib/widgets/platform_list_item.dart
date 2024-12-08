import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:station_info/models/models.dart';
import 'package:station_info/platform.dart';
import 'package:station_info/styles/colors.dart';
import 'package:station_info/widgets/conditional_marquee_text.dart';

class PlatformListItem extends StatelessWidget {
  final Platform platform;
  final bool isOval;
  final bool infoOnly;

  const PlatformListItem({
    super.key,
    this.isOval = false,
    required this.platform,
    this.infoOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    final Widget body = Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: infoOnly
            ? null
            : () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (builder) => PlatformPage(key: super.key),
                    settings: RouteSettings(arguments: platform),
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
                  const ConditionalMarqueeText(
                    text: 'Platform',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    platform.platformNo.toString().padLeft(2, '0'),
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      color: isOval
                          ? Colors.white
                          : Theme.of(context).colorScheme.surfaceContainerHighest,
                      padding:
                          const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                      child: Text(
                        platform.lineName,
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Flexible(
                          child: SizedBox(
                            height: 45,
                            child: Marquee(
                              text: platform.bound,
                              style: const TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w800,
                              ),
                              scrollAxis: Axis.horizontal,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              blankSpace: 100.0,
                              velocity: 60.0,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
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
              ),
            ],
          ),
        ),
      ),
    );
    return infoOnly
        ? body
        : Hero(
            tag: 'platform${platform.platformNo}',
            child: body,
          );
  }
}
