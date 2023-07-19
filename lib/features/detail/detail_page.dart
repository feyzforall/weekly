import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.html});

  final String html;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('data'),
    );
  }
}
