import '../models/app_config.dart';

// Packages
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class HTTPService {
  final Dio dio = Dio();
  final GetIt getIt = GetIt.instance;

  String _base_url;
  String _api_key;

  HTTPService(AppConfig config)
      : _base_url = config.BASE_API_URL,
        _api_key = config.API_KEY {
    // Get AppConfig instance from GetIt
  }

  Future<Response> get(String _path,
      {required Map<String, dynamic> queryParams}) async {
    try {
      String _url = '$_base_url$_path';

      // Default query parameters, including API key and language
      Map<String, dynamic> _query = {
        'api_key': _api_key,
        'language': 'fr', // Fix the typo in 'langage'
      };

      // If additional query parameters are provided, add them to the query
      _query.addAll(queryParams);

      // Perform the GET request using Dio
      return await dio.get(_url, queryParameters: _query);
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      // Handle Dio errors
      print('Unable to perform GET request:');
      print('DioError: $e');
      throw e; // You may want to rethrow the error or handle it appropriately
    }
  }
}
