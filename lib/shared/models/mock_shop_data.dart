import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';
import 'shop_models.dart';

class MockShopData {
  MockShopData._();

  static const UserProfile user = UserProfile(
    name: 'Ester Howard',
    email: 'ester.howard@example.com',
    phone: '+94 77 123 4567',
    avatar: AppAssets.avatarUser,
  );
}
