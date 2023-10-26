import 'dart:convert';
import 'package:manajemen_tugas/helpers/api.dart';
import 'package:manajemen_tugas/helpers/api_url.dart';
import 'package:manajemen_tugas/model/tugas.dart';

class TugasBloc {
  static Future<List<Tugas>> getTugas() async {
    String apiUrl = ApiUrl.listTugas;
    var response = await Api().get(apiUrl);
    var jsonObj = json.decode(response.body);
    List<dynamic> listTugas = (jsonObj as Map<String, dynamic>)['result'];
    List<Tugas> tugass = [] ;
    for (int i = 0; i < listTugas.length; i++) {
      tugass.add(Tugas.fromJson(listTugas[i]));
    }
    return tugass;
  }

  static Future addTugas({Tugas? tugas}) async {
    String apiUrl = ApiUrl.createTugas;

    var body = {
      "title": tugas!.title,
      "description": tugas.description,
      "deadline": tugas.deadline
    };

    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return jsonObj['status'];
  }

  // static Future<bool> updateTugas({required Tugas tugas}) async {
  //   String apiUrl = ApiUrl.updateTugas(tugas.id!);

  //   var body = {
  //     "title": tugas.title,
  //     "description": tugas.description,
  //     "deadline": tugas.deadline
  //   };
  //   print("Body : $body");
  //   var response = await Api().post(apiUrl, body);
  //   var jsonObj = json.decode(response.body);
  //   return jsonObj['result'];
  // }

  static Future<bool> deleteTugas({int? id}) async {
    String apiUrl = ApiUrl.deleteTugas(id!);

    var response = await Api().delete(apiUrl);
    var jsonObj = json.decode(response.body);
    return (jsonObj as Map<String, dynamic>)['result'];
  }
}
