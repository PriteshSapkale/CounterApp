import 'package:demoapps/mycounter.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CounterApp'),
      ),
      body: ChangeNotifierProvider<MyCounter>(
        create: (context) => MyCounter(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Consumer<MyCounter>(
                builder: (context, mycounter, child) {
                  return Text('${mycounter.counter}');
                },
              ),
              Consumer<MyCounter>(
                builder: (context, mycounter, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          mycounter.inc();
                        },
                      ),
                       
                        IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          mycounter.dec();
                        },
                      ),
                 ElevatedButton(
          onPressed: () => _showToast(context),
          child: const Text('Show toast'),
        ),
      
                    ],
                  );
                  
                },
              ),
            ],
          ),
        ),
      ),
      
    );
  }

  _showToast(BuildContext context) {
       final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Added to favorite'),
        action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
