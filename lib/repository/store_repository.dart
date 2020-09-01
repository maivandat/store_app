import 'package:store_app/model/user.dart';
import 'package:store_app/repository/remote/store_api_client.dart';

class StoreRepository {
  final StoreApiClient storeApiClient;

  const StoreRepository({this.storeApiClient});

  Future<User> login(String email, String password) {
    return storeApiClient.login(email, password);
  }
}
