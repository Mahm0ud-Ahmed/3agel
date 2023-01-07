import 'package:aagel/src/core/utils/extension.dart';
import 'package:aagel/src/presentation/screens/home/pages/latest/widget/carousel_item_loaded_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/config/l10n/generated/l10n.dart';
import '../../../../../../data/models/api_pagination_model.dart';
import '../../../../../../data/models/article_model.dart';
import '../../../../../controllers/data_bloc/api_data_bloc.dart';
import '../../../../../widgets/custom_shimmer_widget.dart';

class CarouselHeaderWidget extends StatelessWidget {
  final ApiDataBloc<ArticleModel> carouselBloc;

  const CarouselHeaderWidget({super.key, required this.carouselBloc});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: headerHeight(context),
      width: double.infinity,
      child: BlocBuilder(
        bloc: carouselBloc,
        builder: (context, state) {
          if (state is ApiDataLoaded<ApiPaginationModel<ArticleModel>> &&
              (state.data?.data != null && state.data!.data!.isNotEmpty)) {
            return CarouselItemLoadedWidget(
              article: state.data?.data,
              height: headerHeight(context) - 24,
            );
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

  double headerHeight(BuildContext context){
    return context.isPortrait ? context.screenSize.height * 0.44 : context.screenSize.height * 0.65;
  }
}
