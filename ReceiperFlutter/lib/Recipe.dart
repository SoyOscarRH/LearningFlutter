import 'package:flutter/material.dart';

class RecipeInfo extends StatelessWidget {
  final String type;
  final String quantity;
  final String unit;

  RecipeInfo(
      {Key key,
        @required this.type,
        @required this.quantity,
        @required this.unit})
      : assert(type != null),
        assert(unit != null),
        assert(quantity != null);



  final Map<String, String> conversion = {
    "FAT":"Fat",
    "CHOCDF": "Carbohidrate",
    "SUGAR": "Sugars",
    "PROCNT": "Protein"
  };


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Text(
            "${conversion[type]} $quantity$unit",
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 13.0,
            ),
          ),
        ],
      ),
    );
  }

}


class RecipeWidget extends StatelessWidget {
  final String nameOfRecipe;
  final String imageURL;
  final List<List<String>> data;
  final onTap;


  RecipeWidget(
      {Key key,
      @required this.nameOfRecipe,
      @required this.imageURL,
      @required this.data,
      this.onTap})
      : assert(nameOfRecipe != null),
        assert(data != null),
        assert(imageURL != null);

  Widget recipeImage() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16.0),
      alignment: FractionalOffset.centerLeft,
      height: 80.0,
      width: 80.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(imageURL),
        ),
      ),
    );
  }


  Widget recipeCard() {
    return Container(
      height: 124.0,
      margin: EdgeInsets.only(left: 46.0),
      decoration: BoxDecoration(
        color: Colors.white70,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.0,
            offset: Offset(0.0, 10.0),
          )
        ],
      ),
      child: Container(
        margin: EdgeInsets.only(left: 50.0, top: 26.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  nameOfRecipe,
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 0.0, top: 26.0),
              height: 40.0,
              child: ListView.builder(
                itemCount: data.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return RecipeInfo(
                    type: data[index][0],
                    quantity: data[index][1],
                    unit: data[index][2],
                  );
                },
              ),
            ),
          ],
        )
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        child: InkWell(
          borderRadius: BorderRadius.circular(30.0),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 24.0,
              ),
              child: Stack(
                children: <Widget>[
                  recipeCard(),
                  recipeImage(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
