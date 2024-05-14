// // data_notifier.dart
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../repository/repo.dart';
//
//
// final apiServiceProvider = Provider<ApiService>((ref) => ApiService());
//
// final dataProvider = StateNotifierProvider<DataNotifier, AsyncValue<List<dynamic>>>((ref) {
//   return DataNotifier(ref.read);
// });
//
// class DataNotifier extends StateNotifier<AsyncValue<List<dynamic>>> {
//   final read;
//
//   DataNotifier(this.read) : super(const AsyncValue.loading()) {
//     fetchUserData();
//   }
//
//   Future<void> fetchUserData() async {
//     try {
//       final data = await read(apiServiceProvider).fetchData();
//       print(data);
//       print("999");
//       state = AsyncValue.data(data);
//
//     } catch (e, stackTrace) {
//       state = AsyncValue.error(e, stackTrace);
//     }
//   }
// }
//

