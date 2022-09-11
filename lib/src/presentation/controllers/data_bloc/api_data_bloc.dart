import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:aagel/src/core/error/error_model.dart';
import 'package:aagel/src/core/utils/data_state.dart';
import 'package:aagel/src/core/utils/invoke_reflection.dart';
import 'package:aagel/src/core/utils/pagination_criteria.dart';
import 'package:aagel/src/core/utils/query_params.dart';
import 'package:aagel/src/domain/use_cases/get_pagination_data_use_case.dart';

import '../../../core/config/injector.dart';
import '../../../data/models/api_pagination_model.dart';
import '../../../domain/use_cases/get_data_by_path_use_case.dart';

part 'api_data_event.dart';
part 'api_data_state.dart';

class ApiDataBloc<MODEL> extends Bloc<ApiDataEvent, ApiDataState> {
  // final GetSingleDataUseCase<ProductPaginationModel<MODEL>> _getSingleDataUseCase = GetSingleDataUseCase(injector());
  final GetPaginationDataUseCase<MODEL> _getPaginationDataUseCase =
      GetPaginationDataUseCase(injector());
  // final GetCollectionDataUseCase<MODEL> _getCollectionDataUseCase = GetCollectionDataUseCase(injector());
  final GetDataByPathUseCase<MODEL> _getDataByPathUseCase =
      GetDataByPathUseCase(injector());

  late PaginationCriteria _criteria;
  late PagingController<int, MODEL> controller;
  final InvokeReflection<MODEL> _invokeReflection = InvokeReflection();

  QueryParams? query;
  final int? maxResult;

  ApiDataBloc({this.query, this.maxResult}) : super(const ApiDataIdle()) {
    // on<ApiDataSingle>((event, emit) => _getDataSingle(event, emit));
    // on<ApiDataCollection>((event, emit) => _getDataCollection(event, emit));
    on<ApiDataByPath>((event, emit) => _getDataByPath(event, emit));
    on<ApiDataPagination>((event, emit) => _getDataPagination(event, emit));

    query = initialQuery();
    _criteria = PaginationCriteria();
    initializeController();
  }

  QueryParams initialQuery() {
    String route = _invokeReflection.getRoute();
    if (query == null) {
      return QueryParams(endpoint: route);
    } else {
      if (query!.endpoint != null && query!.endpoint!.isNotEmpty) {
        query!.endpoint = '$route/${query!.endpoint}';
        return query!;
      }
      query!.endpoint = route;
      return query!;
    }
  }

  initializeController() {
    controller = PagingController<int, MODEL>(
      firstPageKey: _criteria.getPageNumber,
      invisibleItemsThreshold: _criteria.getPageSize,
    );
    controller.removePageRequestListener(_fetchData);
    controller.addPageRequestListener(_fetchData);
  }

  void _fetchData(int pageKey) {
    _criteria.pageNumber = pageKey;
    if (!isClosed) {
      add(ApiDataPagination(queryParams: query));
    }
  }

  Future<void> _getDataPagination(
      ApiDataPagination event, Emitter<ApiDataState> emit) async {
    emit(const ApiDataLoading());
    passPaginationForQuery();

    DataState state = await _getPaginationDataUseCase.call(params: query!);
    if (state is DataSuccess) {
      ApiPaginationModel<MODEL> pagination =
          state.data as ApiPaginationModel<MODEL>;
      emit(ApiDataLoaded<ApiPaginationModel<MODEL>>(pagination));
      newSettingForPagination(pagination);
    } else {
      emit(ApiDataError(state.error!));
      controller.error = state.error;
    }
  }

  void passPaginationForQuery() {
    query?.page = _criteria.getPageNumber;
    query?.pageSize ??= _criteria.getPageSize;
  }

  void newSettingForPagination(ApiPaginationModel<MODEL> pagination) {
    _criteria.pageNumber += 1;
    bool noMore = noMoreData(pagination);
    if (noMore) {
      controller.appendLastPage(pagination.data!);
    } else {
      controller.appendPage(pagination.data!, _criteria.getPageNumber);
    }
  }

  bool noMoreData(ApiPaginationModel<MODEL> pagination) {
    if (controller.itemList != null) {
      return maxResult == null
          ? controller.itemList!.length >= pagination.totalResults!
          : pagination.totalResults! > maxResult!
              ? controller.itemList!.length >= maxResult!
              : controller.itemList!.length >= pagination.totalResults!;
    } else {
      return pagination.totalResults! <= _criteria.getPageSize ? true : false;
    }
  }

  Future<void> _getDataByPath(
      ApiDataByPath event, Emitter<ApiDataState> emit) async {
    emit(const ApiDataLoading());
    event.queryParams?.pathId = event.path;

    DataState state;
    if (event.queryParams?.pathId != null &&
        event.queryParams!.pathId!.isNotEmpty) {
      state = await _getDataByPathUseCase.call(params: event.queryParams!);
    } else {
      emit(const ApiDataError(ErrorModel(message: 'Path Not Found')));
      return;
    }

    if (state is DataSuccess) {
      emit(ApiDataLoaded<MODEL>(state.data));
    } else {
      emit(ApiDataError(state.error!));
    }
  }

  /* Future<void> _getDataSingle(ApiDataSingle event, Emitter<ApiDataState> emit) async{
    emit(const ApiDataLoading());
    
    DataState state = await _getSingleDataUseCase.call(params: event.queryParams!);

    if(state is DataSuccess){
      emit(ApiDataLoaded<MODEL>(state.data));
    }else{
      emit(ApiDataError(state.error!));
    }
  } */

  /* Future<void> _getDataCollection(ApiDataCollection event, Emitter<ApiDataState> emit) async{
    emit(const ApiDataLoading());
    DataState state = await _getCollectionDataUseCase.call(params: event.queryParams!);

    if(state is DataSuccess){
      emit(ApiDataLoaded<List<MODEL>>(state.data));
    }else{
      emit(ApiDataError(state.error!));
    }
  } */

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}
