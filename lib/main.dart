
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  var directory=await getApplicationSupportDirectory();
  Hive.init(directory.path);
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: MyFirstApp(),
    );

  }
}

class MyFirstApp extends StatefulWidget {
  const MyFirstApp({super.key});

  @override
  State<MyFirstApp> createState() => _MyFirstAppState();
}

class _MyFirstAppState extends State<MyFirstApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive_Demo"),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
        future: Hive.openBox('students'),
        builder: (context, snapshot) {
          return Column(
            children: [
              ListTile(
                title: Text(snapshot.data!.get('name1').toString()),
                subtitle: Text(snapshot.data!.get('age1').toString()),
                trailing:IconButton(
                    onPressed: (){
                      setState(() {

                      });
                    },
                    icon: Icon(Icons.delete)),
              )
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async {
          var box=await Hive.openBox('students');
          box.put('name1', 'Rohit kumar');
          box.put('age1', '17');
          print(box.get('name1'));
          print(box.get('age1'));
        },
        tooltip: 'Add note list',
        child: const Icon(Icons.add),
      ),

    );

  }
}

