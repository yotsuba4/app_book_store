import 'package:app_book_store/data/remote/order_service.dart';
import 'package:flutter/widgets.dart';

class OrderRepo {
  OrderService _orderService;

  OrderRepo({@required OrderService orderService})
      : _orderService = orderService;
}