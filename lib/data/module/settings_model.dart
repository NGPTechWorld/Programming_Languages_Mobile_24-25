class SettingsModel {
  final bool update;
  final String msgup;
  final bool repair;
  final String msgrepair;
  final String version;
  final String msgVersion;
  final String urlupdate;
  final String agreement;
  SettingsModel({
    required this.update,
    required this.msgup,
    required this.repair,
    required this.msgrepair,
    required this.version,
    required this.msgVersion,
    required this.urlupdate,
    required this.agreement,
  });

  factory SettingsModel.fromJson(Map<String, dynamic> json) {
    return SettingsModel(
      update: json['update'],
      msgup: json['msgup'],
      repair: json['repair'],
      msgrepair: json['msgrepair'],
      version: json['Version'],
      msgVersion: json['msgVersion'],
      urlupdate: json['urlupdate'],
      agreement: json['agreement'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'update': update,
      'msgup': msgup,
      'repair': repair,
      'msgrepair': msgrepair,
      'Version': version,
      'msgVersion': msgVersion,
      'urlupdate': urlupdate,
      'agreement': agreement,
    };
  }
}
