import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_flutter_assignment/screens/login_screen/widgets/custom_logo_container.dart';
import 'package:riverpod_flutter_assignment/screens/login_screen/widgets/form_section.dart';
import '../../consts/consts.dart';
import '../../main.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authNotifier = ref.read(authProvider.notifier);
    final formState = ref.watch(loginFormProvider);
    final formNotifier = ref.read(loginFormProvider.notifier);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: const BoxDecoration(gradient: bgGradient),
        padding: const EdgeInsets.symmetric(horizontal: appHorizontalPadding),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //logo container
              customLogoContainer(context),
              //welcome flutter text
              const Text(
                welcomeText,
                style: TextStyle(
                    fontSize: largeText,
                    color: black,
                    fontWeight: FontWeight.w700),
              ),
              const Text(
                continueText,
                style: TextStyle(
                    fontSize: mediumText,
                    color: grey,
                    fontWeight: FontWeight.w400),
              ),
              //form section
              formSection(context, formKey,authNotifier,formNotifier,formState),
              // formSection(context, formKey)
            ],
          ),
        ),
      ),
    );
  }
}
