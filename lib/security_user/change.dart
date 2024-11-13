import 'dart:ui';

class ChangeData {
  static String ChangeUnitsToVietnamese(String value) {
    Map<String, String> map = {
      'bunch': 'Bó',
      'branch': 'Cành',
      'kg': 'Kg',
    };
    String result = value;
    map.forEach((key, value) {
      result = result.replaceAll(key, value);
    });
    return result;
  }

  static String changeStringToCurrency(String input) {
    String suffix = "";
    input = input.replaceAll(".", "").replaceAll("₫", "").replaceAll(" ", "");

    try {
      int index = input.indexOf(".0");
      if (index != -1) {
        suffix = input.substring(index).replaceAll(".", ",");
        input = input.replaceRange(index, null, "");
      }
      StringBuffer buffer = StringBuffer();
      int count = 0;
      input = int.parse(input).toString();

      String reserveInput = input.split('').reversed.join('');

      for (int i = 0; i < reserveInput.length; i++) {
        buffer.write(reserveInput[i]);
        count++;

        if (count == 3 && i != reserveInput.length - 1) {
          buffer.write('.');
          count = 0;
        }
      }

      String reserveOutput = buffer.toString().split('').reversed.join('');

      return "$reserveOutput$suffix ₫";
    } catch (e) {
      print(e);
      return "";
    }
  }

  static String ChangeCountry(String value) {
    Map<String, String> map = {
      'VN': 'Việt Nam',
      'GB': 'Vương quốc Anh',
      'MA': 'Ma-Rốc',
      'TH': 'Thái Lan',
      'CA': 'Canada',
      'PA': 'Panama',
      'US': 'Hoa Kỳ',
      'JP': 'Nhật Bản',
      'CN': 'Trung Quốc',
      'KR': 'Hàn Quốc',
      'FR': 'Pháp',
      'DE': 'Đức',
      'SG': 'Singapore',
      'MY': 'Malaysia',
      'ID': 'Indonesia',
      'PH': 'Philippines',
      'TW': 'Đài Loan',
      'HK': 'Hồng Kông',
      'IT': 'Ý',
      'ES': 'Tây Ban Nha',
      'NL': 'Hà Lan',
      'SE': 'Thụy Điển',
      'DK': 'Đan Mạch',
      'NO': 'Na Uy',
      'FI': 'Phần Lan',
      'BE': 'Bỉ',
      'AT': 'Áo',
      'CH': 'Thụy Sĩ',
    };
    String result = value;
    map.forEach((key, value) {
      result = result.replaceAll(key, value);
    });
    return result;
  }

  static Color ChangeColorIdToColors(String value) {
    Map<String, Color> map = {
      '754f8232-0f97-4172-9989-9970d69f6945': Color(0xFFF9643E),
      'cff3f0a0-28a1-4621-8b12-6991f9c2ec26': Color(0xFFFF0000),
      'd91d91d8-fd0e-49e8-9df7-0cfc2372cfbe': Color(0xFFD62E90),
      '465f12d1-57f9-43a5-83c4-0de05d2d7b25': Color(0xFF80A2E0),
      'cd74c718-b5bf-4ae4-ac1f-defe03cb9b0d': Color(0xFFD2B214),
      '01H5Q6K3BVMDQQR4EA2FXY9JBH': Color(0xFF5B3434),
      '1ba02d09-43af-4984-bd16-008448ebd120': Color(0xFFC26AA8),
      'd355b6b5-fb0d-471c-8415-65a8e0ea4c21': Color(0xFFE9EDF4),
      'cfd9c19d-4be3-4d22-9a6d-58b57b5c2185': Color(0xFFFEBF01),
    };
    Color result = Color(0xFF000000);
    map.forEach((key, valuee) {
      if (key == value) {
        result = valuee;
      }
    });
    return result;
  }

  static Color ChangeColorIdToColorsBackGround(String value) {
    Map<String, Color> map = {
      '754f8232-0f97-4172-9989-9970d69f6945': Color(0xFFFFFFFF),
      'cff3f0a0-28a1-4621-8b12-6991f9c2ec26': Color(0xFFFFFFFF),
      'd91d91d8-fd0e-49e8-9df7-0cfc2372cfbe': Color(0xFFFFFFFF),
      '465f12d1-57f9-43a5-83c4-0de05d2d7b25': Color(0xFFFFFFFF),
      'cd74c718-b5bf-4ae4-ac1f-defe03cb9b0d': Color(0xFFF5F5F5),
      '01H5Q6K3BVMDQQR4EA2FXY9JBH': Color(0xFFFFFFFF),
      '1ba02d09-43af-4984-bd16-008448ebd120': Color(0xFFFFFFFF),
      'd355b6b5-fb0d-471c-8415-65a8e0ea4c21': Color(0xFFFFFFFF),
      'cfd9c19d-4be3-4d22-9a6d-58b57b5c2185': Color(0xFFF5F5F5),
    };
    Color result = Color(0xFF000000);
    map.forEach((key, valuee) {
      if (key == value) {
        result = valuee;
      }
    });
    return result;
  }

  static String ChangeColorIdToColorName(String value) {
    Map<String, String> map = {
      '754f8232-0f97-4172-9989-9970d69f6945': 'Màu cam',
      'cff3f0a0-28a1-4621-8b12-6991f9c2ec26': 'Màu đỏ',
      'd91d91d8-fd0e-49e8-9df7-0cfc2372cfbe': 'Màu hồng',
      '465f12d1-57f9-43a5-83c4-0de05d2d7b25': 'Màu lam',
      'cd74c718-b5bf-4ae4-ac1f-defe03cb9b0d': 'Màu testing',
      '01H5Q6K3BVMDQQR4EA2FXY9JBH': 'Màu tím',
      '1ba02d09-43af-4984-bd16-008448ebd120': 'Màu tím',
      'd355b6b5-fb0d-471c-8415-65a8e0ea4c21': 'Màu trắng',
      'cfd9c19d-4be3-4d22-9a6d-58b57b5c2185': 'Màu vàng',
    };
    String result = value;
    map.forEach((key, value) {
      result = result.replaceAll(key, value);
    });
    return result;
  }

  static String ChangeStatusIntToStatusString(int value) {
    Map<int, String> map = {
      0: 'pending', //Don hang moi
      1: 'processing', //Dang xu ly
      2: 'ready-ship', //Chuan bi giao hang
      3: 'shipping', //Dang giao hang
      4: 'delivered', //Don hang da giao
      5: 'completed', //Don hang hoan tat
      6: 'on-hold', //Dang cho
      7: 'cancelled' //Da huy
    };
    String result = '';
    map.forEach((key, valuee) {
      if (key == value) {
        result = valuee;
      }
    });
    return result;
  }
}
