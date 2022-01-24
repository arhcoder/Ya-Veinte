import 'dart:io';

import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

import 'package:ya_veinte/Constants/Responsive.dart';
import 'package:ya_veinte/Constants/Theme.dart';

import 'package:ya_veinte/Pages/Chooser.dart';
import 'package:ya_veinte/Pages/Congratulations.dart';
import 'package:ya_veinte/Pages/HappyBirthday.dart';

class Home extends StatefulWidget
{
    Home({Key? key}) : super(key: key);

    @override
    HomeState createState() => HomeState();
}

class HomeState extends State <Home>
{
    // Variables de uso //
    int age = 1;
    String countryName = "México";
    String countryCode = "mx";
    String countryLanguage = "es";

    String congratulations = "¡Feliz cumpleaños, Ale! Ya tienes 20 años.";
    String message = "¡Feliz cumpleaños, Ale! Ya tienes 20 años.";
    bool electedTheFirst = false;

    PageController pageController = PageController
    (
        initialPage: 1
    );

    List <String> countryNames =
    [
        "México",
        "EUA",
        "Japón",
        "China",
        "Alemania",
        "Francia",
        "Portugal",
        "Italia",
        "India",
        "Rusia",
        "El Congo",
        "Polonia",
        "Turkía",
        "Hungría",
        "Afganistán",
        "Israel",
        "España",
        "Tailandia",
        "Bangladesh",
        "Inglaterra",
        "Rumania",
        "Egipto",
        "Arabia",
        "Indonesia",
        "Nigeria",
        "Andorra",
        "Albania",
        "Argelia",
        "Uruguay",
        "Austria",
        "Holanda",
        "Canadá",
        "Bulgaria",
        "Vietnam",
        "Surcorea"
    ];
    List <String> countryCodes =
    [
        "mx",
        "us",
        "jp",
        "cn",
        "de",
        "fr",
        "pt",
        "it",
        "in",
        "ru",
        "cg",
        "pl",
        "tr",
        "hu",
        "af",
        "il",
        "es",
        "th",
        "bd",
        "io",
        "ro",
        "eg",
        "sa",
        "id",
        "ne",
        "ad",
        "al",
        "dz",
        "uy",
        "at",
        "nl",
        "ca",
        "bg",
        "vn",
        "kr"
    ];
    List <String> countryLanguages =
    [
        "es",
        "en",
        "ja",
        "cm",
        "de",
        "fr",
        "pt",
        "it",
        "hi",
        "ru",
        "fr",
        "pl",
        "tr",
        "hu",
        "fa",
        "he",
        "es",
        "th",
        "bn",
        "en",
        "ro",
        "ar",
        "ar",
        "id",
        "fr",
        "ca",
        "sq",
        "ar",
        "es",
        "de",
        "nl",
        "fr",
        "bg",
        "vi",
        "ko"
    ];

    int firstRandom = Random().nextInt(34 + 1);
    int secondRandom = Random().nextInt(34 + 1);

    void translate() async
    {
        final translator = GoogleTranslator();

        message = "Déjame ver...";
        print(countryLanguage);

        if (countryLanguage == "he")
        {
            message = "Por dios, no sé hablar Hebreo Antigüo.";
            print(message);
        }
        else if (countryCode == "cn")
        {
            message = "China es un peligro para la humanidad...";
            print(message);
        }
        else
        {
            var translation = await translator.translate(congratulations, from: "es", to: countryLanguage);
            message = translation.toString();
            print(translation);
        }
        
        setState((){});
    }

    void generateTwoRandoms()
    {
        firstRandom = Random().nextInt(34 + 1);
        do
        {
            secondRandom = Random().nextInt(34 + 1);
        }
        while (secondRandom == firstRandom);
    }

    void firstElection()
    {
        countryName = countryNames[firstRandom];
        countryCode = countryCodes[firstRandom];
        countryLanguage = countryLanguages[firstRandom];

        Curve curve = Curves.ease;
        pageController.animateToPage(1, curve: curve, duration: const Duration(milliseconds: 600));

        translate();
        setState((){});
    }
    void secondElection()
    {
        countryName = countryNames[secondRandom];
        countryCode = countryCodes[secondRandom];
        countryLanguage = countryLanguages[secondRandom];

        Curve curve = Curves.ease;

        pageController.animateToPage(1, curve: curve, duration: const Duration(milliseconds: 600));

        translate();
        setState((){});
    }
    void okayTap()
    {
        if (age == 20 + 1)
        {
            Curve curve = Curves.ease;
            pageController.animateToPage(2, curve: curve, duration: const Duration(milliseconds: 600));
            setState((){});
        }
        else
        {
            age++;
            print("Primero: " + countryCodes[firstRandom]);
            print("Segundo: " + countryCodes[secondRandom]);
            generateTwoRandoms();
            Curve curve = Curves.ease;
            pageController.animateToPage(0, curve: curve, duration: const Duration(milliseconds: 600));
            setState((){});
        }
    }


    @override
    Widget build(BuildContext context)
    {
        final width = MediaQuery.of(context).size.width;

        return Center
        (
            child: Container
            (
                width: width,
                height: width + Responsive.appHorizontalMargin,

                child: Column
                (
                    children:
                    [
                        Expanded
                        (
                            flex: 1,
                            child: PageView
                            (
                                controller: pageController,
                                scrollDirection: Axis.horizontal,
                                allowImplicitScrolling: false,
                                physics: const BouncingScrollPhysics(),

                                children:
                                [
                                    Column
                                    (
                                        children:
                                        [
                                            const SizedBox(height: 50),
                                            AutoSizeText
                                            (
                                                "Elige 👇🏻",
                                                style: GoogleFonts.oswald(
                                                    fontSize: 24.0,
                                                    color: AppColors.darkText,
                                                    fontWeight: FontWeight.bold
                                                ),
                                                maxLines: 2,
                                                minFontSize: 14,
                                            ),
                                            Chooser
                                            (
                                                width: width - Responsive.appHorizontalMargin,
                                                height: width - Responsive.appHorizontalMargin,
                                                firstCountryIconPath: "icons/flags/svg/${countryCodes[firstRandom]}.svg",
                                                firstCountryLanguageCode: countryLanguages[firstRandom],
                                                secondCountryIconPath: "icons/flags/svg/${countryCodes[secondRandom]}.svg",
                                                secondCountryLanguageCode: countryLanguages[secondRandom],
                                                firstAction: firstElection,
                                                secondAction: secondElection,
                                            )
                                        ]
                                    ),
                                    
                                    Congratulations
                                    (
                                        width: width - Responsive.appHorizontalMargin,
                                        height: width - Responsive.appHorizontalMargin,
                                        countryIconPath: "icons/flags/svg/$countryCode.svg",
                                        countryName: countryName,
                                        congratulationsMessage: message,
                                        age: age,
                                        action: okayTap
                                    ),
                                    
                                    HappyBirthday
                                    (
                                        width: width - Responsive.appHorizontalMargin,
                                        height: width,
                                        action: () => exit(0)
                                    )
                                ]
                            )
                        )
                    ]
                )
            )
        );
    }
}