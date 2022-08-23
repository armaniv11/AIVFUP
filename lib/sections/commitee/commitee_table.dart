import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class CommiteeTable extends StatefulWidget {
  final List<dynamic> members;
  final List<String>? headings;
  final bool isMobile;
  const CommiteeTable(
      {Key? key, required this.members, this.headings, this.isMobile = false})
      : super(key: key);

  @override
  State<CommiteeTable> createState() => _CommiteeTableState();
}

class _CommiteeTableState extends State<CommiteeTable> {
  List<CommiteeMember> _items = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      _items = _generateItems();
    });
  }

  List<CommiteeMember> _generateItems() {
    int finalIndex = -1;
    return List.generate(widget.members.length, (int index) {
      print("$finalIndex final Index");
      if (widget.members[index][0] != '') {
        finalIndex = finalIndex + 1;
      }
      return CommiteeMember(
        id: widget.members[index][0] == '' ? '' : '${finalIndex + 1}.',
        name: widget.members[index][0],
        district: widget.members[index][1],
        post: widget.members[index][2],
        mob: widget.members[index][3],
      );
    });
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(
        label: Text(
          'क्र.',
          style: TextStyle(fontSize: widget.isMobile ? 14 : 18),
        ),
      ),
      DataColumn(
        label: Text(widget.headings == null ? ' नाम' : widget.headings![0],
            style: TextStyle(fontSize: widget.isMobile ? 14 : 18)),
      ),
      DataColumn(
        label: Text(widget.headings == null ? ' जिला ' : widget.headings![1],
            style: TextStyle(fontSize: widget.isMobile ? 14 : 18)),
        numeric: false, // Deliberately set to false to avoid right alignment.
      ),
      DataColumn(
        label:
            Text(' पद ', style: TextStyle(fontSize: widget.isMobile ? 14 : 18)),
      ),
      if (!widget.isMobile)
        DataColumn(
          label: Text('मो. न.',
              style: TextStyle(fontSize: widget.isMobile ? 14 : 18)),
        ),
    ];
  }

  DataRow _createRow(CommiteeMember item) {
    return DataRow(
      // index: item.id, // for DataRow.byIndex
      key: ValueKey(randomAlpha(6)),

      color: MaterialStateColor.resolveWith((Set<MaterialState> states) =>
          states.contains(MaterialState.selected) ? Colors.red : Colors.white),
      cells: [
        DataCell(
          Text(
            item.id.toString(),
            style: TextStyle(fontSize: widget.isMobile ? 14 : 16),
          ),
        ),
        DataCell(
          Text(
            item.name == ''
                ? ""
                : widget.isMobile
                    ? "${item.name} (${item.mob})"
                    : "${item.name}",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: widget.isMobile ? 12 : 16),
          ),
          placeholder: false,
        ),
        DataCell(Text(item.district.toString(),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: widget.isMobile ? 12 : 16))),
        DataCell(
          Text(item.post,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: widget.isMobile ? 12 : 16)),
        ),
        if (!widget.isMobile)
          DataCell(
            Text(item.mob,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: widget.isMobile ? 0 : size.width * 0.1),
          child: DataTable(
            columnSpacing: widget.isMobile ? 6 : 12,
            border: TableBorder.all(
              width: widget.isMobile ? 2.0 : 5.0,
              color: Colors.grey,
            ),
            dataRowColor: MaterialStateColor.resolveWith(
                (Set<MaterialState> states) =>
                    states.contains(MaterialState.selected)
                        ? Colors.blue
                        : Color.fromARGB(100, 215, 217, 219)),
            dataRowHeight: widget.isMobile ? 60 : 40,
            dataTextStyle: const TextStyle(color: Colors.black),
            headingRowColor:
                MaterialStateColor.resolveWith((states) => Colors.blue[100]!),
            headingRowHeight: 50,
            headingTextStyle: TextStyle(
                fontWeight:
                    widget.isMobile ? FontWeight.normal : FontWeight.bold,
                color: Colors.black),
            horizontalMargin: widget.isMobile ? 1 : 10,
            showBottomBorder: false,
            showCheckboxColumn: false,
            columns: _createColumns(),
            rows: _items.map((item) => _createRow(item)).toList(),
          ),
        ),
      ),
    );
  }
}

class CommiteeMember {
  CommiteeMember({
    required this.id,
    required this.name,
    required this.post,
    required this.district,
    required this.mob,
  });

  String id;
  String name;
  String district;
  String post;
  String mob;
}
