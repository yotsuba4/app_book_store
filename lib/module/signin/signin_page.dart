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

class SignInFormWidget extends StatefulWidget {
  @override
  _SignInFormWidgetState createState() => _SignInFormWidgetState();
}

class _SignInFormWidgetState extends State<SignInFormWidget> {
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
              _buildPhoneField(bloc),
              _buildPassField(bloc),
              _buildSignInButton(bloc),
              _buildFooter(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSignInButton(SignInBloc bloc) {
    return StreamProvider<bool>.value(
      initialData: false,
      value: bloc.btnStream,
      child: Consumer<bool>(
        builder: (context, enable, child) => NormalButton(
          title: 'Sign In',
          onPressed: enable
              ? () {
                  bloc.event.add(
                    SignInEvent(
                      phone: _txtPhoneController.text,
                      pass: _txtPassController.text,
                    ),
                  );
                }
              : null,
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/sign-up');
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

  Widget _buildPhoneField(SignInBloc bloc) {
    return StreamProvider<String>.value(
      initialData: null,
      value: bloc.phoneStream,
      child: Consumer<String>(
        builder: (context, msg, child) => Container(
          margin: EdgeInsets.only(
            bottom: 15,
          ),
          child: TextField(
            controller: _txtPhoneController,
            onChanged: (text) {
              bloc.phoneSink.add(text);
            },
            cursorColor: Colors.black,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              icon: Icon(
                Icons.phone,
                color: AppColor.blue,
              ),
              hintText: '0973901737',
              errorText: msg,
              labelText: 'Phone',
              labelStyle: TextStyle(color: AppColor.blue),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPassField(SignInBloc bloc) {
    return StreamProvider<String>.value(
      initialData: null,
      value: bloc.passStream,
      child: Consumer<String>(
        builder: (context, msg, child) => Container(
          margin: EdgeInsets.only(
            bottom: 15,
          ),
          child: TextField(
            controller: _txtPassController,
            onChanged: (text) {
              bloc.passSink.add(text);
            },
            obscureText: true,
            cursorColor: Colors.black,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              icon: Icon(
                Icons.lock,
                color: AppColor.blue,
              ),
              hintText: '123456',
              labelText: 'Password',
              errorText: msg,
              labelStyle: TextStyle(color: AppColor.blue),
            ),
          ),
        ),
      ),
    );
  }
}
