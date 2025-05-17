import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/Booking_activity_cart/presentation/manager/add_cart/cart_cubit.dart';
import 'package:sntegpito/core/cache/cache_helper.dart';

class CustomFunctionCart extends StatefulWidget {
  const CustomFunctionCart({
    super.key,
    required this.activityId,
    required this.userId,
    required this.numOfGeusts,
    this.initialIsActive = false,
  });

  final int activityId;
  final int userId;
  final int numOfGeusts;
  final bool initialIsActive;

  @override
  State<CustomFunctionCart> createState() => _CustomFunctionFavouriteState();
}

class _CustomFunctionFavouriteState extends State<CustomFunctionCart> {
  late bool isActive;

  @override
  void initState() {
    super.initState();
    bool? cachedStatus = CacheHelper()
        .getData(key: "${widget.numOfGeusts}_${widget.activityId}");

    isActive = cachedStatus ?? widget.initialIsActive;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (isActive) {
          context.read<CartCubit>().removeFromCart(
                activityId: widget.activityId,
                userId: widget.userId,
                context: context,
              );
          CacheHelper().saveData(
              key: "${widget.numOfGeusts}_${widget.activityId}", value: false);
        } else {
          context.read<CartCubit>().addToCart(
                activityId: widget.activityId,
                userId: widget.userId,
                numOfGeusts: widget.numOfGeusts,
                context: context,
              );
          CacheHelper().saveData(
              key: "${widget.numOfGeusts}_${widget.activityId}", value: true);
        }
        setState(() {
          isActive = !isActive;
        });
      },
      icon: Icon(
        Icons.add_location_outlined,
        color: isActive ? Colors.blue : const Color.fromARGB(255, 82, 82, 82),
      ),
    );
  }
}
