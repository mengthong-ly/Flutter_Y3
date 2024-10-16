import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImageGallery(),
    );
  }
}

class ImageGallery extends StatefulWidget {
  const ImageGallery({
    super.key,
  });

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  int currentIndex = 1;

  void nextImage() {
    setState(() {
      currentIndex =  (currentIndex % 6) + 1;
    });
  }

  void previousImage() {
    setState(() {
      if (currentIndex > 1) {
        currentIndex--;
      } else if (currentIndex == 1) {
        currentIndex = 6;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Gallery"),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: previousImage,
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: nextImage,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.amber,
            width: MediaQuery.of(context).size.width,
            height: 500,
            child: Image.asset("assets/gallery/$currentIndex.png"),
          ),
        ],
      ),
    );
  }
}
