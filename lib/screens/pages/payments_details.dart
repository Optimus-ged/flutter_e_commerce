import 'package:e_commerce/exports/all_exports.dart';
import 'package:e_commerce/utils/app_theme.dart';
import 'package:flutter/material.dart';

class PaymentsDetails extends StatelessWidget {
  const PaymentsDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              height: screen.height * .45,
              width: screen.width,
              child: Stack(
                children: [
                  BackwardButton(color: AppTheme.blueColor),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: screen.height * .55,
              width: screen.width,
              decoration: BoxDecoration(
                color: AppTheme.blueColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(60),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 20, bottom: 10),
                    child: Text(
                      "designation",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white54,
                        fontSize: 19,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: SizedBox(
                      width: 72,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    height: screen.height * .27,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            "aPropos",
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 15,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Center(
                    child: Text(
                      "Prix : pu\$",
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 17,
                        height: 1.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(height: 20)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
