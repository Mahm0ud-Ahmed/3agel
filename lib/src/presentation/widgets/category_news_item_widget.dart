import 'package:aagel/src/core/config/themes/language_manager.dart';
import 'package:aagel/src/data/models/article_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../core/config/assets/assets.gen.dart';
import '../../core/config/l10n/generated/l10n.dart';
import '../../core/config/themes/theme_manager.dart';
import '../controllers/data_bloc/api_data_bloc.dart';

class CategoryNewsItemWidget extends StatefulWidget {
  final ArticleModel article;
  const CategoryNewsItemWidget({super.key, required this.article});

  @override
  State<CategoryNewsItemWidget> createState() => _CategoryNewsItemWidgetState();
}

class _CategoryNewsItemWidgetState extends State<CategoryNewsItemWidget> {
  final ApiDataBloc<ArticleModel> _bookmark = ApiDataBloc();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: ThemeManager().appColor[2],
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              width: 0.3,
              color: ThemeManager().appColor[5].withOpacity(0.4),
            ),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.horizontal(
                  left: LanguageManager().isRTL
                      ? const Radius.circular(0)
                      : const Radius.circular(16),
                  right: LanguageManager().isRTL
                      ? const Radius.circular(16)
                      : const Radius.circular(0),
                ),
                child: SizedBox(
                  height: double.infinity,
                  width: constraints.maxWidth * 0.35,
                  child: CachedNetworkImage(
                    imageUrl: widget.article.urlToImage ?? '',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Assets.images.noImage.svg(
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    errorWidget: (context, url, error) =>
                        Assets.images.noImage.svg(
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.article.title!,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      Text(
                        '${S().category_item_source} ${widget.article.source?['name']}',
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Flexible(
                              child: Text(
                                DateFormat('dd/MM/yyyy hh:mm a').format(
                                    DateTime.tryParse(widget.article.publishedAt!)!),
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            BlocBuilder<ApiDataBloc, ApiDataState>(
                              bloc: _bookmark,
                              builder: (context, state) {
                                return IconButton(
                                  onPressed: () {
                                    _bookmark.add(ToggleSaveOrDelete(false, article: widget.article));
                                  },
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  icon: Icon(
                                    (state is ApiDataLoaded<bool> && state.data != null && state.data == true) ? Icons.star_rate_rounded : Icons.star_outline,
                                    size: 18,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
