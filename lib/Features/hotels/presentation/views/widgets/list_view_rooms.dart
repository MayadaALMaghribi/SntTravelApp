import 'package:flutter/material.dart';
import 'package:sntegpito/Features/hotels/presentation/views/widgets/custom_card_room.dart';

class ListViewRooms extends StatelessWidget {
  const ListViewRooms({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        shrinkWrap: true,
        //physics: NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 4),
            child: CustomCardRoom(),
          );
        },
      ),
    );
  }
}
