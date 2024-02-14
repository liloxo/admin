import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class Customdropdownsearch extends StatefulWidget {
  final String? title;
  final List<SelectedListItem> listdata;
  final TextEditingController selectedname;
  final TextEditingController selectedid;
  const Customdropdownsearch({Key? key, this.title, required this.listdata, required this.selectedname, required this.selectedid}) : super(key: key);

  @override
  State<Customdropdownsearch> createState() => _CustomdropdownsearchState();
}

class _CustomdropdownsearchState extends State<Customdropdownsearch> {

  void dropdownsearch(){
    
    DropDownState(
      DropDown(
        isDismissible: true,
        bottomSheetTitle:  Text(
          widget.title!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: widget.listdata,
        selectedItems: (List<dynamic> selectedList) {
          SelectedListItem selectedListItem = selectedList[0];
          widget.selectedname.text = selectedListItem.name;
          widget.selectedid.text = selectedListItem.value!;
          
        },
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.selectedname,
      cursorColor: Colors.black,
      onTap:  () {
              FocusScope.of(context).unfocus();
              dropdownsearch();
            },
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child: Text(widget.selectedname.text == '' ? widget.title! : widget.selectedname.text)),
                suffixIcon: const InkWell(onTap: null,child: Icon(Icons.arrow_drop_down)),
        hintStyle: const TextStyle(fontSize: 14),
        filled: true,
        fillColor: Colors.black12,
        hintText: widget.selectedname.text == '' ? widget.title : widget.selectedname.text ,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
      ),
    );
  }
}