import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:venturo_shop/datasource/dio_helper.dart';
import 'package:venturo_shop/model/menus_entity.dart';
import 'package:venturo_shop/utils/error/failure_response.dart';
import 'package:venturo_shop/utils/state/view_data_state.dart';

part 'menus_state.dart';

class MenusCubit extends Cubit<MenusState> {
  final RemoteApi remoteApi;

  MenusCubit({required this.remoteApi})
      : super(
          MenusState(
            menuData: ViewData.initial(),
            qty: ViewData.initial()
          ),
        );

  void getDataMenu() async {
    try {
      final data = await remoteApi.getDataMenu();
      data.fold(
        (error) => emit(
          state.copyWith(
            menuData: ViewData.error(
              message: "No Dat",
              failure: FailureResponse(errorMessage: error.errorMessage),
            ),
          ),
        ),
        (data) => emit(
          state.copyWith(
            menuData: ViewData.loaded(data: data),
          ),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          menuData: ViewData.error(
            message: "Exception",
            failure: FailureResponse(errorMessage: e.toString()),
          ),
        ),
      );
    }
  }

  void increment({required String jumlah, required String id, required int index}) async {
    final listItem = state.menuData.data?.datas ?? [];
    emit(state.copyWith(qty: ViewData.loading(message: "Loading")));

  }
}
