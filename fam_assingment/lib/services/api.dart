import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl =
      'https://polyjuice.kong.fampay.co/mock/famapp/feed/home_section/?slugs=famx-paypage';

 Future<dynamic> getData() async {
  var response = await http.get(Uri.parse(baseUrl));
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    
    return jsonResponse;
  } else {
    print('Failed to load data: ${response.statusCode}');
    return null;
  }
}

}
