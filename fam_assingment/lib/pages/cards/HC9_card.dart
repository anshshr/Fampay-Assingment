import 'package:fam_assingment/utils/color_convertor.dart';
import 'package:flutter/material.dart';

class Hc9Card extends StatelessWidget {
    final dynamic data;
  final int index;
  const Hc9Card({super.key, this.data, required this.index});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data[index]['hc_groups'][3]['cards'].length,
        itemBuilder: (context, innerindex) {
          return Container(
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [
                  hexToColor(data[index]['hc_groups'][3]['cards'][innerindex]
                      ['bg_gradient']['colors'][0]),
                  hexToColor(data[index]['hc_groups'][3]['cards'][innerindex]
                      ['bg_gradient']['colors'][1]),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: AspectRatio(
              aspectRatio: data[index]['hc_groups'][3]['cards'][innerindex]
                      ['bg_image']['aspect_ratio']
                  .toDouble(),
              child: Image.network(
                data[index]['hc_groups'][3]['cards'][innerindex]['bg_image']
                    ['image_url'],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
