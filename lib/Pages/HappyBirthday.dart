import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:ya_veinte/Constants/Responsive.dart';
import 'package:ya_veinte/Constants/Theme.dart';

import 'package:ya_veinte/Widgets/okayButton.dart';

class HappyBirthday extends StatelessWidget
{
    final double width;
    final double height;
    final VoidCallback action;

    const HappyBirthday
    ({
        Key? key,
        required this.width,
        required this.height,
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
                                        child: Transform
                                        (
                                            alignment: Alignment.center,
                                            transform: Matrix4.rotationY(math.pi),
                                            child: Image.asset(
                                                "assets/logo.png",
                                                width: Responsive.counstryIconSize - 10,
                                            )
                                        )
                                    ),
                                    const SizedBox(width: Responsive.cardPadding),
                                    AutoSizeText
                                    (
                                        "No queda más\nque decir...",
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
                                    "¡Muchas felicidades! Vive mucho y disfruta el ahora; ya llegará el momento de preocuparse...",
                                    style: GoogleFonts.quicksand(
                                        fontSize: 20.0,
                                        color: AppColors.lightText,
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 5,
                                    minFontSize: 18.0,
                                )
                            ),
                            Row
                            (
                                children:
                                [
                                    const Expanded(child: SizedBox()),
                                    OkayButton(age: 20 + 1, method: action)
                                ]
                            )
                        ]
                    )
                )
            )
        );
    }
}