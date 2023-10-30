import 'package:flutter/material.dart';
import 'package:my_todo/todo_list_screen.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 必须加上这一行。
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
      size: Size(600, 900),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      title: '我的事务',
      titleBarStyle: TitleBarStyle.normal,
      minimumSize: Size(400, 600));
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'NotoSerifSC',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          )),
      home: const TodoListScreen(),
      title: '我的事务',
      debugShowCheckedModeBanner: false,
    );
  }
}
