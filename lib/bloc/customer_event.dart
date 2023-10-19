part of 'customer_bloc.dart';

@immutable
abstract class CustomerEvent {}

class LoadAllCustomerEvent extends CustomerEvent {}

class LoadUnpaidCustomerEvent extends CustomerEvent {}

class LoadPaidCustomerEvent extends CustomerEvent {}
