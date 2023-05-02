import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapapi/ui/all_news.dart';
import 'package:newsapapi/ui/breaking_news.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(title: Text("Flutter News App"),
          bottom: TabBar(
            tabs: [
              Tab(text: "Breaking",),
              Tab(text: "All News",),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            BreakingNews(),
            AllNews(),
          ],
        ),
      ),
    );
  }
}
