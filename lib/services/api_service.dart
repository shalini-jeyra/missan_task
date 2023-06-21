import 'package:faker/faker.dart';

import '../models/models.dart';



class ApiService {
  static final Faker faker = Faker();
  static List<Product> products = fetchProducts();
  static int _nextProductId = 3;

  static List<Product> fetchProducts() {
    return List.generate(
      2,
      (index) => Product(
        id: index + 1,
        name: 'Product ${index + 1}',
        description: faker.lorem.sentence(),
        imageUrl: faker.image.image(),
      ),
    );
  }

  static void addProduct(Product product) {
    product.id = _nextProductId++;
    products.add(product);
  }
}
