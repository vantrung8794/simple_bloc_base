import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';
import '../../models/models.dart';

class EmployeeItem extends StatelessWidget {
  const EmployeeItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Employee? item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(8),
      color: Colors.black12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item?.name ?? '',
            style: StyleConstants.hugeText,
          ),
          UIConstants.verticalSpace8,
          Text(
            '${item?.age} years old',
            style: StyleConstants.mediumText.copyWith(
              color: Colors.black38,
            ),
          ),
        ],
      ),
    );
  }
}
