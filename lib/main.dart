// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import './components/transaction_list.dart';
import './models/transactions.dart';
import './components/transaction_form.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      home: HomePage(),
      theme: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(primary: Colors.blueGrey, secondary: Colors.blueAccent),
          textTheme: theme.textTheme.copyWith(
            titleLarge: TextStyle(
                fontFamily: 'Rubik', fontSize: 20, color: Colors.black),
          ),
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.grey[200],
              titleTextStyle: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.blueGrey,
              ))),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transactions> _transactions = [
    // Transactions(
    //   id: 't1',
    //   title: 'Novo Tênis de corrida',
    //   value: 310.78,
    //   date: DateTime.now(),
    // ),
    // Transactions(
    //   id: 't1',
    //   title: 'Novo Tênis de corrida',
    //   value: 310.78,
    //   date: DateTime.now(),
    // ),
  ];
  _addTransaction(String title, double cost) {
    final newTransaction = Transactions(
      id: Random().nextDouble().toString(),
      title: title,
      value: cost,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
        actions: <Widget>[
          IconButton(
              onPressed: () => _openTransactionFormModal(context),
              icon: Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                child: Text('Gráfico'),
                color: Colors.blue[200],
                elevation: 5,
              ),
            ),
            TransactionList(_transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        onPressed: () => _openTransactionFormModal(context),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
