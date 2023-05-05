import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final TabController tabController;

  CustomTabBar({required this.tabController});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      labelColor: Theme.of(context).primaryColor,
      tabs: [
        Tab(text: 'Services'),
        Tab(text: 'Portfolio'),
        Tab(text: 'Review'),
        Tab(text: 'Details'),
      ],
    );
  }
}
