import 'package:budget/budget_main.dart';
import 'package:flutter/material.dart';
import '../model/budgets.dart';
import '../model/budget_db_helper.dart';
import 'main.dart';

class BudgetSetting extends StatefulWidget {
  final Budgets? budgets;
  const BudgetSetting({super.key, required this.title, this.budgets});
  final String title;

  @override
  State<BudgetSetting> createState() => _BudgetSettingState();
}

class _BudgetSettingState extends State<BudgetSetting> {
  int _counter = 0;
  late int budget_id;
  late int budget_money;
  late DateTime budget_date;
  late DateTime budget_created_at;
  late DateTime budget_updated_at;
  late String moneyText;

  @override
  void initState() {
    super.initState();
    budget_id = widget.budgets?.budget_id ?? 0;
    budget_money = widget.budgets?.budget_money ?? 0;
    budget_date = widget.budgets?.budget_date ?? DateTime.now();
    budget_created_at = widget.budgets?.budget_created_at ?? DateTime.now();
    budget_updated_at = widget.budgets?.budget_updated_at ?? DateTime.now();
    moneyText = '';
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // void createOrUpdateBudget() async {
  //   final isUpdate = (widget.budgets != null);
  //   if (isUpdate) {
  //     await updateBudget();
  //   } else {
  //     await createBudget();
  //   }
  //   // Navigator.of(context).pop();
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => BudgetMain(title: '', ))
  //   );
  // }
  //
  // Future updateBudget() async {
  //   final budget = widget.budgets!.copy(
  //       budget_id: budget_id,
  //       budget_money: budget_money,
  //       budget_date: budget_date,
  //       budget_created_at: budget_created_at,
  //       budget_updated_at: budget_updated_at
  //   );
  //   await BudgetDbHelper.budgetinstance.budgetupdate(budget);
  // }
  //
  // Future createBudget() async {
  //   final budget = Budgets(
  //       budget_id: budget_id,
  //       budget_money: budget_money,
  //       budget_date: budget_date,
  //       budget_created_at: budget_created_at,
  //       budget_updated_at: budget_updated_at
  //   );
  //   await BudgetDbHelper.budgetinstance.budgetinsert(budget);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('予算設定', style: TextStyle(fontSize: 25)),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
                width: double.infinity,
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(child: Text('今月の予算を入力してください。', style: TextStyle(fontSize: 20),),
                    ),
                  ],
                )
            ),
            Container(
              width: 300,
              height: 30,
              child: TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.create),
                ),
                keyboardType: TextInputType.number,
                onChanged: (text){
                  moneyText = text;
                  print(text);
                },
              ),
            ),
            SizedBox(
                height : 100
            ),
            Container(
              width: 100,
              height: 50,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    // print(widget);
                    Navigator.push(
                      context,// ページ遷移をNavigatorで設定
                      MaterialPageRoute(
                          builder: (context) => BudgetMain(moneyText),          // 詳細更新画面（元ネタがないから新規登録）を表示するcat_detail_edit.dartへ遷移
                      ),
                    );
                  },
                  // onPressed:,
                  child: Text('決定'),
                  style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontSize: 20),
                      primary: Colors.orangeAccent,
                      side: BorderSide(
                        color: Colors.black,
                        width: 1,
                      ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment'
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
