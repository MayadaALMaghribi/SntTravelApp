import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sntegpito/Features/Booking_activity_cart/presentation/views/booking_activity_view.dart';
import 'package:sntegpito/Features/Home/presentation/views/home_view.dart';
import 'package:sntegpito/Features/favourite/presentation/views/favourite_view.dart';
import 'package:sntegpito/Features/profile/presentation/views/side_bar_view.dart';
import 'package:sntegpito/Features/profile/presentation/manager/get%20cubit/get_cubit.dart';

class HomeBottomBar extends StatefulWidget {
  const HomeBottomBar({super.key});

  @override
  State<HomeBottomBar> createState() => _HomeBottomBarState();
}

class _HomeBottomBarState extends State<HomeBottomBar> {
  int _selectedIndex = 2;
  final List<Widget> _pages = [
    const SideBarView(),
    const FavouriteView(),
    const HomeView(),
    const BookingActivityView(),
    //const Notifaction(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: CurvedNavigationBar(
          animationDuration: const Duration(milliseconds: 300),
          items: List.generate(_pages.length, (index) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                // لو الأيقونة تم اختيارها، نعمل لها تدوير مع تغيير الحجم
                return RotationTransition(
                  turns: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
                  child: ScaleTransition(
                    scale:
                        Tween<double>(begin: 1.0, end: 0.8).animate(animation),
                    child: child,
                  ),
                );
              },
              child: Icon(
                _getIconByIndex(index),
                key: ValueKey<int>(index),
                size: _selectedIndex == index ? 32 : 30, // تقليل حجم الأيقونة
                color: _selectedIndex == index ? Colors.blue : Colors.black,
              ),
            );
          }),
          index: _selectedIndex,
          backgroundColor: Colors.transparent,
          onTap: (index) {
            // Don't do anything if the same icon is clicked
            if (_selectedIndex == index) {
              return;
            }

            setState(() {
              _selectedIndex = index;
              if (_selectedIndex == 0) {
                context.read<GetCubit>().getuserprofile();
              }
            });
          },
        ));
  }

  // دالة لتحديد الأيقونة حسب الفهرس
  IconData _getIconByIndex(int index) {
    switch (index) {
      case 0:
        return Icons.person;
      case 1:
        return Icons.favorite;
      case 2:
        return Icons.home;
      case 3:
        return Icons.event;
      default:
        return Icons.home;
    }
  }
}
