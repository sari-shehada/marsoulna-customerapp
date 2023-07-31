import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/loader_controller.dart';

class LoaderView extends GetView<LoaderController> {
  const LoaderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoaderView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LoaderView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
