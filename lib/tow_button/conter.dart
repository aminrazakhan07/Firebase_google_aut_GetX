import 'package:get/get.dart';

class counterController extends GetConnect {
  RxInt counts = 0.obs;

  void increese() {
    counts++;
    print(counts);
  }

  void decreese() {
    counts--;
    print(counts);
  }
}
