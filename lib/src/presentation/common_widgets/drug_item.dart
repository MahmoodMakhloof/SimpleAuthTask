import 'package:flutter/material.dart';
import 'package:simple_auth/src/data/responses/response.dart';
import 'package:simple_auth/src/presentation/resources/color_manager.dart';
import 'package:simple_auth/src/presentation/resources/font_manager.dart';
import 'package:simple_auth/src/presentation/resources/style_manager.dart';
import 'package:simple_auth/src/presentation/resources/values_manager.dart';

class DrugItem extends StatelessWidget {
  final AssocitiveDrugResponse drug;
  const DrugItem({Key? key, required this.drug}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
      child: Container(
        decoration: BoxDecoration(
            color: ColorManager.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(AppSize.s14)),
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p15),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    drug.name!,
                    style: getRegularStyle(
                        fontSize: FontSizeManager.s15,
                        color: ColorManager.white),
                  ),
                  Text(
                    drug.strength!,
                    style: getRegularStyle(
                        fontSize: FontSizeManager.s15,
                        color: ColorManager.white),
                  )
                ],
              ),
              Text(drug.dose!,
                  style: getRegularStyle(
                      fontSize: FontSizeManager.s15, color: ColorManager.white))
            ],
          ),
        ),
      ),
    );
  }
}
