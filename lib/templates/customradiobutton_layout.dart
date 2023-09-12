import 'package:flutter/material.dart';

class CustomRadioButton extends StatefulWidget {
  final String choice1;
  final String choice2;
  final ValueChanged<String?> onChanged;
  final String? groupValue;

  const CustomRadioButton({
    Key? key,
    required this.choice1,
    required this.choice2,
    required this.onChanged,
    required this.groupValue,
  }) : super(key: key);

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(
        16.0,
        8.0,
        16.0,
        8.0,
      ), // Adjust margin as needed
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
        border: Border.all(
          color: Colors.grey[300]!, // Use the same border color as InputRow
          width: 1.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Radio<String>(
              value: widget.choice1,
              groupValue: widget.groupValue,
              onChanged: widget.onChanged,
              activeColor: Colors.green, // Adjust the active color as needed
            ),
          ),
          Expanded(
            child: Radio<String>(
              value: widget.choice2,
              groupValue: widget.groupValue,
              onChanged: widget.onChanged,
              activeColor: Colors.green, // Adjust the active color as needed
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.choice1,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.choice2,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
