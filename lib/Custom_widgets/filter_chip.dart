import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ChipFilter extends StatefulWidget {
  final String label;
  final VoidCallback onpressed;

  const ChipFilter({super.key, required this.label, required this.onpressed});

  @override
  State<ChipFilter> createState() => _ChipFilterState();
}

class _ChipFilterState extends State<ChipFilter> {
  var isSelected = false;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return FilterChip(
      padding: EdgeInsets.only(top: 6,bottom: 6),
      labelStyle: isSelected ? theme.textTheme.labelMedium:theme.textTheme.labelSmall,
      backgroundColor: theme.disabledColor,
      selectedColor: theme.primaryColor,
      selected: isSelected,
      label: Text(widget.label),
      onSelected: (bool) {
        setState(() {
          isSelected = !isSelected;
        });
        widget.onpressed;
      },
    );
  }
}
