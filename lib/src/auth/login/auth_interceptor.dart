import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dw11/src/core/constants/local_storage_keys.dart';
import 'package:dw11/src/core/ui/widgets/barbershop_nav_global_key.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final RequestOptions(:headers, :extra) = options;

    const authHeaderKey = 'Authorization';
    headers.remove(authHeaderKey);
    final sp = await SharedPreferences.getInstance();
    headers.addAll({
      authHeaderKey: 'Bearer ${sp.getString(LocalStorageKeys.accessToken)}'
    });
    if (extra case {'DIO_AUTH_KEY': true}) {
      handler.next(options);
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final DioException(requestOptions: RequestOptions(:extra), :response) = err;
    if (extra case {'DIO_AUTH_KEY': true}) {
      if (response != null && response.statusCode == HttpStatus.forbidden) {
        Navigator.of(BarbershopNavGlobalKey.instance.navKey.currentContext!)
            .pushNamedAndRemoveUntil('/auth/login', (route) => false);
      }
    }
    handler.reject(err);
  }
}
