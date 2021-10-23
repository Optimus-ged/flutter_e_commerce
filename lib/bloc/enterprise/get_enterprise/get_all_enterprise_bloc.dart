import 'package:e_commerce/data/repository/data_repository.dart';
import 'package:e_commerce/views/shared/shared_index.dart';
import 'get_all_enterprise_event.dart';
import 'get_all_enterprise_state.dart';

class GetAllEnterpriseBloc extends Bloc<GetAllEnterpriseEvent, GetAllEnterpriseState> {
  get _api => locator.get<DataRepository>();
  GetAllEnterpriseBloc() : super(GetAllEnterpriseInitial());

  @override
  Stream<GetAllEnterpriseState> mapEventToState(GetAllEnterpriseEvent event) async* {
    if (event is LoadEnterprises)
      yield* _mapLoadEnterprisesToState(event);
  }

  Stream<GetAllEnterpriseState> _mapLoadEnterprisesToState(
      LoadEnterprises event) async* {

    try {
      yield GetAllEnterpriseInProgress();
      final enterprises = await _api.getAllEnterprises(event.userId) ;
      if (enterprises.status == 200) {
        yield GetAllEnterpriseSuccess(enterpriseData: enterprises);
        
      } else {
        yield GetAllEnterpriseFailure(enterpriseData: enterprises.message);
      }
    } catch (error, stackTrace) {
      yield GetAllEnterpriseFailure(enterpriseData: "$error");
      print(
          'GetAllEnterpriseBloc.MapEventToState ::: ERROR: $error, STACKTRACE: $stackTrace');
      return;
    }
  }
}
