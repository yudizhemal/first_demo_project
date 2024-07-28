import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:first_demo_project/Theme/Colors.dart';
import 'package:get/get.dart';

class DropdownItem {
  final String value;
  final String name;

  DropdownItem({required this.value, required this.name});
}

class CustomDropdown extends StatefulWidget {
  final List<DropdownItem> items;
  final String? initialValue;
  final ValueChanged<DropdownItem>? onChanged;
  final String? hintText;
  final Color? borderColor;
  final Color? activeBorderColor;
  final Color textColor;
  final Color hintColor;
  final Color? iconColor;
  final String label;
  final double? labelWidth;

  const CustomDropdown({
    super.key,
    required this.items,
    this.initialValue,
    this.hintText,
    this.onChanged,
    this.borderColor,
    this.activeBorderColor,
    this.textColor = darkBlue,
    this.hintColor = softBlue,
    this.iconColor,
    required this.label,
    this.labelWidth,
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  late String? _dropdownValue;
  late Color _borderColor;
  late Color _activeBorderColor;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _dropdownValue = widget.initialValue;
    _borderColor = widget.borderColor ?? grey2;
    _activeBorderColor = widget.activeBorderColor ?? secondaryColor;
  }

  void _onFocusChange(bool focused) {
    setState(() {
      _isFocused = focused;
      _borderColor =
          focused ? _activeBorderColor : (widget.borderColor ?? grey2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: _onFocusChange,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 4),
            child: Text(
              widget.label,
              style: TextStyle(
                color: widget.textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: _borderColor,
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                value: _dropdownValue,
                items: widget.items
                    .map((item) => DropdownMenuItem(
                          value: item.name,
                          child: Text(item.name,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: widget.textColor,
                                  fontWeight: FontWeight.normal)),
                        ))
                    .toList(),
                dropdownStyleData: DropdownStyleData(
                  offset: const Offset(0, -10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                ),
                onChanged: (String? newValue) {
                  DropdownItem? selectedItem = widget.items
                      .firstWhereOrNull((item) => item.name == newValue);
                  setState(() {
                    _dropdownValue = newValue;
                    if (widget.onChanged != null && selectedItem != null) {
                      widget.onChanged!(selectedItem);
                    }
                  });
                },
                customButton: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        _dropdownValue ?? widget.hintText ?? 'Select',
                        style: TextStyle(
                          color: _dropdownValue == null
                              ? widget.hintColor
                              : widget.textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_down_rounded,
                        color: _isFocused
                            ? primaryColor
                            : widget.iconColor ?? Colors.black),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
