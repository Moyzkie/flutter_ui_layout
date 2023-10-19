import 'package:ui_layout/model/customer_model.dart';
import 'package:ui_layout/repository/customer_repository.dart';

class CustomerService {
  final ICustomerRepository customerRepository;

  CustomerService(this.customerRepository);
  
  Future<List<CustomerModel>> getAllCustomers() async {
    return await customerRepository.getAllCustomers();
  }
  
  Future<List<CustomerModel>>getUnpaidCustomer() async {
    final customers = await customerRepository.getAllCustomers();
    return customers.where((customer) => customer.status
       == 'UNPAID').toList();
  }

  Future<List<CustomerModel>>getPaidCustomer() async {
    final customers = await customerRepository.getAllCustomers();
    return customers.where((customer) => customer.status
        == 'PAID').toList();
  }
  
}