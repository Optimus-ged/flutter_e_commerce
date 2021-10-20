import 'shared_index.dart';

class PageviewIndicator extends StatelessWidget {
  final int curentIndex;
  PageviewIndicator(this.curentIndex);
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Container(
      color: Colors.red,
      height: 30,
      width: screen.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          3,
          (index) => AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: (curentIndex == index) ? 10 : 8,
            width: (curentIndex == index) ? 10 : 8,
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: (curentIndex == index) ? Colors.amber : Colors.grey[200],
            ),
            foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
    );
  }
}
