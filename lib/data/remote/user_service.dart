import 'package:app_book_store/network/book_client.dart';
import 'package:dio/dio.dart';

class UserService {
  Future<Response> signIn(String phone, String pass) {
    return BookClient.instance.dio.post(
      '/user/sign-in',
      data: {
        'phone': phone,
        'password': pass,
      },
    );
  }
}