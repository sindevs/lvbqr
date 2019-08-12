import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShopExchange extends StatefulWidget {
  ShopExchange({Key key}) : super(key: key);

  _ShopExchangeState createState() => _ShopExchangeState();
}

class _ShopExchangeState extends State<ShopExchange> {
  Completer<GoogleMapController> _controller = Completer();

  var _currentLocation = 1;
  static final CameraPosition vientaine =
      _camPos(17.9705644, 102.6182906, 14.91);

  static final CameraPosition shop = _camPos(17.963703, 102.6160804, 18.3);
  static final CameraPosition mylocation =
      _camPos(17.9630311, 102.6116022, 18.09);

  static CameraPosition _camPos(double rat, lng, zoom) {
    return CameraPosition(target: LatLng(rat, lng), zoom: zoom - 2.0);
  }

  Future<void> _gotoLocation(CameraPosition pos) async {
    final controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(pos));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("ສະຖານທີ່ແລກປ່ຽນເງິນ"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => {},
          )
        ],
      ),
      body: new GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: vientaine,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text("ທະນາຄານ"),
            icon: Icon(Icons.attach_money),
          ),
          BottomNavigationBarItem(
            title: Text("ຮ້ານແລກປ່ຽນ"),
            icon: Icon(Icons.shop),
          ),
          BottomNavigationBarItem(
            title: Text("ທີ່ຢູ່ຂອງຜູ່ໃຊ້"),
            icon: Icon(Icons.my_location),
          ),
        ],
        currentIndex: _currentLocation,
        onTap: (i) {
          setState(() {
            _currentLocation = i;
            print(i);

            switch (i) {
              case 0:
                _gotoLocation(vientaine);
                break;
              case 1:
                _gotoLocation(shop);
                break;
              case 2:
                _gotoLocation(mylocation);
                break;
            }
          });
        },
      ),
    );
  }
}
