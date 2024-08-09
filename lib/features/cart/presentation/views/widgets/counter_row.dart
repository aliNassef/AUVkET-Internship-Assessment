
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_spacer.dart';
import '../../../../../core/utils/app_styles.dart';

import '../../../../../core/utils/app_colors.dart';

class CounterRow extends StatelessWidget {
  const CounterRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: AppColors.mainColor,
          child: const Icon(
            Icons.remove,
            color: Colors.white,
          ),
        ),
        const HorizatalSpacer(8),
        Text(
          '1',
          style: AppStyles.textStyle18MP.copyWith(
            color: const Color(0xff06004F),
          ),
        ),
        const HorizatalSpacer(8),
        CircleAvatar(
          radius: 18,
          backgroundColor: AppColors.mainColor,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
