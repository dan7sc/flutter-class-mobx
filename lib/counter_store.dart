import 'package:mobx/mobx.dart';

class CounterStore {
  late Action increment;

  CounterStore() {
    increment = Action(_increment);
  }

  final _counter = Observable(0);

  int get value => _counter.value;

  void _increment() {
    _counter.value++;
  }
}
