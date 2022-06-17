class Alarm {
  final int id;
  final DateTime alarm = DateTime.now() ;
  final bool smartAlarm;

   Alarm({
    required this.id,
    required this.smartAlarm,
  });
  Map<String, dynamic> toMap() {
    var smartAlarm;
    var alarm;
    var id;

    return {
      'id': id,
      'alarm': alarm,
      'smartAlarm': smartAlarm,
    };
  }
}