import 'package:flutter/material.dart';
import 'package:lab_android/sqlite/page_list_user_sqlite.dart';
import 'package:lab_android/sqlite/provider_data.dart';
import 'package:provider/provider.dart';

class SQLiteApp extends StatefulWidget {
  const SQLiteApp({Key? key}) : super(key: key);

  @override
  State<SQLiteApp> createState() => _SQLiteAppState();
}

class _SQLiteAppState extends State<SQLiteApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context){
          var databaseProvider = DatabaseProvider();
          databaseProvider.readUsers();
          return databaseProvider;
        },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "SQLite App",
        home: PageListUserSQLite(),
      ),
        );
  }
}
