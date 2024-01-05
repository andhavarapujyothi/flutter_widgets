import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'data.dart';

class TypeaHeadScreen extends StatefulWidget {
  const TypeaHeadScreen({super.key});

  @override
  State<TypeaHeadScreen> createState() => _TypeaHeadScreenState();
}

class _TypeaHeadScreenState extends State<TypeaHeadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TypeAheadField(
          //  textFeildConfiguration:TextFieldConfiguration(

          //  )  ,
          itemBuilder: (context, suggestion) {
            return ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text(suggestion['name']),
              subtitle: Text('\$${suggestion['price']}'),
            );
          },
          onSelected: (suggestion) {},
          suggestionsCallback: (pattern) async {
            return await BackendService.getSuggestions(pattern);
          }),
    );
  }
}
