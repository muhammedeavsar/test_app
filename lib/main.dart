import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: IngredientsPage(
      recipe: Recipe(
        title: 'Egg Bread',
        prepTime: 10,
        numServes: 1,
        ingredients: [
          Ingredient(numIngredient: 3, name: 'Egg'),
          Ingredient(numIngredient: 2, name: 'Bread Slice'),
          Ingredient(numIngredient: 1, name: 'Tablespoon of Butter '),
          Ingredient(numIngredient: 1, name: 'Handful of Chopped Parsley'),
          Ingredient(numIngredient: 1, name: 'Clove of Garlic'),
        ],
        recipeSteps: [
          'Break the eggs into a bowl and beat them,',
          'Dip the bread slices in the egg and soak.',
          'Melt the butter in a skillet and fry the bread slices.',
          'Put the toasted bread slices on a serving plate.',
          'Sprinkle with chopped parsley and grated garlic and serve.',
        ],
        videoUrls: [
        'How to Make Egg Bread for Breakfast?'
        'Tips and Tricks The sliced bread should be neither too thin nor too thick. If you slice the bread too thickly, it may become doughy inside. If the oil is well heated, the bread will absorb less oil.',
        ],
      ),
    ),
  ));
}

class Ingredient {
  final int numIngredient;
  final String name;

  Ingredient({required this.numIngredient, required this.name});
}

class Recipe {
  final String title;
  final int prepTime;
  final int numServes;
  final List<Ingredient> ingredients;
  final List<String> recipeSteps;
  final List<String> videoUrls;


  Recipe({
    required this.title,
    required this.prepTime,
    required this.numServes,
    required this.ingredients,
    required this.recipeSteps,
    required this.videoUrls,
  });
}

class IngredientsPage extends StatefulWidget {
  final Recipe recipe;

  IngredientsPage({required this.recipe});

  @override
  _IngredientsPageState createState() => _IngredientsPageState();
}

class _IngredientsPageState extends State<IngredientsPage> {
  int _selectedServings = 1;
  int _selectedIndex = 0;
  bool _isLiked = false;

  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = (screenWidth - (4 * 10)) / 3;
    double deviceHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white70,
          body: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 300,
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
                                'assets/image/recipe_image.jpg',
                                fit: BoxFit.cover,
                                height: 270,
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
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Icon(
                                                        Icons.access_time,
                                                        size: 20.0,
                                                      ),
                                                      SizedBox(width: 5.0),
                                                      Text(
                                                        '${_selectedServings * widget.recipe.prepTime} min',
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
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_back),
                              onPressed: () {},
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blueGrey,
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
                              icon: Icon(Icons.share),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: _isLiked
                                  ? Icon(Icons.favorite, color: Colors.grey)
                                  : Icon(Icons.favorite_border),
                              onPressed: () {
                                setState(() {
                                  _isLiked = !_isLiked;
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
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
                                      _pageController.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.ease);
                                    });
                                  },
                                  child: Container(
                                    width: containerWidth,
                                    decoration: BoxDecoration(
                                      color: _selectedIndex == 0 ? Colors.black : Colors.transparent,
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Center(
                                      child: Text(
                                        'Ingredients',
                                        style: TextStyle(color: _selectedIndex == 0 ? Colors.white : Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _pageController.animateToPage(1, duration: Duration(milliseconds: 500), curve: Curves.ease);
                                    });
                                  },
                                  child: Container(
                                    width: containerWidth,
                                    decoration: BoxDecoration(
                                      color: _selectedIndex == 1 ? Colors.black : Colors.transparent,
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Center(
                                      child: Text(
                                        'Instructions',
                                        style: TextStyle(color: _selectedIndex == 1 ? Colors.white : Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _pageController.animateToPage(2, duration: Duration(milliseconds: 500), curve: Curves.ease);
                                    });
                                  },
                                  child: Container(
                                    width: containerWidth,
                                    decoration: BoxDecoration(
                                      color: _selectedIndex == 2 ? Colors.black : Colors.transparent,
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Center(
                                      child: Text(
                                        'Video',
                                        style: TextStyle(color: _selectedIndex == 2 ? Colors.white : Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Expanded(
                            child: PageView(
                              controller: _pageController,
                              onPageChanged: (index) {
                                setState(() {
                                  _selectedIndex = index;
                                });
                              },
                              children: [
                                // Ingredients Page
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: ListView.builder(
                                    itemCount: widget.recipe.ingredients.length,
                                    itemBuilder: (context, index) {
                                      final ingredient = widget.recipe.ingredients[index];
                                      final totalIngredientCount = ingredient.numIngredient * _selectedServings;
                                      final formattedName = '$totalIngredientCount ${ingredient.name[0].toUpperCase()}${ingredient.name.substring(1)}';
                                      return ListTile(
                                        title: Text(formattedName),
                                      );
                                    },
                                  ),
                                ),
                                // Instructions Page
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: ListView.builder(
                                    itemCount: widget.recipe.recipeSteps.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        title: Text(widget.recipe.recipeSteps[index]),
                                      );
                                    },
                                  ),
                                ),
                                // Video Page
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text('Egg Bread Recipe Video'),
                                      ),
                                      YoutubePlayer(
                                        controller: YoutubePlayerController(
                                          initialVideoId: YoutubePlayer.convertUrlToId(
                                            'https://www.youtube.com/watch?v=u5pR11WjXt8',
                                          )!,
                                          flags: YoutubePlayerFlags(
                                            autoPlay: false,
                                            mute: false,
                                          ),
                                        ),
                                        showVideoProgressIndicator: true,
                                        progressIndicatorColor: Colors.amber,
                                        progressColors: ProgressBarColors(
                                          playedColor: Colors.amber,
                                          handleColor: Colors.amberAccent,
                                        ),
                                        onReady: () {
                                          print('Player is ready.');
                                        },
                                        onEnded: (data) {
                                          print('Video has ended.');
                                        },
                                      ),
                                      Expanded(
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: widget.recipe.videoUrls.length,
                                          itemBuilder: (context, index) {
                                            return ListTile(
                                              title: Text(widget.recipe.videoUrls[index]),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
      ),
    );
  }
}

