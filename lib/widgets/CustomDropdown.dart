import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:first_demo_project/Theme/Colors.dart';
import 'package:get/get.dart';

class DropdownItem {
  final String value;
  final String name;

  DropdownItem({
    required this.value,
    required this.name,
  });
}

class CustomDropdown extends StatefulWidget {
  final List<DropdownItem> items;
  final String? initialValue;
  final ValueChanged<DropdownItem>? onChanged;
  final String? hintText;
  final Color? borderColor;
  final Color? activeBorderColor;
  final Color? textColor;
  final Color? hintColor;
  final Color? iconColor;

  const CustomDropdown({
    Key? key,
    required this.items,
    this.initialValue,
    this.hintText,
    this.onChanged,
    this.borderColor,
    this.activeBorderColor,
    this.textColor,
    this.iconColor,
    this.hintColor,
  }) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  late String? dropdownValue;
  final FocusNode _focusNode = FocusNode();
  late Color borderColor;
  late Color activeBorderColor;
  var borderSize = 1.0;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.initialValue;
    borderColor = widget.borderColor ?? Colors.grey;
    activeBorderColor = widget.activeBorderColor ?? primaryColor;
    _focusNode.addListener(() {
      setState(() {
        borderColor = _focusNode.hasFocus ? activeBorderColor : (widget.borderColor ?? Colors.grey);
        borderSize = _focusNode.hasFocus ? 2.0 : 1.0;
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
            hint: Text(widget.hintText ?? 'Select', style: TextStyle(
              color: widget.textColor ?? Colors.black,
            )),
            style: TextStyle(
              color: widget.textColor ?? Colors.black,
              fontSize: 16,
            ),
            items: widget.items.map((item) {
              return DropdownMenuItem(
                value: item.name,
                child: Text(item.name, style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                )),
              );
            }).toList(),
            iconStyleData: const IconStyleData(icon: Icon(Icons.keyboard_arrow_down)),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // color: primaryColor,
              ),
            ),
            customButton: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        dropdownValue ?? widget.hintText ?? 'Select',
                        style: TextStyle(
                          color: dropdownValue == null ? widget.hintColor ?? Colors.grey : widget.textColor ?? Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down, color: widget.iconColor ?? Colors.black),
                ],
              ),
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
