import 'package:flutter/material.dart';
import 'package:flutter_sandbox/data-from-api/ListBloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testes API',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Consumindo API'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ListBloc _listBloc = ListBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder(
          stream: _listBloc.output,
          builder: (BuildContext context, AsyncSnapshot snapshot) {

            if(snapshot.hasError){
              return Text('ERROR: ${snapshot.error}');
            }

            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return CircularProgressIndicator();

              default:
                if(snapshot.data.length == 0){
                  return Column(
                    children: <Widget>[
                      Text("Nenhum dado retornado"),
                      IconButton(
                        icon: Icon(Icons.refresh),
                        onPressed: () => _listBloc.getList(),
                      )
                    ]
                  );
                }

                return RefreshIndicator(
                  onRefresh: ()  async => _listBloc.getList(),
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int i){
                      Map<String, dynamic> item = snapshot.data[i];
                      return ListTile(
                        leading: Icon(Icons.people),
                        title: Text('#${item['id']} ${item['name']}'),
                        subtitle: Text('${item['email']}'),
                        trailing: IconButton(
                          icon: Icon(Icons.delete_forever, color: Colors.red),
                          onPressed: () => _listBloc.delete(item['id'].toString()),
                        ),

                        onLongPress: () => _listBloc.udpate(item['id'].toString()),
                      );
                    },

                  ),

                );

            }
          }
        ), 
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => _listBloc.create(),
        tooltip: 'Novo',
        child: Icon(Icons.add),
      ), 
    );
  }
}
