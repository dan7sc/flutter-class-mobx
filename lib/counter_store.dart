import 'package:mobx/mobx.dart';

part 'counter_store.g.dart';

class CounterStore = CounterStoreBase with _$CounterStore;

abstract class CounterStoreBase with Store {
  @observable
  int value = 0;

  @computed
  int get duplicateValue => value * 2;

  @action
  void increment() {
    value++;
  }

  @action
  void decrement() {
    value--;
  }
}
