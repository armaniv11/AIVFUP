import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AdaptiveText extends StatelessWidget {
  final String? text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxlines;

  AdaptiveText(this.text, {Key? key, this.style, this.textAlign, this.maxlines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return kIsWeb
        ? SelectableText(
            text!,
            style: style,
            textAlign: textAlign,
            maxLines: maxlines,
          )
        : Text(
            text!,
            style: style,
            textAlign: textAlign,
            maxLines: maxlines,
          );
  }
}
