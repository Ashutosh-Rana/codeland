import 'package:codeland/design_comp/custom_text_field.dart';
import 'package:codeland/design_comp/primary_button.dart';
import 'package:codeland/utils/app_colors.dart';
import 'package:codeland/utils/constants.dart';
import 'package:codeland/utils/text_styles.dart';
import 'package:codeland/utils/validators.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
                left: screenWidth * .05, right: screenWidth * .05),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Image.asset("assets/images/codeland.png"),
                        Image.asset("assets/images/logo.png"),
                        SizedBox(
                          height: screenHeight * .02,
                        ),
                        const Text(
                          "Biomedical  Kiosk",
                          style: AppTextStyles.poppinsBlack20,
                        ),
                        const Align(
                            widthFactor: 4.9,
                            alignment: Alignment.centerRight,
                            child: Text(
                              "for HCE’s",
                              style: AppTextStyles.poppinsStyle10,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * .02,
                  ),
                  CustomTextField(
                      controller: _usernameController,
                      hintText: "Username",
                      validator: CodelandValidators.usernameValidator),
                  SizedBox(
                    height: screenHeight * .02,
                  ),
                  CustomTextField(
                    controller: _passwordController,
                    hintText: "Password",
                    validator: CodelandValidators.passwordValidator,
                  ),
                  SizedBox(
                    height: screenHeight * .033,
                  ),
                  PrimaryButton(
                    text: "Login",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // _formKey.currentState!
                        //     .save(); // Call save() to trigger validation
                        Navigator.pushNamed(context, imageUploadRoute);
                      }
                    },
                  ),
                  SizedBox(
                    height: screenHeight * .07,
                  ),
                  const Text(
                    "For Assistance & Login Details Contact: ",
                    style: AppTextStyles.poppinsStyle12,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: "English, Kannada & Telugu : ",
                          style: AppTextStyles.poppinsStyle12
                        ),
                        TextSpan(
                          text: "7406333800",
                          style: AppTextStyles.poppinsStyle12.copyWith(color: AppColors.primaryColor, decoration: TextDecoration.underline, decorationColor: AppColors.primaryColor)
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: "English, Kannada & Hindi   : ",
                          style: AppTextStyles.poppinsStyle12
                        ),
                        TextSpan(
                          text: "9071386515",
                          style: AppTextStyles.poppinsStyle12.copyWith(color: AppColors.primaryColor, decoration: TextDecoration.underline, decorationColor: AppColors.primaryColor)
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * .1,
                  ),
                  const Center(
                    child: Text(
                      "v1.7 © 2023, Codeland Infosolutions Pvt Ltd.",
                      style: AppTextStyles.poppinsStyle12,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
