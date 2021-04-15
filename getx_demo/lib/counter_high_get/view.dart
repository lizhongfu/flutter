import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class CounterHighGetPage extends StatelessWidget {
  final CounterHighGetLogic logic = Get.put(CounterHighGetLogic());
  final CounterHighGetState state = Get.find<CounterHighGetLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('计数器-响应式')),
      body: Center(
        child: Obx(
              () => Text('点击了 ${state.count.value} 次',
              style: TextStyle(fontSize: 30.0)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => logic.increase(),
        child: const Icon(Icons.add),
      ),
    );
  }
}

///实际上view层，和之前的几乎没区别，区别的是把状态层给独立出来了
/// 因为CounterHighGetLogic被实例化，所以直接使用Get.find<CounterHighGetLogic>()
/// 就能拿到刚刚实例化的逻辑层，然后拿到state，使用单独的变量接收下
/// ok，此时：logic只专注于触发事件交互，state只专注数据