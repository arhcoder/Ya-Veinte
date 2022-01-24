import 'dart:async';

import 'package:flutter/material.dart';

class Splash extends StatefulWidget
{
    final Widget HomePage;
    Splash(this.HomePage);

    @override
    State <Splash> createState() => SplashState();
}

class SplashState extends State <Splash>
{
    @override
    void initState()
    {
        super.initState();
        Timer
        (
            Duration(seconds: 4),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => widget.HomePage))
        );
    }

    @override
    Widget build(BuildContext context)
    {
        return Center
        (
            child: Column
            (
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                
                children:
                [
                    Image.asset("assets/logo.png", width: 120),
                    const SizedBox(height: 68),
                    const CircularProgressIndicator
                    (
                        valueColor: AlwaysStoppedAnimation <Color> (Colors.white),
                    )
                ]
            )
        );
    }
}