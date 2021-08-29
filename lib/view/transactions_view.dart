import 'package:flutter/material.dart';

import '/widget/drawer/main_drawer.dart';

class TransactionsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      drawer: MainDrawer(),
    );
  }
}
