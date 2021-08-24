import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_app/add_book/add_book_page.dart';
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
        floatingActionButton: Consumer<BookListModel>(
          builder: (context, model, child) {
            return FloatingActionButton(
              onPressed: () async{
                //画面遷移
                final bool? added = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddBookPage(),
                        fullscreenDialog: true,
                    ),
                );

                if (added != null && added) { //addedがnullでなく、かつtrueの時。つまり、titleとauthorを正常に追加できた時。
                  final snackBar = SnackBar(
                    backgroundColor: Colors.green,
                    content: Text('本を追加しました。'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

                model.fetchBookList();

              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            );
          }
        ),
      ),
    );
  }
}