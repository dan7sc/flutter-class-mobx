import 'package:mobx/mobx.dart';

part 'counter_store.g.dart';

class CounterStore = CounterStoreBase with _$CounterStore;

abstract class CounterStoreBase with Store {
  @observable
  String _user = "";

  @observable
  String _password = "";

  @computed
  bool get userAndPasswordValid => _user.isNotEmpty && _password.isNotEmpty;

  @action
  void setUser(String value) => _user = value;

  @action
  void setPassword(String value) => _password= value;
}
