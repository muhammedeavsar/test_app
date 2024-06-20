import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:test_app/constants/color.dart';
import 'package:test_app/main.dart';

void main(){
runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
    home: FoodsPage(
      food: Food(
        title: 'Egg',
        prepTime: 1,
        numServes: 2,
        healthBenefits: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Eggs are a very good source of inexpensive, high-quality protein. ',
                  style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 16),
                ),
                TextSpan(
                  text: 'More than half the protein of an egg is found in the egg white, along with vitamin B2 ',
                  style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 16),
                ),
                TextSpan(
                  text: 'and lower amounts of fat than the yolk. ',
                  style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 16),
                ),
                TextSpan(
                  text: 'Eggs are rich sources of selenium, vitamin D, B6, B12, ',
                  style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 16),
                ),
                TextSpan(
                  text: 'and minerals such as zinc, iron, and copper.',
                  style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    )
));
}
class Food {
  final String title;
  final int prepTime;
  final int numServes;
  final List<RichText> healthBenefits;
  Food({
    required this.title,
    required this.prepTime,
    required this.numServes,
    required this.healthBenefits,

});
}

class FoodsPage extends StatefulWidget{
  final Food food;
  FoodsPage({required this.food});
  @override
  _FoodsPageState createState() => _FoodsPageState();
}
class DashedLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedLinePainter(),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    // Define the gap and dash pattern
    double dashWidth = 5;
    double dashSpace = 3;

    // Draw dashed line
    double startY = size.height / 2;
    double endX = size.width;

    for (double i = 0; i < endX; i += dashWidth + dashSpace) {
      canvas.drawLine(
        Offset(i, startY),
        Offset(i + dashWidth, startY),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
class _FoodsPageState extends State<FoodsPage> {
  int _selectedServings = 1;
  int _selectedIndex = 0;
  bool _isLiked = false;
  late List<RichText> healtBenefits;
  @override
  Widget build(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = (screenWidth - (4 * 10)) / 3;
    return SafeArea(
        child: Scaffold(
          backgroundColor: HexColor(backgroundColor),
          body: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4, // Ekran yüksekliğinin %40'ı
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                     children: [
                       Positioned(
                         child: ClipRRect(
                           borderRadius: BorderRadius.only(
                             bottomLeft: Radius.circular(40.0),
                             bottomRight: Radius.circular(40.0),
                           ),
                           child: ColorFiltered(
                             colorFilter: ColorFilter.mode(
                               Colors.black.withOpacity(0.0),
                               BlendMode.srcOver,
                             ),
                             child: Image.asset(
                               'assets/image/egg.jpeg',
                               fit: BoxFit.cover,
                               height: MediaQuery.of(context).size.height * 0.35,
                               width: MediaQuery.of(context).size.width,
                             ),
                           ),
                         ),
                       ),
                       Positioned(
                         left: 10.0,
                         right: 10.0,
                         bottom: 0.0,
                         child: Container(
                           height: 90,
                           child: Padding(
                             padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                             child: Column(
                               children: [
                                 Card(
                                   margin: EdgeInsets.symmetric(horizontal: 10.0),
                                   shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(20.0),
                                   ),
                                   child: Padding(
                                     padding: EdgeInsets.all(0.0),
                                     child: ClipRRect(
                                       borderRadius: BorderRadius.circular(10.0),
                                       child: Column(
                                         crossAxisAlignment: CrossAxisAlignment.stretch,
                                         children: [
                                           SizedBox(height: 0.0),
                                           Container(
                                             height: 90,
                                             color: Colors.white,
                                             child: Column(
                                               children: [
                                                 SizedBox(height: 3.0),
                                                 Text(
                                                   widget.food.title,
                                                   style: TextStyle(
                                                     fontSize: 24.0,
                                                     fontWeight: FontWeight.bold,
                                                   ),
                                                   textAlign: TextAlign.center,
                                                 ),
                                                 SizedBox(height: 3.0),
                                                 Row(
                                                   mainAxisAlignment: MainAxisAlignment.center,
                                                   children: [
                                                     Icon(
                                                       CupertinoIcons.time,
                                                       size: 20.0,
                                                     ),
                                                     SizedBox(width: 5.0),
                                                     Text(
                                                       '${_selectedServings * widget.food.prepTime} min',
                                                       style: TextStyle(fontSize: 15.0),
                                                     ),
                                                     SizedBox(width: 20.0),
                                                     Icon(
                                                       Icons.group,
                                                       size: 20.0,
                                                     ),
                                                     SizedBox(width: 5.0),
                                                     DropdownButton<int>(
                                                       value: _selectedServings,
                                                       items: List.generate(
                                                           10, (index) => index + 1)
                                                           .map((e) =>
                                                           DropdownMenuItem<int>(
                                                             value: e,
                                                             child: Text('$e Serves',
                                                                 style: TextStyle(
                                                                     fontSize: 15.0)),
                                                           ))
                                                           .toList(),
                                                       onChanged: (value) {
                                                         setState(() {
                                                           _selectedServings = value!;
                                                         });
                                                       },
                                                     ),
                                                   ],
                                                 ),
                                               ],
                                             ),
                                           ),
                                         ],
                                       ),
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         ),
                       ),
                       Positioned(
                         top: 10.0,
                         left: 10.0,
                         right: 10.0,
                         child: Row(
                           children: [
                             IconButton(
                               icon: Icon(CupertinoIcons.back),
                               color: Colors.white,
                               onPressed: () {},
                             ),
                             ElevatedButton(
                               onPressed: () {},
                               style: ElevatedButton.styleFrom(
                                 backgroundColor: Colors.blueGrey,
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(10),
                                 ),
                               ),
                               child: Text(
                                 'Breakfast',
                                 style: TextStyle(
                                   color: Colors.white,
                                 ),
                               ),
                             ),
                             Spacer(),
                             IconButton(
                               icon: Icon(
                                 CupertinoIcons.arrowshape_turn_up_right,
                                 color: Colors.white,
                               ),
                               onPressed: () {},
                             ),
                             IconButton(
                               icon: _isLiked
                                   ? Icon(CupertinoIcons.heart_solid, color: Colors.white)
                                   : Icon(CupertinoIcons.heart, color: Colors.white),
                               onPressed: () {
                                 setState(() {
                                   _isLiked = !_isLiked;
                                 });
                               },
                             ),
                           ],
                         ),
                       ),
                     ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 400,
                    height: 220,
                    child: Column(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Positioned(
                                top: 0,
                                left: 20,
                                right: 20,
                                child: Container(
                                  width: 400,
                                  height: 40,
                                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0),
                                    ),
                                  ),
                                  child: Text(
                                    'Health Benefits',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 26,
                                left: 20,
                                right: 20,
                                bottom: 0,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10.0),
                                      bottomRight: Radius.circular(10.0),
                                    ),
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          children: List.generate(
                                            widget.food.healthBenefits.length,
                                                (index) => ListTile(
                                              title: widget.food.healthBenefits[index],
                                            ),
                                          ),
                                        ),
                                      ],
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
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0), // Added horizontal padding
                    child: Container(
                      width: 400,
                      height: 110,
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 10,
                                    left: 10,
                                    child: Row(
                                      children: [
                                        Icon(Icons.add_circle),
                                        SizedBox(width: 10),
                                        Text(
                                          'Add all ingredients to cart',
                                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 45,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                                      child: CustomPaint(painter: DashedLinePainter(),),
                                    ),
                                  ),
                                  Positioned(
                                    top: 60,
                                    left: 20,
                                    child: Text(
                                      '1 Egg',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
    );
  }
}