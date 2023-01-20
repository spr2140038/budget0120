import 'package:budget/budget_setting.dart';
import 'package:flutter/material.dart';
import '../model/budgets.dart';
import '../model/budget_db_helper.dart';

// class BudgetMainText extends StatelessWidget {
//   BudgetMainText(this.name);
//   final String name;
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }

class BudgetMain extends StatefulWidget {
  // final int id;
  const BudgetMain(String name, {super.key, });
  // final String name;
  // final String title;

  @override
  State<BudgetMain> createState() => _BudgetMainState();
}

class _BudgetMainState extends State<BudgetMain> {
  List<Budgets> budgetList = [];
  // late Budgets budgets;
  bool isLoading = false;
  // late final String name;
  late final String moneyText;

  @override
  void initState(){
    super.initState();
    getBudgetsList();
    // name = '0';
    moneyText = '';
  //   budgetData();
  }
  Future getBudgetsList() async {
    setState(() => isLoading = true);
    budgetList = await BudgetDbHelper.budgetinstance.selectAllBudgets();
    setState(() => isLoading = false);
  }
  //
  // Future budgetData() async {
  //   setState(() => isLoading = true);
  //   budgets = await BudgetDbHelper.budgetinstance.budgetData(widget.id);
  //   setState(() => isLoading = false);
  // }



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
                  Text(moneyText, style: TextStyle(fontSize: 35),),
                  // Text('80,000',style: TextStyle(fontSize: 35),),
                  // Text(budgets.budget_money.toString()),
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
                onPressed: () async {
                  await Navigator.of(context).push(                         // ページ遷移をNavigatorで設定
                    MaterialPageRoute(
                        builder: (context) => const BudgetSetting(title: '',)           // 詳細更新画面（元ネタがないから新規登録）を表示するcat_detail_edit.dartへ遷移
                    ),
                  );
                },
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
