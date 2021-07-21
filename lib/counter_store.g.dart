// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CounterStore on CounterStoreBase, Store {
  Computed<bool>? _$userAndPasswordValidComputed;

  @override
  bool get userAndPasswordValid => (_$userAndPasswordValidComputed ??=
          Computed<bool>(() => super.userAndPasswordValid,
              name: 'CounterStoreBase.userAndPasswordValid'))
      .value;

  final _$_userAtom = Atom(name: 'CounterStoreBase._user');

  @override
  String get _user {
    _$_userAtom.reportRead();
    return super._user;
  }

  @override
  set _user(String value) {
    _$_userAtom.reportWrite(value, super._user, () {
      super._user = value;
    });
  }

  final _$_passwordAtom = Atom(name: 'CounterStoreBase._password');

  @override
  String get _password {
    _$_passwordAtom.reportRead();
    return super._password;
  }

  @override
  set _password(String value) {
    _$_passwordAtom.reportWrite(value, super._password, () {
      super._password = value;
    });
  }

  final _$CounterStoreBaseActionController =
      ActionController(name: 'CounterStoreBase');

  @override
  void setUser(String value) {
    final _$actionInfo = _$CounterStoreBaseActionController.startAction(
        name: 'CounterStoreBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$CounterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$CounterStoreBaseActionController.startAction(
        name: 'CounterStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$CounterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userAndPasswordValid: ${userAndPasswordValid}
    ''';
  }
}
