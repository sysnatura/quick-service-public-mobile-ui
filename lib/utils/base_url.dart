class AppUrl {
   static const String base_url = "https://aqsapi.aspiromtech.com/";
   //static const String base_url = "https://5f48-111-92-63-14.in.ngrok.io/";

  static const String register_url = base_url + "Api/CustomerMobile/SaveCustomerMobile";
  static const String service_list_url = base_url + "api//Attribute/GetAllAttribute";
  static const String single_customer_details_url = base_url +"api/Customer/GetSingleCustomer/";
  static const String customer_update_Profile = base_url +"Api/Customer/UpdateCustomerForMobile";
  static const String signup_OTP_Varify = base_url +"Api/CustomerMobile/CutomerOtpVerify";
  static const String get_all_service_orderbystatus = base_url +"api/ServiceOrderMobile/GetAllServiceOrdersByStatus?";
  static const String get_notifications = base_url +"Api/Notification/GetCustomerUnreadNotification";
  static const String login_url = base_url + "api/Account/CustomerLogin";
  static const String catrgoty_listing_url = base_url + "api/Module/GetAllModuleByOrder";
  static const String confirm_password = base_url + "Api/CustomerMobile/UpdatePasswordFromMobile";
  static const String forgotPass_email_varification = base_url + "Api/CustomerMobile/SendForgotPasswordOtp?u";
  static const String forgotpassword_url = base_url + "Api/Customer/ResetPasswordEmailVerification";
  static const String update_customerAddress = base_url + "Api/CustomerAddress/UpdateCustomerAddressForMobile";
  static const String get_single_address = base_url + "api/CustomerAddress/GetSingleCustomerAddress?";
  static const String get_all_city_url = base_url + "Api/City/GetAllCityByStateId/";
  static const String get_all_state_url = base_url + "Api/State/GetAllStateByCountry/";
  static const String real_estate_url = base_url + "Api/RealEstate/GetAllApprovedRealEstate";
  static const String change_password_url = base_url + "api/Customer/UpdateCustomerPassword";
  static const String setAsPrimary_url = base_url + "Api/CustomerAddress/SetAsPrimary/";
  static const String book_service = base_url + "api/ServiceOrderMobile/SaveService";
  static const String get_customer_address_url = base_url + "api/CustomerAddress/GetSingleCustomerAddressList/";
  static const String get_service_questions = base_url + "api/Attribute/GetAllAttributeByService?";
  static const String delete_customer_address_url = base_url +"Api/CustomerAddress/DeleteCustomerAddress/";
  static const String add_customer_addess = base_url +"Api/CustomerAddress/SaveCustomerAddress";
  static const String get_all_country_url = base_url + "Api/Country/GetAllCountry";
  static const String get_all_bookings = base_url + "Api/ServiceOrder/GetAllServiceOrders/";
  static const String update_profile_pic_url = base_url +"api/CustomerMobile/UploadProfilePicture";






}
