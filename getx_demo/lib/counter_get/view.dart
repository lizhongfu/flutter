import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class CounterGetPage extends StatelessWidget {
  CounterGetLogic logic = Get.put(CounterGetLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GetX计数器')),
      body: Center(
        child: Obx(
              () => Text('点击了 ${logic.count.value} 次',
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
