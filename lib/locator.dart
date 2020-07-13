
import 'package:get_it/get_it.dart';
import 'package:drunka/login/model/user_repository.dart';
import 'package:drunka/dashboard/viewmodel/category_repository.dart';
import 'package:drunka/dashboard/services/category_api.dart';
import 'package:drunka/question/sevices/question_api.dart';
import 'package:drunka/common/global.dart';



GetIt locator = GetIt.instance;



void setupLocator() {
  locator.registerLazySingleton(() => CategoryApi(Global.firestoreCollection));
  locator.registerLazySingleton(() => UserRepository()) ;
  locator.registerLazySingleton(() => CategoryRepository());
  locator.registerLazySingleton(() => QuestionApi(Global.firestoreCollection));

}