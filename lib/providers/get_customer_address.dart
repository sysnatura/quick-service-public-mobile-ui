import 'package:aqscustomer/models/get_customer_address_list_model.dart';
import 'package:aqscustomer/utils/base_url.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum CustomerAddressStatus { loading, success, empty, failure }

class GetCustomerAddressProvider extends ChangeNotifier {
  List<GetCustomerAddressList> _responseString;
  CustomerAddressStatus _status = CustomerAddressStatus.loading;
  String _errorMessage = "";
  int _requestId = 0;

  List<GetCustomerAddressList> get responseString => _responseString;
  CustomerAddressStatus get status => _status;
  // Retain the legacy success flag for callers outside the status-based UI.
  bool get error => _status == CustomerAddressStatus.success ||
      _status == CustomerAddressStatus.empty;
  String get errorMessage => _errorMessage;

  Future<List<GetCustomerAddressList>> GetCustomerAddress() async {
    final requestId = ++_requestId;
    _status = CustomerAddressStatus.loading;
    _responseString = null;
    _errorMessage = "";
    notifyListeners();
    try {
      final preferences = await SharedPreferences.getInstance();
      final customerId = preferences.getInt("customerId");
      if (customerId == null || customerId <= 0) {
        throw StateError('Missing customer');
      }
      final response = await get(
        Uri.parse(AppUrl.get_customer_address_url+"$customerId"),
      ).timeout(const Duration(seconds: 30));
      if (response.statusCode != 200) {
        throw StateError('Address request failed');
      }
      final addresses = getCustomerAddressListFromJson(response.body).reversed.toList();
      if (requestId != _requestId) return null;
      _responseString = addresses;
      _status = addresses.isEmpty
          ? CustomerAddressStatus.empty : CustomerAddressStatus.success;
      _errorMessage = "Success";
      notifyListeners();
      return addresses;
    } catch (_) {
      if (requestId != _requestId) return null;
      _responseString = null;
      _status = CustomerAddressStatus.failure;
      _errorMessage = "Unable to load addresses. Please try again.";
      notifyListeners();
      return null;
    }
  }
}
