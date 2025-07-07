class WeatherResponseModel {
  Location? location;
  Current? current;

  WeatherResponseModel({this.location, this.current});

  factory WeatherResponseModel.fromJson(Map<String, dynamic> json) {
    return WeatherResponseModel(
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      current: json['current'] == null
          ? null
          : Current.fromJson(json['current'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'location': location?.toJson(),
        'current': current?.toJson(),
      };
}

class Location {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  int? localtimeEpoch;
  String? localtime;

  Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json['name'] as String?,
        region: json['region'] as String?,
        country: json['country'] as String?,
        lat: (json['lat'] as num?)?.toDouble(),
        lon: (json['lon'] as num?)?.toDouble(),
        tzId: json['tz_id'] as String?,
        localtimeEpoch: json['localtime_epoch'] as int?,
        localtime: json['localtime'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'region': region,
        'country': country,
        'lat': lat,
        'lon': lon,
        'tz_id': tzId,
        'localtime_epoch': localtimeEpoch,
        'localtime': localtime,
      };
}

class Current {
  int? lastUpdatedEpoch;
  String? lastUpdated;
  double? tempC;
  double? tempF;
  int? isDay;
  Condition? condition;
  double? windMph;
  double? windKph;
  int? windDegree;
  String? windDir;
  double? pressureMb;
  double? pressureIn;
  double? precipMm;
  double? precipIn;
  int? humidity;
  int? cloud;
  double? feelslikeC;
  double? feelslikeF;
  double? windchillC;
  double? windchillF;
  double? heatindexC;
  double? heatindexF;
  double? dewpointC;
  double? dewpointF;
  double? visKm;
  double? visMiles;
  double? uv;
  double? gustMph;
  double? gustKph;

  Current({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.windchillC,
    this.windchillF,
    this.heatindexC,
    this.heatindexF,
    this.dewpointC,
    this.dewpointF,
    this.visKm,
    this.visMiles,
    this.uv,
    this.gustMph,
    this.gustKph,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        lastUpdatedEpoch: json['last_updated_epoch'] as int?,
        lastUpdated: json['last_updated'] as String?,
        tempC: (json['temp_c'] as num?)?.toDouble(),
        tempF: (json['temp_f'] as num?)?.toDouble(),
        isDay: json['is_day'] as int?,
        condition: json['condition'] == null
            ? null
            : Condition.fromJson(json['condition'] as Map<String, dynamic>),
        windMph: (json['wind_mph'] as num?)?.toDouble(),
        windKph: (json['wind_kph'] as num?)?.toDouble(),
        windDegree: json['wind_degree'] as int?,
        windDir: json['wind_dir'] as String?,
        pressureMb: json['pressure_mb'] as double?,
        pressureIn: (json['pressure_in'] as num?)?.toDouble(),
        precipMm: json['precip_mm'] as double?,
        precipIn: json['precip_in'] as double?,
        humidity: json['humidity'] as int?,
        cloud: json['cloud'] as int?,
        feelslikeC: (json['feelslike_c'] as num?)?.toDouble(),
        feelslikeF: (json['feelslike_f'] as num?)?.toDouble(),
        windchillC: (json['windchill_c'] as num?)?.toDouble(),
        windchillF: json['windchill_f'] as double?,
        heatindexC: (json['heatindex_c'] as num?)?.toDouble(),
        heatindexF: json['heatindex_f'] as double?,
        dewpointC: (json['dewpoint_c'] as num?)?.toDouble(),
        dewpointF: (json['dewpoint_f'] as num?)?.toDouble(),
        visKm: json['vis_km'] as double?,
        visMiles: json['vis_miles'] as double?,
        uv: (json['uv'] as num?)?.toDouble(),
        gustMph: (json['gust_mph'] as num?)?.toDouble(),
        gustKph: json['gust_kph'] as double?,
      );

  Map<String, dynamic> toJson() => {
        'last_updated_epoch': lastUpdatedEpoch,
        'last_updated': lastUpdated,
        'temp_c': tempC,
        'temp_f': tempF,
        'is_day': isDay,
        'condition': condition?.toJson(),
        'wind_mph': windMph,
        'wind_kph': windKph,
        'wind_degree': windDegree,
        'wind_dir': windDir,
        'pressure_mb': pressureMb,
        'pressure_in': pressureIn,
        'precip_mm': precipMm,
        'precip_in': precipIn,
        'humidity': humidity,
        'cloud': cloud,
        'feelslike_c': feelslikeC,
        'feelslike_f': feelslikeF,
        'windchill_c': windchillC,
        'windchill_f': windchillF,
        'heatindex_c': heatindexC,
        'heatindex_f': heatindexF,
        'dewpoint_c': dewpointC,
        'dewpoint_f': dewpointF,
        'vis_km': visKm,
        'vis_miles': visMiles,
        'uv': uv,
        'gust_mph': gustMph,
        'gust_kph': gustKph,
      };
}

class Condition {
  String? text;
  String? icon;
  int? code;

  Condition({this.text, this.icon, this.code});

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json['text'] as String?,
        icon: json['icon'] as String?,
        code: json['code'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'text': text,
        'icon': icon,
        'code': code,
      };
}
