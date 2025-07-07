class Alert {
  String? headline;
  dynamic msgtype;
  dynamic severity;
  dynamic urgency;
  dynamic areas;
  String? category;
  dynamic certainty;
  String? event;
  dynamic note;
  String? effective;
  String? expires;
  String? desc;
  String? instruction;

  Alert({
    this.headline,
    this.msgtype,
    this.severity,
    this.urgency,
    this.areas,
    this.category,
    this.certainty,
    this.event,
    this.note,
    this.effective,
    this.expires,
    this.desc,
    this.instruction,
  });

  factory Alert.fromJson(Map<String, dynamic> json) => Alert(
        headline: json['headline'] as String?,
        msgtype: json['msgtype'] as dynamic,
        severity: json['severity'] as dynamic,
        urgency: json['urgency'] as dynamic,
        areas: json['areas'] as dynamic,
        category: json['category'] as String?,
        certainty: json['certainty'] as dynamic,
        event: json['event'] as String?,
        note: json['note'] as dynamic,
        effective: json['effective'] as String?,
        expires: json['expires'] as String?,
        desc: json['desc'] as String?,
        instruction: json['instruction'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'headline': headline,
        'msgtype': msgtype,
        'severity': severity,
        'urgency': urgency,
        'areas': areas,
        'category': category,
        'certainty': certainty,
        'event': event,
        'note': note,
        'effective': effective,
        'expires': expires,
        'desc': desc,
        'instruction': instruction,
      };
}
