class AnnouncementModel {
  List<Announcements>? announcements;

  AnnouncementModel({this.announcements});

  AnnouncementModel.empty();

  AnnouncementModel.fromJson(List json) {
    announcements = <Announcements>[];
    for (var v in json) {
      announcements!.add(Announcements.fromJson(v));
    }
  }

  List toList() {
    if (announcements != null) {
     return announcements!.map((v) => v.toJson()).toList();
    }
    return [];
  }
}

class Announcements {
  int? id;
  String? name;
  String? startDate;
  String? endDate;
  String? description;
  String? tenantId;
  String? createdBy;
  String? createdAt;
  String? updatedAt;

  Announcements({
    this.id,
    this.name,
    this.startDate,
    this.endDate,
    this.description,
    this.tenantId,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
  });

  Announcements.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    description = json['description'];
    tenantId = json['tenant_id'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['description'] = description;
    data['tenant_id'] = tenantId;
    data['created_by'] = createdBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
