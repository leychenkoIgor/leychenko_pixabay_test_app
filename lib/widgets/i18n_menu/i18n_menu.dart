import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:leychenko_pixabay_test_app/resources/resources.dart';
import 'package:leychenko_pixabay_test_app/services/i18n/app_localization_delegate.dart';

class I18nMenu extends StatelessWidget {
  I18nMenu({Key? key}) : super(key: key);
  late CircularMenu wgCircularMenu;

  @override
  Widget build(BuildContext context) {
    wgCircularMenu = CircularMenu(
        key: GlobalKey(),
        alignment: Alignment.bottomRight,
        toggleButtonColor: Colors.blueGrey.withOpacity(0.8),
        animatedIconCall: (AnimationController _animationController) {
          return AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: _animationController.status == AnimationStatus.dismissed
                  ? Container(
                      width: 30,
                      height: 30,
                      child: SvgPicture.asset(
                        key: ValueKey<int>(1),
                        width: 30,
                        colorFilter:
                            ColorFilter.mode(Colors.white, BlendMode.srcIn),
                        IconSvg.languageIcon, //'assets/img/heart-icon.svg',
                      ),
                    )
                  : Container(
                      width: 30,
                      height: 30,
                      child: Icon(
                        key: ValueKey<int>(2),
                        size: 30,
                        Icons.close,
                        color: Colors.white,
                      ),
                    ));
        },
        items: [
          CircularMenuItem(
              // icon: LanguageIcons.ukrainian_language_code_icon,
              wgIcon: SvgPicture.asset(
                width: 30,

                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                IconSvg.frLanguageIcon, //'assets/img/heart-icon.svg',
              ),
              color: Colors.blueGrey.withOpacity(0.8),
              onTap: () {
                loclCubit.setLocaleFr();
                wgCircularMenu.key!.currentState!.reverseAnimation();
              }),
          CircularMenuItem(
              // icon: LanguageIcons.ukrainian_language_code_icon,
              wgIcon: SvgPicture.asset(
                width: 30,
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                IconSvg.plLanguageIcon, //'assets/img/heart-icon.svg',
              ),
              color: Colors.blueGrey.withOpacity(0.8),
              onTap: () {
                loclCubit.setLocalePl();
                wgCircularMenu.key!.currentState!.reverseAnimation();
              }),
          CircularMenuItem(
              wgIcon: SvgPicture.asset(
                width: 30,
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                IconSvg.ukLanguageIcon, //'assets/img/heart-icon.svg',
              ),
              color: Colors.blueGrey.withOpacity(0.8),
              onTap: () {
                loclCubit.setLocaleUk();
                wgCircularMenu.key!.currentState!.reverseAnimation();
              }),
          CircularMenuItem(
              // icon: LanguageIcons.ukrainian_language_code_icon,
              wgIcon: SvgPicture.asset(
                width: 30,
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                IconSvg.enLanguageIcon, //'assets/img/heart-icon.svg',
              ),
              color: Colors.blueGrey.withOpacity(0.8),
              onTap: () {
                loclCubit.setLocaleEn();
                wgCircularMenu.key!.currentState!.reverseAnimation();
              }),
        ]);

    return wgCircularMenu;
  }
}
