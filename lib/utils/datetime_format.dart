import 'package:intl/intl.dart';

DateandTime(DateTime val)
{
  //DateTime dateToday = val;
  return DateFormat('dd/MM/yyyy HH:mm').format(val).toString().substring(0, 10);
}

String simplyFormat({ DateTime time, bool dateOnly = false}) {
  String year = time.year.toString();

  // Add "0" on the left if month is from 1 to 9
  String month = time.month.toString().padLeft(2, '0');

  // Add "0" on the left if day is from 1 to 9
  String day = time.day.toString().padLeft(2, '0');

  // Add "0" on the left if hour is from 1 to 9
  String hour = time.hour.toString().padLeft(2, '0');

  // Add "0" on the left if minute is from 1 to 9
  String minute = time.minute.toString().padLeft(2, '0');

  // Add "0" on the left if second is from 1 to 9
  String second = time.second.toString();

  // If you only want year, month, and date
  if (dateOnly == false) {
    return "$hour:$minute";
  }

  // return the "yyyy-MM-dd HH:mm:ss" format
  return "$year-$month-$day";
}



GetTime(String val){
  String formattedDate =DateFormat.yMEd().add_jms().format(DateTime.parse(val));
  // String formattedDate = DateFormat.jm().format(DateTime.parse(val));
  print(formattedDate);
}

GetTimeAmPm(String val){   //Format : 11:14:09 AM
  //DateFormat('hh:mm a').format(DateTime.now());
  return DateFormat.jm().format(DateTime.parse(val));
}
