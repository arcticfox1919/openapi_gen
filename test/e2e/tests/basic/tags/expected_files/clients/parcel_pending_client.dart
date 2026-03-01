// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'dart:convert';

import 'package:gio/gio.dart';

import '../models/api_parcel_pending_building_settings.dart';
import '../models/api_parcel_pending_building_settings_request.dart';
import '../models/get_parcel_pending_webhook_buildings_building_id_response.dart';

/// ParcelPendingClient
class ParcelPendingClient {
  /// Creates a [ParcelPendingClient] using the provided [gio] instance.
  ///
  /// [baseUrl] overrides any base URL already configured on the
  /// [Gio] instance for this client only.
  ParcelPendingClient(Gio gio, {String? baseUrl})
      : _gio = gio,
        _baseUrl = baseUrl;

  final Gio _gio;
  final String? _baseUrl;

  /// get Parcel Pending webhook URL.
  ///
  /// [buildingId] - Identifier for an existing building.
  Future<GetParcelPendingWebhookBuildingsBuildingIdResponse>
      getParcelPendingWebhookUrl({
    required String buildingId,
  }) async {
    final response = await _gio.get(
      '${_baseUrl ?? ''}/parcel-pending-webhook/buildings/${buildingId}',
    );
    return GetParcelPendingWebhookBuildingsBuildingIdResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  }

  /// Retrieve the ParcelPending settings of a building.
  ///
  /// [buildingId] - Identifier for an existing building.
  ///
  /// [projectId] - Identifier for an existing project.
  Future<ApiParcelPendingBuildingSettings> getParcelPendingBuildingSettings({
    required String buildingId,
    required String projectId,
  }) async {
    final response = await _gio.get(
      '${_baseUrl ?? ''}/projects/${projectId}/buildings/${buildingId}/parcel-pending/settings',
    );
    return ApiParcelPendingBuildingSettings.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  }

  /// Create or update ParcelPending settings of a building.
  ///
  /// [buildingId] - Identifier for an existing building.
  ///
  /// [projectId] - Identifier for an existing project.
  Future<ApiParcelPendingBuildingSettings>
      createUpdateParcelPendingBuildingSettings({
    required String buildingId,
    required String projectId,
    required ApiParcelPendingBuildingSettingsRequest body,
  }) async {
    final response = await _gio.post(
      '${_baseUrl ?? ''}/projects/${projectId}/buildings/${buildingId}/parcel-pending/settings',
      jsonBody: body.toJson(),
    );
    return ApiParcelPendingBuildingSettings.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  }
}
