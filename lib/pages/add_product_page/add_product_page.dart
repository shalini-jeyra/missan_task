import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import '../../models/models.dart';
import '../../services/api_service.dart';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  static final Faker faker = Faker();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  void _saveProduct() {
    if (_formKey.currentState!.validate()) {
      String name = _nameController.text;
      String description = _descriptionController.text;

      Product newProduct = Product(
        id: 0,
        name: name,
        description: description,
        imageUrl: faker.image.image(),
      );

      ApiService.addProduct(newProduct);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product added successfully!'),
        ),
      );
      Navigator.pop(context, true);

      _nameController.clear();
      _descriptionController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Product Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the product name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _saveProduct,
                child: const Text('Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
