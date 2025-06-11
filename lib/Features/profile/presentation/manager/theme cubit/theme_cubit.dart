// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sntegpito/core/cache/cache_helper.dart';
// import 'package:sntegpito/core/utils/constant.dart';

// class ThemeCubit extends Cubit<ThemeMode> {
//   ThemeCubit() : super(ThemeMode.light) {
//     loadSaveTheme();
//   }
//   void loadSaveTheme() {
//     final isDark = CacheHelper().getData(key: Constants.isDark) ?? false;
//     emit(isDark ? ThemeMode.dark : ThemeMode.light);
//   }

//   void changeTheme() {
//     if (state == ThemeMode.dark) {
//       CacheHelper().saveData(key: Constants.isDark, value: false);
//       emit(ThemeMode.light);
//     } else if (state == ThemeMode.light) {
//       CacheHelper().saveData(key: Constants.isDark, value: true);
//       emit(ThemeMode.dark);
//     }
//   }
// }
 // SwitchListTile(
                            //   title: Text(
                            //     context.watch<ThemeCubit>().state ==
                            //             ThemeMode.dark
                            //         ? "Light Mode"
                            //         : "Dark Mode",
                            //     style: TextStyle(
                            //       fontSize: 20,
                            //       fontWeight: FontWeight.w700,
                            //     ),
                            //   ),
                            //   secondary: IconButton(
                            //     icon: Icon(
                            //       context.watch<ThemeCubit>().state ==
                            //               ThemeMode.dark
                            //           ? Icons.dark_mode
                            //           : Icons.light_mode,
                            //     ),
                            //     onPressed: () {
                            //       context.read<ThemeCubit>().changeTheme();
                            //     },
                            //   ),
                            //   value: context.watch<ThemeCubit>().state ==
                            //       ThemeMode.dark,
                            //   onChanged: (_) {
                            //     context.read<ThemeCubit>().changeTheme();
                            //   },
                            // ),
