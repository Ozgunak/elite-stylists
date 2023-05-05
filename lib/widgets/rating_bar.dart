import 'package:flutter/material.dart';

class RatingBar extends StatefulWidget {
  @override
  _RatingBarState createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  int _selectedStar = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = [];
    for (int i = 1; i <= 5; i++) {
      stars.add(
        IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(
            i <= _selectedStar ? Icons.star : Icons.star_border,
            color: Colors.amber,
          ),
          onPressed: () {
            setState(() {
              _selectedStar = i;
            });
          },
        ),
      );
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: stars,
    );
  }
}
