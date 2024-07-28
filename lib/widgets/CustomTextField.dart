import 'package:flutter/material.dart';
import 'package:first_demo_project/Theme/Colors.dart';

class CustomTextField extends StatefulWidget {
  final String value;
  final void Function(String)? onTextChanged;
  final String? errorText;
  final bool disabled;
  final String label;
  final String? hintText;
  final double? labelWidth;
  final bool autofocus;
  final Color borderColor;
  final Color activeBorderColor;
  final Color? textColor;
  final Color? hintColor;

  const CustomTextField({
    super.key,
    required this.value,
    this.onTextChanged,
    this.errorText,
    this.disabled = false,
    required this.label,
    this.hintText,
    this.labelWidth,
    this.autofocus = false,
    this.borderColor = grey2,
    this.activeBorderColor = secondaryColor,
    this.textColor = darkBlue,
    this.hintColor = softBlue,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late final TextEditingController _controller;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
    _controller.addListener(_onTextChanged);
  }

  @override
  void didUpdateWidget(CustomTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _controller.text = widget.value;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    widget.onTextChanged?.call(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (focused) => setState(() => _isFocused = focused),
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
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color:
                    _isFocused ? widget.activeBorderColor : widget.borderColor,
              ),
            ),
            child: TextField(
              controller: _controller,
              enabled: !widget.disabled,
              autofocus: widget.autofocus,
              decoration: InputDecoration(
                errorText: widget.errorText,
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: widget.hintColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
              style: TextStyle(
                color: widget.textColor,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
