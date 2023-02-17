import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseItem extends StatelessWidget {
  final String food;
  final String value;
  final void Function()? onChangedLess;
  final void Function()? onChangedPlus;

  const ChooseItem({
    required this.food,
    required this.value,
    required this.onChangedLess,
    required this.onChangedPlus,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: Get.height * 0.05,
          child: Center(
            child: Text(
              food,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),
        SizedBox(
          height: Get.height * 0.05,
          child: Center(
            child: Row(
              children: [
                IconButton(
                  onPressed: onChangedLess,
                  icon: const Icon(Icons.remove, color: Colors.red),
                  iconSize: 28,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                IconButton(
                  onPressed: onChangedPlus,
                  icon: const Icon(Icons.add, color: Colors.green),
                  iconSize: 28,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
