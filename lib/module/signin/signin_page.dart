import 'package:app_book_store/base/base_widget.dart';
import 'package:app_book_store/data/remote/user_service.dart';
import 'package:app_book_store/data/repo/user_repo.dart';
import 'package:app_book_store/event/signin_event.dart';
import 'package:app_book_store/module/signin/signin_bloc.dart';
import 'package:app_book_store/shared/app_color.dart';
import 'package:app_book_store/shared/widget/normal_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageContainer(
      bloc: [],
      di: [
        Provider.value(
          value: UserService(),
        ),
        ProxyProvider<UserService, UserRepo>(
          update: (context, userService, previous) =>
              UserRepo(userService: userService),
        ),
      ],
      title: 'Sign In',
      child: SignInFormWidget(),
    );
  }
}

class SignInFormWidget extends StatelessWidget {
  final TextEditingController _txtPhoneController = TextEditingController();
  final TextEditingController _txtPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Provider<SignInBloc>.value(
      value: SignInBloc(userRepo: Provider.of(context)),
      child: Consumer<SignInBloc>(
        builder: (context, bloc, child) => Container(
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildPhoneField(),
              _buildPassField(),
              NormalButton(onPressed: () {
                print(_txtPhoneController.text);
                bloc.event.add(
                  SignInEvent(
                    phone: _txtPhoneController.text,
                    pass: _txtPassController.text,
                  ),
                );
              }),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return GestureDetector(
      onTap: () {
        print('Da bat su kien');
      },
      child: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.all(10),
        child: Text(
          'Đăng ký tài khoản',
          style: TextStyle(
            color: AppColor.blue,
            fontSize: 17,
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneField() {
    return Container(
      margin: EdgeInsets.only(
        bottom: 15,
      ),
      child: TextFormField(
        controller: _txtPhoneController,
        cursorColor: Colors.black,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          icon: Icon(
            Icons.phone,
            color: AppColor.blue,
          ),
          hintText: '(+84) 973 901 789',
          labelText: 'Phone',
          labelStyle: TextStyle(color: AppColor.blue),
        ),
      ),
    );
  }

  Widget _buildPassField() {
    return Container(
      margin: EdgeInsets.only(
        bottom: 15,
      ),
      child: TextFormField(
        controller: _txtPassController,
        obscureText: true,
        cursorColor: Colors.black,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            color: AppColor.blue,
          ),
          hintText: 'Password',
          labelText: 'Password',
          labelStyle: TextStyle(color: AppColor.blue),
        ),
      ),
    );
  }
}
