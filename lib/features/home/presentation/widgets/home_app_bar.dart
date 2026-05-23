
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/widgets/app_svg_icon.dart';

class SearchBarField extends StatelessWidget {
  const SearchBarField({
    super.key,
    this.onTap,
    this.onChanged,
    this.controller,
    this.hint = 'Search',
  });

  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onTap: onTap,
      onChanged: onChanged,
      readOnly: onChanged == null,
      decoration: InputDecoration(
        hintText: hint,
        prefixIconConstraints: const BoxConstraints.tightFor(
          width: AppSizes.inputHeight,
          height: AppSizes.inputHeight,
        ),
        suffixIconConstraints: const BoxConstraints.tightFor(
          width: AppSizes.inputHeight,
          height: AppSizes.inputHeight,
        ),
        prefixIcon: Center(
          child: AppSvgIcon(
            AppAssets.iconSearch,
            size: AppSizes.iconSm,
            color: context.colors.onSurface.withValues(alpha: 0.52),
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(AppSpacing.xs),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: context.colors.primary,
              borderRadius: BorderRadius.circular(AppRadius.sm),
            ),
            child: const Center(
              child: AppSvgIcon(
                AppAssets.iconFilter,
                color: Colors.white,
                size: AppSizes.iconSm,
              ),
            ),
          ),
        ),
      ),
    );
  }
}