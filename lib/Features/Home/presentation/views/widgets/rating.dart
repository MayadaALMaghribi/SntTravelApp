import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Rating extends StatefulWidget {
  const Rating({super.key});

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {

   @override
  void initState() {
    super.initState();
    _getRating(); 
  }

   double _rating=0;
     void _SetRating(double rating) async{
      SharedPreferences spref= await SharedPreferences.getInstance();
      spref.setDouble("Rating", rating);

     }
     void _getRating()async{
      SharedPreferences spref=await SharedPreferences.getInstance();
     _rating=spref.getDouble("Rating")??0;
     }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
                RatingBar.builder(
                initialRating: _rating,
                maxRating: 4,
                minRating: 1,
                itemCount: 4,
                itemSize: 18,
                itemBuilder: (context,index){
                 return const Icon(
                  Icons.star,
                  color: Colors.amber,
                 );
                   
                }, 
                onRatingUpdate:(rating){
                  setState(() {
                    _rating=rating;
                  });
                  _SetRating(_rating);
                  print(_rating);
                }
                
                ),
                Text(
                  "$_rating",
                   style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                  ),
                ),
             
    ],);
  }
}