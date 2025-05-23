import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder:
          (ctx, index) => Dismissible(
            key: ValueKey(expenses[index]),
            direction: DismissDirection.endToStart,
            background: Container(), //LTR
            secondaryBackground: Container(
              //RTL
              color: Theme.of(context).colorScheme.error.withOpacity(0.75),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.symmetric(
                horizontal: Theme.of(context).cardTheme.margin!.horizontal,
              ),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) => onRemoveExpense(expenses[index]),
            child: ExpenseItem(expenses[index]),
          ),
    );
  }
}
