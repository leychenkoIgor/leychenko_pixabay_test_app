import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leychenko_pixabay_test_app/services/i18n/app_localization_delegate.dart';
import 'package:leychenko_pixabay_test_app/services/i18n/bloc/locatization_cubit.dart';
import 'package:leychenko_pixabay_test_app/services/theme/theme.dart';

class AppBarWdg extends StatelessWidget {
  final String? textID;
  final bool isBackButton;

  const AppBarWdg({super.key, this.textID = null, this.isBackButton = false});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      automaticallyImplyLeading: false,
      leading: isBackButton ? IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context); // Повертаємося на попередню сторінку
        },
      ) : null,
      actions: isBackButton ? [
        const SizedBox(
          width: 55,
        )
      ] : null,
      title: Center(
          child: Container(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              decoration: BoxDecoration(
                color: appTheme.appBarTheme.backgroundColor,
                borderRadius: BorderRadius.circular(30), // радіус бордера
              ),
              child: BlocBuilder<LocatizationCubit, LocatizationState>(
                bloc: loclCubit,
                buildWhen: (_, state) {
                  return state is LocatizationInitial || state is LocatizationNewLoaded;
                },
                builder: (context, state) {
                  return textID!=null?Text(appLoc.translate(textID!)):SizedBox();
                },
              ))),
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
    );
  }
}
