import 'package:flutter/material.dart';

class OffersCard extends StatelessWidget {
  final String imagePath;
  const OffersCard({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(imagePath);
  }
}
