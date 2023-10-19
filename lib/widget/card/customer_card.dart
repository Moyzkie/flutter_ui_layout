import 'package:flutter/material.dart';
import 'package:ui_layout/model/customer_model.dart';

class CustomerCard extends StatelessWidget {
  final CustomerModel customer;

  const CustomerCard({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(8.0),
      height: 50,
      decoration: _buildCardDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _buildRemindButton(),
              const SizedBox(width: 10),
              SizedBox(
                  width: 85,
                  child: Text(
                    customer.name,
                    style: const TextStyle(overflow: TextOverflow.ellipsis),
                  )),
            ],
          ),
          Text('₱${customer.balance.toStringAsFixed(2)}'),
          const Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.pinkAccent,
            size: 14,
          )
        ],
      ),
    );
  }

  BoxDecoration _buildCardDecoration() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey, // Shadow color
            offset: Offset(0, 2), // Shadow offset
            blurRadius: 4, // Shadow blur radius
          ),
        ],
      );

  Container _buildRemindButton() => Container(
        padding: const EdgeInsets.all(5),
        width: 93,
        decoration: _buildRemindButtonDecoration(),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildRemindButtonText(),
              const SizedBox(width: 5),
              _buildRemindButtonNotificationIcon()
            ],
          ),
        ),
      );

  Text _buildRemindButtonText() => const Text(
        'REMIND',
        style: TextStyle(
          color: Colors.white,
        ),
      );

  Container _buildRemindButtonNotificationIcon() => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
        ),
        child: Icon(
          Icons.notifications,
          color: _getNotificationIconColor(),
          size: 16,
        ),
      );

  BoxDecoration _buildRemindButtonDecoration() => BoxDecoration(
        color: _getReminderButtonColor(),
        borderRadius: BorderRadius.circular(5),
      );

  Color _getReminderButtonColor() {
    if (customer.status == 'UNPAID') return Colors.pinkAccent;
    return Colors.black12;
  }

  Color _getNotificationIconColor() {
    if (customer.status == 'UNPAID') return Colors.pinkAccent;
    return Colors.black12;
  }
}
