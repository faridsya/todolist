class FormValidator {
  static String? validateId(String value) {
    if (value.isEmpty) return 'Tidak boleh kosong';
    if (value.length < 10) return 'Minimal 10 digit';

    return "";
  }

  static String validateEmail(String value) {
    String pattern = r"^(([^<>()[\]\\.,;:\s@\']+(\.[^<>()[\]\\.,;:\s@\']+)*)|(\'.+\'))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$";
    RegExp regExp = RegExp(pattern);

    if (value.isEmpty) return 'Tidak boleh kosong';
    if (!regExp.hasMatch(value)) return 'Format E-Mail tidak valid';

    return "";
  }

  static String validatePassword(String value) {
    if (value.isEmpty) return 'Tidak boleh kosong';
    if (value.length<6) return 'Minimal 6 karakter';

    return "";
  }

  static String? validateHandphone(String value) {
    if (value.isEmpty) return 'Tidak boleh kosong';
    if (value.length < 10) return 'Nomor Handphone minimal 10 digit';

    final codeNumber = value[0] + value[1];

    if (codeNumber != '08') return 'Format Nomor Handphone tidak valid. ex: 08xxxxxxxxxx';

    return "";
  }

  static String? validatePhoneNumber(String phoneNumber) {
    if (phoneNumber.isEmpty) return 'Tidak boleh kosong';
    if (phoneNumber[0] == '0' || phoneNumber[0] != '8') return 'Format tidak valid. ex: 8123xxxxxx';
    if (phoneNumber.length < 9) return 'Minimal 10 digit';

    return "";
  }

  static String validatePertemuan(String value) {
    if (value.isEmpty) return 'Tidak boleh kosong';
    return "";
  }

  static String validatePaket(String value) {
    if (value.isEmpty) return 'Tidak boleh kosong';
    return "";
  }
  static String validateusername(String value) {
    if (value.isEmpty) return 'Tidak boleh kosong';
    return "";
  }

  static String validateUraian(String value) {
    if (value.isEmpty) return 'Tidak boleh kosong';
    return "";
  }

  static String validateTanggal(String value) {
    if (value.isEmpty) return 'Tidak boleh kosong';
    return "";
  }

  static String validateNama(String value) {
    if (value.isEmpty) return 'Tidak boleh kosong';

    return "";
  }

  static String validatealamat(String value) {
    if (value.isEmpty) return 'Tidak boleh kosong';

    return "";
  }

  static String validateUsulanSiswa(String value) {
    if (value.isEmpty) return 'Tidak boleh kosong';

    return "";
  }

  static String validatePertanyaan(String value) {
    if (value.isEmpty) return 'Tidak boleh kosong';

    return "";
  }
}
