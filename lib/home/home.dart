import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dataProvider/data_provider.dart';
import '../models/models.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Login API"),
      ),
      body: _data.when(
        data: (_data){
          List<UserModel> userList = _data.map((e) => e).toList();
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (_,index){
                    return  Card(
                      color: Colors.blue, 
                      elevation: 4, 
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title: Text(userList[index].firstname,style: TextStyle(
                          color: Colors.white,
                        ),),
                        subtitle: Text(userList[index].lastname,style: TextStyle(
                          color: Colors.white,
                        ),),
                        trailing: CircleAvatar(
                          backgroundImage: NetworkImage(userList[index].avatar),
                        ),
                      ),
                    );
                  }
                  )
                )
            ],
          );
        }, 
        error: (err, s) => Text(err.toString()), 
        loading: () => const Center(
          child: CircularProgressIndicator(),
        )
        ),
    );
  }
}