import 'package:flutter/material.dart';

class Login extends StatefulWidget {
	@override
	createState () => _LoginState();
}

class _LoginState extends State<Login> {
	@override



	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("Login"),
				centerTitle: true,
			),
			body: Container(
				alignment: Alignment.topCenter,
				child: ListView(
					children: <Widget>[
						Container(
							padding: EdgeInsets.all(30.0),
						),
						Image.asset(
							"images/perfil.png",
							color: Colors.blueGrey.shade100,
							height: 50.0,
							width: 50.0,
						),
						Container(
							padding: EdgeInsets.all(30.0),
						),
						Container(
							child: Card(
								elevation: 2.0,
								margin: EdgeInsets.all(10.0),
  								child: Container(
									padding: EdgeInsets.all(20.0),
									child: 	Column(
										children: <Widget>[
											TextField(
												decoration: InputDecoration(
													hintText: "Name",
													icon: Icon(Icons.person),
												)
											),
											TextField(
												decoration: InputDecoration(
													hintText: "Password",
													icon: Icon(Icons.person),
												)
											),
											Center(
												child: Row(
													children: <Widget>[
														RaisedButton(
															onPressed: () => {},
															color: Colors.red.shade300,
															child: Text(
																"Login", 
																style: TextStyle(
																	color: Colors.white,
																)
															),
														),
													],
												)
											),
										],
									),
								),
							),
						),
					],
				),
			),
		);
	}
}