import 'package:flutter/material.dart';

class PageOne3 extends StatefulWidget {
  const PageOne3({Key? key}) : super(key: key);

  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Page 3'),
      ),
    );
  }
}
