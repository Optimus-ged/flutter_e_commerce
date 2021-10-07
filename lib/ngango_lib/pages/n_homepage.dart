import 'package:flutter/material.dart';

class NHomePage extends StatelessWidget {
  const NHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              child: Container(
                padding: EdgeInsets.only(top: 15, bottom: 15, left: 20),
                color: Color(0xffAA000A),
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black45,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "AGENTS",
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Container(
                    color: Colors.green,
                    child: Row(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle
                          ),
                          // child: Image.network(src),
                        ),
                        SizedBox(width: 10,),
                        Text('nom postnom'),
                        Text('telephone')
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
