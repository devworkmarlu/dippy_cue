import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class WebRequest {
  static Dio _dio = Dio();
  static bool isRequestInProgress = false;

  bool getDioState() {
    return isRequestInProgress;
  }

  static Future<Response> fetchData(String url) async {
    isRequestInProgress = true;
    try {
      final response = await _dio.get(url);

      return response;
    } catch (error) {
      throw Exception('Failed to fetch data: $error');
    } finally {
      isRequestInProgress = false;
    }
  }

  static Future<Response> dataFetch(String url, FormData form) async {
    isRequestInProgress = true;
    try {
      final response = await _dio.post(url, data: form);

      return response;
    } catch (error) {
      print('Something Wrong with the water');
      throw Exception('Failed to fetch data: $error');
    } finally {
      isRequestInProgress = false;
    }
  }

  static Future<Response> dataFetch2(String url, FormData form, ctx) async {
    isRequestInProgress = true;
    try {
      final response = await _dio.post(url, data: form);

      return response;
    } catch (error) {
      Navigator.of(ctx.currentContext).pop();
      ScaffoldMessenger.of(ctx).showSnackBar(
        const SnackBar(content: Text('Somethings Wrong With The Water!')),
      );

      throw Exception('Failed to fetch data: $error');
    } finally {
      isRequestInProgress = false;
    }
  }

// You can add more public functions for different API calls if needed
}
