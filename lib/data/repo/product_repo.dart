import 'package:app_book_store/data/remote/product_service.dart';
import 'package:flutter/widgets.dart';

class ProductRepo {
  ProductService _productService;

  ProductRepo({@required ProductService productService})
      : _productService = productService;
}
