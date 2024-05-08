import 'dart:math';
import 'dart:convert';

import 'package:intl/intl.dart';

class DataFormatter {



  /// Function untuk formatting int number menjadi format Rupiah
  static String formatIDR(int num, [String? symbol]) => NumberFormat.currency(
        locale: 'id_ID',
        symbol: symbol ?? 'Rp ',
        decimalDigits: 0,
      ).format(num);

  /// Function untuk mengubah format sebuah tanggal.
  static String formatDate(String date,
      [String format = 'dd MMMM y', String locale = 'in']) {
    DateTime tempDate = stringToDate(date);
    return DateFormat(format, locale).format(tempDate);
  }

  /// Function untuk mengubah String menjadi DateTime
  static DateTime stringToDate(String date,
          [String format = 'y-M-dd', String locale = 'in']) =>
      DateFormat(format, locale).parse(date);



  static String formatPhoneNumber({
    required String phoneNumber,
  }) {
    if (phoneNumber.isEmpty) return '';
    // return 'Nomor Handphone Kosong';
    return (phoneNumber.startsWith('0')) ? phoneNumber : '0$phoneNumber';
  }



}
