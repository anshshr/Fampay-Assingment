import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fam_assingment/utils/color_convertor.dart'; // Update as per your utils path.

class Hc3Card extends StatefulWidget {
  final dynamic data;
  final int index;

  const Hc3Card({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);

  @override
  _Hc3CardState createState() => _Hc3CardState();
}

class _Hc3CardState extends State<Hc3Card> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  bool _showActions = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.3, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _saveCardState(String key, int cardId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedList = prefs.getStringList(key) ?? [];
    if (!savedList.contains(cardId.toString())) {
      savedList.add(cardId.toString());
      await prefs.setStringList(key, savedList);
    }
  }

  Future<void> _handleRemindLater() async {
    await _saveCardState('remindLater', widget.index);
    setState(() {
      _showActions = false;
    });
  }

  Future<void> _handleDismissNow() async {
    await _saveCardState('dismissedCards', widget.index);
    setState(() {
      _showActions = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        setState(() {
          _showActions = true;
        });
        _controller.forward();
      },
      onTap: () {
        setState(() {
          _showActions = false;
        });
        _controller.reverse();
      },
      child: Stack(
        children: [
          SlideTransition(
            position: _slideAnimation,
            child: AspectRatio(
              aspectRatio: widget.data[widget.index]['hc_groups'][0]['cards'][0]
                  ['bg_image']['aspect_ratio'],
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.data[widget.index]['hc_groups'][0]['cards'][0]
                          ['bg_image']['image_url'],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 120, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.data[widget.index]['hc_groups'][0]['cards'][0]
                            ['formatted_title']['entities'][0]['text'],
                        style: TextStyle(
                          fontSize: widget.data[widget.index]['hc_groups'][0]
                                  ['cards'][0]['formatted_title']['entities'][0]
                              ['font_size']
                              .toDouble(),
                          color: hexToColor(widget.data[widget.index]
                                      ['hc_groups'][0]['cards'][0]
                                  ['formatted_title']['entities'][0]['color']),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Text(
                          widget.data[widget.index]['hc_groups'][0]['cards'][0]
                              ['formatted_title']['entities'][1]['text'],
                          style: TextStyle(
                            fontSize: widget.data[widget.index]['hc_groups'][0]
                                    ['cards'][0]['formatted_title']['entities']
                                [1]['font_size']
                                .toDouble(),
                            color: hexToColor(widget.data[widget.index]
                                        ['hc_groups'][0]['cards'][0]
                                    ['formatted_title']['entities'][1]['color']),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (_showActions)
            Positioned(
              left: 0,
              top: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      _handleRemindLater();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.notifications_active_sharp,
                            color: Colors.yellow,
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "Remind Later",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      _handleDismissNow();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.cancel,
                            color: Colors.yellow,
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "Dismiss Now",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
