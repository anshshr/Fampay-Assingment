import 'package:flutter/material.dart';

class Hc5Card extends StatelessWidget {
  final dynamic data;
  final int index;
  const Hc5Card({super.key, this.data, required this.index});

  @override
  Widget build(BuildContext context) {
    bool isScrollable = data[index]['hc_groups'][2]['is_scrollable'];
    List cards = data[index]['hc_groups'][2]['cards'];

    return isScrollable
        ? SizedBox(
            height: MediaQuery.of(context).size.width / cards[0]['bg_image']['aspect_ratio'],
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cards.length,
              itemBuilder: (context, cardIndex) {
                return AspectRatio(
                  aspectRatio: cards[cardIndex]['bg_image']['aspect_ratio'],
                  child: Image.network(cards[cardIndex]['bg_image']['image_url']),
                );
              },
            ),
          )
        : Row(
            children: cards.map<Widget>((card) {
              return Expanded(
                child: AspectRatio(
                  aspectRatio: card['bg_image']['aspect_ratio'],
                  child: Image.network(card['bg_image']['image_url']),
                ),
              );
            }).toList(),
          );
  }
}
