import 'package:flutter/material.dart';

class A {
  void printMessage() {
    debugPrint('Hello from A');
  }
}

class B extends A {
  @override
  void printMessage() {
    debugPrint('Hello from B');
  }
}

class C extends A {
  @override
  void printMessage() {
    debugPrint('Hello from C');
  }
}

class D implements B, C {
  @override
  void printMessage() {
    // TODO: implement printMessage
  }
}
