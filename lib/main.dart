import 'package:custom_cupertino_context_menu/custom_cupertino_context_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Widget> _actions = [
    CupertinoContextMenuAction(child: Text('AAA')),
    CupertinoContextMenuAction(child: Text('BBB')),
    CupertinoContextMenuAction(child: Text('CCC')),
    CupertinoContextMenuAction(child: Text('DDD')),
  ];

  @override
  Widget build(BuildContext context) {
    final Widget _officialCuperTinoContextMenu = Column(
      children: [
        Text(
          'CuperTinoContextMenu',
          style: TextStyle(fontSize: 20),
        ),
        CupertinoContextMenu(
          actions: _actions,
          child: TappablePhoto(
            onTap: () => _moveToNewPage(context),
          ),
        ),
      ],
    );
    final Widget _customCupertinoContextMenu = Column(
      children: [
        Text(
          'Custom CuperTinoContextMenu',
          style: TextStyle(fontSize: 20),
        ),
        CustomCupertinoContextMenu(
          actions: _actions,
          child: TappablePhoto(
            onTap: () => _moveToNewPage(context),
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _officialCuperTinoContextMenu,
            _customCupertinoContextMenu,
          ],
        ),
      ),
    );
  }

  void _moveToNewPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(Colors.green, BlendMode.colorBurn),
              child: Image.asset('lib/lena.png'),
            ),
          ),
        );
      }),
    );
  }
}

class TappablePhoto extends StatelessWidget {
  TappablePhoto({this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: onTap,
        child: Image.asset('lib/lena.png', width: 200),
      ),
    );
  }
}
