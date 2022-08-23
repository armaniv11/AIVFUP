import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  final String? heading;
  final List? items;
  final String? selected;
  final double width;
  final String dropdownHint;
  final ValueChanged<String> callBack;
  final Color color;

  const CustomDropDown(
      {Key? key,
      required this.heading,
      required this.items,
      required this.callBack,
      required this.selected,
      this.color = Colors.indigo,
      this.width = 200,
      this.dropdownHint = 'Option!!'})
      : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    String? _selected = widget.selected;
    return SizedBox(
      width: widget.width,
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Material(
          type: MaterialType.canvas,
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          elevation: 8,
          child: Row(
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.heading == ''
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        widget.heading!,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: widget.color),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
              SizedBox(height: 14, child: VerticalDivider()),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: DropdownButton(
                    hint: Text(widget.dropdownHint),
                    underline: SizedBox(),
                    onChanged: (dynamic val) {
                      setState(() {
                        _selected = val;
                        print(val);
                        widget.callBack(_selected!);
                        // _selectedCare = val.toString();
                      });
                    },
                    isExpanded: true,
                    iconEnabledColor: Colors.blue[800],
                    dropdownColor: Colors.grey[100],
                    style: TextStyle(
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.grey[800]),
                    value: _selected,
                    items: widget.items!.map((location) {
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
