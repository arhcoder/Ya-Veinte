import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Screens/Home.dart';
import 'Screens/Splash.dart';

import 'Constants/Theme.dart';

void main()
{
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle
        (
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light
        )
    );

    runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
    const MyApp({Key? key}) : super(key: key);
    
    @override
    Widget build(BuildContext context)
    {
        return MaterialApp
        (
            debugShowCheckedModeBanner: false,
            title: "Ya veinte años...",
            home: SplashPage()
        );
    }
}

class HomePage extends StatelessWidget
{
    @override
    Widget build(BuildContext context)
    {
        return Scaffold
        (
            body: SafeArea
            (
                child: Container
                (
                    color: AppColors.background,
                    child: Home()
                )
            )
        );
    }
}

class SplashPage extends StatelessWidget
{
    @override
    Widget build(BuildContext context)
    {
        return Scaffold
        (
            body: SafeArea
            (
                child: Container
                (
                    color: AppColors.main,
                    child: Splash(HomePage())
                )
            )
        );
    }
}