import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  History({Key key}) : super(key: key);

  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  String id;
  final db = Firestore.instance;
  final _formKey = GlobalKey<FormState>();

  Card buildItem(DocumentSnapshot doc) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'ຊື່ລາຍການ:   ${doc.data['namelist']}',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              'ວັນທີ - ເດືອນ - ປີ:  ${doc.data['date']}',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              'ຈຳນວນເງິນທີ່ແລກປ່ຽນ:   ${doc.data['amount']}',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              'ຈຳນວນເງິນທີ່ໄດ້ຮັບ:   ${doc.data['income']}',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              'ສະຖານທີ່ແລກປ່ຽນ:   ${doc.data['address']}',
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: () => deleteData(doc),
                  child: Text(
                    'ແກ້ໄຂ',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.green,
                ),
                SizedBox(
                  width: 10.0,
                ),
                FlatButton(
                  onPressed: () => deleteData(doc),
                  child: Text(
                    'ລຶບ',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.red,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[
          StreamBuilder<QuerySnapshot>(
            stream: db.collection('List').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                    children: snapshot.data.documents
                        .map((doc) => buildItem(doc))
                        .toList());
              } else {
                return SizedBox();
              }
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pushNamed("/addlist");
        },
        label: Text(
          "ເພີ່ມລາຍການ",
          style: TextStyle(color: Colors.white),
        ),
        icon: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
      ),
    );
  }

  void createData() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    }
  }

  void readData() async {
    DocumentSnapshot snapshot = await db.collection('List').document(id).get();
    print(snapshot.data['name']);
  }

  void updateData(DocumentSnapshot doc) async {
    await db
        .collection('List')
        .document(doc.documentID)
        .updateData({'todo': 'please 🤫'});
  }

  void deleteData(DocumentSnapshot doc) async {
    await db.collection('List').document(doc.documentID).delete();
    setState(() => id = null);
  }
}
