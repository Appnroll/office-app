class KudosModel {
  KudosModel(String creator, String reason) {
    this.creator = creator;
    this.reason = reason;
    createdAt = new DateTime.now();
    mentioned = <String>['mentioned1','mentioned2', 'mentioned3'];
  }

  String creator;
  List<String> mentioned = <String>[];
  DateTime createdAt;
  String reason;
}
