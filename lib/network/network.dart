import 'dart:convert';

import 'package:cryptoapp/model/crypto_model.dart';
import 'package:cryptoapp/screen/main_screen.dart';
import 'package:http/http.dart' as http;

class Network {
  static Uri url = Uri.parse('https://api.coincap.io/v2/assets');
  static Future<void> getCrypto() async{
    var response = await http.get(Network.url);
    if(response.statusCode == 200){
      var res_body = jsonDecode(response.body);
      var data = res_body['data'];
      HomeScreen.CryptoList.clear();
      data.forEach((element){
        HomeScreen.CryptoList.add(Crypto.fromJson(element));
      });
    }
  }
}