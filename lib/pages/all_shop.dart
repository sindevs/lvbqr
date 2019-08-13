import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';

class ShopExchange extends StatefulWidget {
  ShopExchange({Key key}) : super(key: key);

  _ShopExchangeState createState() => _ShopExchangeState();
}

class _ShopExchangeState extends State<ShopExchange> {
  Completer<GoogleMapController> _controller = Completer();

  // GoogleMapController mapController;

  //userlocaiton
  LocationData currentLocation;

  var clients = [];

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

  static Marker _markerLct(String id, String name, double rat, lng) {
    return Marker(
        markerId: MarkerId(id),
        position: LatLng(rat, lng),
        infoWindow: InfoWindow(title: name));
  }

  //getcurrent location
  Future<LocationData> getCurrentLocation() async {
    Location location = Location();
    try {
      return await location.getLocation();
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        // Permission denied
      }
      return null;
    }
  }

  //found mylocation
  Future _goToMe() async {
    final GoogleMapController controller = await _controller.future;
    currentLocation = await getCurrentLocation();
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(currentLocation.latitude, currentLocation.longitude),
      zoom: 16,
    )));
  }

  @override
  Widget build(BuildContext context) {
    var googleMap = new GoogleMap(
      mapType: MapType.hybrid,
      // myLocationEnabled: true,
      initialCameraPosition: vientaine,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      markers: {
        _markerLct(
            "1", "ທະນາຄານການຄ້າຕ່າງປະເທດລາວສຳນັກງານໃຫ່ຍ", 17.96305, 102.606788),
        _markerLct("2", "ທະນາຄານພັດທະນາລາວສຳນັກງານໃຫ່ຍ", 17.967377, 102.599260),
        _markerLct("3", "ທະນາຄານລາວ-ຫວຽດສຳນັກງານໃຫ່ຍ", 17.967401, 102.615851),
        _markerLct("6", "ທະນາຄານເອຊີເລດາລາວ", 17.965670, 102.616643),
        _markerLct("4", "ທະນາຄານພົງສະຫວັນ", 17.967917, 102.605001),
        _markerLct(
            "5", "ທະນາຄານອຸດສະຫະກຳ ແລະ ການຄ້າຈິນ", 17.976351, 102.625100),
      },
    );
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
      body: googleMap,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToMe,
        label: Text("ທີ່ຢູ່ຂອງຂ້ອຍ"),
        icon: Icon(Icons.near_me),
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
