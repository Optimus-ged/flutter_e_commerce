import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final Color color;
  final String hint;
  final bool isPassword = false;
  final bool isLogin = false;
  final VoidCallback onTap;
  final TextEditingController controller;

  const CustomInput(
      {Key key, this.color, this.hint, this.onTap, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: 55,
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 15, right: !isPassword ? 15 : 0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                obscureText: isLogin,
                keyboardType: TextInputType.number,
                style: TextStyle(fontWeight: FontWeight.w600),
                decoration: InputDecoration.collapsed(
                  hintText: '$hint',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            if (isPassword)
              InkWell(
                onTap: onTap,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      Icons.remove_red_eye_sharp,
                      color: Colors.grey,
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
