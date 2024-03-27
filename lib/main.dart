// ignore_for_file: prefer_const_constructors

import './models/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  var title;
  var cost;

  final _transactions = [
    Transactions(
      id: 't1',
      title: 'Novo Tênis de corrida',
      value: 310.78,
      date: DateTime.now(),
    ),
    Transactions(
      id: 't1',
      title: 'Conta de Luz',
      value: 179.2,
      date: DateTime.now(),
    ),
    Transactions(
      id: 't1',
      title: 'Conta de Internet',
      value: 150.4,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Despesas Pessoais'),
        ),
        body: Column(
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
            Column(
              children: _transactions.map((tr) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.purple,
                            width: 2,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'R\$ ${tr.value.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.purple),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            tr.title,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat('d MMM y').format(tr.date),
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    TextField(
                      onChanged: (value) => title = value,
                      decoration: InputDecoration(labelText: 'Titulo'),
                    ),
                    TextField(
                      onChanged: (value) => cost = value,
                      decoration: InputDecoration(labelText: 'Valor (R\$)'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Nova Transação',
                              style: TextStyle(color: Colors.purple),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
