import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mech/services.dart';

class AutoshopProfile extends StatefulWidget {
  const AutoshopProfile({Key? key}) : super(key: key);

  @override
  State<AutoshopProfile> createState() => _AutoshopProfileState();
}

class _AutoshopProfileState extends State<AutoshopProfile> {
  bool isAppBarBg = false;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          isAppBarBg = true;
        });
      } else {
        setState(() {
          isAppBarBg = false;
        });
      }
    });
    print('isAppBarBg: $isAppBarBg');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          // title: Text(isAppBarBg ? 'AUTOSHOPZ' : ''),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.arrow_left_circle_fill,
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.grey, Colors.black],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: ListView(
              controller: scrollController,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              children: [
                const SizedBox(
                  height: kToolbarHeight + 25,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(200),
                          side:
                              const BorderSide(width: 2, color: Colors.white)),
                      child: const SizedBox(
                        height: 50,
                        width: 50,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text(
                        'AUTOSHOPZ',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  'media/img/q7.png',
                  height: 150,
                  width: 250,
                ),
                const Text(
                  'Services',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                Column(
                  children: List.generate(
                      mech.length,
                      (index) => Column(
                            children: [
                              Services(
                                serves: mech[index],
                                position: index,
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          )),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Contact Us',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(8.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(
                  height: 25,
                )
              ]),
        ));
  }
}
