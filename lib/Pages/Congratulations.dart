import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:ya_veinte/Constants/Responsive.dart';
import 'package:ya_veinte/Constants/Theme.dart';

import 'package:ya_veinte/Widgets/okayButton.dart';

class Congratulations extends StatelessWidget
{
    final double width;
    final double height;
    final String countryIconPath;
    final String countryName;
    final String congratulationsMessage;
    final int age;
    final VoidCallback action;

    const Congratulations
    ({
        Key? key,
        required this.width,
        required this.height,
        required this.countryIconPath,
        required this.countryName,
        required this.congratulationsMessage,
        required this.age,
        required this.action
    })
    : super(key: key);

    @override
    Widget build(BuildContext context)
    {
        return Center
        (
            child: Container
            (
                width: width,
                height: height,

                decoration: BoxDecoration
                (
                    color: AppColors.card,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow:
                    [
                        BoxShadow
                        (
                            color: Colors.grey.withOpacity(0.54),
                            offset: const Offset(0, 8),
                            blurRadius: 24.0,
                            spreadRadius: -6
                        )
                    ]
                ),
                child: Padding
                (
                    padding: const EdgeInsets.all(Responsive.cardPadding),
                    child: Column
                    (
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:
                        [
                            Row
                            (
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,

                                children:
                                [
                                    Container
                                    (
                                        decoration: BoxDecoration
                                        (
                                            boxShadow:
                                            [
                                                BoxShadow
                                                (
                                                    color: Colors.grey.withOpacity(0.60),
                                                    offset: const Offset(6, 6),
                                                    blurRadius: 11.0,
                                                    spreadRadius: -4
                                                )
                                            ]
                                        ),
                                        child: ClipRRect
                                        (
                                            borderRadius: BorderRadius.circular(8.0),
                                            child: SvgPicture.asset(
                                                countryIconPath,
                                                package: "country_icons",
                                                width: Responsive.counstryIconSize,
                                            )
                                        )
                                    ),
                                    const SizedBox(width: Responsive.cardPadding),
                                    AutoSizeText
                                    (
                                        "En $countryName\nse dice...",
                                        style: GoogleFonts.oswald(
                                            fontSize: 20.0,
                                            color: AppColors.darkText,
                                            fontWeight: FontWeight.bold
                                        ),
                                        maxLines: 2,
                                        minFontSize: 14,
                                    )
                                ]
                            ),
                            Padding
                            (
                                padding: const EdgeInsets.symmetric(horizontal: Responsive.cardPadding),
                                child: AutoSizeText
                                (
                                    congratulationsMessage,
                                    style: GoogleFonts.quicksand(
                                        fontSize: 20.0,
                                        color: AppColors.lightText,
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    minFontSize: 18.0,
                                )
                            ),
                            Row
                            (
                                children:
                                [
                                    const Expanded(child: SizedBox()),
                                    OkayButton(age: age, method: action)
                                ]
                            )
                        ]
                    )
                )
            )
        );
    }
}