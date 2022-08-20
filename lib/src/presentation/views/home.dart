import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_auth/core/app_prefs.dart';
import 'package:simple_auth/core/di.dart';
import 'package:simple_auth/src/data/responses/response.dart';
import 'package:simple_auth/src/presentation/busines_logic/auth/auth_cubit.dart';
import 'package:simple_auth/src/presentation/busines_logic/home/home_cubit.dart';
import 'package:simple_auth/src/presentation/common_widgets/drug_item.dart';
import 'package:simple_auth/src/presentation/resources/color_manager.dart';
import 'package:simple_auth/src/presentation/resources/strings_manager.dart';
import 'package:simple_auth/src/presentation/resources/style_manager.dart';

import '../resources/font_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/values_manager.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        // homeCubit.getProblems();
        return Scaffold(
          backgroundColor: ColorManager.darkBackground,
          body: state is GetProblemsSuccessState
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: AppSize.s50,
                      ),
                      _getWelcomeWidget(),
                      _getDrugsClassesWidget(state.data.problems![0]
                          .diabetes![0].medications![0].medicationsClasses![0]),
                    ],
                  ),
                )
              : state is GetProblemsErrorState
                  ? Center(
                      child: Text(
                      state.msg,
                      style: getRegularStyle(
                          color: ColorManager.white,
                          fontSize: FontSizeManager.s15),
                    ))
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
          floatingActionButton: FloatingActionButton(
              backgroundColor: ColorManager.black.withOpacity(0.3),
              elevation: 40,
              onPressed: () {
                authCubit.logout();
                Navigator.pushReplacementNamed(context, Routes.loginRoute);
              },
              child: const Icon(Icons.logout)),
        );
      },
    );
  }

  _getUserName() {
    AppPreferences appPreferences = instance<AppPreferences>();
    String? username = appPreferences.getUserName();
    return username;
  }

  _getWelcomeWidget() {
    String welcomeMsg = Greeting.get(DateTime.now().hour);
    String username = _getUserName();
    String text = '$welcomeMsg\n$username';

    return Padding(
      padding: const EdgeInsets.all(AppPadding.p10),
      child: Text(
        text,
        style: getRegularStyle(
            fontSize: FontSizeManager.s25, color: ColorManager.white),
      ),
    );
  }

  _getDrugsClassesWidget(MedicationsClassesResponse mcl) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // class 1
          Text(
            "Class1",
            style: getRegularStyle(
                fontSize: FontSizeManager.s18, color: ColorManager.lightGrey),
          ),
          Text(
            "AssociatedDrug1",
            style: getRegularStyle(
                fontSize: FontSizeManager.s18, color: ColorManager.lightGrey),
          ),
          ..._getDrugsList(mcl.class1![0].associtiveDrug!),
          Text(
            "AssociatedDrug2",
            style: getRegularStyle(
                fontSize: FontSizeManager.s18, color: ColorManager.lightGrey),
          ),
          ..._getDrugsList(mcl.class1![0].associatedDrug2),

          const SizedBox(
            height: AppSize.s30,
          ),
          // class 2
          Text(
            "Class2",
            style: getRegularStyle(
                fontSize: FontSizeManager.s18, color: ColorManager.lightGrey),
          ),
          Text(
            "AssociatedDrug1",
            style: getRegularStyle(
                fontSize: FontSizeManager.s18, color: ColorManager.lightGrey),
          ),
          ..._getDrugsList(mcl.class2![0].associtiveDrug!),
          Text(
            "AssociatedDrug2",
            style: getRegularStyle(
                fontSize: FontSizeManager.s18, color: ColorManager.lightGrey),
          ),
          ..._getDrugsList(mcl.class2![0].associatedDrug2),
        ],
      ),
    );
  }

  _getDrugsList(List<AssocitiveDrugResponse> drugs) {
    return List.generate(drugs.length, (index) => DrugItem(drug: drugs[index]));
  }
}

class Greeting {
  static String get(int hour) {
    if (hour < 12) {
      return AppStrings.goodMorning;
    }
    if (hour < 17) {
      return AppStrings.goodAfternoon;
    }
    return AppStrings.goodEvening;
  }
}
