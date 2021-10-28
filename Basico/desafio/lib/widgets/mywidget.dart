import 'package:desafio/model/item.dart';
import 'package:desafio/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



class AgcsState extends State<AgcsWidget> {

  var _items = <Item>[];

  @override
  void initState() {
    super.initState();
    
    _loadData();
  }

  _loadData(){
    Repository repository = Repository();
    setState(() {
      _items = repository.getData();
    });
  }

  Widget _buildRow(int position) {
    return Card(
      elevation: 0.2,
      child: ListTile(
        title: Text(_items[position].content, style: getTextStyle(_items[position].isChecked)),
        leading: Text("${_items[position].id}", style: getTextStyle(_items[position].isChecked)),
        trailing: Checkbox(
          value: _items[position].isChecked,
          onChanged: (value) => setState(() => _items[position].isChecked = value!)
        ),
        tileColor:  getColor(_items[position].isChecked)
      ),
    );
  }

  Color getColor(bool isChecked) => ( isChecked ? Colors.black : Colors.white);
  TextStyle getTextStyle(bool isChecked) => (isChecked ? const TextStyle(fontSize: 15.0, color: Colors.white)
      : const TextStyle(fontSize: 15.0, color: Colors.black));


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: _items.length,
      itemBuilder: (BuildContext context, int position){
        return _buildRow(position);
      },
    );
  }
}


class AgcsWidget extends StatefulWidget {
  @override
  createState() => AgcsState();
}

