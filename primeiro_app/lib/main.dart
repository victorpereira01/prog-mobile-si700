import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Primeiro App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DefaultTabController(
        length: 3,
        child: MyFirstApp(),
      ),
    );
  }
}

class MyFirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Primeiro App"),
          bottom: TabBar(tabs: [
            Tab(icon: Icon(Icons.battery_unknown)),
            Tab(icon: Icon(Icons.android)),
            Tab(icon: Icon(Icons.cake))
          ]),
        ),
        body: TabBarView(children: [
          Center(child: generateVictorView()),
          Center(child: Text("TELA 2")),
          Center(child: generateTrabalhoView()),
        ]));
  }
}

Widget generateVictorView() {
  return Center(
      child: Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 15),
        child: Text(
          "Victor Pereira Cordeiro - 206588",
          style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple),
        ),
      ),
      Text(
        "TADS - 6º semestre",
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple),
      ),
      Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.deepPurple, width: 5)),
          margin: EdgeInsets.only(right: 80, left: 80, top: 10),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Image.asset('assets/images/victor.jpg'))),
      Padding(
          padding: EdgeInsets.all(20),
          child: Text(
              "Atualmente trabalho com Desenvolvimento Web, minha principal stack é "
              "Java com Spring no back-end e no front-end quase sempre React e React Native, "
              "tenho pouquíssima experiência com mobile e é a primeira vez que vejo Flutter. No meu tempo "
              "livre gosto de tocar violão e jogar games.",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple)))
    ],
  ));
}

Widget generateTrabalhoView() {
  return Center(
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 15),
          child: Text(
            "TEMA DO APP",
            style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 20, left: 20, top: 10),
          child: Text(
            "Biltong shankle kevin boudin pork chop beef meatloaf chicken pig flank "
            "sirloin buffalo pastrami hamburger brisket. Tail bresaola pig ham, porchetta "
            "drumstick pastrami boudin ribeye. Corned beef jowl pastrami, landjaeger ",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple),
          ),
        )
      ],
    ),
  );
}
