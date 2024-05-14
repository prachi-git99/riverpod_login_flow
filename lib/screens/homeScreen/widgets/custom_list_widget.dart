import 'package:riverpod_flutter_assignment/model/user_model.dart';

import '../../../consts/consts.dart';

String getInitials(data) {
  String? name = data;
  var initial = name?.split(" ");
  for (int i = 0; i < initial!.length; i++) {
    initial[i] = initial[i][0];
  }
  if (initial.length > 2) {
    initial = initial.sublist(0, 2);
  }
  name = initial.join("");
  return name;
}

Widget customListWidget({required TextEditingController searchController,required UserModel data,required String query}) {

  final nameIndex = data.name.toLowerCase().indexOf(query.toLowerCase());
  return Container(
    padding: const EdgeInsets.all(containerSmallPadding),
    margin: const EdgeInsets.only(top: verticalMargin),
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
          color: grey.withOpacity(0.3),
          spreadRadius: 1,
          blurRadius: 4,
          offset: const Offset(
              5, 5) // Adjust these values for bottom and right shadow
          )
    ], color: white, borderRadius: BorderRadius.circular(mediumBorderRadius)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(containerSmallPadding),
          decoration: BoxDecoration(
            color: pink,
            shape: BoxShape.circle,
            border: Border.all(color: white),
            boxShadow: [
              BoxShadow(
                  color: grey.withOpacity(0.9),
                  blurRadius: 1,
                  offset: const Offset(
                      0, 3) // Adjust these values for bottom and right shadow
                  )
            ],
          ),
          child: Text(
            getInitials(data.name),
            style: const TextStyle(
                color: white,
                fontSize: mediumText,
                fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(width: horizontalMargin),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: data.name.substring(0, nameIndex),
                  style: const TextStyle(
                      fontSize: mediumText,
                      color: black,
                      fontWeight: FontWeight.w700),
                  children: [
                    TextSpan(
                      text: data.name
                          .substring(nameIndex, nameIndex + query.length),
                      style: const TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: data.name.substring(nameIndex + query.length),
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              // Text(
              //   data.name,
              //   style: const TextStyle(
              //       fontSize: smallText,
              //       color: black,
              //       fontWeight: FontWeight.w400),
              // ),
              Text(
                data.email,
                style: const TextStyle(
                    fontSize: smallText,
                    color: black,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
