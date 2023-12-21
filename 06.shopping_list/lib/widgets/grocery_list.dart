import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_list/models/grocery_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key, required this.groceryItems});

  final List<GroceryItem> groceryItems;

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  void _removeItem(GroceryItem item) async {
    final itemIndex = widget.groceryItems.indexOf(item);
    setState(() {
      widget.groceryItems.remove(item);
    });
    final url = Uri.https('flutter-prep-316f3-default-rtdb.firebaseio.com',
        'shopping-list/${item.id}.json');
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      setState(() {
        widget.groceryItems.insert(itemIndex, item);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.groceryItems.length,
        itemBuilder: (ctx, index) => Dismissible(
              key: ValueKey(widget.groceryItems[index].id),
              background: Container(
                color: Theme.of(context).colorScheme.error.withOpacity(0.75),
              ),
              onDismissed: (direction) async {
                _removeItem(widget.groceryItems[index]);
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
