import 'package:flutter/material.dart';
import 'package:flutter_reorderable_grid_view/entities/order_update_entity.dart';
import 'package:flutter_reorderable_grid_view/widgets/widgets.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final _scrollController = ScrollController();
  final _gridViewKey = GlobalKey();
  final _fruits = <String>["apple", "banana", "strawberry"];

  @override
  Widget build(BuildContext context) {
    final generatedChildren = List.generate(
      _fruits.length,
      (index) => Container(
        key: Key(_fruits.elementAt(index)),
        color: Colors.lightBlue,
        child: Text(
          _fruits.elementAt(index),
        ),
      ),
    );

    return Scaffold(
      body: ReorderableBuilder(
        scrollController: _scrollController,
        onReorder: (List<OrderUpdateEntity> orderUpdateEntities) {
          for (final orderUpdateEntity in orderUpdateEntities) {
            final fruit = _fruits.removeAt(orderUpdateEntity.oldIndex);
            _fruits.insert(orderUpdateEntity.newIndex, fruit);
          }
        },
        builder: (children) {
          return GridView(
            key: _gridViewKey,
            controller: _scrollController,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 4,
              crossAxisSpacing: 8,
            ),
            children: children,
          );
        },
        children: generatedChildren,
      ),
    );
  }
}
