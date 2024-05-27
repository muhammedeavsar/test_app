import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
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
        recipeSteps : [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Step 1 ',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
                ),
                TextSpan(
                  text: '\n',
                ),
                TextSpan(
                  text: 'Break the eggs into a bowl and beat them.',
                  style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 16),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Step 2 ',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
                ),
                TextSpan(
                  text: '\n',
                ),
                TextSpan(
                  text: 'Dip the bread slices in the egg and soak.',
                  style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 16),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Step 3 ',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
                ),
                TextSpan(
                  text: '\n',
                ),
                TextSpan(
                  text: 'Melt the butter in a skillet and fry the bread slices.',
                  style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 16),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Step 4 ',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
                ),
                TextSpan(
                  text: '\n',
                ),
                TextSpan(
                  text: 'Put the toasted bread slices on a serving plate.',
                  style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 16),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Step 5 ',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 16),
                ),
                TextSpan(
                  text: '\n',
                ),
                TextSpan(
                  text: 'Sprinkle with chopped parsley and grated garlic and serve.',
                  style: TextStyle(fontWeight: FontWeight.normal, color: Colors.black, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
        videoUrls: [
          'https://www.youtube.com/watch?v=u5pR11WjXt8',
        ],
        videoAbout: [
          'Egg Bread Recipe Video',
          'How to Make Egg Bread for Breakfast?',
          'Tips and Tricks: The sliced bread should be neither too thin nor too thick. If you slice the bread too thickly, it may become doughy inside. If the oil is well heated, the bread will absorb less oil.',
        ],
        healthBenefits: [
          'Eggs are a great source of protein. Parsley is rich in vitamins A, C, and K. Garlic can boost the immune system.',
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
  final List<RichText> recipeSteps;
  final List<String> videoUrls;
  final List<String> videoAbout;
  final List<String> healthBenefits;


  Recipe({
    required this.title,
    required this.prepTime,
    required this.numServes,
    required this.ingredients,
    required this.recipeSteps,
    required this.videoUrls,
    required this.videoAbout,
    required this.healthBenefits,
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
  late List<RichText> recipeSteps;

  PageController _pageController = PageController();


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = (screenWidth - (4 * 10)) / 3;
    recipeSteps = widget.recipe.recipeSteps;

    return SafeArea(
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
                                                  widget.recipe.title,
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
                      Positioned(
                        top: 10.0,
                        left: 10.0,
                        right: 10.0,
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(CupertinoIcons.back),
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
                              icon: Icon(CupertinoIcons.arrowshape_turn_up_right),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: _isLiked
                                  ? Icon(CupertinoIcons.heart, color: Colors.grey)
                                  : Icon(CupertinoIcons.heart),
                              onPressed: () {
                                setState(() {
                                  _isLiked = !_isLiked;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 400,
                  height: 90,
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
                                height: 38,
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
                              bottom: 10,
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
                                          widget.recipe.healthBenefits.length,
                                              (index) => ListTile(
                                            title: Text(
                                              widget.recipe.healthBenefits[index],
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
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
                Container(
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
                                    _pageController.jumpToPage(0);
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
                                    _pageController.jumpToPage(1);
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
                                    _pageController.jumpToPage(2);
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
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: List.generate(
                                widget.recipe.ingredients.length,
                                    (index) {
                                  final ingredient = widget.recipe.ingredients[index];
                                  final totalIngredientCount = ingredient.numIngredient * _selectedServings;
                                  final formattedName = '$totalIngredientCount ${ingredient.name[0].toUpperCase()}${ingredient.name.substring(1)}';
                                  return ListTile(
                                    title: Text(formattedName),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        // Instructions Page
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: recipeSteps.map((step) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: step,
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        // Video Page
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20, // You can adjust the font size as needed
                                      color: Colors.black, // You can adjust the color as needed
                                    ),
                                    children: [
                                      TextSpan(
                                        text: widget.recipe.videoAbout.isNotEmpty ? widget.recipe.videoAbout[0] : '', // Assuming videoAbout list is not empty
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10,),
                                YoutubePlayer(
                                  controller: YoutubePlayerController(
                                    initialVideoId: YoutubePlayer.convertUrlToId(
                                      widget.recipe.videoUrls.isNotEmpty ? widget.recipe.videoUrls[0] : '',
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
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: List.generate(
                                      widget.recipe.videoAbout.length,
                                          (index) {
                                        if (index == 0) {
                                          return SizedBox.shrink(); // Skip the first element, as it's already displayed as the title
                                        } else {
                                          return ListTile(
                                            title: Text(widget.recipe.videoAbout[index]),
                                          );
                                        }
                                      },
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
