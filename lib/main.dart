import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Native view Example"),
        ),
        body: const NativeViewList(), // FlutterViewList(),
      ),
    );
  }
}

class NativeViewList extends StatefulWidget {
  const NativeViewList({Key? key}) : super(key: key);

  @override
  State<NativeViewList> createState() => _NativeViewListState();
}

class _NativeViewListState extends State<NativeViewList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 150,
        itemBuilder: (context, index) {
          // This is used in the platform side to register the view.
          const String viewType = '<native_view>';
          // Pass parameters to the platform side.
          final Map<String, dynamic> creationParams = <String, dynamic>{};
          return Container(
            width: 300,
            height: 150,
            margin: const EdgeInsets.all(20),
            child: UiKitView(
              viewType: viewType,
              layoutDirection: TextDirection.ltr,
              creationParams: creationParams,
              creationParamsCodec: const StandardMessageCodec(),
            ),
          );
        });
  }
}

class FlutterViewList extends StatefulWidget {
  const FlutterViewList({Key? key}) : super(key: key);

  @override
  State<FlutterViewList> createState() => _FlutterViewListState();
}

class _FlutterViewListState extends State<FlutterViewList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 150,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(20),
            width: 300,
            height: 150,
            color: Colors.red,
            child: Center(
              child: Text(
                "$index",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          );
        });
  }
}
