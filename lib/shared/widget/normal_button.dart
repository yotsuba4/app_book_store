import 'package:app_book_store/shared/app_color.dart';
import 'package:app_book_store/shared/style/btn_style.dart';
import 'package:flutter/material.dart';

class NormalButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  NormalButton({@required this.onPressed,@required this.title});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        width: 200,
        height: 45,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: BtnStyle.normal(),
        ),
        style: ElevatedButton.styleFrom(
          primary: AppColor.yellow,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(4.0)),
        ),
      ),
    );
  }
}
    /* return ButtonTheme(
      minWidth: 200,
      height: 45,
      child: RaisedButton(
        onPressed: onPressed,
        color: AppColor.yellow,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(4.0)),
        child: Text(
          'Sign In',
          style: BtnStyle.normal(),
        ),
      ),
    );*/

