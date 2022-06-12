import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:millionaire_app/constants.dart';
import 'package:millionaire_app/managers/resource_manager.dart';
import 'package:millionaire_app/ui/popups/filter_city_popup.dart';
import 'package:millionaire_app/ui/widgets/bouncing_animated_widget.dart';

import 'components/places_auto_complete.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double inputWidth = (screenWidth > 400) ? 400 : (screenWidth * 75 / 100);
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          GoogleMap(
            onMapCreated: (controller) {},
            initialCameraPosition: const CameraPosition(target: LatLng(35, 36)),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: true,
            mapToolbarEnabled: false,
            minMaxZoomPreference: const MinMaxZoomPreference(5, 19),
            onCameraMoveStarted: () {},
            onCameraIdle: () {},
            onCameraMove: (position) {},
            padding: const EdgeInsets.only(bottom: 90.0, top: 80.0),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: (screenWidth - inputWidth) / 2, vertical: 20),
              child: const PlacesAutoComplete(),
            ),
          ),
          BounceAnimatedWidget(
            onTap: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(60))),
                isScrollControlled: true,
                backgroundColor: Colors.white,
                context: context,
                builder: (builder) {
                  return FilterCityPopUp(onConfirmClicked: () {});
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        const Color(0xFF8BE2F7).withOpacity(0.75),
                        const Color(0xFFB4F5F5)
                      ]),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Image.asset(
                        ResourceManager.getResource(name: 'map_filter.png')),
                  )),
            ),
          ),
        ]),
      ),
    );
  }
}
