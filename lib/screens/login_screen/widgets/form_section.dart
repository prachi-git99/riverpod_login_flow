import '../../../consts/consts.dart';

import 'custom_button.dart';
import 'custom_textField.dart';

Widget formSection(context, formKey,authNotifier,formNotifier,formState) {
  return Form(
      key: formKey,
      child: Column(children: [
        //text fields
        customTextField(
          isObscure: false,
          onChange:  (value) => formNotifier.setUsername(value),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Username cannot be empty';
            } else if (value.length < 2) {
              return 'Username too short';
            }
            return null;
          },
          hintText: userHintText,
        ),
        customTextField(
          isObscure: true,
          hintText: passwordHintText,
          onChange: (value) => formNotifier.setPassword(value),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Password cannot be empty';
            } else if (value.length < 6) {
              return 'Password is too short';
            }
            return null;
          },
          icon: IconButton(
              onPressed: () {}, icon: const Icon(Icons.remove_red_eye)),
        ),
        //forgot password button
        Align(
            alignment: Alignment.centerRight,
            child: TextButton(
                onPressed: () {},
                child: const Text(forgotPassword,
                    style: TextStyle(color: primaryColor)))),
        //login button
        customButton(
            context: context,
            onTap: () {
              if (formKey.currentState!.validate()) {
                authNotifier.login(formState.username);
              }
            })
      ]));
}
