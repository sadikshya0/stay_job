import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ExploreScreenController extends GetxController {
  var selectedIndex = 0.obs;

  GoogleMapController? mapController;

  final LatLng initialPosition = const LatLng(27.7172, 85.3240);

  final Set<Marker> markers = {};

  @override
  void onInit() {
    super.onInit();
    _loadDefaultMarker();
  }

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _loadDefaultMarker() {
    markers.add(
      const Marker(
        markerId: MarkerId("kathmandu"),
        position: LatLng(27.7172, 85.3240),
        infoWindow: InfoWindow(title: "Kathmandu", snippet: "Default location"),
      ),
    );
  }

  void addMarker(LatLng position, String id) {
    markers.add(
      Marker(
        markerId: MarkerId(id),
        position: position,
        infoWindow: InfoWindow(title: id),
      ),
    );

    update();
  }
}
