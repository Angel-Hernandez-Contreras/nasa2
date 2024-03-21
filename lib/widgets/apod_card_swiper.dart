import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:nasa2/models/models.dart';

class ApodCardSwiper extends StatelessWidget {
  final List<Apod> apods;
  const ApodCardSwiper({Key? key, required this.apods});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: apods.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: (_, int index) {
          final apod = apods[index];
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'apod', arguments: apod),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/loading.gif'),
                image: NetworkImage(apod.url),
                //image: AssetImage('assets/no-image.jpeg'),
              ),
            ),
          );
        },
      ),
    );
  }
}
