import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_app/book_list/book_list_model.dart';
import 'package:youtube_app/domain/Book.dart';

class BookListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookListModel>( //ChangeNotifierProviderでデータが変わったことを知りWidgetを作り直す
      create: (_) =>BookListModel()..fetchBookList(), //画面が読み込まれた時にfetchBookListクラスを動かす。
      child: Scaffold(
        appBar: AppBar(
          title: Text('本一覧'),
        ),
        body: Center(
          child: Consumer<BookListModel>(builder: (context, model, child) {
            final List<Book>? books = model.books;

            if (books == null) {
              return CircularProgressIndicator();
            }

            final List<Widget> widgets = books.map( //リストのbooksを更にmapしてwidgetのTextに変換する。
                    (book) => ListTile(
                      title: Text(book.title),
                      subtitle: Text(book.author),
                    ),
            ).toList();
            return ListView(
              children: widgets,
            );
          },),
        ),
      ),
    );
  }
}