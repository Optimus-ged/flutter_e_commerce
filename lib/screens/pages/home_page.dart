import 'package:e_commerce/exports/all_exports.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppTheme.whiteColor,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              // shadowColor: AppTheme.blueColor,
              floating: true,
              automaticallyImplyLeading: false,
              expandedHeight: 120,
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
                // color: Colors.white,
                child: GridView.builder(
                  padding: EdgeInsets.only(
                    bottom: 70,
                    top: 10,
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
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        // color: Colors.black38,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 0.2, color: Colors.black12),
                      ),
                      child: Text("$index"),
                    );
                  },
                ),
              ),
            )
          ],
        ),
        floatingActionButton: Material(
          elevation: 20,
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(35),
          ),
          child: Container(
            height: 60,
            color: Colors.transparent,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // bottomNavigationBar: Material(
        //   color: Colors.amber,
        //   elevation: 20,
        //   borderRadius: BorderRadius.vertical(
        //     top: Radius.circular(35),
        //   ),
        //   child: Container(
        //     height: 60,
        //     color: Colors.transparent,
        //   ),
        // ),
      ),
    );
  }

  // Building text field
  Widget _buildTextField({BuildContext context}) {
    var screen = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0.1, color: AppTheme.blueColor),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.search, color: AppTheme.blueColor),
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
    );
  }

  // Building custom outline borders
  OutlineInputBorder _outlineBorder({Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      gapPadding: 0,
      borderSide: BorderSide(
        color: color,
        width: 1,
      ),
    );
  }
}
