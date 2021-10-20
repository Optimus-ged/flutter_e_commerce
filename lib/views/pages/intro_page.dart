
import 'package:e_commerce/views/shared/shared_index.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(flex: 4, child: Container()),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.only(left: 40, right: 40, bottom: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTransition(
                          beginOffset: Offset(-0.2, 0),
                          duration: 500,
                          child: Text(
                            'Get started',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ),
                        SizedBox(height: 5),
                        CustomTransition(
                          beginOffset: Offset(0, 0.03),
                          duration: 500,
                          child: Text(
                            'Millions of  people use to turn their ideas into reality',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTransition(
                          beginOffset: Offset(-0.2, 0),
                          duration: 500,
                          child: Text(
                            'Skype now',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ),
                        Material(
                          elevation: 4,
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            decoration: BoxDecoration(
                              color: CustomTheme.redColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 7,
                              ),
                              child: InkWell(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ),
                                ),
                                child: Text(
                                  'Next',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
