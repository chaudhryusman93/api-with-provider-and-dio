import 'package:api_with_dio/ApiProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ApiProvider>(
      create: (context) => ApiProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final apiProvider = Provider.of<ApiProvider>(context, listen: false);
    apiProvider.fetchData();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Consumer<ApiProvider>(
            builder: (context, value, child) => Center(
                  child: (apiProvider.isLoading)
                      ? const CircularProgressIndicator()
                      : ListView.builder(
                          itemCount: apiProvider.list.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                  apiProvider.list[index].title.toString()),
                              subtitle:
                                  Text(apiProvider.list[index].body.toString()),
                              leading: CircleAvatar(
                                radius: 20,
                                child:
                                    Text(apiProvider.list[index].id.toString()),
                              ),
                            );
                          },
                        ),
                )) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
