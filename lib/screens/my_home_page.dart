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
            height: 200,
            viewportFraction: 1,
            autoPlay: true,
            enlargeCenterPage: true,
          ),
          items: [
            _buildGradientImage(Faker().image.image(
                keywords: ['hair', 'barber'],
                width: MediaQuery.of(context).size.width.toInt(),
                height: 200)),
            _buildGradientImage(Faker().image.image(
                keywords: ['hair', 'salon'],
                width: MediaQuery.of(context).size.width.toInt(),
                height: 200)),
            _buildGradientImage(Faker().image.image(
                keywords: ['salon', 'barber'],
                width: MediaQuery.of(context).size.width.toInt(),
                height: 200)),
          ],
        ),
        Positioned(
          top: 10,
          left: 10,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: RatingBar(),
        ),
      ],
    );
  }

  Widget _buildGradientImage(String imageUrl) {
    return Stack(
      children: [
        Image.network(
          imageUrl,
          width: MediaQuery.of(context).size.width,
          height: 200,
          fit: BoxFit.cover,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.7),
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
        children: [
          const Center(child: Text('Services')),
          const Center(child: Text('Portfolio')),
          const Center(child: Text('Review')),
          const Center(child: Text('Details')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildCarousel(),
          _buildCard(),
          CustomTabBar(tabController: _tabController),
          _buildTabBarView(),
        ],
      ),
    );
  }
}
