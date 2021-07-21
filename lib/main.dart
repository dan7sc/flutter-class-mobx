import 'package:class_mobx_nocodegen/counter_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final store = CounterStore();
  ReactionDisposer? disposer;

  @override
  void initState() {
    disposer = reaction((_) => store.appStatus, (AppStatus status) {
      if (status == AppStatus.loading) {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else if (status == AppStatus.success) {
        Navigator.pop(context);
      } else if (status == AppStatus.error) {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => Center(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Usuário ou senha inválidos"),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Entendi!"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    disposer!();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: "Usuário"),
                onChanged: store.setUser,
              ),
              TextField(
                decoration: InputDecoration(hintText: "Senha"),
                onChanged: store.setPassword,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Observer(
              builder: (_) {
                return Expanded(
                  child: ElevatedButton(
                    onPressed: store.userAndPasswordValid ? () => store.login() : null,
                    child: Text("Entrar"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
