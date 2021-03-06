import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddBookModel extends ChangeNotifier {
  String? title;
  String? author;

  Future addBook() async{
    if (title == null || title!.isEmpty) {
      throw '本のタイトルが入力されていません。';
    }

    if (author == null || author!.isEmpty) {
      throw '本の著者が入力されていません。';
    }
    
    //firebaseに追加
    await FirebaseFirestore.instance.collection('books').add({
      "title": title,
      "author": author,
    });
  }
}