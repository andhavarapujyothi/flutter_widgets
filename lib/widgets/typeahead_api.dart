import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../api/api.dart';
import '../constants.dart';
import 'data.dart';

class TypeaHeadScreen extends StatefulWidget {
  const TypeaHeadScreen({super.key});

  @override
  State<TypeaHeadScreen> createState() => _TypeaHeadScreenState();
}

class _TypeaHeadScreenState extends State<TypeaHeadScreen> {
  final TextEditingController _plantNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: const EdgeInsets.only(bottom: 15, left: 35, right: 35),
            child: TypeAheadField(
              itemBuilder: (BuildContext context, dynamic suggestion) {
                return ListTile(
                  title: Text(suggestion['plantName']),
                );
              },
              onSelected: (dynamic suggestion) {
                _plantNameController.text = suggestion['plantName'];
                ConstantVariables.plantName = suggestion['plantName'];
                ConstantVariables.plantName = suggestion['plant_id'];
              },
              suggestionsCallback: (String value) async {
                return await plantName(value);
              },
            )
            //  TypeAheadFormField(
            //     getImmediateSuggestions: false,
            //     debounceDuration:
            //         const Duration(microseconds: 500),
            //     textFieldConfiguration: TextFieldConfiguration(
            //         textAlign: TextAlign.left,
            //         onSubmitted: (value) async {},
            //         controller: _plantNameController,
            //         decoration: InputDecoration(
            //           focusedBorder: OutlineInputBorder(
            //             borderSide: const BorderSide(
            //                 color: Colors.indigo, width: 2.0),
            //             borderRadius: BorderRadius.circular(14),
            //           ),
            //           enabled: true,
            //           errorBorder: OutlineInputBorder(
            //             borderSide: const BorderSide(
            //                 color: Colors.red, width: 2.0),
            //             borderRadius: BorderRadius.circular(14),
            //           ),
            //           focusedErrorBorder: OutlineInputBorder(
            //             borderSide: const BorderSide(
            //                 color: Colors.red, width: 2.0),
            //             borderRadius: BorderRadius.circular(14),
            //           ),
            //           enabledBorder: OutlineInputBorder(
            //             borderSide: const BorderSide(
            //                 color: Colors.indigo, width: 2.0),
            //             borderRadius: BorderRadius.circular(14),
            //           ),
            //           hintText: "Enter Plant Name",
            //           alignLabelWithHint: true,
            //           hintStyle: TextStyle(
            //               color: Colors.grey,
            //               fontSize: 10,

            //               //String ubuntu = 'ubuntu_Medium';
            //               fontFamily: 'ubuntu_Medium'),
            //           fillColor: Colors.white,
            //         )),
            //     suggestionsCallback: (String value) async {
            //       return await plantName(value);
            //     },
            //     itemBuilder:
            //         (BuildContext context, dynamic suggestion) {
            //       return ListTile(
            //         title: Text(suggestion['plantName']),
            //       );
            //     },
            //     onSuggestionSelected: (dynamic suggestion) {
            //       _plantNameController.text =
            //           suggestion['plantName'];
            //       ConstantVariables.plantName =
            //           suggestion['plantName'];
            //       ConstantVariables.plantName =
            //           suggestion['plant_id'];
            //     },
            //     noItemsFoundBuilder: (dynamic suggestion) {
            //       return Text('No items found');
            //     })
            ));
  }
}
