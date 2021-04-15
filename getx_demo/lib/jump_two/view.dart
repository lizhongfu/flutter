import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/jump_one/logic.dart';

import 'logic.dart';

class JumpTwoPage extends StatelessWidget {
  ///重点来了，这里通过Get.find()，获取到了之前实例化GetXController，
  ///获取某个模块的GetXController后就很好做了，可以通过这个GetXController
  ///去调用相应的事件，也可以通过它，拿到该模块的数据！
  final JumpOneLogic oneLogic = Get.find();
  final JumpTwoLogic twoLogic = Get.put(JumpTwoLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('跨页面-Two')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          oneLogic.increase();
          twoLogic.increase();
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          //计数显示
          Obx(
                () => Text('跨页面-Two点击了 ${twoLogic.count.value} 次',
                style: TextStyle(fontSize: 30.0)),
          ),

          //传递数据
          Obx(
                () => Text('传递的数据：${twoLogic.msg.value}',
                style: TextStyle(fontSize: 30.0)),
          ),
        ]),
      ),
    );
  }
}

