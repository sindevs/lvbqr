import 'package:flutter/material.dart';

class AddList extends StatefulWidget {
  AddList({Key key}) : super(key: key);

  _AddListState createState() => _AddListState();
}

class _AddListState extends State<AddList> {
  final _formkey = GlobalKey<FormState>();
  List<DropdownMenuItem<String>> listdrop = [];
  String _datevalue = '';
  String _namelist = '';
  String _amount = '';
  String _addEx = '';

  void loadData() {
    listdrop.add(new DropdownMenuItem(
      child: new Text(
        "ກີບ",
      ),
      value: "Kip",
    ));
    listdrop.add(new DropdownMenuItem(
      child: new Text(
        "ບາດ",
      ),
      value: "bath",
    ));
    listdrop.add(new DropdownMenuItem(
      child: new Text(
        "ໂດລາ",
      ),
      value: "dollar",
    ));
  }

  @override
  Widget build(BuildContext context) {
    loadData();
    return new Scaffold(
        appBar: new AppBar(
          title: Text('ເພີ່ມລາຍການແລກປ່ຽນ'),
        ),
        body: new GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Form(
                  key: _formkey,
                  child: new ListView(
                    children: <Widget>[
                      _buildDateList(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildList(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _buildAmount(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _amountIncome(),
                      SizedBox(
                        height: 10.0,
                      ),
                      _addressExchage(),
                      SizedBox(
                        height: 10.0,
                      ),
                      Center(
                        child: DropdownButton(
                          items: listdrop,
                          onChanged: null,
                        ),
                      )
                    ],
                  )),
            )));
  }

  Widget _buildDateList() {
    return TextFormField(
      onSaved: (String value) => _datevalue = value,
      decoration: InputDecoration(
          labelText: "ວັນທີ - ເດືອນ - ປີ",
          hintText: "ກະລຸນາປ້ອນວັນທີເດືອນປີ",
          filled: true,
          fillColor: Colors.white),
      keyboardType: TextInputType.datetime,
      validator: (String value) {
        if (value.isEmpty) {
          return "ກະລຸນາປ້ອນຂໍ້ມູນ";
        }
      },
    );
  }

  Widget _buildList() {
    return new TextFormField(
      onSaved: (String value) => _datevalue = value,
      decoration: InputDecoration(
          labelText: "ຊື່ລາຍການ",
          hintText: "ກະລຸນາປ້ອນ ລາຍການ",
          filled: true,
          fillColor: Colors.white),
      keyboardType: TextInputType.text,
      validator: (String value) {
        if (value.isEmpty) {
          return "ກະລຸນາປ້ອນຂໍ້ມູນ";
        }
      },
    );
  }

  Widget _buildAmount() {
    return new TextFormField(
      onSaved: (String value) => _datevalue = value,
      decoration: InputDecoration(
          labelText: "ຈຳນວນເງິນທີ່ແລກປ່ຽນ",
          hintText: "ກະລຸນາປ້ອນຈຳນວນເງິນທີ່ແລກປ່ຽນ",
          filled: true,
          fillColor: Colors.white),
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.isEmpty) {
          return "ກະລຸນາປ້ອນຂໍ້ມູນ";
        }
      },
    );
  }

  Widget _amountIncome() {
    return new TextFormField(
      onSaved: (String value) => _datevalue = value,
      decoration: InputDecoration(
          labelText: "ຈຳນວນເງິນທີ່ໄດ້ຮັບ",
          hintText: "ກະລຸນາປ້ອນຈຳນວນເງິນທີ່ໄດ້ຮັບ",
          filled: true,
          fillColor: Colors.white),
      keyboardType: TextInputType.number,
      validator: (String value) {
        if (value.isEmpty) {
          return "ກະລຸນາປ້ອນຂໍ້ມູນ";
        }
      },
    );
  }

  Widget _addressExchage() {
    return new TextFormField(
      onSaved: (String value) => _datevalue = value,
      decoration: InputDecoration(
          labelText: "ສະຖານທີ່ແລກປ່ຽນ",
          hintText: "ກະລຸນາປ້ອນວັນທີເດືອນປີ",
          filled: true,
          fillColor: Colors.white),
      keyboardType: TextInputType.text,
      validator: (String value) {
        if (value.isEmpty) {
          return "ກະລຸນາປ້ອນຂໍ້ມູນ";
        }
      },
    );
  }
}
