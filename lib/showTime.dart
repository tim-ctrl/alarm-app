import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'addAlarm.dart';


class showTimeOfDay extends StatefulWidget {
  const showTimeOfDay({Key? key}) : super(key: key);

  @override
  State<showTimeOfDay> createState() => _showTimeOfDayState();
}

class _showTimeOfDayState extends State<showTimeOfDay> {
  String _time= "";

  @override
  void initState(){
    super.initState();
    Timer.periodic(
        Duration(
          milliseconds: 50,
        ),
            (Timer t) => _getTime());
  }
  void _getTime() {
    var _dateTime = new DateTime.now();
    final String formTime = DateFormat('kk:mm').format(_dateTime).toString();
    if(this.mounted){
      setState(() {
        _time = formTime;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    bool isSwitched = false;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black38,
        onPressed: () {
          addAlarm();
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _time,
                    style: const TextStyle(fontSize: 75.0),
                    textAlign: TextAlign.center,

                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 65, vertical: 50),
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 90),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                  gradient: LinearGradient(
                      colors: [Colors.grey.shade600,Colors.grey.shade900]
                  ) ,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        )
                      ),
                    )
                  ],
                ),

              )

            ],

          )
      ),
    );
  }
}