// import 'dart:ui';

// import 'subcategory.dart';

// class Category {
//   // int? id;
//   // String? name;
//   List<Category>? color;
//   Color? backgroundColor;
//   bool? isSelected = true;
//   // int? amount;
//   // List<CategoryPart>? parts;
//   // List<Category>? subCategories;

//   Category( 
//     {
//       // this.id,
//       // this.name, 
//       this.color,
//       this.backgroundColor,
//       this.isSelected
//       // this.amount,
//       // this.subCategories,
//       // this.parts
//     }
//   );

// }
class Category{
  int? id;
  String? tittle;

  categoryMap(){
    var mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['tittle'] = tittle;

    return mapping;
  }
}
