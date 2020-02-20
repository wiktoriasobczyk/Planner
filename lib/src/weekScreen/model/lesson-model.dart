class Lesson {
  String id;
  String name;
  String startDateTime;
  String finishDateTime;
  String place;
  String leaderName;

  Lesson({this.id,this.name, this.startDateTime, this.finishDateTime, this.place, this.leaderName});

  getName() => this.name;
  getStartDateTime() => this.startDateTime;
  getFinishDateTime() => this.finishDateTime;
  getPlace() => this.place;
  getleaderName() => this.leaderName;
}
