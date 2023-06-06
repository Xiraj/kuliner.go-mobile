import 'package:get/get.dart';

class MyController extends GetxController {
  var orang = 0.obs;
  var menu = 0.obs;
  increment() {
    orang.value++;
  }

  decrement() {
    orang.value--;
  }

  menuIncrement() {
    menu.value++;
  }

  menuDecrement() {
    menu.value--;
  }
}