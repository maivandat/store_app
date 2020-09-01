import 'package:meta/meta.dart';
import 'package:store_app/model/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/bloc/store_event.dart';
import 'package:store_app/bloc/store_state.dart';
import 'package:store_app/repository/store_repository.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  final StoreRepository storeRepository;

  StoreBloc({@required this.storeRepository})
      : assert(storeRepository != null),
        super(StoreInitial());

  @override
  Stream<StoreState> mapEventToState(StoreEvent event) async* {
    if(event is StoreLoginRequested) {
      yield StoreLoadInProgress();
      try {
        final User user = await storeRepository.login(event.email, event.password);
        yield StoreLoadSuccess(user: user);
      } catch (e) {
        yield StoreLoadFailure();
      }
    }
  }
}
