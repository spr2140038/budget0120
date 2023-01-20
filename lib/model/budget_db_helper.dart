import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'budgets.dart';

const String columnBudgetId = '_budget_id';
const String columnBudgetMoney = 'budget_money';
const String columnBudgetDate = 'budget_date';
const String columnBudgetCreatedAt = 'budget_created_at';
const String columnBudgetUpdatedAt = 'budget_updated_at';

const List<String> budgetcolumns = [
  columnBudgetId,
  columnBudgetMoney,
  columnBudgetDate,
  columnBudgetCreatedAt,
  columnBudgetUpdatedAt,
];

class BudgetDbHelper {
  // DbHelperをinstance化する
  static final BudgetDbHelper budgetinstance = BudgetDbHelper._createInstance();
  static Database? _budgetdatabase;

  BudgetDbHelper._createInstance();

  // databaseをオープンしてインスタンス化する
  Future<Database> get budgetdatabase async {
    return _budgetdatabase ??= await _initDB(); // 初回だったら_initDB()=DBオープンする
  }

  // データベースをオープンする
  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'budgets.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onBudgetCreate, // cats.dbがなかった時の処理を指定する（DBは勝手に作られる）
    );
  }

  Future _onBudgetCreate(Database database, int version) async {
    //catsテーブルをcreateする
    await database.execute('''
      CREATE TABLE budgets(
        _budget_id INTEGER PRIMARY KEY AUTOINCREMENT,
        budget_money INTEGER,
        budget_date INTEGER,
        budget_created_at TEXT,
        budget_updated_at TEXT
      )
    ''');
  }

  Future<List<Budgets>> selectAllBudgets() async {
    final db = await budgetinstance.budgetdatabase;
    final budgetsData = await db.query('budgets');          // 条件指定しないでcatsテーブルを読み込む

    return budgetsData.map((json) => Budgets.fromJson(json)).toList();    // 読み込んだテーブルデータをListにパースしてreturn
  }

  Future<Budgets> budgetData(int id) async {
    final db = await budgetinstance.budgetdatabase;
    var budget = [];
    budget = await db.query(
      'budgets',
      columns: budgetcolumns,
      where: '_budget_id = ?',                     // 渡されたidをキーにしてcatsテーブルを読み込む
      whereArgs: [id],
    );
    return Budgets.fromJson(budget.first);      // 1件だけなので.toListは不要
  }

  Future budgetinsert(Budgets budgets) async {
    final db = await budgetdatabase;
    return await db.insert(
        'budgets',
        budgets.toJson()                         // cats.dartで定義しているtoJson()で渡されたcatsをパースして書き込む
    );
  }

  Future budgetupdate(Budgets budgets) async {
    final db = await budgetdatabase;
    return await db.update(
      'budgets',
      budgets.toJson(),
      where: '_budget_id = ?',                   // idで指定されたデータを更新する
      whereArgs: [budgets.budget_id],
    );
  }

  Future budgetdelete(int id) async {
    final db = await budgetinstance.budgetdatabase;
    return await db.delete(
      'budgets',
      where: '_budget_id = ?',                   // idで指定されたデータを削除する
      whereArgs: [id],
    );
  }
}