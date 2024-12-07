import 'package:flutter/material.dart';
import 'package:station_info/models/models.dart';
import 'package:station_info/styles/colors.dart';
import 'package:station_info/widgets/platform_list_item.dart';
import 'package:station_info/widgets/train_list_item.dart';

class PlatformPage extends StatefulWidget {
  const PlatformPage({super.key});

  @override
  State<StatefulWidget> createState() => _PlatformPageState();
}

class _PlatformPageState extends State<PlatformPage> {
  Platform? platform;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        platform = ModalRoute.of(context)?.settings.arguments as Platform;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.backgroundColor,
        surfaceTintColor: MyColors.backgroundColor,
      ),
      backgroundColor: MyColors.backgroundColor,
      body: platform != null
          ? Column(
              children: [
                PlatformListItem(
                  platform: platform!,
                  infoOnly: true,
                ),
                Expanded(
                  child: SafeArea(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        border: Border.all(
                          color:
                              Theme.of(context).colorScheme.tertiaryContainer,
                          width: 2,
                          strokeAlign: BorderSide.strokeAlignOutside,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        child: Ink(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          child: ListView.builder(
                              itemCount: platform!.trains.length,
                              itemBuilder: (context, index) {
                                return TrainListItem(
                                  train: platform!.trains[index],
                                  isOval: index % 2 != 0,
                                );
                              }),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Container(),
    );
  }
}
