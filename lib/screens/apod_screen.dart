import 'package:flutter/material.dart';
import 'package:nasa2/providers/nasa_provider.dart';
import 'package:provider/provider.dart';

class ApodScreen extends StatelessWidget {
  const ApodScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('APOD'),
      ),
      body: Center(
        child: Consumer<NasaProvider>(
          builder: (context, apodProvider, _) {
            if (apodProvider.apod != null) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(apodProvider.apod!.title),
                  const SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    color: Colors.amber[600],
                    width: 500,
                    height: 250,
                    child: Image.network(
                      apodProvider.apod!.url,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(apodProvider.apod!.explanation),
                ],
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
