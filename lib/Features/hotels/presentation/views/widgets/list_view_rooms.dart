import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/hotels/presentation/manager/cubit/roomshotel_cubit.dart';
import 'package:sntegpito/Features/hotels/presentation/manager/cubit/roomshotel_state.dart';
import 'package:sntegpito/Features/hotels/presentation/views/widgets/custom_card_room.dart';

class ListViewRooms extends StatelessWidget {
  const ListViewRooms({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: BlocBuilder<RoomsHotelCubit, HotelRoomsByIdState>(
        builder: (context, state) {
          if (state is HotelRoomsByIdLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HotelRoomsByIdFailure) {
            return Center(child: Text("Error: ${state.errmessage}"));
          } else if (state is HotelRoomsByIdSuccess) {
            return ListView.builder(
              shrinkWrap: true,
              //physics: NeverScrollableScrollPhysics(),
              itemCount: state.hotelroomsmodel.length,
              itemBuilder: (context, index) {
                return  Padding(
                  padding:const EdgeInsets.only(bottom: 4),
                  child: CustomCardRoom(roomsModel: state.hotelroomsmodel[index],),
                );
              },
            );
          }
          return const Text('No Rooms Available');
        },
      ),
    );
  }
}
