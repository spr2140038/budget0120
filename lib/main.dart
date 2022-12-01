import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.50),
        child: AppBar(
          title: Text('今月の予算', style: TextStyle(fontSize: 25),),
          centerTitle: true,
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 40,),
            Container(
              width: 200,
              height: 40,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black
                  ),
                ),
              ),
              child: Row(
                children: <Widget>[
                  SizedBox(width: 20,),
                  Text('¥', style: TextStyle(fontSize: 35),),
                  SizedBox(width: 35,),
                  Text('80,000',style: TextStyle(fontSize: 35),),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Container(
              width: double.infinity,
              height: 40,
              child: Text('使用金額', style: TextStyle(fontSize: 30),),
            ),
            SizedBox(height: 30,),
            Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.red,
                      width: 10,
                    ),
                  )
              ),
              child: Row(
                children: <Widget>[
                  Text('今月', style: TextStyle(fontSize: 30),),
                  SizedBox(width: 25,),
                  Text('¥', style: TextStyle(fontSize: 30),),
                  SizedBox(width: 10,),
                  Text('30,000', style: TextStyle(fontSize: 30),),
                  SizedBox(width: 10,),
                  Text('/', style: TextStyle(fontSize: 30),),
                  SizedBox(width: 10,),
                  Text('¥', style: TextStyle(fontSize: 30),),
                  SizedBox(width: 10,),
                  Text('80,000', style: TextStyle(fontSize:30),),

                ],
              ),
            ),
            SizedBox(height: 40,),
            Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.blue,
                      width: 10,
                    ),
                  )
              ),
              child: Row(
                children: <Widget>[
                  Text('今週', style: TextStyle(fontSize: 30),),
                  SizedBox(width: 25,),
                  Text('¥', style: TextStyle(fontSize: 30),),
                  SizedBox(width: 10,),
                  Text('7,000', style: TextStyle(fontSize: 30),),
                  SizedBox(width: 10,),
                  Text('/', style: TextStyle(fontSize: 30),),
                  SizedBox(width: 10,),
                  Text('¥', style: TextStyle(fontSize: 30),),
                  SizedBox(width: 10,),
                  Text('20,000', style: TextStyle(fontSize:30),),
                ],
              ),
            ),
            SizedBox(height: 40,),
            Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.green,
                    width: 10,
                  ),
                )
              ),
              child: Row(
                children: <Widget>[
                  Text('今日', style: TextStyle(fontSize: 30),),
                  SizedBox(width: 25,),
                  Text('¥', style: TextStyle(fontSize: 30),),
                  SizedBox(width: 10,),
                  Text('2,000', style: TextStyle(fontSize: 30),),
                  SizedBox(width: 10,),
                  Text('/', style: TextStyle(fontSize: 30),),
                  SizedBox(width: 10,),
                  Text('¥', style: TextStyle(fontSize: 30),),
                  SizedBox(width: 10,),
                  Text('2,800', style: TextStyle(fontSize:30),),
                ],
              ),
            ),
            SizedBox(height: 40,),
            Container(
              width: 160,
              height: 50,
              child: ElevatedButton(
                child: Text('予算の設定', style: TextStyle(fontSize: 25),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
