import 'package:expense_tracker/custom_widgets/add_expense.dart';
import 'package:expense_tracker/custom_widgets/chart/chart.dart';
import 'package:expense_tracker/custom_widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: "Flutter Book",
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "McDonalds",
        amount: 7.99,
        date: DateTime.now(),
        category: Category.food),
  ];

  void _updateExpenses(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(expenseIndex, expense);
              });
            }),
        content: const Text("Expense deleted."),
      ),
    );
  }

  void _addExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => AddExpense(updateExpense: _updateExpenses),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    // print(MediaQuery.of(context).size.height);
    Widget mainContent = const Center(
      child: Text("No expenses found!"),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Flutter Expense Tracker"),
        actions: [
          IconButton(
            onPressed: _addExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: deviceWidth < 600
          ? Column(
              children: [
                Chart(
                  expenses: _registeredExpenses,
                ),
                Expanded(
                  child: mainContent,
                ),
              ],
            )
          : Row(children: [
              Expanded(
                child: Chart(
                  expenses: _registeredExpenses,
                ),
              ),
              Expanded(
                child: mainContent,
              ),
            ]),
    );
  }
}
