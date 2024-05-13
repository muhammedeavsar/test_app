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
    double deviceHeight = MediaQuery
        .of(context)
        .size
        .height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white70,
          body: Column(
            children: [
              Container(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40.0),
                        bottomRight: Radius.circular(40.0),
                      ),
                      child: Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height / 3,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.0),
                            BlendMode.srcOver,
                          ),
                          child: Image.asset(
                            'assets/image/recipe_image.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                          },
                        ),
                        ElevatedButton(
                          onPressed: () {
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueGrey,
                          ),
                          child: Text(
                            'Kahvaltı',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.share),
                          onPressed: () {
                          },
                        ),
                        IconButton(
                          icon: _isLiked ? Icon(Icons.favorite, color: Colors.grey) : Icon(Icons.favorite_border),
                          onPressed: () {
                            setState(() {
                              _isLiked = !_isLiked;
                            });
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
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
                                        widget.recipe.title,
                                        style: TextStyle(fontSize: 24.0),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 3.0),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: [
                                          Icon(
                                            Icons.access_time,
                                            size: 20.0,
                                          ),
                                          SizedBox(width: 5.0),
                                          Text(
                                            'Hazırlanma Süresi: ${_selectedServings *
                                                widget.recipe.prepTime} dk',
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
                                                  child: Text('$e kişi',
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
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = 0;
                                });
                              },
                              child: Container(
                                color: _selectedIndex == 0
                                    ? Colors.black
                                    : Colors.transparent,
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Text('İçindekiler', style: TextStyle(
                                        color: _selectedIndex == 0 ? Colors
                                            .white : Colors.black)),
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
                                color: _selectedIndex == 1
                                    ? Colors.black
                                    : Colors.transparent,
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Text('Yemek Tarifi', style: TextStyle(
                                        color: _selectedIndex == 1 ? Colors
                                            .white : Colors.black)),
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
                                color: _selectedIndex == 2
                                    ? Colors.black
                                    : Colors.transparent,
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Text('Video', style: TextStyle(
                                        color: _selectedIndex == 2 ? Colors
                                            .white : Colors.black)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      if (_selectedIndex == 0) // İçindekiler seçiliyse
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
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
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
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
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}


