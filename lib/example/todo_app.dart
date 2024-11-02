import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:submission_flutter/helper/data.dart';

class TodoAppPage extends StatefulWidget {
  const TodoAppPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TodoAppPageState createState() => _TodoAppPageState();
}

class _TodoAppPageState extends State<TodoAppPage> {
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
                        child: ListView(
                          children: todoItems.asMap().entries.map((entry) {
                            int index = entry.key;
                            String time = entry.value['time'];

                            // Kondisi untuk menentukan apakah Card aktif
                            bool isActive = time == activeTime;

                            // Menentukan apakah widget Center harus ditampilkan di atas/bawah
                            bool showDividerAbove = isActive && index != 0;
                            bool showDividerBelow =
                                isActive && index != todoItems.length - 1;

                            return Column(
                              children: [
                                // Divider di atas, hanya jika bukan Card pertama
                                if (showDividerAbove)
                                  Center(
                                    child: Container(
                                      margin:
                                          const EdgeInsets.symmetric(vertical: 10.0),
                                      color: Colors.grey[500],
                                      height: 5.0,
                                      width: 30.0,
                                    ),
                                  ),

                                // Card utama
                                Card(
                                  color: isActive
                                      ? Colors.grey[500]
                                      : Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: ListTile(
                                      title: Text(
                                        entry.value['title'],
                                        style: TextStyle(
                                            color: isActive
                                                ? Colors.white
                                                : Colors.grey[600]),
                                      ),
                                      leading: Container(
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: isActive
                                              ? Colors.white
                                              : Colors.grey[500],
                                        ),
                                        child: Icon(
                                          Icons.work,
                                          color: isActive
                                              ? Colors.grey[500]
                                              : Colors.white,
                                        ),
                                      ),
                                      trailing: Text(
                                        time,
                                        style: TextStyle(
                                            color: isActive
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                    ),
                                  ),
                                ),

                                // Divider di bawah, hanya jika bukan Card terakhir
                                if (showDividerBelow)
                                  Center(
                                    child: Container(
                                      margin:
                                          const EdgeInsets.symmetric(vertical: 10.0),
                                      color: Colors.grey[500],
                                      height: 5.0,
                                      width: 30.0,
                                    ),
                                  ),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ))));
  }
}
