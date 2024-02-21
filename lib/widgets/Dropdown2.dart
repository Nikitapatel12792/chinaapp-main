import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Drpdown extends StatelessWidget {
  final String hint;
  final String? value;
  final List<String> dropdownItems;
  final ValueChanged<String?>? onChanged;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final Widget? icon;
  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final double? itemHeight;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset offset;

  const Drpdown({
    required this.hint,
    required this.value,
    required this.dropdownItems,
    required this.onChanged,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.valueAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonElevation,
    this.icon,
    this.iconSize,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.itemHeight,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.offset = const Offset(0, 0),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        //To avoid long text overflowing.
        isExpanded: true,
        hint: Container(
          alignment: hintAlignment,
          child: Text(
            hint,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              fontFamily: "simsam",
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ),
        value: value,
        items: dropdownItems
            .map((item) => DropdownMenuItem<String>(
          value: item,
          child: Container(
            alignment: valueAlignment,
            child: Text(
              item,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style:  TextStyle(
                fontSize: 16.sp,
              ),
            ),
          ),
        ))
            .toList(),
        onChanged: onChanged,
        selectedItemBuilder: selectedItemBuilder,
        buttonStyleData: ButtonStyleData(
          height: buttonHeight ?? 40.h,
          width: buttonWidth ?? 220.w,
          padding: buttonPadding ??  EdgeInsets.only(left: 8.w, right: 3.w),
          decoration: buttonDecoration ??
              BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  border: Border.all(
                    color: Color(0xffb797979),
                  ),
                  color: Colors.white.withOpacity(0.70)
              ),

          elevation: buttonElevation,
        ),

        iconStyleData: IconStyleData(
          icon: icon ?? const Icon(Icons.arrow_drop_down),
          iconSize: iconSize ?? 25.sp,
          iconEnabledColor: iconEnabledColor,
          iconDisabledColor: iconDisabledColor,
        ),
        dropdownStyleData: DropdownStyleData(
          //Max height for the dropdown menu & becoming scrollable if there are more items. If you pass Null it will take max height possible for the items.
          maxHeight: dropdownHeight ?? 250.h,
          width: dropdownWidth ?? 220.w,
          padding: dropdownPadding ?? EdgeInsets.symmetric(vertical: 5.h),
          decoration: dropdownDecoration ??
              BoxDecoration(
                borderRadius: BorderRadius.circular(14),
              ),
          elevation: dropdownElevation ?? 8,
          //Null or Offset(0, 0) will open just under the button. You can edit as you want.
          offset: offset,
          //Default is false to show menu below button
          isOverButton: false,
          scrollbarTheme: ScrollbarThemeData(
            radius: scrollbarRadius ?? const Radius.circular(40),
            thickness: scrollbarThickness != null
                ? MaterialStateProperty.all<double>(scrollbarThickness!)
                : null,
            thumbVisibility: scrollbarAlwaysShow != null
                ? MaterialStateProperty.all<bool>(scrollbarAlwaysShow!)
                : null,
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
          height: itemHeight ?? 40.h,
          padding: itemPadding ??  EdgeInsets.only(left: 14.w, right: 14.w),
        ),
      ),
    );
  }
}