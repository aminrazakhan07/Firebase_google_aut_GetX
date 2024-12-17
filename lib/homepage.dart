import 'package:firebase_google_auth/conter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    counterController countr = Get.put(counterController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                countr.counts.value.toString(),
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      countr.decreese();
                    },
                    child: Container(
                      height: 50,
                      color: Colors.deepOrange,
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          '_ Decrese',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )),
                  SizedBox(width: 10),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      countr.increese();
                    },
                    child: Container(
                      height: 50,
                      color: Colors.green,
                      padding: EdgeInsets.all(10),
                      child: Center(
                          child: Text(
                        '+ Increese',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      )),
                    ),
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
