import 'package:flutter/material.dart';

class TopBottomPage extends StatefulWidget {
  const TopBottomPage({super.key});

  @override
  State<TopBottomPage> createState() => _TopBottomPageState();
}

class _TopBottomPageState extends State<TopBottomPage> {
  bool _isLove = true;
  bool _isFav = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          // icon heart
          child: Icon(
            _isLove ? Icons.favorite : Icons.favorite_border,
            color: Colors.red,
          ),
          onPressed: () {
            setState(() {
              _isLove = !_isLove;
            });
          },
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                    padding: const EdgeInsets.all(20),
                    color: Colors.grey,
                    child: Stack(children: [
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: const Text(
                          'TopBottom',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          child: Icon(
                            Icons.featured_video,
                            color: _isFav ? Colors.yellow : Colors.white,
                            size: 40,
                          ),
                          onTap: () {
                            setState(() {
                              _isFav = !_isFav;
                            });
                          },
                        ),
                      )
                    ])),
              ),
              const Expanded(
                  child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'TopBottom',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                        'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam dolore nobis totam quod saepe fugit quia cumque molestiae corporis, architecto praesentium eligendi doloribus cupiditate a. Dolor minus illum, sed officiis alias at omnis voluptates atque! Voluptates, sunt omnis!')
                  ],
                ),
              )),
            ],
          ),
        ));
  }
}
