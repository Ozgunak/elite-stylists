import 'package:carousel_slider/carousel_slider.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import '../widgets/rating_bar.dart';
import '../widgets/custom_tab_bar.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildCarousel() {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 300,
            viewportFraction: 1,
            autoPlay: true,
            enlargeCenterPage: true,
          ),
          items: [
            _buildGradientImage('hair', 'barber'),
            _buildGradientImage('hair', 'salon'),
            _buildGradientImage('salon', 'barber'),
          ],
        ),
        Positioned(
          top: MediaQuery.of(context).padding.top + 10,
          left: 10,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).padding.top + 10,
          right: 10,
          child: RatingBar(),
        ),
      ],
    );
  }

  Widget _buildGradientImage(String keyword1, String keyword2) {
    return Stack(
      children: [
        Image.network(
          Faker().image.image(
              keywords: [keyword1, keyword2],
              width: MediaQuery.of(context).size.width.toInt(),
              height: 300),
          width: MediaQuery.of(context).size.width,
          height: 300,
          fit: BoxFit.cover,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 300,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.7),
                Colors.black.withOpacity(0.2),
                Colors.black.withOpacity(0.1)
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCard() {
    return const Card(
      margin: EdgeInsets.all(16),
      child: ListTile(
        leading: Icon(Icons.account_circle),
        title: Text('Title'),
        subtitle: Text('Description'),
      ),
    );
  }

  Widget _buildTabBarView() {
    return SizedBox(
      height: 200,
      child: TabBarView(
        controller: _tabController,
        children: const [
          Center(child: Text('Services')),
          Center(child: Text('Portfolio')),
          Center(child: Text('Review')),
          Center(child: Text('Details')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            expandedHeight: 250,
            pinned: false,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: _buildCarousel(),
            ),
          ),
        ];
      },
      body: Column(
        children: [
          _buildCard(),
          CustomTabBar(tabController: _tabController),
          _buildTabBarView(),
        ],
      ),
    );
  }
}
