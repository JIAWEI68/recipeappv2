import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/grid_views/recipes_grid_view.dart';
import 'package:recipes_app/lists/recipe_list.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    RecipeList recipeList = Provider.of<RecipeList>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextField(
                  onChanged: (value) {
                    //to set the search string in the download list to the value of the text field
                    //set a text field where it gets the value and sets it to searchString which is in recipeList
                    setState(() {
                      recipeList.searchString = value.toLowerCase();
                    });
                  },
                  decoration: InputDecoration(
                      labelText: "Search", suffixIcon: Icon(Icons.search)),
                ),
              ),
              Padding(
                //set a space between the search text and the grid view
                padding: EdgeInsets.only(top: 10.0),
                child: Container(
                  padding: EdgeInsets.only(),
                  height: 537.0009,
                  width: 350,
                  //set the grid view as the widget for the screen
                  child: RecipesGridView(),
                ),
              )
            ]),
      ),
    );
  }
}
