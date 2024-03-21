import 'package:flutter/material.dart';
import 'package:nasa2/widgets/apod_card_swiper.dart';
import 'package:provider/provider.dart';
import 'package:nasa2/providers/nasa_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final apodProvider = Provider.of<NasaProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(
          child: Text('Nasa'),
        ),
      ),
      body: Column(
        children: [
          ApodCardSwiper(
            apods: [apodProvider.apod!],
          ),
        ],
      ),
    );
  }
}
