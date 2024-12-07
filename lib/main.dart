import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:station_info/models/models.dart';
import 'package:station_info/styles/colors.dart';
import 'package:station_info/widgets/platform_list_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Platform>? platforms;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    loadData();
  }

  void loadData() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/json/stationData.json");
    List<dynamic> dataJson = jsonDecode(data);
    setState(() {
      platforms =
          dataJson.map((platform) => Platform.fromJson(platform)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarContrastEnforced: false,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: MyColors.backgroundColor,
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: SafeArea(
            child: Center(
              child: Text(
                'Kisaki Coast',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 4,
                  decoration: TextDecoration.underline,
                  decorationColor: MyColors.titleTint,
                  decorationThickness: 2,
                ),
              ),
            ),
          ),
        ),
        body: platforms != null
            ? ListView.builder(
                itemCount: platforms!.length,
                itemBuilder: (builder, index) {
                  final platform = platforms![index];
                  return PlatformListItem(
                    platform: platform,
                    isOval: index % 2 != 0,
                  );
                },
              )
            : Container(),
      ),
    );
  }
}
