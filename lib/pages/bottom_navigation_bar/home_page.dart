import 'package:flutter/material.dart';


import '../../tools/major_font.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List images1 = [
    "cyber.jpg",
    "nsenji.png",
    "thanos.jpg",
    "travis.jpg",
    "korea.jpg",
    "pooh.jpg",

  ];
  List images2 = [
    "thanos.jpg",
    "korea.jpg",
    "pooh.jpg",
    "cyber.jpg",
    "travis.jpg",
    "nsenji.png",

  ];

  @override
  Widget build(BuildContext context) {
    TabController tabCoctroller = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              
              // Container(
              //   margin: const EdgeInsets.only(top: 35, left: 5),
              //   child: 
              //   IconButton(
              //     onPressed:(() {
                    
              //      Navigator.push(context, MaterialPageRoute(builder: ((context) => BarItemPage())));}),
              //     icon:Icon( Icons.view_stream_rounded),
              //     color: Colors.black,
              //   ),
              // ),
              Expanded(child: Container()),
              Container(
                margin: const EdgeInsets.only(right: 20, top: 35),
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.grey),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: MajorFont(
              text: "Discover",
              size: 30,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            child: TabBar(
                indicatorColor: const Color.fromARGB(255, 146, 138, 43),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: const EdgeInsets.only(left: 20, right: 20),
                labelColor: Colors.black87,
                unselectedLabelColor: Colors.black38,
                // isScrollable: true,
                controller: tabCoctroller,
                tabs: const [Text("Category"), Text("Places"), Text("Food")]),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, top: 10),
            height: 300,
            width: double.maxFinite,
            child: TabBarView(controller: tabCoctroller, children: [
              // Container(
              ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: 300,
                    width: 200,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/cyber.jpg")),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  );
                },
              ),
              // ),
              const Text("how"),
              const Text("are"),
            ]),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            height: 120,
            width: double.maxFinite,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (_, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: 120,
                    width: 90,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/"+ images1[index])),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  );
                }),
          ),
          const SizedBox(height: 10,),
          Container(
            margin: const EdgeInsets.only(left: 20),
            height: 120,
            width: double.maxFinite,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (_, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: 120,
                    width: 90,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/"+ images2[index])),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  );
                }),
          ),
        ],
        ),
    );
  }
}
