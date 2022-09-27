import 'package:cinema_tikets/tools/major_font.dart';
import 'package:cinema_tikets/tools/minor_font.dart';
import 'package:cinema_tikets/tools/responsive_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "acacia.jpg",
    "arena.jpg",
    "ham.jpg",
    "metroplex.jpg"];

  List text1 =  [
    "Acacia mall",
    "arena mall",
    "ham towers",
    "metroplex"

  ];

  List text2= [
    "we shall ",
    "we shall ",
    "we shall ",
    "we shall "
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 4,
        itemBuilder:(_,index){
          return Container(
            width:double.maxFinite,
            height:double.maxFinite,
            decoration:BoxDecoration(
              image : DecorationImage(
                image: AssetImage(
                  "assets/"+images[index]
                ),
                fit:BoxFit.cover,
                colorFilter: new ColorFilter.mode(Colors.blue.withOpacity(0.2), BlendMode.dstATop)
              )
            ),
            child: Container(
              margin : const EdgeInsets.only(top:150,left:20,right:20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      MajorFont(text:text1[index] ),
                      MinorFont(text:text2[index]),
                      SizedBox(height:20),

                      SizedBox(height:20),
                      Button()
                    ]
                  ),
                  Column(
                    
                    children: List.generate(4,(indexDots){
                      return Container(
                        
                        margin: const EdgeInsets.only(bottom:2),
                        width :8,
                        height:index == indexDots?25:8,
                        decoration: BoxDecoration(
                          
                          borderRadius: BorderRadius.circular(8),
                          color : index == indexDots?Colors.blueAccent:Colors.blueAccent.withOpacity(0.3)
                        )
                        
                      );
                    })
                  )
                ]

              ),
            ),
          );

        } )
    );
  }
}