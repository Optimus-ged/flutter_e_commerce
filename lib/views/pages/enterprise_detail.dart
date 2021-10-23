import 'package:e_commerce/model/enterprise/enterprise.dart';
import 'package:e_commerce/views/shared/custom_cached_img.dart';
import 'package:e_commerce/views/shared/shared_index.dart';

//FocusScope.of(context).unfocus()
//FocusScope.of(context).requestFocus(FocusNode());

class EnterpriseDetail extends StatefulWidget {
  final Enterprise enterprise;
  const EnterpriseDetail({Key key, @required this.enterprise})
      : super(key: key);

  @override
  _EnterpriseDetailState createState() => _EnterpriseDetailState();
}

class _EnterpriseDetailState extends State<EnterpriseDetail> {
  TextEditingController _montantController;
  

  


 

  bool isByMobile = false;
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: screen.height,
        margin: EdgeInsets.only(top: 24),
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Retour',
                          style: TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: CustomCashedImage(
                          imageUrl: "$upload/${widget.enterprise.photo}",
                          screen: MediaQuery.of(context).size,
                          isHomePage: true,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    child: Text("${widget.enterprise.description} "),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.only(left: 30, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'selectionner le mode\nde paiement que vous souhaitez',
                          style: TextStyle(fontSize: 10),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.only(right: 20),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isByMobile = false;
                                  });
                                },
                                child: Material(
                                  elevation: 4,
                                  borderRadius: BorderRadius.circular(25),
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: !isByMobile
                                          ? CustomTheme.redColor
                                          : CustomTheme.greyColor,
                                    ),
                                    child: Icon(
                                      Icons.bookmarks_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isByMobile = true;
                                  });
                                },
                                child: Material(
                                  elevation: 4,
                                  borderRadius: BorderRadius.circular(25),
                                  child: Container(
                                      alignment: Alignment.center,
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: !isByMobile
                                            ? CustomTheme.greyColor
                                            : CustomTheme.redColor,
                                      ),
                                      child: Icon(
                                        Icons.payments_sharp,
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    print('aaaaaaaaaaaaaaaaaa');
                                  },
                                  child: Container(
                                    height: 50,
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.only(left: 15, right: 15),
                                    decoration: BoxDecoration(
                                      color: CustomTheme.orangeColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: TextField(
                                      controller: _montantController,
                                      keyboardType: TextInputType.number,
                                      style:
                                          TextStyle(fontWeight: FontWeight.w600),
                                      decoration: InputDecoration.collapsed(
                                        hintText: 'montant',
                                        hintStyle: TextStyle(
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: 40,
              right: 40,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'A payer : 10000Fc',
                    style: TextStyle(
                        color: Colors.black38,
                        decoration: TextDecoration.underline,
                        fontSize: 15),
                  ),
                  SizedBox(height: 8),
                  Material(
                    elevation: 4,
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      height: 50,
                      width: screen.width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: CustomTheme.redColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Payer impot',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
