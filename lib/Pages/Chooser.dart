import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:ya_veinte/Constants/Responsive.dart';
import 'package:ya_veinte/Constants/Theme.dart';

class Chooser extends StatelessWidget
{
    final double width;
    final double height;

    final String firstCountryIconPath;
    final String firstCountryLanguageCode;

    final String secondCountryIconPath;
    final String secondCountryLanguageCode;

    final VoidCallback firstAction;
    final VoidCallback secondAction;

    const Chooser
    ({
        Key? key,
        required this.width,
        required this.height,
        required this.firstCountryIconPath,
        required this.firstCountryLanguageCode,
        required this.secondCountryIconPath,
        required this.secondCountryLanguageCode,
        required this.firstAction,
        required this.secondAction
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

                padding: const EdgeInsets.only(top: 80),

                child: Center
                (
                    child: GridView
                    (
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount
                        (
                            crossAxisCount: 2,
                            crossAxisSpacing: 14,
                        ),

                        children:
                        [
                            CountryButton
                            (
                                countryIconPath: firstCountryIconPath,
                                counstryLanguageCode: firstCountryLanguageCode,
                                action: firstAction
                            ),

                            CountryButton
                            (
                                countryIconPath: secondCountryIconPath,
                                counstryLanguageCode: secondCountryLanguageCode,
                                action: secondAction
                            )
                        ]
                    )
                )
            )
        );
    }
}

class CountryButton extends StatelessWidget
{
    final String countryIconPath;
    final String counstryLanguageCode;
    final VoidCallback action;

    const CountryButton
    ({
        Key? key,
        required this.countryIconPath,
        required this.counstryLanguageCode,
        required this.action
    })
    : super(key: key);

    @override
    Widget build(BuildContext context) 
    {
        return Container
        (
            child: GestureDetector
            (
                onTap: action,
                child: Container
                (
                    decoration: BoxDecoration
                    (
                        color: AppColors.card,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(width: 0.4, color: AppColors.lightText.withOpacity(0.8))
                    ),
                    child: Center
                    (
                        child: Container
                        (
                            width: Responsive.counstryIconSize,
                            height: Responsive.counstryIconSize - 24,

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
                                borderRadius: BorderRadius.circular(10.0),
                                child: SvgPicture.asset(
                                    countryIconPath,
                                    package: "country_icons",
                                )
                            ),
                        )
                    )
                )
            )
        );
    }
}