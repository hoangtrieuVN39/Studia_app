import 'package:flutter/material.dart';
import 'package:studia/core/core.dart';

class CustomBottomSheet {
  static void show(BuildContext context, List<BottomSheetItem> items) {
    showModalBottomSheet(
      useSafeArea: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.8,
          ),
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 24,
          ),
          decoration: const BoxDecoration(
            color: AppColors.snow,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: AppColors.divider,
                  borderRadius: BorderRadius.circular(2.5),
                ),
              ),

              if (items.length > 9)
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder:
                        (context, index) => BottomSheetItem(
                          text: items[index].text,
                          isSelected: items[index].isSelected,
                          onTap: items[index].onTap,
                        ),
                  ),
                )
              else
                ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder:
                      (context, index) => BottomSheetItem(
                        text: items[index].text,
                        isSelected: items[index].isSelected,
                        onTap: items[index].onTap,
                      ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class BottomSheetItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function onTap;

  const BottomSheetItem({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 48,
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFCDA9) : AppColors.snow,
          border: Border.all(
            color: isSelected ? AppColors.powerorange : AppColors.divider,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: AppTextStyles.body.copyWith(
            color: isSelected ? AppColors.powerorange : AppColors.darkgray,
          ),
        ),
      ),
    );
  }
}
