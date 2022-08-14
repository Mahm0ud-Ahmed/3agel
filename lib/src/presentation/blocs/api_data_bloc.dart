import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:aagel/src/core/error/error_model.dart';
import 'package:aagel/src/core/utils/data_state.dart';
import 'package:aagel/src/core/utils/invoke_reflection.dart';
import 'package:aagel/src/core/utils/pagination_criteria.dart';
import 'package:aagel/src/core/utils/query_params.dart';
import 'package:aagel/src/domain/use_cases/get_pagination_data_use_case.dart';

import '../../core/config/injector.dart';
import '../../data/models/api_pagination_model.dart';
import '../../domain/use_cases/get_data_by_path_use_case.dart';

part 'api_data_event.dart';
part 'api_data_state.dart';

class ApiDataBloc<MODEL> extends Bloc<ApiDataEvent, ApiDataState> {

  // final GetSingleDataUseCase<ProductPaginationModel<MODEL>> _getSingleDataUseCase = GetSingleDataUseCase(injector());
  final GetPaginationDataUseCase<MODEL> _getPaginationDataUseCase = GetPaginationDataUseCase(injector());
  // final GetCollectionDataUseCase<MODEL> _getCollectionDataUseCase = GetCollectionDataUseCase(injector());
  final GetDataByPathUseCase<MODEL> _getDataByPathUseCase = GetDataByPathUseCase(injector());

  late PaginationCriteria _criteria;
  late PagingController<int, MODEL> controller;
  final InvokeReflection<MODEL> _invokeReflection = InvokeReflection();

  QueryParams? query;

  ApiDataBloc() : super(const ApiDataIdle()) {
    // on<ApiDataSingle>((event, emit) => _getDataSingle(event, emit));
    // on<ApiDataCollection>((event, emit) => _getDataCollection(event, emit));
    on<ApiDataByPath>((event, emit) => _getDataByPath(event, emit));
    on<ApiDataPagination>((event, emit) => _getDataPagination(event, emit));
    if(query == null){
      String route = _invokeReflection.getRoute();
      query = QueryParams(endpoint: route);
    }
    _criteria = PaginationCriteria();
    initializeController();
  }

  initializeController(){
    controller = PagingController<int, MODEL>(
      firstPageKey: _criteria.getPageNumber,
      invisibleItemsThreshold: _criteria.getPageSize,
    );
    controller.removePageRequestListener(_fetchData);
    controller.addPageRequestListener(_fetchData);
  }

  void _fetchData(int pageKey) {
    _criteria.setPageNumber = pageKey;
    if(!isClosed) {
      print('===>> $query');
      add(ApiDataPagination(queryParams: query));
    }
  }

  Future<void> _getDataPagination(ApiDataPagination event, Emitter<ApiDataState> emit) async{
    emit(const ApiDataLoading());
    passPaginationForEvent(event);

    DataState state = await _getPaginationDataUseCase.call(params: event.queryParams ?? query!);
    if(state is DataSuccess){
      ApiPaginationModel<MODEL> pagination = state.data as ApiPaginationModel<MODEL>;
      emit(ApiDataLoaded<ApiPaginationModel<MODEL>>(pagination));
      newSettingForPagination(pagination);
    }else{
      emit(ApiDataError(state.error!));
      controller.error = state.error;
    }
  }

  void passPaginationForEvent(ApiDataPagination event){
    event.queryParams?.page = _criteria.getPageNumber;
    event.queryParams?.pageSize = _criteria.getPageSize;
  }

  void newSettingForPagination(ApiPaginationModel<MODEL> pagination){
    _criteria.pageNumber = (int.parse(pagination.skip)) +10;
    final bool noMoreData = pagination.total! <= int.parse(pagination.skip);
    if(noMoreData){
      controller.appendLastPage(pagination.data!);
    }else{
      controller.appendPage(pagination.data!, _criteria.getPageNumber);
    }
  }

  Future<void> _getDataByPath(ApiDataByPath event, Emitter<ApiDataState> emit) async{
    emit(const ApiDataLoading());
    event.queryParams?.pathId = event.path;
    
    DataState state;
    if(event.queryParams?.pathId != null && event.queryParams!.pathId!.isNotEmpty){
      state = await _getDataByPathUseCase.call(params: event.queryParams!);
    }else{
      emit(const ApiDataError(ErrorModel(message: 'Path Not Found')));
      return;
    }

    if(state is DataSuccess){
      emit(ApiDataLoaded<MODEL>(state.data));
    }else{
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


