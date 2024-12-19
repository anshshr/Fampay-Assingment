import 'package:fam_assingment/utils/color_convertor.dart';
import 'package:fam_assingment/utils/url_launcher.dart';
import 'package:flutter/material.dart';

class Hc1Card extends StatelessWidget {
  final dynamic data;
  final int index;
  const Hc1Card({super.key, this.data, required this.index});


  @override
  Widget build(BuildContext context) {
    return data[index]['hc_groups'][4]['is_scrollable']
        ? SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    openWebURL(data[index]['hc_groups'][4]['cards'][1]['url']);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: hexToColor(
                          data[index]['hc_groups'][4]['cards'][0]['bg_color']),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: AspectRatio(
                          aspectRatio: data[index]['hc_groups'][4]['cards'][0]
                                  ['icon']['aspect_ratio']
                              .toDouble(),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(data[index]['hc_groups']
                                [4]['cards'][0]['icon']['image_url']),
                          )),
                      title: Text(
                        data[index]['hc_groups'][4]['cards'][0]['formatted_title']
                            ['entities'][0]['text'],
                        style: TextStyle(
                          fontFamily: data[index]['hc_groups'][4]['cards'][0]
                              ['formatted_title']['entities'][0]['font_family'],
                          color: hexToColor(data[index]['hc_groups'][4]['cards']
                              [0]['formatted_title']['entities'][0]['color']),
                        ),
                      ),
                      subtitle: Text(
                        data[index]['hc_groups'][4]['cards'][0]
                            ['formatted_description']['entities'][0]['text'],
                        style: TextStyle(
                          fontFamily: data[index]['hc_groups'][4]['cards'][0]
                                  ['formatted_description']['entities'][0]
                              ['font_family'],
                          color: hexToColor(data[index]['hc_groups'][4]['cards']
                                  [0]['formatted_description']['entities'][0]
                              ['color']),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ListTile(
                    leading: AspectRatio(
                        aspectRatio: data[index]['hc_groups'][4]['cards'][1]
                                ['icon']['aspect_ratio']
                            .toDouble(),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(data[index]['hc_groups']
                              [4]['cards'][1]['icon']['image_url']),
                        )),
                    title: Text(data[index]['hc_groups'][4]['cards'][1]
                        ['formatted_title']['entities'][0]['text']),
                  ),
                ),
              ],
            ),
          )
        : Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: hexToColor(
                      data[index]['hc_groups'][4]['cards'][0]['bg_color']),
                ),
                child: ListTile(
                  leading: AspectRatio(
                      aspectRatio: data[index]['hc_groups'][4]['cards'][0]
                              ['icon']['aspect_ratio']
                          .toDouble(),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(data[index]['hc_groups']
                            [4]['cards'][0]['icon']['image_url']),
                      )),
                  title: Text(
                    data[index]['hc_groups'][4]['cards'][0]['formatted_title']
                        ['entities'][0]['text'],
                    style: TextStyle(
                      fontFamily: data[index]['hc_groups'][4]['cards'][0]
                          ['formatted_title']['entities'][0]['font_family'],
                      color: hexToColor(data[index]['hc_groups'][4]['cards'][0]
                          ['formatted_title']['entities'][0]['color']),
                    ),
                  ),
                  subtitle: Text(
                    data[index]['hc_groups'][4]['cards'][0]
                        ['formatted_description']['entities'][0]['text'],
                    style: TextStyle(
                      fontFamily: data[index]['hc_groups'][4]['cards'][0]
                              ['formatted_description']['entities'][0]
                          ['font_family'],
                      color: hexToColor(data[index]['hc_groups'][4]['cards'][0]
                          ['formatted_description']['entities'][0]['color']),
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: AspectRatio(
                    aspectRatio: data[index]['hc_groups'][4]['cards'][1]['icon']
                            ['aspect_ratio']
                        .toDouble(),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(data[index]['hc_groups'][4]
                          ['cards'][1]['icon']['image_url']),
                    )),
                title: Text(data[index]['hc_groups'][4]['cards'][1]
                    ['formatted_title']['entities'][0]['text']),
              )
            ],
          );
  }
}
