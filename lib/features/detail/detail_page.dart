import 'package:flutter/material.dart';
import 'package:weekly/features/home/model/articles.dart';
import 'package:weekly/product/constants/dimensions.dart';

//! Error : Mevcuttaki html kütüphaneleri projede kullanılan flutter versiyonuyla
// benim düşünceme göre uyumsuzluk problemi olduğu için bu ekran yapılamadı. Kütüphane çalışsaydı
// gelen url ile html direkt ekrana basılacaktı. Vebview istenmediği için bu şekilde bırakıldı.

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: Dimensions.pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(article.imageUrl),
            SizedBox(height: Dimensions.smallPadding.bottom),
            Text(
              article.title.toString(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: Dimensions.smallPadding.bottom),
            Text(
              article.subtitle.toString(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: Dimensions.smallPadding.bottom),
            Text(article.publishedDate.toString())
          ],
        ),
      ),
    );
  }
}
