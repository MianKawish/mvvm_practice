import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  Color buttonColor, textColor;
  String buttonText;
  int hight, width;
  bool loading;
  final VoidCallback callBack;
  CustomButton(
      {super.key,
      this.buttonColor = Colors.black,
      this.textColor = Colors.white,
      this.hight = 50,
      this.width = 70,
      this.loading = false,
      required this.buttonText,
      required this.callBack});

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          )
        : InkWell(
            onTap: callBack,
            child: Container(
              height: hight.toDouble(),
              width: width.toDouble(),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: buttonColor,
              ),
              child: Center(
                  child: Text(
                buttonText,
                style: TextStyle(color: textColor),
              )),
            ),
          );
  }
}
