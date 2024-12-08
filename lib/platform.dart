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
    return Hero(
      tag: 'platform${platform?.platformNo}',
      child: Scaffold(
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
                      child: Navigator(
                        initialRoute: '/',
                        onGenerateRoute: (RouteSettings settings) {
                          return MaterialPageRoute(builder: (context) {
                            switch (settings.name) {
                              case '/':
                                return _trains();
                              case 'trainDetail':
                                return TrainDetail(
                                    train: settings.arguments as Train);
                              default:
                                return Container();
                            }
                          });
                        },
                      ),
                    ),
                  ),
                ],
              )
            : Container(),
      ),
    );
  }

  Widget _trains() {
    return Container(
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
          child: ListView.builder(
              itemCount: platform!.trains.length,
              itemBuilder: (context, index) {
                return TrainListItem(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      'trainDetail',
                      arguments: platform!.trains[index],
                    );
                  },
                  train: platform!.trains[index],
                  isOval: index % 2 != 0,
                );
              }),
        ),
      ),
    );
  }
}

class TrainDetail extends StatelessWidget {
  final Train train;

  const TrainDetail({super.key, required this.train});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
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
            child: Column(
              children: [
                TrainListItem(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  train: train,
                  isOval: true,
                  detailMode: true,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: train.stops.map((stop) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                stop,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32,
                                ),
                              ),
                            ),
                            if (train.stops.indexOf(stop) !=
                                train.stops.length - 1)
                              const SizedBox(height: 28),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
