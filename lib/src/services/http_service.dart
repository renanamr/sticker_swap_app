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
  }) async{
    try{
      return await _dio.get(
          "$_apiUrl$endpoint",
          queryParameters: queryParameters,
          options: Options(headers: {'Authorization': 'bearer ${_auth.token}',})
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
    final headers = {'Authorization': 'bearer ${_auth.token}',};

    return await _dio.post(
      "$_apiUrl$endpoint",
      data: data,
      options: Options(headers: headers),
    );
  }

  Future put({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? extraHeaders,
    Map<String, dynamic>? queryParameters
  }) async{
    try{
      final headers = {'Authorization': 'bearer ${_auth.token}',};

      return await _dio.put(
          "$_apiUrl$endpoint",
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: headers)
      );
    } catch(e){
      rethrow;
    }
  }

}