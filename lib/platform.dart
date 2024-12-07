import 'package:flutter/material.dart';
import 'package:station_info/styles/colors.dart';
import 'package:station_info/widgets/platform_list_item.dart';
import 'package:station_info/widgets/train_list_item.dart';

class PlatformPage extends StatefulWidget {
  const PlatformPage({super.key});

  @override
  State<StatefulWidget> createState() => _PlatformPageState();
}

class _PlatformPageState extends State<PlatformPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: MyColors.backgroundColor),
      backgroundColor: MyColors.backgroundColor,
      body: Column(
        children: [
          PlatformListItem(platformNo: 1, lineName: 'Test', bound: 'Bound'),
          Expanded(
            child: SafeArea(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                    width: 2,
                    strokeAlign: BorderSide.strokeAlignOutside,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Ink(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    child: ListView(
                      children: [
                        TrainListItem(time: '', type: '', terminus: ''),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
