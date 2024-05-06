import 'package:flutter/material.dart';

void main() {
  runApp(IngredientsPage(
    recipe: Recipe(title: 'Yumurtalı Ekmek', prepTime: 10, numServes: 1),
  ));
}

class Recipe {
  final String title;
  final int prepTime;
  final int numServes;

  Recipe({required this.title, required this.prepTime, required this.numServes});
}

class IngredientsPage extends StatefulWidget {
  final Recipe recipe;

  IngredientsPage({required this.recipe});

  @override
  _IngredientsPageState createState() => _IngredientsPageState();
}

class _IngredientsPageState extends State<IngredientsPage> {
  int _selectedServings = 1;
  int _selectedIndex = -1;
  bool _isLiked = false;


  final List<String> ingredients = [
    '3 adet yumurta',
    '2 dilim ekmek',
    'Tuz, karabiber',
    '1 yemek kaşığı tereyağı',
    'Bir avuç doğranmış maydanoz',
    'Bir diş sarımsak',
  ];

  final List<String> recipeSteps = [
    'Yumurtaları bir kaseye kırın ve çırpın.',
    'Ekmek dilimlerini yumurtaya batırın ve ıslatın.',
    'Tavada tereyağı eritin ve ekmek dilimlerini kızartın.',
    'Kızarmış ekmekleri servis tabağına alın.',
    'Üzerine doğranmış maydanoz ve rendelenmiş sarımsak serpip servis yapın.',
  ];

  final List<String> videoUrls = [
    'https://www.youtube.com/watch?v=u5pR11WjXt8',
  ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 325,
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.0), BlendMode.srcOver),
                child: Image.asset(
                  'assets/image/recipe_image.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back, color:Colors.white),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            'Kahvaltı',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color:Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: _isLiked ? Icon(Icons.favorite, color:Colors.white) : Icon(Icons.favorite_border, color:Colors.white),
                            color: _isLiked ? Colors.white : null,
                            onPressed: () {
                              setState(() {
                                _isLiked = !_isLiked;
                              });
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.share, color:Colors.white),
                            onPressed: () {
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 175.0),
                  Container(
                    height: 130,
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(height: 20.0),
                        Text(
                          widget.recipe.title,
                          style: TextStyle(fontSize: 24.0),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 20.0,
                            ),
                            SizedBox(width: 5.0),
                            Text(
                              'Hazırlanma Süresi: ${_selectedServings * widget.recipe.prepTime} dk',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            SizedBox(width: 20.0),
                            Icon(
                              Icons.group,
                              size: 20.0,
                            ),
                            SizedBox(width: 5.0),
                            DropdownButton<int>(
                              value: _selectedServings,
                              items: List.generate(10, (index) => index + 1)
                                  .map((e) => DropdownMenuItem<int>(
                                value: e,
                                child: Text('$e kişi'),
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
                  SizedBox(height: 5.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 0;
                          });
                        },
                        child: Container(
                          color: _selectedIndex == 0 ? Colors.black : Colors.transparent,
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Icon(Icons.menu_book, color: _selectedIndex == 0 ? Colors.white : Colors.black),
                              Text('İçindekiler', style: TextStyle(color: _selectedIndex == 0 ? Colors.white : Colors.black)),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 1;
                          });
                        },
                        child: Container(
                          color: _selectedIndex == 1 ? Colors.black : Colors.transparent,
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Icon(Icons.restaurant, color: _selectedIndex == 1 ? Colors.white : Colors.black),
                              Text('Yemek Tarifi', style: TextStyle(color: _selectedIndex == 1 ? Colors.white : Colors.black)),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 2;
                          });
                        },
                        child: Container(
                          color: _selectedIndex == 2 ? Colors.black : Colors.transparent,
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Icon(Icons.video_library, color: _selectedIndex == 2 ? Colors.white : Colors.black),
                              Text('Video', style: TextStyle(color: _selectedIndex == 2 ? Colors.white : Colors.black)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (_selectedIndex == 0) // İçindekiler seçiliyse
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(20.0),
                        child: ListView.builder(
                          itemCount: ingredients.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(ingredients[index]),
                            );
                          },
                        ),
                      ),
                    ),
                  if (_selectedIndex == 1) // Yemek tarifi seçiliyse
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(20.0),
                        child: ListView.builder(
                          itemCount: recipeSteps.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(recipeSteps[index]),
                            );
                          },
                        ),
                      ),
                    ),
                  if (_selectedIndex == 2) // Video seçiliyse
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(20.0),
                        child: Center(
                          child: Image.asset(
                            'assets/image/yumurtalı_ekmek.jpg',
                            fit: BoxFit.cover,
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
