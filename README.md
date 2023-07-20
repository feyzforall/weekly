# weekly

Weekly, son 1 hafta içinde New York Times'da yayımlanan favori makaleleri okuyabileceğiniz bir uygulamadır.

## Teknoloji 

Neleri kullandım :

- [Flutter] : Bu harika teknoloji için bildiğimiz, bilmediğimiz, varolmuş ve varolabilme ihtimali olan tüm tanrılar, sağolun.
- [get_it] : Dependency injection amacıyla kullanılan kütüphane.
- [BLoC] : State management state management nedir bu state management.
- [go_router] : go go go(router).
- [mockito] : Adı güzel kendi güzel test kütüphanemiz.


   [Flutter]: <https://flutter.dev>
   [get_it]: <https://pub.dev/packages/get_it>
   [BLoC]: <https://pub.dev/packages/flutter_bloc>
   [go_router]: <https://pub.dev/packages/go_router>
   [mockito]: <https://pub.dev/packages/mockito>
  

## Kurulumlar

Projede Flutter'ın 3.13.0-7.0.pre.17, Dart'ın ise 3.1.0 sürümü kullanılmıştır. 

Paketleri indirmek ve projeyi başlatmak sırasıyla şu komutları çalıştırabilirsiniz.

```sh
flutter clean
flutter pub get
flutter run
```

Ayrıca, testleri çalıştırmak için: 

```sh
flutter test
```

Test coverage'i görmek içinse 

```sh
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

komutlarını sırasını yazmanız yeterli.

## Sorunlar

Makalenin detayının verildiği url sonuç olarak HTML formatında bir çıktı veriyor. Kullanılan HTML kütüphaneleri ise tahminlerime göre mevcut Flutter versiyonuyla uyumsuzluk yaşadığı için saçma sapan hatalara sebebiyet veriyor. Bu sorunun kaynağının da kullandığım Flutter sürümünün kararlı sürüm olmaması olduğunu düşünüyorum. Olur da canlıya proje yapılacak olursa bu sürüm kullanılmayacağı için bu tarz problemler yaşanmayacaktır.

Not: Kararlı olmayan sürümleri kullanmayı ve geliştiricilerin geliştirme aşamasında nelerle uğraştığını görmeyi seviyorum. Mobil uygulamalarda da eğer varsa beta sürümü kullanmaya çalışırım hep..

## Uygulamadan kesitler 

<p float="left">
   <img src="https://github.com/feyzforall/weekly/assets/30154300/63d53939-df53-4440-9ab0-664b90ae35a5.png" width=320>
   <img src="https://github.com/feyzforall/weekly/assets/30154300/83e86f3c-2d38-4aeb-9db2-da03872c7566" width=320>
</p>



