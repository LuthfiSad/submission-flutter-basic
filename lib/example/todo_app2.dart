import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:submission_flutter/helper/data.dart';

class TodoApp2Page extends StatefulWidget {
  const TodoApp2Page({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TodoApp2PageState createState() => _TodoApp2PageState();
}

class _TodoApp2PageState extends State<TodoApp2Page> {
  String _timeString = '';

  @override
  void initState() {
    super.initState();
    _updateTime();
    Timer.periodic(const Duration(seconds: 1), (Timer t) => _updateTime());
  }

  void _updateTime() {
    final DateTime now = DateTime.now();
    final String formattedTime = DateFormat('HH:mm').format(now);

    setState(() {
      _timeString = formattedTime;
    });
  }

  String getClosestTime(String currentTime) {
    DateTime current = DateFormat('HH:mm').parse(currentTime);

    // Filter timeSlots untuk mendapatkan waktu yang kurang dari atau sama dengan waktu saat ini
    List<Map<String, dynamic>> filteredTimes = todoItems.where((time) {
      DateTime slotTime = DateFormat('HH:mm').parse(time['time']);
      return slotTime.isBefore(current) || slotTime == current;
    }).toList();

    // Mengambil waktu terakhir dari daftar waktu yang memenuhi syarat
    return filteredTimes.isNotEmpty
        ? filteredTimes.last['time']
        : todoItems.first['time'];
  }

  @override
  Widget build(BuildContext context) {
    String activeTime = getClosestTime(_timeString);
    return Scaffold(
        body: SafeArea(
            child: Container(
                padding: const EdgeInsets.fromLTRB(20.0, 70.0, 20.0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Todo App', style: TextStyle(fontSize: 30.0)),
                    const Text('Welcome'),
                    const SizedBox(height: 20.0),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: SingleChildScrollView(
                          child: Wrap(
                            // spacing: 10.0, // Jarak antar item
                            // runSpacing: 10.0,
                            children: todoItems.asMap().entries.map((entry) {
                              String time = entry.value['time'];

                              bool isActive = time == activeTime;

                              return SizedBox(
                                width: (MediaQuery.of(context).size.width / 2) -
                                    20, // Lebar tiap item
                                child: ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    minHeight: 300.0,
                                  ),
                                  child: Card(
                                      color: isActive
                                          ? Colors.grey[500]
                                          : Colors.white,
                                      child: Container(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    entry.value['title'],
                                                    style: TextStyle(
                                                        color: isActive
                                                            ? Colors.white
                                                            : Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                  Column(
                                                    children: entry
                                                        .value['list']
                                                        .map<Widget>((item) {
                                                      return Row(
                                                        children: [
                                                          Text('- ',
                                                              style: TextStyle(
                                                                  color: isActive
                                                                      ? Colors
                                                                          .white
                                                                      : Colors
                                                                          .black,
                                                                  fontSize:
                                                                      16)),
                                                          Expanded(
                                                              child: Text(
                                                            item,
                                                            style: TextStyle(
                                                                color: isActive
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black),
                                                          )),
                                                        ],
                                                      );
                                                    }).toList(),
                                                    // children: [
                                                    //   Row(
                                                    //     children: [
                                                    //       Text('- ',
                                                    //           style: TextStyle(
                                                    //               fontSize:
                                                    //                   16)),
                                                    //       Expanded(
                                                    //           child: Text(
                                                    //               'Lorem ipsum')),
                                                    //     ],
                                                    //   )
                                                    // ],
                                                  ),
                                                ]),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Stack(children: [
                                                  Container(
                                                    alignment: Alignment.center,
                                                    margin: const EdgeInsets.only(
                                                        left: 18, top: 2),
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.grey[400],
                                                    ),
                                                    child: const Icon(
                                                      Icons
                                                          .tips_and_updates_rounded,
                                                      size: 16.0,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.grey[400],
                                                    ),
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    child: const Icon(
                                                      Icons
                                                          .tips_and_updates_rounded,
                                                      size: 16.0,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ]),
                                                Text(time, style: TextStyle(color: isActive ? Colors.white : Colors.black))
                                              ],
                                            )
                                          ],
                                        ),
                                      )),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ))));
  }
}
