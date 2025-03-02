import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/profile/presentation/views/side_bar_view.dart';
import 'package:sntegpito/Features/Home/presentation/views/widgets/button_search.dart';
import 'package:sntegpito/Features/profile/presentation/manager/get%20cubit/get_cubit.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  context.read<GetCubit>().getuserprofile();
                  return const SideBarView();
                }));
              },
              child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 6,
                        )
                      ]),
                  child: const Icon(
                    Icons.sort_rounded,
                    size: 22,
                  ))),
          InkWell(
              onTap: () {
                showSearch(context: context, delegate: MySearchDelegate());
              },
              child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 6,
                        )
                      ]),
                  child: const Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 22,
                  )))
        ],
      ),
    );
  }
}
