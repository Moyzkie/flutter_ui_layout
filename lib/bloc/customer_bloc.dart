import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ui_layout/model/customer_model.dart';
import 'package:ui_layout/service/customer_service.dart';

part 'customer_event.dart';

part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final CustomerService customerService;

  CustomerBloc(this.customerService) : super(CustomerInitial()) {
    on<LoadAllCustomerEvent>(_loadAllCustomers);
    on<LoadUnpaidCustomerEvent>(_loadUnpaidCustomers);
    on<LoadPaidCustomerEvent>(_loadPaidCustomers);
  }

  Future<void> _loadAllCustomers(LoadAllCustomerEvent event, emit) async {
    emit(LoadedCustomerState(await customerService.getAllCustomers()));
  }

  Future<void> _loadUnpaidCustomers(LoadUnpaidCustomerEvent event, emit) async {
    emit(LoadedCustomerState(await customerService.getUnpaidCustomer()));
  }

  Future<void> _loadPaidCustomers(LoadPaidCustomerEvent event, emit) async {
    emit(LoadedCustomerState(await customerService.getPaidCustomer()));
  }
}
