import 'package:mobx/mobx.dart';

part 'counter_store.g.dart';

class CounterStore = CounterStoreBase with _$CounterStore;

enum AppStatus { loading, success, error, empty }

abstract class CounterStoreBase with Store {
  @observable
  AppStatus appStatus = AppStatus.empty;

  @observable
  String _user = "";

  @observable
  String _password = "";

  @computed
  bool get userAndPasswordValid => _user.isNotEmpty && _password.isNotEmpty;

  @action
  void setUser(String value) => _user = value;

  @action
  void setPassword(String value) => _password = value;

  @action
  Future<void> login() async {
    appStatus = AppStatus.loading;
    await Future.delayed(Duration(seconds: 2));
    appStatus = AppStatus.success;
  }
}
