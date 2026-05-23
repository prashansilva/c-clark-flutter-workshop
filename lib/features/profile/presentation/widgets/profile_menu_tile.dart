
import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/widgets/app_svg_icon.dart';

class ProfileMenuTile extends StatelessWidget {
  const ProfileMenuTile({
    super.key,
    required this.iconAsset,
    required this.title,
    this.route,
  });

  final String iconAsset;
  final String title;
  final String? route;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: AppSvgIcon(iconAsset, color: context.colors.primary),
      title: Text(title),
      trailing: const AppSvgIcon(AppAssets.iconArrowRight),
      onTap: route == null ? null : () => context.pushNamed(route!),
    );
  }
}