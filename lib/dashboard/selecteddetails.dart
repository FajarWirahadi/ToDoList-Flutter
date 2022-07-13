import 'package:flutter/material.dart';
import 'package:todolist/models/category.dart';
import 'package:todolist/models/subcategory.dart';
import 'package:todolist/theme.dart';
import 'package:path/path.dart' as path;
 
//  class SelectedDetails extends StatefulWidget {

//    Category? selectedCategory;
//    CategoryPart? categoryPart;
//    SelectedDetails ({this.selectedCategory, this.categoryPart});
   
//    @override
//    _SelectedDetailsState createState() => _SelectedDetailsState();
//  }
 
//  class _SelectedDetailsState extends State<SelectedDetails> {
   
//    @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     setState(() { 
//     });
//   }
   
//    @override
//    Widget build(BuildContext context) {
//      return Scaffold(
//        appBar: AppBar(
//         backgroundColor: redColor,
//         elevation: 0.0,
//         centerTitle: true
//       ),
//        body: Container(
//          child: Column(
//            children: [
//              Expanded(
//                child: ListView.builder(
//                  itemCount: widget.selectedCategory!.parts!.length,
//                  itemBuilder: (context, index) {
//                    return Column(
//                      children: [
//                        Text(widget.selectedCategory!.parts![index].toString())
//                      ],
//                    );
//                  }
//                )
//              ),
//            ],
//          ),
//        ),
//      );
//    }
//  }

// class SelectedDetails extends StatelessWidget {

//   Category? selectedCategory;
//   SelectedDetails ({this.selectedCategory});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           Text(this.selectedCategory!.parts![1].parts.toString())
//         ],
//       ),
//     );
//   }
// }