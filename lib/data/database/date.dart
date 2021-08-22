import '/data/model/date.dart';

/// Dates can be serialized into an integer:
///   day 1-31, 5 bits
///   month 1-12, 4 bits
///   year 0-2^22-1, 22 bits

Date fromRawDate(int rawDate) {
  int day = rawDate & 0x1f;
  rawDate >>= 5;

  int month = rawDate & 0xf;
  rawDate >>= 4;

  int year = rawDate;

  return Date(
    year: year,
    month: month,
    day: day,
  );
}

int toRawDate(Date date) {
  int rawDate = 0;

  rawDate += date.year;

  rawDate <<= 4;
  rawDate += date.month;

  rawDate <<= 5;
  rawDate += date.day;

  return rawDate;
}
