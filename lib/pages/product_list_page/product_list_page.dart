import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../services/api_service.dart';
import '../pages.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();

    products = ApiService.products;
  }

  Future<void> _addProduct() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddProductPage()),
    );
    if (result == true) {
      setState(() {
        products = ApiService.products;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        actions: [
          IconButton(icon: const Icon(Icons.add), onPressed: _addProduct),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: Image.network(
                      products[index].imageUrl,
                      width: 60,
                      height: 60,
                    ),
                    title: Text(
                      products[index].name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(products[index].description),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDetailsPage(
                                  product: products[index],
                                )),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
