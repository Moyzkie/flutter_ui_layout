part of 'customer_bloc.dart';

@immutable
abstract class CustomerState {}

class CustomerInitial extends CustomerState {}

class LoadedCustomerState extends CustomerState {
  final List<CustomerModel> customers;

  LoadedCustomerState(this.customers);
}
