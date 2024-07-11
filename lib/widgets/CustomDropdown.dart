import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:first_demo_project/Theme/Colors.dart';
import 'package:get/get.dart';

class DropdownItem {
  final String value;
  final String name;

  DropdownItem(
      {required this.value, required this.name});
}


class CustomDropdown extends StatefulWidget {
  final List<DropdownItem> items;
  final String? initialValue;
  final ValueChanged<DropdownItem>? onChanged;

  const CustomDropdown({
    Key? key,
    required this.items,
    this.initialValue,
    this.onChanged,
  }) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown>{
  late String? dropdownValue;
  final FocusNode _focusNode = FocusNode();
  Color borderColor = Colors.grey;
  var borderSize = 1.0;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.initialValue;
    _focusNode.addListener(() {
      setState(() {
        borderColor = _focusNode.hasFocus ? primaryColor : Colors.grey;
        borderSize = _focusNode.hasFocus ? 1.9 : 1.0;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: _focusNode,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: borderSize),
          borderRadius: BorderRadius.circular(10),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton2(
            isExpanded: true,
            value: dropdownValue,
            hint: const Text('Select an item'),
            items: widget.items.map((item) {
              return DropdownMenuItem(
                value: item.name,
                child: Text(item.name, style: const TextStyle(
                  fontWeight: FontWeight.normal,
                )),
              );
            }).toList(),
            iconStyleData: const IconStyleData(icon: Icon(Icons.keyboard_arrow_down)),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.only(right: 8, top: 3, bottom: 3),
            ),
            onChanged: (String? newValue) {
              DropdownItem? selectedItem = widget.items.firstWhereOrNull((item) => item.name == newValue);
              setState(() {
                dropdownValue = newValue;
                if (widget.onChanged != null && selectedItem != null) {
                  widget.onChanged!(selectedItem);
                }
              });
            },
          ),
        ),
      ),
    );
  }
}