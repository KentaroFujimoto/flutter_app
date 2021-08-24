import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_app/add_book/add_book_model.dart';
import 'package:youtube_app/book_list/book_list_page.dart';

class AddBookPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddBookModel>( //ChangeNotifierProviderでデータが変わったことを知らせWidgetを作り直す。
      create: (_) =>AddBookModel(), //画面が読み込まれた時にAddBookModelクラスを動かす。
      child: Scaffold(
        appBar: AppBar(
          title: Text('本を追加'),
        ),
        body: Center(
          child: Consumer<AddBookModel>(builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'タイトル',
                    ),
                    onChanged: (text){
                      model.title = text; //modelのtitleに入力されたtextを入れる。
                    },
                  ),
                  SizedBox(height: 4),
                  TextField(
                    decoration: InputDecoration(
                      hintText: '著者',
                    ),
                    onChanged: (text){
                      model.author = text; //modelのauthorに入力されたtextを入れる。
                    },
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                      onPressed: () async{
                        //追加の処理
                        try{
                          await model.addBook();
                          Navigator.of(context).pop(true);
                          // final snackBar = SnackBar(
                          //   backgroundColor: Colors.green,
                          //   content: Text('本を追加しました。'),
                          // );
                          // ScaffoldMessenger.of(context).showSnackBar(snackBar);

                        } catch(e) {
                          final snackBar = SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(e.toString()),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: Text('追加する'),
                  )
                ],
              ),
            );
          },),
        ),
      ),
    );
  }
}