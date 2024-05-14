import 'package:flutter/cupertino.dart';

import '../../../consts/consts.dart';


Widget customSearchBar(
    {searchController, void Function(String)? onChanged, onClear}) {
  return Container(
    margin: const EdgeInsets.only(bottom: verticalMargin),
    decoration: BoxDecoration(
        color: searchBarColor,
        borderRadius: BorderRadius.circular(mediumBorderRadius)),
    // padding: const EdgeInsets.symmetric(horizontal: appHorizontalPadding),
    child: TextField(
      controller: searchController,
      style: const TextStyle(color: black),
      cursorColor: primaryColor,
      decoration: InputDecoration(
          hintText: 'Search...',
          hintStyle: const TextStyle(color: grey),
          border: InputBorder.none,
          prefixIcon: const Icon(CupertinoIcons.search, color: grey),
          suffixIcon: IconButton(
              onPressed: onClear,
              icon: const Icon(CupertinoIcons.clear_circled, color: grey))),
      onChanged: onChanged,
    ),
  );
}
