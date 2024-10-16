import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_app/W4-s1-s2-s3/week4-S1/Ex-2-the-product/product_category.dart';

void main() {
  runApp(const TheProduct());
}

class TheProduct extends StatelessWidget {
  const TheProduct({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: Text(
            "Products",
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        body: const Column(
          children: [
            SizedBox(height: 15),
            ProductCard(product: Product.dart),
            ProductCard(product: Product.flutter),
            ProductCard(product: Product.firebase),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: false,
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              product.image,
              width: 100,
              height: 100,
              alignment: Alignment.centerLeft,
            ),
            const SizedBox(height: 10),
            Text(
              product.title,
              style: GoogleFonts.poppins(
                  fontSize: 24, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 2),
            Text(
              product.description,
              style: GoogleFonts.poppins(
                  fontSize: 12, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
