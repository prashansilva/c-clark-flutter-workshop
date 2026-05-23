import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/extensions.dart';
import '../../../../core/services/services.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../routes/app_routes.dart';
import '../providers/onboarding_provider.dart';
import '../widgets/onboarding_page_item.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _index = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _finish() async {
    //await LocalStorageService.instance.setOnboardingCompleted(true);
    if (!mounted) return;
    context.pushNamedAndRemoveUntil(AppRoutes.main);
  }

  @override
  Widget build(BuildContext context) {
    final List<OnboardingSlide> slides = [
      OnboardingSlide(
        title: 'Your Shopping Destination for Everything',
        description:
        'Find fashion, furniture, gadgets, and daily essentials in one beautiful mobile store.',
        image: AppAssets.onboardingGrid,
      ),
      OnboardingSlide(
        title: 'Wishlist to Dream Product, in Just a Few Clicks',
        description:
        'Save favorites, compare choices, and come back when the time feels right.',
        image: AppAssets.onboardingPhone,
      ),
      OnboardingSlide(
        title: 'Swift and Reliable Delivery',
        description:
        'Track every order clearly from checkout to your front door.',
        image: AppAssets.onboardingDelivery,
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _finish,
                  child: const Text('Skip'),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: slides.length,
                  onPageChanged: (value) => setState(() => _index = value),
                  itemBuilder: (context, index) {
                    final slide = slides[index];
                    return OnboardingPageItem(slide: slide);
                  },
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(slides.length, (dot) {
                  final bool active = dot == _index;
                  return AnimatedContainer(
                    duration: AppDurations.fast,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: active ? 22 : 7,
                    height: 7,
                    decoration: BoxDecoration(
                      color: active
                          ? context.colors.primary
                          : AppColors.lightBorder,
                      borderRadius: BorderRadius.circular(999),
                    ),
                  );
                }),
              ),
              const SizedBox(height: AppSpacing.lg),
              AppButton(
                label: _index == slides.length - 1 ? 'Get Started' : 'Next',
                onPressed: () {
                  if (_index == slides.length - 1) {
                    _finish();
                    return;
                  }
                  _pageController.nextPage(
                    duration: AppDurations.normal,
                    curve: Curves.easeOut,
                  );
                },
                iconAsset: AppAssets.iconArrowRight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
