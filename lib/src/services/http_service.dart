import 'dart:io' show HttpException;

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'package:sticker_swap_app/src/core/entities/auth.dart';

class HttpService{

  final _auth = Modular.get<Auth>();

  final _dio = Dio();
  final _apiUrl = dotenv.env['API_URI'];

  Future<dynamic> get({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? extraHeaders,
  }) async{
    try{
      return await _dio.get(
          "$_apiUrl/api/$endpoint",
          queryParameters: queryParameters,
          options: Options(headers: _getHeaders(extraHeaders))
      );
    } on DioException catch(e){
      throw HttpException(e.message!);
    } catch(e){
      rethrow;
    }
  }

  Future post({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? extraHeaders,
  }) async{
    return await _dio.post(
      "$_apiUrl/api/$endpoint",
      data: data,
      options: Options(headers: _getHeaders(extraHeaders))
    );
  }

  Future put({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? extraHeaders,
    Map<String, dynamic>? queryParameters
  }) async{
    try{
      return await _dio.put(
          "$_apiUrl/api/$endpoint",
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: _getHeaders(extraHeaders))
      );
    } catch(e){
      rethrow;
    }
  }

  /// Organiza Headers de autenticação dos usuários
  Map<String, dynamic> _getHeaders(Map<String, dynamic>? extraHeaders){
    Map<String, dynamic> headers = {};

    if(_auth.token != null) {
      headers.addAll({'Authorization': 'bearer ${_auth.token}'});
    }

    if (extraHeaders != null) headers.addAll(extraHeaders);
    return headers;
  }

}