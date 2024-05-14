import 'package:riverpod_flutter_assignment/consts/consts.dart';

Widget customDrawerWidget(context,authState,authNotifier){
  var size = MediaQuery.of(context).size;
  return SafeArea(
    child: Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: size.width * 0.08,
              child: Text('${authState.username?[0].toUpperCase()}'),
            ),
            title: Text(
              'Welcome To App',
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: largeText),
            ),
            subtitle: Text(
              '${authState.username}!',
              style: TextStyle(
                  fontWeight: FontWeight.w400, fontSize: largeText),
            ),
          ),
          SizedBox(height: size.height*0.05,),
          ElevatedButton(onPressed: () {
            authNotifier.logout();
          }, child: Text("Logout"))
        ],
      ),
    ),
  );
}