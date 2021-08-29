import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text('Budgets'),
            onTap: () {
              print('Drawer budgets');
            },
          ),
          ListTile(
            title: Text('Transactions'),
            onTap: () {
              print('Drawer transactions');
            },
          ),
          ListTile(
            title: Text('Goals'),
            onTap: () {
              print('Drawer goals');
            },
          ),
          ListTile(
            title: Text('Sources'),
            onTap: () {
              print('Drawer sources');
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
