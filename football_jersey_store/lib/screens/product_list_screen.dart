import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class ProductListScreen extends StatefulWidget {
  final List<Product> products;
  const ProductListScreen({Key? key, required this.products}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    final favCount = widget.products.where((p) => p.isFavorite).length;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('⚽ Football Jersey Store',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.52,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: widget.products.length,
        itemBuilder: (context, index) {
          return ProductCard(
            product: widget.products[index],
            onFavoriteChanged: () => setState(() {}),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('❤️ Favourites'),
              content: Text(favCount == 0
                  ? 'No favourites yet.'
                  : 'You have $favCount favourite(s).'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        },
        icon: const Icon(Icons.favorite),
        label: Text('Favourites ($favCount)'),
        backgroundColor: Colors.red[600],
      ),
    );
  }
}
