import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final TabController tabController;

  const CustomTabBar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      labelColor: Theme.of(context).primaryColor,
      tabs: const [
        Tab(text: 'Services'),
        Tab(text: 'Portfolio'),
        Tab(text: 'Review'),
        Tab(text: 'Details'),
      ],
    );
  }
}
