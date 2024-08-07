import 'package:flutter_application/ui/views/screens/example.dart';

class ProductRepository {
  final List<ProductModel> products = [];

  void addProduct(ProductModel product) {
    products.add(product);
  }

  List<ProductModel> getProducts() {
    return List.unmodifiable(products);
  }

  ProductModel? getProduct(String name) {
    return products.firstWhere((product) => product.name == name);
  }

  void updateProduct(String name, ProductModel updatedProduct) {
    for (int i = 0; i < products.length; i++) {
      if (products[i].name == name) {
        products[i] = updatedProduct;
        break;
      }
    }
  }

  void deleteProduct(String name) {
    products.removeWhere((product) => product.name == name);
  }
}

class CartManager {
  final List<List<ProductModel>> cart = [];

  void addToCart(List<ProductModel> products) {
    cart.add(products);
  }
}
