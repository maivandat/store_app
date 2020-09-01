import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:store_app/model/user.dart';

abstract class StoreState extends Equatable {
  const StoreState();

  @override
  List<Object> get props => [];
}

class StoreInitial extends StoreState {}

class StoreLoadInProgress extends StoreState {}

class StoreLoadSuccess extends StoreState {
  final User user;

  const StoreLoadSuccess({@required this.user}): assert(user != null);

  @override
  List<Object> get props => [user];
}

class StoreLoadFailure extends StoreState {}
