import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_flutter_assignment/consts/consts.dart';
import 'package:riverpod_flutter_assignment/screens/homeScreen/widgets/custom_drawer_widget.dart';
import 'package:riverpod_flutter_assignment/screens/homeScreen/widgets/custom_list_widget.dart';
import 'package:riverpod_flutter_assignment/screens/homeScreen/widgets/custom_searchBar.dart';
import '../../main.dart';
import '../../model/user_model.dart';
import '../../repository/repo.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dataState = ref.watch(userProvider);

    final authState = ref.watch(authProvider);
    final authNotifier = ref.read(authProvider.notifier);

    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        drawer: customDrawerWidget(context, authState, authNotifier),
        appBar: AppBar(
            elevation: 1,
            shadowColor: grey,
            //custom search bar widget
            title: customSearchBar(
                searchController: searchController,
                onClear: () {
                  setState(() {
                    searchController.clear();
                  });
                },
                onChanged: (value) {
                  setState(() {
                    searchController.text = value;
                  });
                })),
        // list of contacts
        body: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: appHorizontalPadding, vertical: appVerticalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                homeScreenTitle,
                style: TextStyle(
                    fontSize: largeText,
                    color: black,
                    fontWeight: FontWeight.w700),
              ),
              dataState.when(
                  data: (data) {
                    String query = searchController.text;
                    List<UserModel> searchResults = [];
                    searchResults = data
                        .where((item) => item.name
                            .toLowerCase()
                            .contains(query.toLowerCase()))
                        .toList();

                    return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const ScrollPhysics(),
                        itemCount: searchResults.length != [] ? searchResults.length:data.length,
                        itemBuilder: (context, index) {
                          return customListWidget(
                              searchController: searchController,
                              data: searchResults == []?data[index]:searchResults[index],
                              query: query);
                        });
                  },
                  error: (error, _) => Center(child: Text('Error: $error')),
                  loading: () =>
                      const Center(child: CircularProgressIndicator())),
            ],
          ),
        ));
  }
}
