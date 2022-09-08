import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:live_soccer/app/service_locator.dart';
import 'package:live_soccer/presentation/helpers/sp.dart';
import 'package:live_soccer/presentation/providers/theme_provider.dart';
import 'package:live_soccer/presentation/resourcing/theme_manager.dart';

import 'presentation/screens/main_page.dart';

// Future<void> _precache() async {
//     for (String imageUrl in _urls) {
//       await precachePicture(
//         NetworkPicture(
//           SvgPicture.svgByteDecoderBuilder,
//           imageUrl,
//         ),
//         null,
//       );
//     }
//   }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SpHelper.spHelper.initSp();
  await initAppModule();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeStateNotifier);
    return ScreenUtilInit(
        minTextAdapt: true,
        builder: (context, widget) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: AppTheme.lightTheme,
              themeMode:
                  appTheme.isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
              darkTheme: AppTheme.darkTheme,
              home: MainPage());
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  late AnimationController controller;
  double heigh = 200;
  double width = 200;
  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..repeat();
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      controller.forward(from: 20);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedBuilder(
              animation: controller,
              child: Container(
                width: width,
                height: heigh,
                color: Colors.amber,
              ),
              builder: (context, Widget? child) {
                return Transform.rotate(
                  angle: controller.value * pi,
                  child: child,
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
