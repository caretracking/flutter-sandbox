import 'dart:async';

import 'package:dio/dio.dart';

class ListBloc {

  StreamController _streamController = StreamController();

  Stream get output => _streamController.stream;

  StreamSink get _input => _streamController.sink;

  Dio _dio = Dio();

  String endpoint = "http://5e24d7d9c5fc8f001465d497.mockapi.io/caretracking/api/v1";
  

  ListBloc() {
    getList();
  }

  void getList() async {
    Response resp =  await _dio.get('$endpoint/Pessoa/');
    
    _input.add(resp.data);


  }

  void create() async {
    await _dio.post('$endpoint/Pessoa', data: {
      'createAt': DateTime.now().millisecondsSinceEpoch,
      'name': 'Asdrubal Matos',
      'email': 'novo@email.com',
    } );

    getList();

  }

  void udpate(String id) async {
    await _dio.put('$endpoint/Pessoa/$id', data: {
      'createAt': DateTime.now().millisecondsSinceEpoch,
      'name': 'Asdrubal Matos Atualizado',
      'email': 'novo2@email.com',
    } );

    getList();
  }

  void delete (String id) async {
    await _dio.delete('$endpoint/Pessoa/$id');
    getList();

  }


  void dispose(){
    _streamController.close();
  }


}