import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: SafeArea(
            child: Center(
              child: Text(
                'どこそこの駅',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 4,
                  decoration: TextDecoration.underline,
                  decorationColor: MyColors.titleTint,
                  decorationThickness: 4,
                ),
              ),
            ),
          ),
        ),
        body: ListView(
          children: [
            PlatformListItem(platformNo: 1, lineName: 'Test', bound: 'test',),
            PlatformListItem(platformNo: 1, lineName: 'Test', bound: 'test', isOval: true,)
          ],
        ),
      ),
    );
  }
}
