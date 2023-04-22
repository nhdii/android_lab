import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lab_android/sqlite/page_sqlite_detail.dart';
import 'package:lab_android/sqlite/provider_data.dart';
import 'package:lab_android/sqlite/sqlite_data.dart';

import 'package:provider/provider.dart';

class PageListUserSQLite extends StatefulWidget {
  const PageListUserSQLite({Key? key}) : super(key: key);

  @override
  _PageListUserSQLiteState createState() => _PageListUserSQLiteState();
}

class _PageListUserSQLiteState extends State<PageListUserSQLite> {
  BuildContext?  _dialogContext;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite App'),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => PageUserSQLiteDetail(xem: false),)
            ),
            icon: const Icon(Icons.add_circle_outlined, color: Colors.white,),
          ),
        ],
      ),
      body: Consumer<DatabaseProvider>(
        builder: (context, databaseProvider, child) {
          if(databaseProvider.users == null){
            return const Center(child: Text('No Data!'),);
          }
          else{
            return ListView.separated(
              separatorBuilder: (context, index) => const Divider(thickness: 1,),
              itemCount: databaseProvider.users!.length,
              itemBuilder: (context, index) {
                _dialogContext = context;
                User user = databaseProvider.users![index];
                return Slidable(
                  child: ListTile(
                    leading: Text('${user.id}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
                    ),
                    title: Text('${user.name}', style: const TextStyle(fontSize: 18, color: Colors.indigo,),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Phone: ${user.phone}'),
                        Text('Email: ${user.email}'),
                      ],
                    ),
                  ),
                  endActionPane: ActionPane(
                    motion: const DrawerMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) =>Navigator.push(context,
                            MaterialPageRoute(builder: (context) => PageUserSQLiteDetail(xem: true, user: user,),)
                        ),
                        icon: Icons.details,
                        foregroundColor: Colors.green,
                        backgroundColor: Colors.green[50]!,
                      ),
                      SlidableAction(onPressed: (context) => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => PageUserSQLiteDetail(xem: false, user: user,),)
                      ),
                        icon: Icons.edit,
                        foregroundColor: Colors.blue,
                        backgroundColor: Colors.blue[50]!,
                      ),
                      SlidableAction(onPressed: (context) => _xoa(_dialogContext, user),
                        icon: Icons.delete_forever,
                        foregroundColor: Colors.red,
                        backgroundColor: Colors.red[50]!,
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    DatabaseProvider provider = context.read<DatabaseProvider>();
    provider.closeDatabase();
  }

  _xoa(BuildContext? dialogContext, User user) async {
    String? confirm = await showConfirmDialog(context, 'Confirm Delete ${user.name!}');
    if(confirm == 'ok'){
      DatabaseProvider provider =  context.read<DatabaseProvider>();
      provider.deleteUser(user.id!);
    }
  }

}

Future<String?> showConfirmDialog(BuildContext context, String dispMessage) async{
  AlertDialog dialog = AlertDialog(
    title: const Text('Confirm'),
    content: Text(dispMessage),
    actions: [
      ElevatedButton(
        onPressed: () => Navigator.of(context, rootNavigator: true).pop('cancel'),
        child: Text('Cancel'),
      ),
      ElevatedButton(
        onPressed: () => Navigator.of(context, rootNavigator: true).pop('ok'),
        child: Text('OK'),
      ),
    ],
  );
  String? res = await showDialog<String?>(
    barrierDismissible: false, // phai bam nut cancel hoac ok
    context: context,
    builder: (context) => dialog,
  );
  return res;
}