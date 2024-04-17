import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// const LatLng sourceLocation = LatLng(23.527834333084922, 87.36170784556745);
// const LatLng destinationLocation = LatLng(23.53591894593059, 87.33764990341295);

class Map_page extends StatefulWidget {

  /// connecting the text field //

  // final String searchQuery;
  const Map_page({Key? key}) : super(key: key);

  @override
  State<Map_page> createState() => _Map_page_State();
}

class _Map_page_State extends State<Map_page> {
  //
  // late GoogleMapController mapController;
  //
  // Map<String, Marker> _marker = {};

  Completer<GoogleMapController> _controller =Completer();

  static final CameraPosition _kGooglePlex=const CameraPosition(
      target: LatLng(23.567500,87.259274),
    zoom: 14.4746,
  );

  ///// list of all markers /////

  List<Marker> _marker=[];
  List<Marker>_list= const[
   Marker(
       markerId: MarkerId('1'),
     position: LatLng(23.567500,87.259274),
     infoWindow: InfoWindow(
       title: 'My Location',
     ),
   ),

      Marker(
  markerId: MarkerId('2'),
  position: LatLng(23.571838,87.302292),
  infoWindow: InfoWindow(
  title: 'My School',
  ),
      ),
    Marker(
      markerId: MarkerId('2'),
      position: LatLng(23.53933110319663, 87.2911756308152),
      infoWindow: InfoWindow(
        title: 'Junction Mall',
      ),
    ),
  ];

  /////// marker ////////

  @override
  void initState(){
    super.initState();
    _marker.addAll(_list);  // addAll as it is a list
  }
  @override
  Widget build(BuildContext context) {
    // String searchQuery=widget.searchQuery;
    // if (searchQuery.isNotEmpty) {
    //   _marker = _list.where((marker) {
    //     return marker.infoWindow.title!.toLowerCase().contains(searchQuery.toLowerCase());
    //   }).toList();
    // } else {
    //   // If the search query is empty, show all markers
    //   _marker = List.from(_list);
    // }
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Page'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          mapType: MapType.normal,
          markers:Set<Marker>.of(_marker),
          compassEnabled: true,
          myLocationEnabled: true,


          onMapCreated: (GoogleMapController controller){
            _controller.complete(controller);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.location_disabled_outlined
        ),
        onPressed: ()async{
          GoogleMapController controller=await _controller.future;
          controller.animateCamera(CameraUpdate.newCameraPosition(
             CameraPosition(
                 target: LatLng(23.571838,87.302292),
               zoom: 14,
          )
          ),
          );
          setState(() {

          });
          },
      ),

    );}}
