import 'package:e_commerce/model/enterprise/enterprise.dart';
import 'package:flutter/material.dart';
import 'custom_cached_img.dart';
import 'shared_index.dart';

class EnterpriseItem extends StatelessWidget {
  final Enterprise enterprise;
  const EnterpriseItem({Key key, this.enterprise}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => EnterpriseDetail(
              enterprise: enterprise,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: CustomCashedImage(
                      imageUrl: "$upload/${enterprise.photo}",
                      screen: MediaQuery.of(context).size,
                      isHomePage: true,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  child: Text(
                    "${enterprise.description} ",
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
