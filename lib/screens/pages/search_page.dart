import 'package:e_commerce/exports/all_exports.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map params = ModalRoute.of(context).settings.arguments;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppTheme.whiteColor,
    ));
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppTheme.whiteColor,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              floating: true,
              automaticallyImplyLeading: false,
              expandedHeight: 100,
              title: Text(
                "${params["hint"]}",
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 15,
                ),
              ),
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [_buildTextField(context: context)],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                child: GridView.builder(
                  padding: EdgeInsets.only(
                    bottom: 10,
                    top: 5,
                    left: 10,
                    right: 10,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      childAspectRatio: 0.7),
                  primary: false,
                  shrinkWrap: true,
                  itemCount: 30,
                  itemBuilder: (context, index) {
                    return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 0.2, color: Colors.black12),
                      ),
                      child: Text("$index"),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Building text field
  _buildTextField({BuildContext context}) {
    var screen = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
      child: Material(
        elevation: 4,
        shadowColor: Colors.black26,
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            // border: Border.all(width: 0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.search,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                ),
                Container(
                  height: 50,
                  width: screen.width * .73,
                  alignment: Alignment.center,
                  // color: Colors.amber,
                  child: TextField(
                    cursorColor: AppTheme.blueColor,
                    style: TextStyle(
                      fontSize: 17,
                      color: AppTheme.blueColor,
                    ),
                    decoration: InputDecoration.collapsed(
                      hintText: "Rechercher ici !",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.withOpacity(0.3),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
