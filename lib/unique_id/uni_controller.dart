import 'package:get/get.dart';

class Controllerhome extends GetxController {
  var counte = 0;

  incrementCounter() {
    counte++;
    update(['1']);
  }

  @override
  void onInit() {
    print('Init called');
    super.onInit();
  }

  @override
  void onClose() {
    print('disposed called ');
    super.onClose();
  }
}
