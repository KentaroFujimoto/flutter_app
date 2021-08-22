import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:youtube_app/domain/Book.dart';

class BookListModel extends ChangeNotifier {
  final Stream<QuerySnapshot> _usersStream = //stream定義。_usersStreamは名前。
    FirebaseFirestore.instance.collection('books').snapshots(); //stream定義。snapshotsで非同期型でデータを受け取る。
  List<Book>? books; //

  void fetchBookList(){ //関数定義。fetchBookListは名前。
    _usersStream.listen((QuerySnapshot snapshot) { //定義したstreamをlistenする。collection内のdocsにアクセスできるQuerySnapshotを引数に指定。変化があればsnapshotに値が入る。

      final List<Book> books = snapshot.docs.map((DocumentSnapshot document) { //mapでsnapshotのdocsに入っているDocumentSnapshotをBookに変換。
        Map<String, dynamic> data = document.data() as Map<String, dynamic>; //StringとdynamicのMapにする。
        final String title = data['title']; //documentのtitleを取得。
        final String author = data['author']; //documentのauthorを取得。
        return Book(title, author); //Bookメソッドにtitleとauthorを渡す。
      }).toList(); //リストにする。

      this.books = books;
      notifyListeners(); //book_list_pageのConsumerを動かす。
    });
  }
}