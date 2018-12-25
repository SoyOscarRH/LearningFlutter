import 'package:flutter/material.dart';



class PrincipalScreen extends StatelessWidget {

  final List<Widget> recipes;
  final onAdd;


  PrincipalScreen({@required this.recipes, @required this.onAdd})
      : assert(recipes != null);


  @override
  Widget build(BuildContext context) {

    var principalAppBar = AppBar(
      centerTitle: true,
      backgroundColor: Color(0xFF4d5784),
      elevation: 1.2,
      title: Text(
        "Reciper",
        style: TextStyle(
          fontSize: 22.0,
          color: Colors.blueGrey.shade50,
          fontWeight: FontWeight.w400,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.account_circle,
            color: Colors.white,
          ),
          onPressed: () => debugPrint("See Profile"),
        ),
      ]
    );

    var addOtherButton = FloatingActionButton(
      backgroundColor: Color(0xffff748a),
      child: Icon(
        Icons.add,
        color: Color(0xfffff2e5),
      ),
      onPressed: () => debugPrint("Add other"),
    );



    return Scaffold(
      appBar: principalAppBar,
      floatingActionButton: addOtherButton,
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(5.0),
        children: recipes,
      )
    );
  }
}