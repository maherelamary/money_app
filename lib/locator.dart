import 'package:get_it/get_it.dart';
import 'package:money_app/CORE/viewModel/login_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => LoginModel());
}
