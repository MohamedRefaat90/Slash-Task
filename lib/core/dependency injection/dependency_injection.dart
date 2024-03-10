import 'package:get_it/get_it.dart';
import 'package:slash_tesk/core/utils/api_handler.dart';

class DependencyInjection {
  static final GetIt getIt = GetIt.instance;

  static init() {
    getIt.registerSingleton<ApiHandler>(ApiHandler());
  }
}
