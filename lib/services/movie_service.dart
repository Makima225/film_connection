// Packages

import 'package:get_it/get_it.dart';

//  Services
import 'package:film_connection/services/http_service.dart';

class MovieService {
  final GetIt getIt = GetIt.instance;

  final HTTPService _http = GetIt.I.get<HTTPService>();
}
