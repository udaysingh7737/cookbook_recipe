import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String label;
  final String text;
  final ValueChanged<String> onChanged;

  const TextFieldWidget({
    Key key,
    this.label,
    this.text,
    this.onChanged
  }) : super(key: key);



  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {

  TextEditingController controller = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label,
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10),
          
        ),
        TextField(
          controller: controller,
        )
      ],
    );
  }
}
