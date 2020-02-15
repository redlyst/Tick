import 'package:flutter/material.dart';

class PageViewCardListTile extends StatelessWidget {
  final String title;
  final String content;
  final bool biggerContent;

  PageViewCardListTile({
    @required this.title,
    @required this.content,
    this.biggerContent = false,
  })  : assert(title != null),
        assert(content != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Color(0xff9595a4)),
        ),
        SizedBox(
          height: 4.0,
        ),
        Text(
          content,
          style: biggerContent
              ? Theme.of(context)
                  .textTheme
                  .title
                  .merge(TextStyle(color: Color(0xff42404d)))
              : Theme.of(context)
                  .textTheme
                  .subtitle
                  .merge(TextStyle(color: Color(0xff42404d))),
        ),
        SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
