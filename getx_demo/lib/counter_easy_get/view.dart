import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class CounterEasyGetPage extends StatelessWidget {

  ///init：虽然上述代码没用到，但是，这个参数是存在在GetBuilder中的，
  ///因为在加载变量的时候就使用Get.put()生成了CounterEasyGetLogic
  ///对象，GetBuilder会自动查找该对象，所以，就可以不使用init参数
  final CounterEasyGetLogic logic = Get.put(CounterEasyGetLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('计数器-简单式')),
      body: Center(
        child: GetBuilder<CounterEasyGetLogic>(
          ///builder：方法参数，拥有一个入参，类型便是GetBuilder所传入泛型的类型
          builder: (logicGet) => Text(
            '点击了 ${logicGet.count} 次',
            style: TextStyle(fontSize: 30.0),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => logic.increase(),
        child: const Icon(Icons.add),
      ),
    );
  }
}

// Obx是配合Rx响应式变量使用、GetBuilder是配合update使用：请注意，这完全是俩套定点刷新控件的方案
// 区别：前者响应式变量变化，Obx自动刷新；后者需要使用update手动调用刷新
// 响应式变量，因为使用的是StreamBuilder，会消耗一定资源
// GetBuilder内部实际上是对StatefulWidget的封装，所以占用资源极小