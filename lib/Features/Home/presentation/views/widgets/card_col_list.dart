import 'package:flutter/material.dart';
import 'package:sntegpito/Features/Home/data/model/category_model.dart';
import 'package:sntegpito/Features/Home/presentation/views/widgets/rating.dart';


class CardColList extends StatelessWidget {
  const CardColList({super.key,required this.colmodel});
        final  CategoryModel colmodel;
  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
              GestureDetector(
              
                child: Container(
              height: 250,
              decoration: BoxDecoration(
                color:Colors.black,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image:AssetImage(colmodel.image),
                  fit:BoxFit.cover,
                  opacity: 0.8,
                  ),
              ),
             ),
              ),
             Padding(
              padding: const EdgeInsets.only(top:10),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    colmodel.categoryname,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  // const Icon(
                  //   Icons.more_vert_outlined,
                  //   size: 30,    
                  //   ),
              ],
              ),

             ),
             const SizedBox(height: 5,),
              const Rating(),
              const SizedBox(height: 5,)
              
          ],
      );
  }
}