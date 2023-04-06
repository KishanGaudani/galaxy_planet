import 'package:flutter/material.dart';
import 'package:galaxy_planet_pr2/model/Global.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController scaleanimationController;

  late Animation<double> sizeAnimation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    scaleanimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    sizeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut));
    scaleAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
        parent: scaleanimationController, curve: Curves.easeInOut));

    animationController.repeat();
    scaleanimationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        centerTitle: true,
        title: const Text(
          "GALAXY PLANET",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          ScaleTransition(
              scale: scaleAnimation,
              child: const Image(
                image: AssetImage("assets/images/1119991.webp"),
              )),
          ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: Global.length,
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'detail',
                        arguments: Global[i]);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    padding: const EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        RotationTransition(
                          turns: sizeAnimation,
                          child: Hero(
                            tag: Global[i]['tag'],
                            child: Image.asset(
                              Global[i]['iconImage'],
                              height: 100,
                              width: 100,
                            ),
                          ),
                        ),
                        // const Spacer(),
                        SizedBox(
                          width: 170,
                        ),
                        Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 70,
                              ),
                              Text(
                                Global[i]['name'],
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
