import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: CardDisplayApp()));
}

class CardDisplayApp extends StatelessWidget {
  final List<dynamic> cards = [
    {
      "id": 9,
      "name": "aStark",
      "title": " ",
      "formatted_title": {
        "entities": [
          {
            "text": "Small display card",
            "font_style": "underline",
            "font_family": "met_semi_bold"
          }
        ]
      },
      "formatted_description": {
        "entities": [
          {
            "text": "Arya Stark",
            "font_style": "underline",
            "font_family": "met_regular"
          }
        ]
      },
      "icon_url":
          "https://hok.famapp.co.in/hok-assets/feedMedia/ext/b4827462-93a9-4963-98b9-255942f10530-1734193289680.webp",
      "bg_color": Color(0xFFFBAF03),
    },
    {
      "id": 3,
      "name": "smallCardWithArrow",
      "formatted_title": {
        "entities": [
          {
            "text": "Small card with an arrow",
            "font_style": "underline",
            "font_family": "met_semi_bold"
          }
        ]
      },
      "icon_url":
          "https://hok.famapp.co.in/hok-assets/feedMedia/ext/5435b4ee-a962-4531-95d5-889e4038eece-1734193661283.webp",
      "bg_color": Color(0xFFFBAF03),
    }
  ];

  final bool isScrollable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Card Display Example")),
      body: isScrollable
          ? ListView(
              scrollDirection: Axis.horizontal,
              children: cards.map((card) => buildCard(card)).toList(),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: cards.map((card) => buildCard(card)).toList(),
            ),
    );
  }

  Widget buildCard(dynamic card) {
    return Container(
      width: 160,
      height: 80,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: card['bg_color'],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(card['icon_url']),
          ),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                card['formatted_title']['entities'][0]['text'],
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              ),
              if (card.containsKey('formatted_description'))
                Text(
                  card['formatted_description']['entities'][0]['text'],
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
