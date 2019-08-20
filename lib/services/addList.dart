import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddList extends StatefulWidget {
  AddList({Key key}) : super(key: key);

  _AddListState createState() => _AddListState();
}

class _AddListState extends State<AddList> {
  final _formkey = GlobalKey<FormState>();
  final db = Firestore.instance;
  // List<DropdownMenuItem<String>> listdrop = [];
  String _datevalue = '';
  String _namelist = '';
  String _amount = '';
  String _income = '';
  String _address = '';
  String id;

  Widget _buildDateList() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "ວັນທີ - ເດືອນ - ປີ",
          hintText: "ກະລຸນາປ້ອນວັນທີເດືອນປີ",
          icon: const Icon(Icons.date_range),
          filled: true,
          fillColor: Colors.white),
      keyboardType: TextInputType.datetime,
      validator: (String value) {
        if (value.isEmpty) {
          return "ກະລຸນາປ້ອນຂໍ້ມູນ";
        }
      },
      onSaved: (String value) => _datevalue = value,
    );
  }

  TextFormField _buildList() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "ຊື່ລາຍການ",
          hintText: "ກະລຸນາປ້ອນ ລາຍການ",
          icon: const Icon(Icons.list),
          filled: true,
          fillColor: Colors.white),
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value.isEmpty) {
          return "ກະລຸນາປ້ອນຂໍ້ມູນ";
        }
      },
      onSaved: (value) => _namelist = value,
    );
  }

  Widget _buildAmount() {
    return TextFormField(
      onSaved: (String value) => _amount = value,
      decoration: InputDecoration(
          labelText: "ຈຳນວນເງິນທີ່ແລກປ່ຽນ",
          hintText: "ກະລຸນາປ້ອນຈຳນວນເງິນທີ່ແລກປ່ຽນ",
          icon: const Icon(Icons.money_off),
          filled: true,
          fillColor: Colors.white),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value.isEmpty) {
          return "ກະລຸນາປ້ອນຂໍ້ມູນ";
        }
      },
    );
  }

  Widget _amountIncome() {
    return TextFormField(
      onSaved: (value) => _income = value,
      decoration: InputDecoration(
          labelText: "ຈຳນວນເງິນທີ່ໄດ້ຮັບ",
          hintText: "ກະລຸນາປ້ອນຈຳນວນເງິນທີ່ໄດ້ຮັບ",
          icon: const Icon(Icons.attach_money),
          filled: true,
          fillColor: Colors.white),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value.isEmpty) {
          return "ກະລຸນາປ້ອນຂໍ້ມູນ";
        }
      },
    );
  }

  Widget _addressExchage() {
    return TextFormField(
      onSaved: (value) => _address = value,
      decoration: InputDecoration(
          labelText: "ສະຖານທີ່ແລກປ່ຽນ",
          hintText: "ກະລຸນາປ້ອນສະຖານທີ່ແລກປ່ຽນ",
          icon: const Icon(Icons.arrow_drop_down_circle),
          filled: true,
          fillColor: Colors.white),
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value.isEmpty) {
          return "ກະລຸນາປ້ອນຂໍ້ມູນ";
        }
        if (value == '') {
          return "er";
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // loadData();
    return new Scaffold(
        appBar: new AppBar(
          title: Text('ເພີ່ມລາຍການແລກປ່ຽນ'),
        ),
        body: new GestureDetector(
            // onTap: () {
            //   FocusScope.of(context).requestFocus(FocusNode());
            // },
            child: Container(
          padding: EdgeInsets.all(20.0),
          child: Form(
              key: _formkey,
              child: ListView(
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
                  // _addressExchage(),
                  TextFormField(
                    onSaved: (value) => _address = value,
                    decoration: InputDecoration(
                        labelText: "ສະຖານທີ່ແລກປ່ຽນ",
                        hintText: "ກະລຸນາປ້ອນສະຖານທີ່ແລກປ່ຽນ",
                        icon: const Icon(Icons.arrow_drop_down_circle),
                        filled: true,
                        fillColor: Colors.white),
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "ກະລຸນາປ້ອນຂໍ້ມູນ";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CupertinoButton(
                    child: Text("ເພີ່ມລາຍການ"),
                    onPressed: () => _submit(
                        _datevalue, _namelist, _amount, _income, _address),
                    color: Colors.red,
                    disabledColor: Colors.grey,
                    padding: EdgeInsets.all(10),
                    minSize: 50,
                    pressedOpacity: 0.8,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ],
              )),
        )));
  }

  void _submit(String _datevalue, String _namelist, String _amount,
      String _income, String _address) async {
    if (_formkey.currentState.validate()) {
      if (_datevalue.isEmpty) {
        _formkey.currentState.save();
        return null;
      } else {
        DocumentReference ref = await db.collection("List").add({
          'date': _datevalue,
          'namelist': _namelist,
          'amount': _amount,
          'income': _income,
          'address': _address,
        });
        setState(() => id = ref.documentID);
        print(ref.documentID);
        Navigator.pop(context);
      }
    }
  }
}
