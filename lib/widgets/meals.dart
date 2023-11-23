import 'package:flutter/material.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/screens/mealInfo.dart';

class MealsWidget extends StatelessWidget {
  const MealsWidget(this.meal, {super.key});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => MealInfo(meal)))
        },
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: NetworkImage(meal.imageUrl),
                  height: 240,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.black54,
                    child: Text(
                      meal.title,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(width: 4),
                      Text('${meal.duration} min'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(width: 4),
                      Text(meal.complexity.toString().split('.').last),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(width: 4),
                      Text(meal.affordability.toString().split('.').last),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
