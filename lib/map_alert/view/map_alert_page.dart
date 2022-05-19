import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:risk_alert/map_alert/cubit/map_alert_cubit.dart';
import 'package:risk_alert/map_alert/view/map_alert_drawer.dart';
import 'package:risk_alert/map_alert/view/send_alert_dialog.dart';
import 'package:risk_alert/repositories/contact_repository.dart';
import 'package:risk_alert/theme/colors.dart';

const mapboxAccessToken =
    'pk.eyJ1IjoianVhbmpvc2VsZWNhIiwiYSI6ImNsMnZ4Mm5vcjBnOG0zcG9hbXViZGE3NnMifQ'
    '.sMywpszKgBthYDKs7Nedzg';
const mapboxStyle = 'mapbox/light-v10';

class MapAlertPage extends StatelessWidget {
  const MapAlertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MapAlertCubit(contactRepository: context.read<ContactRepository>()),
      child: const _MapAlertView(),
    );
  }
}

class _MapAlertView extends StatelessWidget {
  const _MapAlertView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MapAlertDrawer(),
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: primaryColor),
        title: Column(
          children: [
            const Text(
              'Seleccionados',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
            BlocBuilder<MapAlertCubit, MapAlertState>(
              builder: (context, state) {
                return Text(
                  '${state.selectedContactsId.length} contactos',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: primaryColor,
                  ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BlocBuilder<MapAlertCubit, MapAlertState>(
        builder: (context, state) {
          return Visibility(
            visible: state.selectedContactsId.isNotEmpty,
            child: FloatingActionButton(
              onPressed: () {
                showDialog<dynamic>(
                  context: context,
                  builder: (_) => SendAlertDialog(
                    contactsCounter: state.selectedContactsId.length,
                  ),
                );
              },
              child: const Icon(
                Icons.campaign,
                color: Colors.white,
              ),
            ),
          );
        },
      ),
      body: FlutterMap(
        options: MapOptions(
          minZoom: 5,
          maxZoom: 18,
          center: LatLng(-16.396504, -71.524031),
          zoom: 16,
        ),
        children: [
          TileLayerWidget(
            options: TileLayerOptions(
              urlTemplate:
                  'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
              additionalOptions: {
                'accessToken': mapboxAccessToken,
                'id': mapboxStyle
              },
            ),
          ),
          MarkerLayerWidget(
            options: MarkerLayerOptions(
              markers: [
                Marker(
                  width: 24,
                  height: 24,
                  point: LatLng(-16.396504, -71.524031),
                  builder: (ctx) => const _UserPositionMarker(),
                ),
              ],
            ),
          ),
          MarkerLayerWidget(
            options: MarkerLayerOptions(
              markers: [
                Marker(
                  width: 24,
                  height: 24,
                  point: LatLng(-16.394972395512674, -71.52496961851624),
                  builder: (ctx) => const _SecurityPlaceMarker(),
                ),
              ],
            ),
          ),
          MarkerLayerWidget(
            options: MarkerLayerOptions(
              markers: [
                Marker(
                  width: 24,
                  height: 24,
                  point: LatLng(-16.397244126497444, -71.52329091333556),
                  builder: (ctx) => const _SecurityPlaceMarker(),
                ),
              ],
            ),
          ),
          MarkerLayerWidget(
            options: MarkerLayerOptions(
              markers: [
                Marker(
                  width: 24,
                  height: 24,
                  point: LatLng(-16.398232200939407, -71.52672950529734),
                  builder: (ctx) => const _SecurityPlaceMarker(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _UserPositionMarker extends StatelessWidget {
  const _UserPositionMarker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xff00C14D),
        border: Border.all(color: const Color(0xffF2FFF7)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff69D982).withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
          ),
        ],
      ),
    );
  }
}

class _SecurityPlaceMarker extends StatelessWidget {
  const _SecurityPlaceMarker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.house,
      color: primaryColor,
    );
  }
}
