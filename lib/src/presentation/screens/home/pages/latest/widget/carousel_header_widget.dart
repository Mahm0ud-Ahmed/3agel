import 'package:aagel/src/presentation/screens/home/pages/latest/widget/carousel_item_loaded_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/config/l10n/generated/l10n.dart';
import '../../../../../../core/utils/query_params.dart';
import '../../../../../../data/models/api_pagination_model.dart';
import '../../../../../../data/models/article_model.dart';
import '../../../../../controllers/data_bloc/api_data_bloc.dart';
import '../../../../../widgets/custom_shimmer_widget.dart';

class CarouselHeaderWidget extends StatelessWidget {
  final ApiDataBloc<ArticleModel> carouselBloc = ApiDataBloc(
      query: QueryParams(category: 'sport', pageSize: 5), maxResult: 5)
    ..add(ApiDataPagination());

  CarouselHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      width: double.infinity,
      child: BlocBuilder(
        bloc: carouselBloc,
        builder: (context, state) {

          if (state is ApiDataLoaded<ApiPaginationModel<ArticleModel>> &&
              (state.data?.data != null && state.data!.data!.isNotEmpty)) {
            return CarouselItemLoadedWidget(article: state.data?.data);

          } else if (state is ApiDataLoading) {
            return const CustomShimmerWidget(
              margin: EdgeInsets.symmetric(horizontal: 12),
              height: 200,
              width: double.infinity,
              radius: 14,
            );

          } else if (state is ApiDataError) {
            return Center(
              child: Text(state.error!.message ?? ''),
            );
            
          } else {
            return Center(
              child: Text(S().no_more_data_state),
            );
          }
        },
      ),
    );
  }
}
