import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:chatgpt_teste/constants/api_consts.dart';
import 'package:chatgpt_teste/models/models_model.dart';
import 'package:http/http.dart' as http;

import '../models/chat_model.dart';

class ApiService {
  static Future<List<ModelsModel>> getModels() async {
    try {
      var response = await http.get(
        Uri.parse('$BASE_URL/models'),
        headers: {'Authorization': 'Bearer $API_KEY'},
      );
      Map jsonResponse = jsonDecode(response.body);
      if (jsonResponse['error'] != null) {
        //print('jsonResponse["error"] ${jsonResponse['error']['message']}');
        throw HttpException(jsonResponse['error']['message']);
      }
      //print('jsonReponse $jsonResponse');
      List temp = [];
      for (var value in jsonResponse['data']) {
        temp.add(value);
        //log('temp ${value['id']}');
      }
      return ModelsModel.modelsFromSnapshot(temp);
    } catch (error) {
      log('error $error');
      rethrow;
    }
  }

  static Future<List<ChatModel>> sendMessage(
      {required String message, required String modelId}) async {
    try {
      var response = await http.post(Uri.parse('$BASE_URL/chat/completions'),
          headers: {
            'Authorization': 'Bearer $API_KEY',
            'Content-Type': 'application/json; charset=utf-8'
          },
          body: utf8.encode(
            jsonEncode({
              "model": modelId,
              "messages": [
                {"role": "user", "content": message}
              ],
              "temperature": 0.7
            }),
          ));
      Map jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
      if (jsonResponse['error'] != null) {
        //print('jsonResponse["error"] ${jsonResponse['error']['message']}');
        throw HttpException(jsonResponse['error']['message']);
      }
      List<ChatModel> chatList = [];
      if (jsonResponse['choices'].length > 0) {
        //log('jsonReponse[choices]text ${jsonResponse['choices'][0]['text']}');
        chatList = List.generate(
          jsonResponse['choices'].length,
          (index) => ChatModel(
            msg: jsonResponse['choices'][index]['message']['content'],
            chatIndex: 1,
          ),
        );
      }
      return chatList;
    } catch (error) {
      log('error $error');
      rethrow;
    }
  }
}
