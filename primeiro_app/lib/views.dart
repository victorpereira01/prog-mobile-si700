import 'package:flutter/material.dart';

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

Widget generateAlexandreView() {
  return Center(
      child: Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 15),
        child: Text(
          "Alexandre Queiroz - 212344",
          style: TextStyle(
              fontSize: 23, fontWeight: FontWeight.bold, color: Colors.indigo),
        ),
      ),
      Text(
        "TADS - 6º semestre",
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo),
      ),
      Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.indigo, width: 5)),
          margin: EdgeInsets.only(right: 80, left: 80, top: 10),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Image.asset('assets/images/alexandre.jpg'))),
      Padding(
          padding: EdgeInsets.all(20),
          child: Text(
              "No momento não estou estágiando nem trabalhando, mas minha principal área de "
              "atuação é a de Suporte que foi a área que eu estagiei para concluir meu técnico. "
              "Eu não sou o maior fã de programação, mas procuro saber um pouco sobre diversas "
              "linguagens, para o caso de eu eventualmente ter uma ideia que eu mesmo queira "
              "transformar em um software. No meu tempo livre, o que eu mais gosto de fazer é "
              "jogar, ouvir música e antes da quarentena, gostava de caminhar.",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo)))
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
            "APP DE CONTROLE FINANCEIRO",
            style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(right: 20, left: 20, top: 15),
            child: Column(
              children: [
                Text(
                  "App de controle financeiro para gerenciar receitas e gastos",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/main.jpg', width: 185),
                      Image.asset('assets/images/list.jpg', width: 185),
                    ],
                  ),
                )
              ],
            ))
      ],
    ),
  );
}
