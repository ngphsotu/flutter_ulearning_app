import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common.dart';

// * Reusable Text Form Field
class ReusableTextFormField extends StatefulWidget {
  final int? maxLine;
  final bool obscureText;
  final bool autocorrect;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Function(String value)? onChanged;

  const ReusableTextFormField({
    super.key,
    this.maxLine = 1,
    this.hintText,
    this.labelText,
    this.errorText,
    this.controller,
    this.prefixIcon,
    this.keyboardType,
    this.autocorrect = true,
    this.obscureText = false,
    this.onChanged,
  });

  @override
  State<ReusableTextFormField> createState() => _ReusableTextFormFieldState();
}

class _ReusableTextFormFieldState extends State<ReusableTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLine,
      onChanged: (value) => widget.onChanged!(value),
      autocorrect: widget.autocorrect,
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        errorText: widget.errorText,
        prefixIcon: widget.prefixIcon,
        labelStyle: TextStyle(
          color: AppColors.primaryText,
          fontSize: 14.sp,
          fontFamily: 'Avenir',
          fontWeight: FontWeight.normal,
        ),
        hintStyle: TextStyle(
          color: AppColors.primarySecondaryElementText,
          fontSize: 12.sp,
          fontFamily: 'Avenir',
          fontWeight: FontWeight.normal,
        ),
        errorStyle: TextStyle(
          color: Colors.red,
          fontSize: 12.sp,
          fontFamily: 'Avenir',
          fontWeight: FontWeight.normal,
        ),
        enabledBorder: OutlineInputBorder(
          // borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(15.w),
          borderSide:
              const BorderSide(color: AppColors.primaryThirdElementText),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.w),
          borderSide:
              const BorderSide(color: AppColors.primaryThirdElementText),
        ),
        // border: const OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.transparent),
        // ),
        // disabledBorder: const OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.transparent),
        // ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// class ReuseduceTextFormField extends StatefulWidget {
//   final bool? enable;
//   final bool obscureText;
//   final int? maxLine;
//   final String? hintText;
//   final String? labelText;
//   final String? errorText;
//   final Widget? prefixIcon;
//   final Widget? suffixIcon;
//   final Function? funcValidation;
//   final Function(String)? onChanged;
//   final TextInputType? keyboardType;
//   final InputDecoration? decoration;
//   final TextEditingController? controller;

//   const ReuseduceTextFormField({
//     super.key,
//     this.maxLine = 1,
//     this.decoration = const InputDecoration(),
//     this.enable = true,
//     this.obscureText = false,
//     this.hintText,
//     this.labelText,
//     this.errorText,
//     this.prefixIcon,
//     this.suffixIcon,
//     this.onChanged,
//     this.controller,
//     this.keyboardType,
//     this.funcValidation,
//   });

//   @override
//   State<ReuseduceTextFormField> createState() => _ReuseduceTextFormFieldState();
// }

// class _ReuseduceTextFormFieldState extends State<ReuseduceTextFormField> {
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       maxLines: widget.maxLine,
//       onChanged: widget.onChanged,
//       controller: widget.controller,
//       obscureText: widget.obscureText,
//       keyboardType: widget.keyboardType,
//       decoration: InputDecoration(
//         hintText: widget.hintText,
//         labelText: widget.labelText,
//         errorText: widget.errorText,
//         prefixIcon: widget.prefixIcon,
//         suffixIcon: widget.suffixIcon,
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: const BorderSide(color: Colors.grey),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: const BorderSide(color: Colors.grey),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: const BorderSide(color: Colors.grey),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: const BorderSide(color: Colors.grey),
//         ),
//       ),
//     );
//   }
// }
