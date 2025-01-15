import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController textController;
  final String lblText;
  final String hint;
  final IconData? prefix;
  final bool obscur;
  final Function(String)? onChange;
  const CustomTextfield({
    super.key,
    required this.textController,
    required this.lblText,
    required this.hint,
    this.prefix,
    this.obscur = false,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0, left: 20, right: 20),
        child: TextFormField(
          controller: textController,
          onChanged: onChange,
          obscureText: obscur,
          autofocus: true,
          autocorrect: true,
          decoration: InputDecoration(
            label: Text(lblText),
            labelStyle: TextStyle(
              color: Colors.pinkAccent,
              fontSize: 22,
            ),
            hintText: hint,
            hintStyle: TextStyle(
              color: const Color.fromARGB(255, 255, 185, 208),
            ),
            prefixIcon: Icon(prefix),
            prefixIconColor: Colors.pinkAccent[100],
            filled: true,
            fillColor: const Color.fromARGB(255, 255, 229, 250),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.pinkAccent),
              // borderRadius: BorderRadius.only(
              // topLeft: Radius.circular(25),
              // bottomRight: Radius.circular(25),
              // ),
            ),
            //
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.pinkAccent),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                bottomRight: Radius.circular(0),
              ),
            ),
            //
            enabledBorder: OutlineInputBorder(
              // borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.pinkAccent),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          ),
        ),
      ),
    );
  }
}

///////  Auto Comlete TextField
class AutoSearchText extends StatefulWidget {
  @override
  _AutoSearchTextState createState() => _AutoSearchTextState();
}

class _AutoSearchTextState extends State<AutoSearchText> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _allItems = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Grapes',
    'Mango',
    'Orange',
    'Pineapple',
    'Strawberry',
    'Watermelon',
  ];
  List<String> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    // Initially, filtered list contains all items
    _filteredItems = _allItems;
  }

  void _filterSearchResults(String query) {
    if (query.isEmpty) {
      setState(() {
        _filteredItems = _allItems;
      });
    } else {
      setState(() {
        _filteredItems = _allItems
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AutoComplete TextField'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              onChanged: _filterSearchResults,
              decoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Type to search...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_filteredItems[index]),
                    onTap: () {
                      _controller.text = _filteredItems[index];
                      FocusScope.of(context).unfocus();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
