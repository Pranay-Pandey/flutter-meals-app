import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/models/model.dart' as model;

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.category});

  final model.Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            category.color.withOpacity(0.9),
            category.color.withOpacity(0.5),
          ],
          begin: Alignment.topCenter  ,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(child: Text(category.title, style: 
      TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        fontFamily: GoogleFonts.abel().fontFamily,
        // color: Colors.white,  
      ),)),
    );
  }
}
