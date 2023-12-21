import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key, required this.groceryItems});

  final List<GroceryItem> groceryItems;

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.groceryItems.length,
        itemBuilder: (ctx, index) => Dismissible(
              key: ValueKey(widget.groceryItems[index].name),
              background: Container(
                color: Theme.of(context).colorScheme.error.withOpacity(0.75),
              ),
              onDismissed: (direction) {
                setState(() {
                  widget.groceryItems.remove(widget.groceryItems[index]);
                });
              },
              child: ListTile(
                leading: Container(
                  width: 24,
                  height: 24,
                  color: widget.groceryItems[index].category.categoryColor,
                ),
                title: Text(widget.groceryItems[index].name),
                trailing: Text(widget.groceryItems[index].quantity.toString()),
              ),
            ));
  }
}
