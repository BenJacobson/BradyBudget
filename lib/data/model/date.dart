/// Class to represent dates, Simplified to year, month, day.
/// Dates can be serialized into an integer:
///   day 1-31, 5 bits
///   month 1-12, 4 bits
///   year 0-2^22-1, 22 bits
class Date {
  static fromInt(int packedDate) {
    int day = packedDate & 0x1f;
    packedDate >>= 5;

    int month = packedDate & 0xf;
    packedDate >>= 4;

    int year = packedDate;

    return Date(
      year: year,
      month: month,
      day: day,
    );
  }

  final int year;
  final int month;
  final int day;

  const Date({
    required this.year,
    required this.month,
    required this.day,
  });

  int toInt() {
    int val = 0;

    val += year;

    val <<= 4;
    val += month;

    val <<= 5;
    val += day;

    return val;
  }
}
