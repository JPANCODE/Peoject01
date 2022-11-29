import 'package:database/providers/transaction_provider.dart';
import 'package:database/screens/form_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'models/Transactions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return TransactionProvider();
        })
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: const MyHomePage(title: 'บัญชี'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return FormScreen();
                  }));
                })
          ],
        ),
        body: Consumer(
          builder: (context, TransactionProvider provider, Widget) {
            var count = provider.transactions.length;
            if (count <= 0) {
              return Center(
                child: Text(
                  "ไม่พบข้อมูล",
                  style: TextStyle(fontSize: 25),
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: count,
                  itemBuilder: (context, int index) {
                    Transactions data = provider.transactions[index];
                    return Card(
                      elevation: 5,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 5),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 28,
                          child: FittedBox(
                            child: Text(data.amount.toString()),
                          ),
                        ),
                        title: Text(data.title!),
                        subtitle:
                            Text(DateFormat("dd/MM/yyyy").format(data.date!)),
                      ),
                    );
                  });
            }
          },
        ));
  }
}
