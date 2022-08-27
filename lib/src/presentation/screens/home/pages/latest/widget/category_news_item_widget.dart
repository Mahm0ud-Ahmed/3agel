import 'package:aagel/src/data/models/article_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/config/assets/assets.gen.dart';
import '../../../../../../core/config/l10n/generated/l10n.dart';
import '../../../../../../core/config/themes/theme_manager.dart';

class CategoryNewsItemWidget extends StatelessWidget {
  final ArticleModel article;
  const CategoryNewsItemWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return DecoratedBox(
          decoration: BoxDecoration(
              color: ThemeManager().appColor[0],
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                  width: 0.3,
                  color: ThemeManager().appColor[5].withOpacity(0.4))),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    topLeft: Radius.circular(16)),
                child: SizedBox(
                  height: double.infinity,
                  width: constraints.maxWidth * 0.35,
                  child: CachedNetworkImage(
                    imageUrl: article.urlToImage ?? '',
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
                        article.title!,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      Text(
                        '${S().category_item_source} ${article.source?['name']}',
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            DateFormat('dd/MM/yyyy hh:mm a').format(
                                DateTime.tryParse(article.publishedAt!)!),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          IconButton(
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            icon: const Icon(
                              Icons.star_outline,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}