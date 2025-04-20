import 'package:flutter/material.dart';
import 'package:sntegpito/Features/filter/presentation/views/widgets/build_filter_form.dart';

class FilterViewBody extends StatelessWidget {
  const FilterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent, // عشان يخلي الخلفيه الى قبلها شفافه
        child: Container(
          height:
              MediaQuery.of(context).size.height * 0.8, // 80 في الميه من الطول
          width:
              MediaQuery.of(context).size.width * 0.9, // 90 في الميه من العرض
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const BuildFilterForm(),
        ),
      ),
    );
  }
}
