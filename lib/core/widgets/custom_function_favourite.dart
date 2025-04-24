import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/favourite/presentation/manager/addfovuritecubit/addfovurite_cubit.dart';
import 'package:sntegpito/core/widgets/custom_snak_bar.dart';

class CustomFunctionFavourite extends StatefulWidget {
  const CustomFunctionFavourite(
      {super.key,
      required this.indexIdFav,
      required this.itemTypefav,
      required this.userIdfav});

  final int indexIdFav;
  final String itemTypefav;
  final int userIdfav;

  @override
  State<CustomFunctionFavourite> createState() =>
      _CustomFunctionFavouriteState();
}

bool isactive = false;

class _CustomFunctionFavouriteState extends State<CustomFunctionFavourite> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddfovuriteCubit, AddfovuriteState>(
      listener: (context, state) {
        if (state is AddfovuriteSucess) {
          setState(() {
            isactive = true;
          });
          CustomSnackBar.show(context, state.sucessmessage);
        } else if (state is AddfovuriteFailure) {
          setState(() {
            isactive = false;
          });
          CustomSnackBar.show(context, state.errmessage, isError: true);
        }
      },
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            context.read<AddfovuriteCubit>().addfavourite(
                itemIdfav: widget.indexIdFav,
                itemTypefav: widget.itemTypefav,
                userIdfav: widget.userIdfav);
            print("11111111111111111111111111111" + "${widget.indexIdFav}");
            print(widget.itemTypefav);
            print(widget.userIdfav);
          },
          icon: Icon(
            Icons.favorite,
            color: isactive
                ? Colors.red
                : const Color.fromARGB(255, 181, 180, 180),
          ),
        );
      },
    );
  }
}
