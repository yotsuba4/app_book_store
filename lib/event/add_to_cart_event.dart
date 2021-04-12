import 'package:app_book_store/base/base_event.dart';

class AddToCartEvent extends BaseEvent {
  int count;
  AddToCartEvent(this.count);
}
