import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rest_api/features/home/data/data_source/remote_data_source.dart';
import 'package:rest_api/features/home/data/repository/product.dart';
import 'package:rest_api/features/home/domain/usecase/get_products.dart';
import 'package:shared_preferences/shared_preferences.dart';

final serviceLocator = GetIt.I;

Future<void> setUpLocator() async {
  serviceLocator.registerSingletonAsync(
      () async => await SharedPreferences.getInstance());

  serviceLocator.registerLazySingleton(() => Dio(BaseOptions(baseUrl: 'https://fakestoreapi.com')));
  serviceLocator.registerLazySingleton(() => HomeRemoteDataSource());
  serviceLocator.registerLazySingleton(() => ProductRepositoryImpl(serviceLocator()));
  serviceLocator.registerLazySingleton(() => GetProductsUseCase(serviceLocator()));
  
}
