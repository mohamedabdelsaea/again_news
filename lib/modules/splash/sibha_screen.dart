import 'package:again_news/core/route/page_route_name.dart';
import 'package:again_news/main.dart';
import 'package:flutter/material.dart';

class SibhaScreen extends StatefulWidget {
  const SibhaScreen({super.key});

  @override
  State<SibhaScreen> createState() => _SibhaScreenState();
}

class _SibhaScreenState extends State<SibhaScreen> {
  int num = 0;

  void addNum() {
    num++;
    setState(() {
    });
  }

  void deleteNum() {
    num = 0;
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: () {
        navigatorKey.currentState!.pushNamed(PageRouteName.home);
      }, icon: Icon(Icons.arrow_back,color: Colors.red,size: 30,)),),
      body: Column(
        children: [
          SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.center,
              width: size.width * 0.6,
              height: size.height * 0.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black.withAlpha(200),
              ),
              child: Center(
                child: Text(
                  '$num',
                  style: theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 50),
                ),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.055),
          GestureDetector(
            onTap: () {
              setState(() {
                deleteNum();
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36.0),
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(36),
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: size.height * 0.155),
          GestureDetector(
            onTap: () {
              setState(() {
                addNum();
              });
            },
            child: Container(
              width: size.width * 0.6,
              height: size.height * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
