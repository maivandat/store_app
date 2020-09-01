import 'package:equatable/equatable.dart';

abstract class StoreEvent extends Equatable {
  const StoreEvent();
}

class StoreLoginRequested extends StoreEvent {
  final String email;
  final String password;

  const StoreLoginRequested({ this.email, this.password })
      : assert(email != null || password != null);

  @override
  List<Object> get props => [email, password];
}
