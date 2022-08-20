import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_auth/core/validation.dart';
import 'package:simple_auth/src/presentation/resources/style_manager.dart';

import '../busines_logic/auth/auth_cubit.dart';
import '../common_widgets/my_auth_text_field.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/values_manager.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //* Auth Bloc
    final authBloc = BlocProvider.of<AuthCubit>(context);

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoginSuccessState) {
          Navigator.pushReplacementNamed(context, Routes.homeRoute);
        }
      },
      builder: ((context, state) {
        return Scaffold(
          backgroundColor: ColorManager.darkBackground,
          appBar: AppBar(
            backgroundColor: ColorManager.darkBackground,
            automaticallyImplyLeading: false,
            actions: [
              if (state is AuthLoginLoadingState)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppPadding.p16),
                  child: Center(
                    child: SizedBox(
                      height: AppSize.s20,
                      width: AppSize.s20,
                      child: CircularProgressIndicator(
                        color: ColorManager.white,
                        strokeWidth: AppSize.s1_5,
                      ),
                    ),
                  ),
                )
            ],
          ),
          body: Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: AppPadding.p15),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppPadding.p10,
                            ),
                            child: Text(
                              AppStrings.login,
                              style: getBoldStyle(
                                  color: ColorManager.white,
                                  fontSize: FontSizeManager.s50),
                            ),
                          )),
                      const SizedBox(
                        height: AppSize.s16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p10,
                            vertical: AppPadding.p10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            AppStrings.loginText,
                            style: getRegularStyle(
                                color: ColorManager.white,
                                fontSize: FontSizeManager.s13),
                          ),
                        ),
                      ),
                      MyAuthTextField(
                        controller: _emailController,
                        validator: (email) {
                          return EmailValidator.validate(email!);
                        },
                        inputType: TextInputType.emailAddress,
                        hintText: AppStrings.email,
                      ),
                      const SizedBox(
                        height: AppSize.s8,
                      ),
                      MyAuthTextField(
                        controller: _passwordController,
                        isObsecure: authBloc.isLoginPasswordSecured,
                        hintText: AppStrings.password,
                        inputType: TextInputType.visiblePassword,
                        suffix: InkWell(
                          onTap: () {
                            authBloc.loginPasswordToggleShow();
                          },
                          child: Text(authBloc.isLoginPasswordSecured
                              ? AppStrings.show
                              : AppStrings.hide),
                        ),
                        validator: (password) {
                          return PasswordValidator.validate(password!);
                          
                        },
                      ),
                      const SizedBox(
                        height: AppSize.s10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: AppSize.s50,
                        child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                authBloc.login(_emailController.text,
                                    _passwordController.text);
                              }
                            },
                            child: const Text(
                              AppStrings.login,
                            )),
                      ),
                      Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        children: [
                          // text Button
                          TextButton(
                            onPressed: () {
                              // todo : navigate to forget password
                            },
                            child: const Text(AppStrings.forgetPassword),
                          ),
                          // text Button
                          TextButton(
                            onPressed: () {
                              // todo : navigate to register
                            },
                            child: const Text(AppStrings.registerText),
                          ),
                        ],
                      ),
                      if (state is AuthLoginErrorState)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: AppPadding.p5),
                          child: Text(state.msg,
                              style: getRegularStyle(
                                  color: ColorManager.red,
                                  fontSize: FontSizeManager.s15)),
                        ),
                    ],
                  ),
                ),
              ),
            )),
          ),
        );
      }),
    );
  }
}
