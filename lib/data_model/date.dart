part of data_model;

class Date {
  final int year;
  final int month;
  final int day;

  const Date({
    required this.year,
    required this.month,
    required this.day,
  });

  @override
  String toString() {
    return 'Date(year: $year, month: $month, day: $day)';
  }
}
