import 'home_page.dart';
import 'package:flutter/material.dart';
import '/utils/styles.dart';
class Location extends StatelessWidget {
  const Location({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 250),
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 80,
                  maxHeight: 80
                ),
                child: Row(
                  children: const [
                    // Image(image: AssetImage(""))
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Container(
                padding: const EdgeInsets.all(40),
                child: Text("Choose your preferred location", style: Styles.headLineStyle2,),
              ),
              InkWell(
                  onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> const HomePage(location: 'ACACIA',)));
                  },
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Styles.primaryColor,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Center(child: Text("ACACIA", style: TextStyle(color: Colors.white))),
                ),
              ),
              const SizedBox(height:10),
              InkWell(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> const HomePage(location: "METROPLEX NAALYA",)));
                },
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Styles.primaryColor,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child:  const Center(child: Text("METROPLEX NAALYA", style: TextStyle(color: Colors.white))),
                ),
              ),
              const SizedBox(height:10),
              InkWell(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=> const HomePage(location: 'ARENA MALL',)));
                },
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Styles.primaryColor,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Center(child: Text("ARENA MALL", style: TextStyle(color: Colors.white))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
