import 'package:fam_assingment/pages/cards/HC1_card.dart';
import 'package:fam_assingment/pages/cards/HC3_card.dart';
import 'package:fam_assingment/pages/cards/HC5_card.dart';
import 'package:fam_assingment/pages/cards/HC6_card.dart';
import 'package:fam_assingment/pages/cards/HC9_card.dart';
import 'package:fam_assingment/services/api.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService apiService = ApiService();
  dynamic data;
  Future getdata() async {
    var response = await apiService.getData();
    setState(() {
      data = response;
    });
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          child: Image.asset(
            'assets/images/FamPay_Logo.png',
            height: 70,
            width: 110,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            padding: const EdgeInsets.only(bottom: 20),
            scrollDirection: Axis.vertical,
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //container(HC3)
                  Hc3Card(data: data, index: index),

                  const SizedBox(
                    height: 6,
                  ),
                  //container(HC6)
                  Hc6Card(data: data, index: index),

                  //  container(HC5)
                  Hc5Card(index: index, data: data),
                  const SizedBox(
                    height: 7,
                  ),

                  //  container(HC9)
                  Hc9Card(index: index, data: data),

                  const SizedBox(
                    height: 7,
                  ),

                  //  container(HC1)
                  Hc1Card(index: index, data: data),
                ],
              );
            },
          )),
    );
  }
}
