import 'package:flutter/material.dart';
import 'package:youtube_app/book_list/book_list_page.dart';
import 'package:youtube_app/main_model.dart';
import 'package:youtube_app/video_detail_page.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

// void  main() async {
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BookListPage(),
      // home: ChangeNotifierProvider<MainModel>(
      //   create: (_) => MainModel(),
      //   child: Scaffold(
      //     appBar: AppBar(
      //       title: Text('SiGMaのflutter大学'),
      //     ),
      //     body: Consumer<MainModel>(builder: (context, model, child) {
      //         return Center(
      //            child: Column(
      //              children: [
      //                Text(model.sigmaText),
      //                ElevatedButton(
      //                    onPressed: (){
      //                      Navigator.push(
      //                        context,
      //                        MaterialPageRoute(builder: (context) => BookListPage()),
      //                      );
      //                    },
      //                    child: Text('ボタン'),
      //                    style: ElevatedButton.styleFrom(
      //                      primary: Colors.black12,
      //                    ),
      //                ),
      //              ],
      //            ),
      //         );
      //       }
      //     ),
      //   ),
      // ),
    );
  }
}

