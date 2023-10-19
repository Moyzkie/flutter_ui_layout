import 'package:ui_layout/model/customer_model.dart';

abstract class ICustomerRepository {
  Future<List<CustomerModel>> getAllCustomers();
}

class CustomerRepository implements ICustomerRepository {
  @override
  Future<List<CustomerModel>> getAllCustomers() async {
    return [
      CustomerModel(
        name: 'Juan Dela Cruz',
        balance: 10,
        status: 'UNPAID',
      ),
      CustomerModel(
        name: 'Mel Francis',
        balance: 76.00,
        status: 'UNPAID',
      ),
      CustomerModel(
        name: 'Pedro Penduko',
        balance: 0.00,
        status: 'PAID',
      ),
    ];
  }
}
