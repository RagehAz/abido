import 'package:flutter/material.dart';
import 'package:abido/core/layout/the_layout.dart';
import 'package:abido/core/shared_components/super_box/super_box.dart';
import 'package:abido/core/shared_components/super_text/super_text.dart';
import 'package:abido/core/theme/colorz.dart';
import 'package:abido/core/theme/fonts.dart';
import 'package:abido/core/theme/iconz.dart';
import 'package:abido/core/utilities/contextual.dart';

class HomeScreen extends StatelessWidget {
  // --------------------------------------------------------------------------
  const HomeScreen({super.key});
  // -----------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    // --------------------
    return TheLayout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const SuperBox(
            height: 100,
            width: 100,
            icon: Iconz.icon,
            color: Colorz.abidoGrisDark4,
            iconSizeFactor: 0.7,
            corners: 50,
            margins: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          ),

          SuperText(
            boxWidth: context.screenWidth,
            centered: false,
            appIsLTR: true,
            text: 'Abido',
            maxLines: 4,
            margins: const EdgeInsets.symmetric(horizontal: 20),
            textHeight: 100,
            lineSpacingFactor: 0.6,
            font: InfinityFont.montreal,
          ),

          SuperText(
            boxWidth: context.screenWidth,
            centered: false,
            appIsLTR: true,
            text: 'You Imagine.\nI Create.',
            maxLines: 5,
            margins: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            textHeight: 30,
            font: InfinityFont.regular,
          ),

        ],
      ),
    );
    // --------------------
  }

  // -----------------------------------------------------------------------------
}
