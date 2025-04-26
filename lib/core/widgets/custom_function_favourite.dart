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
  Widget build(BuildContext context) {
    return BlocConsumer<AddfovuriteCubit, AddfovuriteState>(
      listener: (context, state) {
        if (state is AddfovuriteSucess) {
          setState(() {
            isactive = true;
          });
          CustomSnackBar.show(context, state.sucessmessage);
        } else if (state is RemovefavSucess) {
          setState(() {
            isactive = false;
          });
          CustomSnackBar.show(context, state.errorModel.errorMessage);
        } else if (state is RemovefavFailure || state is AddfovuriteFailure) {
          setState(() {
            isactive = isactive;
          });
          CustomSnackBar.show(
            context,
            (state is AddfovuriteFailure)
                ? state.errmessage
                : (state as RemovefavFailure).errorModel.errorMessage,
            isError: true,
          );
        }
      },
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            if (isactive) {
              context.read<AddfovuriteCubit>().RemoveFav(
                  itemIdfav: widget.indexIdFav,
                  itemTypefav: widget.itemTypefav,
                  userIdfav: widget.userIdfav);
            } else {
              context.read<AddfovuriteCubit>().addfavourite(
                  itemIdfav: widget.indexIdFav,
                  userIdfav: widget.userIdfav,
                  itemTypefav: widget.itemTypefav);
            }
            print("&&&&&&&&&&&&&&&&&& indexid " + "${widget.indexIdFav}");
            print(" item type fav " + "${widget.itemTypefav}");
            print("Useridfav " + "${widget.userIdfav}");
          },
          icon: Icon(
            Icons.favorite,
            size: 24,
            color: isactive
                ? Colors.red
                : const Color.fromARGB(255, 181, 180, 180),
          ),
        );
      },
    );
  }
}
