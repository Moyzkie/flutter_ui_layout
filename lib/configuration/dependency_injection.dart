import 'package:get_it/get_it.dart';
import 'package:ui_layout/bloc/customer_bloc.dart';
import 'package:ui_layout/repository/customer_repository.dart';
import 'package:ui_layout/service/customer_service.dart';

class DependencyInjection {
  static final getIt =  GetIt.instance;

  static void register() {
    registerRepositories();
    registerServices();
    registerBlocs();
  }

  static void registerRepositories() {
    getIt.registerLazySingleton<ICustomerRepository>(() => CustomerRepository());
  }

  static void registerServices() {
    getIt.registerLazySingleton<CustomerService>(() => CustomerService(
      getIt.get<ICustomerRepository>()
    ));
  }

  static void registerBlocs() {
    getIt.registerFactory<CustomerBloc>(() => CustomerBloc(
      getIt.get<CustomerService>()
    ));
  }


}