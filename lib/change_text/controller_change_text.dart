import 'package:get/get.dart';

class NameController extends GetxController {
  RxString inputName = "".obs;

  RxString errorMessage = ''.obs;

  void errorText(String text) {
    if (text.isEmpty) {
      errorMessage.value = "Text Field connot be empty!";
    } else {
      inputName.value = text;
      errorMessage.value = '';
    }
  }
}
