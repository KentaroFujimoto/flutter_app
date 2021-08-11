import 'package:flutter/material.dart';
import 'package:youtube_app/video_detail_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final items = List<String>.generate(10000, (i) => "Item $i");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false, //タイトルを左に
          leading: Icon(Icons.videocam),
          title: Text('SiGMaのflutter大学'),
          actions: [
            SizedBox(
              width: 44,
              child: TextButton(
                child: Icon(Icons.search),
                onPressed: (){},
              ),
            ),
            SizedBox(
              width: 44,
              child: TextButton(
                child: Icon(Icons.more_vert),
                onPressed: (){},
              ),
            ),
          ],
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 100,
                      child:
                        Image.asset('images/logo.jpg'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: <Widget>[
                        const Text('SiGMaのflutter大学'),
                        TextButton(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.video_call,
                                  color: Colors.red,
                                ),
                                Text(
                                  '登録する',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            onPressed: (){},
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => VideoDetalPage()),
                        );
                      },
                      contentPadding: EdgeInsets.all(20),
                      leading: SizedBox(
                        width: 80,
                        child: Image.network(
                            'https://cdn-ssl-devio-img.classmethod.jp/wp-content/uploads/2018/08/flutter-logo-400x400.png'
                        ),
                      ),
                      title: Column(
                        children: [
                          Text(
                            '【flutter超入門】擬似アプリ',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                '100回再生',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                '1日前',
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

