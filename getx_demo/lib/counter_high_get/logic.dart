import 'package:get/get.dart';

import 'state.dart';

class CounterHighGetLogic extends GetxController {
  final state = CounterHighGetState();

  void increase() => ++state.count;
}
