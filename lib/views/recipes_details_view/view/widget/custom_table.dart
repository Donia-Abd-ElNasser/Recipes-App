import 'package:flutter/material.dart';
import 'package:recipes_app/views/recipes_details_view/model/recipe_details.dart';

class CustomTable extends StatelessWidget {
  const CustomTable({super.key, required this.ingredientsList});
final List<Ingredient> ingredientsList ;
  @override
  Widget build(BuildContext context) {
    return Table(
  border: TableBorder.all(color: Colors.grey),
  columnWidths: const {
    0: FlexColumnWidth(3),
    1: FlexColumnWidth(1.5),
  },
  children: [
    // Header row
    TableRow(
      decoration: BoxDecoration(color: Colors.grey.shade800),
      children: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Ingredient', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Measure', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    ),
    ...ingredientsList.map(
      (ing) => TableRow(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(ing.name),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(ing.measure),
          ),
        ],
      ),
    ),
  ],
)
;
  }
}