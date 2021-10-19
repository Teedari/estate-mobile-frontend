class Notice {
  final String applicant;
  final String contact;
  final String facility;
  final String comment;
  final String start_date;
  final String end_date;

  Notice({
    required this.applicant,
    required this.contact,
    required this.facility,
    required this.comment,
    required this.start_date,
    required this.end_date,
  });

  // factory Notice.fromJson(Map<String, dynamic> json) => _$NoticeFromJson(json);

  // Map<String, dynamic> toJson()=> _$NoticeToJson(this);
}
