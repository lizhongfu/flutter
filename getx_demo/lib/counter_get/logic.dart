import 'package:get/get.dart';

class CounterGetLogic extends GetxController {

  /// 这里变量数值后写.obs操作，是说明定义了该变量为响应式变量，当该变量数值变化时，
  /// 页面的刷新方法将自动刷新；基础类型，List，类都可以加.obs，使其变成响应式变量
  var count = 0.obs;

  ///自增
  void increase() => ++count;
}
