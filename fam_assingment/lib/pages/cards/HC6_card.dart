import 'package:fam_assingment/utils/color_convertor.dart';
import 'package:fam_assingment/utils/url_launcher.dart';
import 'package:flutter/material.dart';

class Hc6Card extends StatelessWidget {
  final dynamic data;
  final int index;
  const Hc6Card({
    super.key,
    required this.data,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    bool isScrollable = data[index]['hc_groups'][1]['is_scrollable'];

    return isScrollable
        ? SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                data[index]['hc_groups'][1]['cards'].length,
                (cardIndex) => buildCard(context, cardIndex),
              ),
            ),
          )
        : Row(
            children: List.generate(
              data[index]['hc_groups'][1]['cards'].length,
              (cardIndex) => Expanded(
                child: buildCard(context, cardIndex),
              ),
            ),
          );
  }

  Widget buildCard(BuildContext context, int cardIndex) {
    return GestureDetector(
      onTap: () {
        openWebURL(data[index]['hc_groups'][1]['cards'][cardIndex]['url']);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.08, color: Colors.black),
        ),
        height: 50,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: data[index]['hc_groups'][1]['cards'][cardIndex]['icon']
                      ['aspect_ratio']
                  .toDouble(),
              child: Image.network(
                  data[index]['hc_groups'][1]['cards'][cardIndex]['icon']['image_url']),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              data[index]['hc_groups'][1]['cards'][cardIndex]['formatted_title']
                  ['entities'][0]['text'],
              style: TextStyle(
                color: hexToColor(data[index]['hc_groups'][1]['cards'][cardIndex]
                    ['formatted_title']['entities'][0]['color']),
                fontFamily: data[index]['hc_groups'][1]['cards'][cardIndex]
                    ['formatted_title']['entities'][0]['font_family'],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.arrow_forward_ios,
                    size: data[index]['hc_groups'][1]['cards'][cardIndex]['icon_size']
                        .toDouble()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
