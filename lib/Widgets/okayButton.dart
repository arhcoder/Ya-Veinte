import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ya_veinte/Constants/Theme.dart';

class OkayButton extends StatelessWidget
{
    final int age;
    final VoidCallback method;

    const OkayButton({Key? key, required this.age, required this.method}) : super(key: key);

    @override
    Widget build(BuildContext context)
    {
        return FloatingActionButton
        (
            mini: true,
            backgroundColor: AppColors.main,
            tooltip: "Okay",

            onPressed: method,

            child: age == 20 + 1?
            const Icon
            (
                Icons.check
            )
            : Text
            (
                age.toString(),
                style: GoogleFonts.oswald(
                    // fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                )
            )
        );
    }
}