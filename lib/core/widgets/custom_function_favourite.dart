import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/favourite/presentation/manager/addfovuritecubit/addfovurite_cubit.dart';

import 'package:sntegpito/core/cache/cache_helper.dart';

class CustomFunctionFavourite extends StatefulWidget {
  const CustomFunctionFavourite({
    super.key,
    required this.indexIdFav,
    required this.itemTypefav,
    required this.userIdfav,
    this.initialIsActive = false,
  });

  final int indexIdFav;
  final String itemTypefav;
  final int userIdfav;
  final bool initialIsActive;

  @override
  State<CustomFunctionFavourite> createState() =>
      _CustomFunctionFavouriteState();
}

class _CustomFunctionFavouriteState extends State<CustomFunctionFavourite> {
  late bool isActive;

  @override
  void initState() {
    super.initState();
    bool? cachedStatus = CacheHelper()
        .getData(key: "${widget.itemTypefav}_${widget.indexIdFav}");

    isActive = cachedStatus ?? widget.initialIsActive;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (isActive) {
          context.read<AddfovuriteCubit>().RemoveFav(
              itemIdfav: widget.indexIdFav,
              itemTypefav: widget.itemTypefav,
              userIdfav: widget.userIdfav);
          CacheHelper().saveData(
              key: "${widget.itemTypefav}_${widget.indexIdFav}", value: false);
        } else {
          context.read<AddfovuriteCubit>().addfavourite(
              itemIdfav: widget.indexIdFav,
              userIdfav: widget.userIdfav,
              itemTypefav: widget.itemTypefav);
          CacheHelper().saveData(
              key: "${widget.itemTypefav}_${widget.indexIdFav}", value: true);
        }
        setState(() {
          isActive = !isActive;
        });
      },
      icon: Icon(
        Icons.favorite,
        color: isActive ? Colors.red : Colors.grey,
      ),
    );
  }
}
