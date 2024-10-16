enum Product {
  dart('Dart', 'dart is the best object programming', 'assets/dart.png'),
  flutter('Flutter', 'flutter is the best object programming',
      'assets/flutter.png'),
  firebase('Firebase', 'firebase is the best object programming',
      'assets/firebase.png');

  final String title;
  final String description;
  final String image;

  const Product(this.title, this.description, this.image);

  // @override
  // String toString() {
  //   return title;
  // }
}
