import 'package:flutter/material.dart';
import 'package:sntegpito/Features/hotels/presentation/views/widgets/list_view_rooms.dart';
import 'package:sntegpito/core/utils/styles.dart';

class RoomsViewBody extends StatelessWidget {
  const RoomsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Available rooms (20)',
                style: Styles.textStyle22.copyWith(
                  color: const Color(0xff121212),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const ListViewRooms(),
            ],
          ),
        ),
      ),
    );
  }
}
