import 'package:conutry_infos/src/theme.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget {
  final Function(String)? textChanged;

  const SearchBox({Key? key, this.textChanged}) : super(key: key);

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  bool canCancel = false;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    focusNode = FocusNode()..addListener(focusListener);
  }

  void focusListener() => setState(() => canCancel = focusNode.hasFocus);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextField(
        textAlign: TextAlign.center,
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Search Country',
          filled: true,
          fillColor: AppColors.filledColor,
          hintStyle: const TextStyle(),
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: BorderSide.none),
        ),
        keyboardType: TextInputType.text,
        onChanged: (text) => widget.textChanged!(text),
        focusNode: focusNode,
      ),
    );
  }

  void onCancel() {
    if (controller.text.isEmpty) focusNode.unfocus();
    widget.textChanged!('');
    controller.text = '';
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }
}
