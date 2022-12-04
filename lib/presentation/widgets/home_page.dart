import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_class/data/api_service.dart';
import 'package:rest_api_class/data/user_model.dart';
import 'package:rest_api_class/presentation/controllers/user_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Rest Api Class'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          return ref.read(userListProvider).when(
              data: (data) => ListView(
                    children: [
                      ...data.map((e) => ListTile(
                            title: Text(e.email),
                            trailing: CircleAvatar(
                              backgroundImage: NetworkImage(e.avatar),
                            ),
                          ))
                    ],
                  ),
              error: (err, s) => Text(err.toString()),
              loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ));
        },
      ),
      // body: FutureBuilder<List<UserModel>>(
      //   future: ApiService().getData(),
      //   builder: (context, snap) {
      //     if (snap.hasData) {
      //       return ListView(
      //         children: [
      //           ...snap.data!.map(
      //             (e) => ListTile(
      //               title: Text(e.email),
      //               trailing: CircleAvatar(
      //                 backgroundImage: NetworkImage(e.avatar),
      //               ),
      //             ),
      //           ),
      //         ],
      //       );
      //     } else {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //   },
      // ),
    );
  }
}
