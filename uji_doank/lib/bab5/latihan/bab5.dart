import 'package:flutter/material.dart';
void main() {
  runApp(const MaterialApp(
    home: ProductListScreen(),
  ));
}
class Product {
  final String name;
  final double price;
  final String description;
  final String imageUrl;
  Product({
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
  });
}
class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  final List<Product> products = const [
    Product(
      name: 'Laptop Gaming',
      price: 1500.00,
      description: 'Laptop dengan performa tinggi untuk gaming berat.',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSzYrYmYomvcy8QhQ1NID5kzgsyyFF00KdCA&s',
    ),
    Product(
      name: 'Smartphone',
      price: 800.00,
      description: 'Smartphone flagship dengan kamera terbaik.',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRm9-gCmBlAEjo1p_d8ajTngisn82hS44JtNw&s',
    ),
    Product(
      name: 'Headphone',
      price: 120.00,
      description: 'Headphone dengan kualitas suara premium.',
      imageUrl:
          'https://media.dinomarket.com/docs/imgTD/2023-05/DM_FAA78051EF44DA90059B7DA0CFE8E269_080523160514_ll.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Produk')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: Image.network(product.imageUrl),
            title: Text(product.name),
            subtitle: Text('Rp ${product.price.toStringAsFixed(2)}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(product: product),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
class ProductDetailScreen extends StatelessWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product.imageUrl),
            const SizedBox(height: 20),
            Text('Nama: ${product.name}', style: const TextStyle(fontSize: 22)),
            Text('Harga: Rp ${product.price.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 18)),
            Text('Deskripsi: ${product.description}',
                style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 30),
            ElevatedButton(
              child: const Text('Kembali ke Daftar'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}