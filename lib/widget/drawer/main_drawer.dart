import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '/view/budgets_view.dart';
import '/view/goals_view.dart';
import '/view/sources_view.dart';
import '/view/transactions_view.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                'Brady Budget',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text('Budgets'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BudgetsView(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Transactions'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TransactionsView(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Goals'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GoalsView(),
                ),
              );
            },
          ),
          ListTile(
            title: Text('Sources'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SourcesView(),
                ),
              );
            },
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text("Obviously copyrighted ©"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
