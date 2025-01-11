// ignore_for_file: unused_local_variable, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:firebase_google_auth/unique_id/uni_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class UniHomePage extends StatefulWidget {
  const UniHomePage({super.key});

  @override
  State<UniHomePage> createState() => _UniHomePageState();
}

class _UniHomePageState extends State<UniHomePage> {
  ///
  // Controllerhome = Get.put(Controllerhome());

  var UniController = Get.put(Controllerhome);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder<Controllerhome>(
                  id: '1',
                  init: Controllerhome(),
                  // یہ بیلڈ میں یوز ہوسکتا ہے انیٹ کی جگہ
                  //Controllerhome = Get.put(Controllerhome());

                  // initState: (_) => print('Init state called'),
                  // dispose: (_) => print('controller disposed'),

                  ///
                  builder: (Controllerhome) => Text(
                        '${Controllerhome.counte}',
                        style: TextStyle(fontSize: 30),
                      )),
              Text('First Counter'),

              ///
              SizedBox(height: 15),
              ElevatedButton(
                  onPressed: () {
                    var homeController = Get.find<Controllerhome>();
                    homeController.incrementCounter();
                  },
                  child: Text(
                    'counter 1',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            ],
          ),
          SizedBox(width: 30),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder<Controllerhome>(
                  id: '2',
                  builder: (Controllerhome) => Text(
                        '${Controllerhome.counte}',
                        style: TextStyle(fontSize: 30),
                      )),
              ////
              Text('First Counter'),
              SizedBox(height: 15),
              ElevatedButton(
                  onPressed: () {
                    var homeController = Get.find<Controllerhome>();
                    homeController.incrementCounter();
                  },
                  child: Text(
                    'counter 2',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),

              ////
            ],
          )
        ],
      ),
    );
  }
}
