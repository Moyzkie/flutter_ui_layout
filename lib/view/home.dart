import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_layout/bloc/customer_bloc.dart';
import 'package:ui_layout/widget/Text/title_text.dart';
import 'package:ui_layout/widget/button/action_button.dart';
import 'package:ui_layout/widget/button/back_button.dart';
import 'package:ui_layout/widget/button/outlined_button.dart';
import 'package:ui_layout/widget/card/customer_card.dart';

class Home extends StatelessWidget {
  static final getIt = GetIt.instance;

  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CustomerBloc>(
      create: (context) =>
          getIt.get<CustomerBloc>()..add(LoadAllCustomerEvent()),
      child: const HomeWidget(),
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  bool isActiveAllButton = true;
  bool isActiveUnpaidButton = false;
  bool isActivePaidButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        shadowColor: Colors.black38,
        leading: PeddlerBackButton(
          onPressed: () {},
        ),
        title: const TitleText(title: 'CREDIT LEDGER'),
        actions: _buildActionButtons(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _buildBoardBalance(),
            _buildHeaderBoard(),
            const SizedBox(height: 20),
            _buildButtonTabAndDueDate(),
            const SizedBox(height: 10),
            _buildHeader(),
            const SizedBox(height: 10),
            _buildCustomerList(),
          ],
        ),
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  List<Widget> _buildActionButtons() => [
        _buildSortActionButton(),
        const SizedBox(width: 10),
        _buildSearchActionButton(),
        const SizedBox(width: 10),
        _buildMessageActionButton(),
        const SizedBox(width: 10),
        _buildSettingActionButton()
      ];

  PeddlerIconActionButton _buildSortActionButton() => PeddlerIconActionButton(
        Icons.sort_by_alpha,
        onTap: () {},
      );

  PeddlerIconActionButton _buildSearchActionButton() => PeddlerIconActionButton(
        Icons.search_outlined,
        onTap: () {},
      );

  PeddlerIconActionButton _buildMessageActionButton() =>
      PeddlerIconActionButton(
        Icons.email_outlined,
        onTap: () {},
      );

  PeddlerIconActionButton _buildSettingActionButton() =>
      PeddlerIconActionButton(
        Icons.settings,
        onTap: () {},
      );

  Container _buildBoardBalance() => Container(
        height: 120,
        decoration: _buildBoardBalanceDecoration(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTotalBalance(),
              const SizedBox(height: 10),
              _buildTotalBalanceLabel(),
            ],
          ),
        ),
      );

  BoxDecoration _buildBoardBalanceDecoration() => const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.pinkAccent, Colors.purple],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      );

  Text _buildTotalBalance() => const Text(
        '₱86.00',
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );

  Text _buildTotalBalanceLabel() => const Text(
        'Total Balance',
        style: TextStyle(
          fontSize: 14,
          color: Colors.white,
        ),
      );

  Container _buildHeaderBoard() => Container(
        padding: const EdgeInsets.all(10),
        decoration: _buildHeaderBoardDecoration(),
        child: _buildHeaderBoardContent(),
      );

  BoxDecoration _buildHeaderBoardDecoration() => const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      );

  Row _buildHeaderBoardContent() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCustomerListHeader(),
          _buildTotalPaymentAndCreditHeader(),
        ],
      );

  Column _buildCustomerListHeader() => const Column(
        children: [
          Text('Customer List'),
          SizedBox(height: 5),
          Text(
            '3 Entries',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      );

  Row _buildTotalPaymentAndCreditHeader() => Row(
        children: [
          _buildTotalPaymentHeader(),
          const SizedBox(width: 30),
          _buildTotalCreditHeader(),
        ],
      );

  Widget _buildTotalPaymentHeader() => const Column(
        children: [
          Text('Total Payment'),
          SizedBox(height: 5),
          Text(
            '₱0.00',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          )
        ],
      );

  Widget _buildTotalCreditHeader() => const Column(
        children: [
          Text('Total Credit'),
          SizedBox(height: 5),
          Text(
            '₱86.00',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          )
        ],
      );

  Row _buildButtonTabAndDueDate() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildButtonTabs(),
          _buildDueDate(),
        ],
      );

  Row _buildButtonTabs() => Row(
        children: [
          _buildButtonAll(),
          const SizedBox(width: 5),
          _buildButtonUnpaid(),
          const SizedBox(width: 5),
          _buildButtonPaid(),
        ],
      );

  PeddlerOutLinedButton _buildButtonAll() => PeddlerOutLinedButton(
        isActive: isActiveAllButton,
        buttonText: 'All',
        onTap: () {
          setState(() {
            isActiveAllButton = true;
            isActiveUnpaidButton = false;
            isActivePaidButton = false;
          });
          BlocProvider.of<CustomerBloc>(context).add(LoadAllCustomerEvent());
        },
      );

  PeddlerOutLinedButton _buildButtonUnpaid() => PeddlerOutLinedButton(
        isActive: isActiveUnpaidButton,
        buttonText: 'UNPAID',
        onTap: () {
          setState(() {
            isActiveAllButton = false;
            isActiveUnpaidButton = true;
            isActivePaidButton = false;
          });
          BlocProvider.of<CustomerBloc>(context).add(LoadUnpaidCustomerEvent());
        },
      );

  PeddlerOutLinedButton _buildButtonPaid() => PeddlerOutLinedButton(
        isActive: isActivePaidButton,
        buttonText: 'PAID',
        onTap: () {
          setState(() {
            isActiveAllButton = false;
            isActiveUnpaidButton = false;
            isActivePaidButton = true;
          });
          BlocProvider.of<CustomerBloc>(context).add(LoadPaidCustomerEvent());
        },
      );

  Container _buildDueDate() => Container(
        padding: const EdgeInsets.all(10),
        width: 110,
        height: 40,
        decoration: _buildDueDateDecoration(),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Due Date'),
            Icon(Icons.calendar_month_outlined),
          ],
        ),
      );

  BoxDecoration _buildDueDateDecoration() => BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(30),
      );

  Padding _buildHeader() => Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildReminderAndCustomerNameLabel(),
            const Text('Balance'),
            const SizedBox(width: 25)
          ],
        ),
      );

  Row _buildReminderAndCustomerNameLabel() => const Row(
        children: [
          Text('Reminder'),
          SizedBox(width: 50),
          Text('Customer Name'),
        ],
      );

  Expanded _buildCustomerList() => Expanded(
        child: BlocBuilder<CustomerBloc, CustomerState>(
          builder: (context, state) {
            if (state is LoadedCustomerState) {
              return ListView.builder(
                  itemCount: state.customers.length,
                  itemBuilder: (context, index) {
                    return CustomerCard(customer: state.customers[index]);
                  });
            }
            return Container();
          },
        ),
      );

  Container _buildFloatingActionButton() => Container(
        width: 180,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.pinkAccent,
        ),
        child: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person,
                color: Colors.white,
              ),
              SizedBox(width: 10),
              Text(
                'ADD CUSTOMER',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      );
}
