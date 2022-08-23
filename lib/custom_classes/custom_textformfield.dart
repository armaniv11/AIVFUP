import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final Widget? icon;
  final double width;
  final double paddingLeft;
  final double paddingRight;
  final double paddingTop;
  final double paddingBottom;
  final TextInputType inputType;
  final int maxlines;
  final int? maxlength;
  final Color headingColor;
  final bool isDense;
  final double headingSize;
  final bool validationEnabled;
  final bool enabled;
  final bool reverted;
  final VoidCallback? onChanged;
  final String? suffix;
  const CustomTextFormField(
      {Key? key,
      required this.controller,
      this.hintText,
      this.icon,
      this.width = double.maxFinite,
      this.inputType = TextInputType.number,
      this.maxlines = 1,
      this.maxlength,
      this.headingColor = Colors.grey,
      this.isDense = true,
      this.headingSize = 14,
      this.validationEnabled = false,
      this.enabled = true,
      this.reverted = false,
      this.onChanged,
      this.suffix,
      this.paddingLeft = 0,
      this.paddingRight = 8,
      this.paddingTop = 0,
      this.paddingBottom = 16})
      : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: widget.paddingLeft,
          right: widget.paddingRight,
          top: widget.paddingTop,
          bottom: widget.paddingBottom),
      child: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            width: widget.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white.withOpacity(0.9),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              child: TextFormField(
                  validator: (value) {
                    if (widget.validationEnabled) {
                      return value!.isEmpty
                          ? "${widget.hintText} cannot be empty!!"
                          : null;
                    }
                    return null;
                  },
                  textCapitalization: TextCapitalization.sentences,
                  enabled: widget.enabled,
                  maxLines: widget.maxlines == 1 ? null : widget.maxlines,
                  maxLength: widget.maxlength == 15 ? null : widget.maxlength,
                  keyboardType: widget.inputType,
                  controller: widget.controller,
                  style: TextStyle(
                      color: !widget.enabled ? Colors.grey : Colors.black),
                  decoration: InputDecoration(
                      label: Text("${widget.hintText}"),
                      suffixText: widget.suffix,
                      labelStyle: const TextStyle(color: Colors.black),
                      errorStyle: const TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                      prefixIcon: widget.icon,
                      filled: false,
                      isDense: true,
                      border: InputBorder.none),
                  onChanged: (val) {
                    if (widget.onChanged != null) {
                      widget.onChanged!();
                    }
                    // if (widget.reverted) {
                    //   widget.onChanged(val);
                    // }
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
