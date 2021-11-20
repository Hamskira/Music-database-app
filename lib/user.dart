import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Data extends ChangeNotifier{
  String email = "";
  String fullname = "";
  List data_list = [];

  Future getData() async{
    http.Response response = await http.get(Uri.parse('http://192.168.0.6/select.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    data_list = jsonDecode(response.body);
    for(int i =0;i<data_list.length;i++){
      if(data_list[i]["Email"] == Email){
        email = data_list[i]["Email"];
        fullname = data_list[i]["FullName"];
      }
    }
    notifyListeners();
    print(response.statusCode);
    print(email);
    print(fullname);
  }


  String get Email => email;
  set Email(String data){
    email = data;
    notifyListeners();
  }
}