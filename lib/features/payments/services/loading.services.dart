import 'package:mobx/mobx.dart';
part 'loading.services.g.dart';

class LoadingServices = _LoadingServicesBase with _$LoadingServices;

abstract class _LoadingServicesBase with Store {
  @observable
  bool isLoading = false;

  @action
  void setLoading(bool value) {
    isLoading = value;
  }
}
