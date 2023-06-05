import 'package:cached_network_svg_image/cached_network_svg_image.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage(this.url, {super.key});
  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Hero(
          tag: url,
          child: CachedNetworkSVGImage(
            url,
            placeholder: const CircularProgressIndicator(color: Colors.green),
            errorWidget: const Icon(Icons.error, color: Colors.red),
            width: 400.0,
            height: 400.0,
          ),
        ),
      ),
    );
  }
}
