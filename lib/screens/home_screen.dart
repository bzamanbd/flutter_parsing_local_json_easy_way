import 'dart:convert';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
  
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON parsing easy way'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString('assets/files/data.json'),
        builder: (context, snapshot){
          List?myData = jsonDecode(snapshot.data.toString());
          if (myData==null) {
            return const Center(
              child: Text('Loading...',textScaleFactor: 1.5,),
            );
          } else {
            return ListView.separated(
              itemCount: myData.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Image.network(myData[index]['imageUrl']),
                  title: Center(
                    child: Text(myData[index]['name'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(myData[index]['price'].toString()),
                    ],
                  ),
                  minVerticalPadding: size.height/20,
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Theme.of(context).primaryColor,
                  thickness: 1,
                );
              },
             
            );
          }
          
        },
        ),
    );
  }
}