import 'package:basics/Api/Auth/Forgot_password_cubit/forgot_cubit.dart';
import 'package:basics/Domain/auth_entities/reset_password.dart';
import 'package:basics/Domain/value_objects/colors.dart';
import 'package:basics/Presentation/Site/app_page.dart';
import 'package:basics/Presentation/Utils/Gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPage extends StatefulWidget {
  const ResetPage({super.key, required this.email});

  final String email;
  @override
  State<ResetPage> createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    _codeController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordCubit, ForgotState>(
      listener: (context, state) {
        if (state is ResetLoading) {
          setState(() {
            isLoading = true;
          });
        } else if (state is ResetError) {
          setState(() {
            isLoading = false;
          });
        } else if (state is ResetSuccess) {
          setState(() {
            isLoading = false;
          });

          context.goNamed("login");
        }
      },
      child: AppPageBasics(children: [
        gapH40,
        gapH10,
        isLoading
            ? const CircularProgressIndicator()
            : Column(
                children: [
                  Text("Reset hasła",
                      style: GoogleFonts.montserrat(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 123, 121, 121))),
                  gapH40,
                  FractionallySizedBox(
                    widthFactor: 0.35,
                    child: Form(
                        child: Column(
                      children: [
                        TextFormField(
                            validator: (value) {
                              if (value == '' || value == null) {
                                return "Please enter Code";
                              }

                              return "";
                            },
                            controller: _codeController,
                            decoration: const InputDecoration(
                              labelText: "Code",
                              border: OutlineInputBorder(),
                            )),
                        gapH10,
                        gapH10,
                        TextFormField(
                            validator: (value) {
                              if (value == '' || value == null) {
                                return "Please enter Code";
                              }

                              return "";
                            },
                            controller: _passwordController,
                            decoration: const InputDecoration(
                              labelText: "New password",
                              border: OutlineInputBorder(),
                            )),
                        gapH40,
                        ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all<Color>(myOrange),
                            ),
                            onPressed: () async {
                              await context
                                  .read<ForgotPasswordCubit>()
                                  .resetPassword(ResetPassword(
                                      Email: widget.email,
                                      ResetCode: _codeController.text,
                                      NewPassword: _passwordController.text));
                            },
                            child: const Text(
                              "Zresetuj hasło",
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    )),
                  )
                ],
              ),
      ]),
    );
  }
}
