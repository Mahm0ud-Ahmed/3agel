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
  final Function(ArticleModel)? onDelete;
  const CategoryNewsItemWidget({super.key, required this.article, this.onDelete});

  @override
  State<CategoryNewsItemWidget> createState() => _CategoryNewsItemWidgetState();
}

class _CategoryNewsItemWidgetState extends State<CategoryNewsItemWidget> {
  final ApiDataBloc<ArticleModel> _bookmark = ApiDataBloc();
  late final ValueNotifier<bool> _bookmarkNotifier;

  @override
  void initState() {
    super.initState();
    _bookmarkNotifier = ValueNotifier(false);
  }

  @override
  void didChangeDependencies()async  {
    super.didChangeDependencies();
    _bookmarkNotifier.value = await _bookmark.isBookmark(widget.article.url!);
  }

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
                  padding: const EdgeInsetsDirectional.only(start: 8, end: 8, top: 8),
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
                      const SizedBox(height: 8,),
                      Text(
                        '${S().category_item_source} ${widget.article.source?['name']}',
                        style: TextStyle(
                          color: ThemeManager().appColor[6],
                          fontSize: 14
                        ),
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                DateFormat('dd/MM/yyyy hh:mm a').format(
                                    DateTime.tryParse(widget.article.publishedAt!)!),
                                style: TextStyle(
                                  color: ThemeManager().appColor[6],
                                  fontSize: 14
                                ),
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            BlocListener(
                              bloc: _bookmark,
                              listener: (context, state) async{
                                if(state is ApiDataLoaded<bool> && state.data != null){
                                  _bookmarkNotifier.value =  await _bookmark.isBookmark(widget.article.url!);
                                }
                              },
                              child: ValueListenableBuilder<bool>(
                                valueListenable: _bookmarkNotifier,
                                builder: (context, value, child) {
                                  _bookmark.isBookmark(widget.article.url!).then((value) => _bookmarkNotifier.value = value);
                                  return IconButton(
                                    onPressed: () async{
                                      _bookmark.add(ToggleSaveOrDelete(value, article: widget.article));
                                      widget.onDelete?.call(widget.article);
                                    },
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    icon: Icon(
                                      value ? Icons.star_rate_rounded : Icons.star_border_rounded,
                                      size: 24,
                                      color: ThemeManager().appColor[4],
                                    ),
                                  );
                                },
                              ),
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
