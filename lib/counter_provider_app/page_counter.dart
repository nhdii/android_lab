import 'package:flutter/material.dart';
import 'package:lab_android/counter_provider_app/changenotifier_counter.dart';
import 'package:provider/provider.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Counter(),
      child: PageCounter3(),
    );
  }
}

class PageCounter extends StatelessWidget {
  PageCounter({Key? key}) : super(key: key);
  int num = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<Counter>(
      child: Text("Not rebuild: $num", style: TextStyle(fontSize: 25),),
      builder: (context, counter, child) => Scaffold(
        appBar: AppBar(
          title: Text("Counter App"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: (){
                    num++;
                    counter.tang();
                  },
                  child: Text("Tang"),
              ),
              Text("${counter.value}", style:
                TextStyle(fontSize: 40),),
              child!,
              ElevatedButton(
                onPressed: (){
                  num--;
                  counter.giam();
                },
                child: Text("Giam"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PageCounter2 extends StatelessWidget {
  const PageCounter2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App 2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  var c = context.read<Counter>();
                  c.tang();
                },
                child: Text("Tang")
            ),
            Consumer<Counter>(
                builder: (context, counter, child) => Column(
                  children: [
                    Text("${counter.value}", style: TextStyle(fontSize: 40)),
                    child ?? Text("Bi null roi", style: TextStyle(fontSize: 25),)
                  ],
                ),
              child: Text("Not rebuild: ${context.read<Counter>().value}", style: TextStyle(fontSize: 20),),
            ),
            ElevatedButton(
                onPressed: (){
                  var c = context.read<Counter>();
                  c.giam();
                },
                child: Text("Giam")
            ),
          ],
        ),
      ),
    );
  }
}

//Khong khuyen khich dung
class PageCounter3 extends StatelessWidget {
  const PageCounter3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var counter = Provider.of<Counter>(context, listen: true);
    // var counter = context.watch<Counter>();
    var counter = context.select<Counter, int>((value) => value.value);
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App 3"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  context.read<Counter>().tang();
                },
                child: Text("Tang")
            ),
            Text("${counter.toInt()}", style: TextStyle(fontSize: 40),),
            ElevatedButton(
                onPressed: (){
                  context.read<Counter>().giam();
                },
                child: Text("Giam")
            ),
          ],
        ),
      ),
    );
  }
}





