import 'package:flutter/material.dart';

TextStyle bodyMediumOnBackground(BuildContext context) {
  return Theme.of(context)
      .textTheme
      .bodyMedium!
      .copyWith(color: Theme.of(context).colorScheme.onBackground);
}

TextStyle titleMediumOnBackground(BuildContext context) {
  return Theme.of(context)
      .textTheme
      .titleMedium!
      .copyWith(color: Theme.of(context).colorScheme.onBackground);
}
