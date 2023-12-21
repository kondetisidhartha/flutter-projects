import 'package:flutter/material.dart';
import 'package:shopping_list/data/dummy_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: groceryItems
          .map((groceryObject) => Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        SizedBox(
                          width: 16.0,
                          height: 16.0,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: groceryObject.category.categoryColor),
                          ),
                        ),
                        const SizedBox(width: 30),
                        Text(groceryObject.name,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground)),
                      ]),
                      Text(groceryObject.quantity.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground))
                    ]),
              ))
          .toList(),
      // child: Text(
      //   "Your Groceries",
      //   style: Theme.of(context)
      //       .textTheme
      //       .bodyMedium!
      //       .copyWith(color: Theme.of(context).colorScheme.onBackground),
      // ),
    );
  }
}
