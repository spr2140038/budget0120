import 'budget_db_helper.dart';
import 'package:intl/intl.dart';

// Budgetsテーブルの定義
class Budgets {
  int budget_id;
  int budget_money;
  DateTime budget_date;
  DateTime budget_created_at;
  DateTime budget_updated_at;

  Budgets({
    required this.budget_id,
    required this.budget_money,
    required this.budget_date,
    required this.budget_created_at,
    required this.budget_updated_at,
  });

// 更新時のデータを入力項目からコピーする処理
  Budgets copy({
    int? budget_id,
    int? budget_money,
    DateTime? budget_date,
    DateTime? budget_created_at,
    DateTime? budget_updated_at,
  }) =>
      Budgets(
        budget_id: budget_id ?? this.budget_id,
        budget_money: budget_money ?? this.budget_money,
        budget_date: budget_date ?? this.budget_date,
        budget_created_at: budget_created_at ?? this.budget_created_at,
        budget_updated_at: budget_updated_at ?? this.budget_updated_at,
      );

  static Budgets fromJson(Map<String, Object?> json) =>
      Budgets(
        budget_id: json[columnBudgetId] as int,
        budget_money: json[columnBudgetMoney] as int,
        budget_date: DateTime.parse(json[columnBudgetDate] as String),
        budget_created_at: DateTime.parse(
            json[columnBudgetCreatedAt] as String),
        budget_updated_at: DateTime.parse(
            json[columnBudgetUpdatedAt] as String),
      );

  Map<String, Object> toJson() =>
      {
        columnBudgetMoney: budget_money,
        columnBudgetDate: DateFormat('yyyy-MM-dd HH:mm:ss').format(
            budget_date),
        columnBudgetCreatedAt: DateFormat('yyyy-MM-dd HH:mm:ss').format(
            budget_created_at),
        columnBudgetUpdatedAt: DateFormat('yyyy-MM-dd HH:mm:ss').format(
            budget_updated_at),
      };
}