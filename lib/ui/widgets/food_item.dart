import 'package:flutter/material.dart';

class FoodItem extends StatelessWidget {
  final String food;
  final bool value;
  final void Function(bool?)? onChanged;

  const FoodItem({
    required this.food,
    required this.value,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        food,
        style: const TextStyle(fontSize: 18),
      ),
      value: value,
      onChanged: onChanged,
    );
  }
}
