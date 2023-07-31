

import 'package:distro_mate/utils/helper/shared_preferences.dart';

import '../constants/app_constants.dart';

class PrefUtils {
  static String? setUserToken(String token) {
    Prefs.prefs!.setString(SharedPrefsKeys.USER_TOKEN, token);
  }

  static String getUserToken() {
    final String? value = Prefs.prefs!.getString(SharedPrefsKeys.USER_TOKEN);
    return value ?? '';
  }


  static String? setBankToken(String token) {
    Prefs.prefs!.setString(SharedPrefsKeys.BANK_USER_TOKEN, token);
  }

  static String getBankToken() {
    final String? value = Prefs.prefs!.getString(SharedPrefsKeys.BANK_USER_TOKEN);
    return value ?? '';
  }

  static String? setBankUSERID(String token) {
    Prefs.prefs!.setString(SharedPrefsKeys.BANK_USER_ID, token);
  }

  static String getBankUSERID() {
    final String? value = Prefs.prefs!.getString(SharedPrefsKeys.BANK_USER_ID);
    return value ?? '';
  }

  static String? setRemember(String token) {
    Prefs.prefs!.setString(SharedPrefsKeys.password_remember, token);
  }

  static String getRemember() {
    final String? value =
        Prefs.prefs!.getString(SharedPrefsKeys.password_remember);
    return value ?? '';
  }

  static String? setPassword(String token) {
    Prefs.prefs!.setString(SharedPrefsKeys.password, token);
  }

  static String getPassword() {
    final String? value = Prefs.prefs!.getString(SharedPrefsKeys.password);
    return value ?? '';
  }

  static String? setRole(String role) {
    Prefs.prefs!.setString(SharedPrefsKeys.role, role);
  }

  static String getRole() {
    final String? value = Prefs.prefs!.getString(SharedPrefsKeys.role);
    return value ?? '';
  }

  static String? setFirebaseToken(String firebasetoken) {
    Prefs.prefs!.setString(SharedPrefsKeys.firebasetoken, firebasetoken);
  }

  static String getFirebaseToken() {
    final String? value = Prefs.prefs!.getString(SharedPrefsKeys.firebasetoken);
    return value ?? '';
  }

  static String? setUserID(String userId) {
    Prefs.prefs!.setString(SharedPrefsKeys.userId, userId);
  }

  static String getuserID() {
    final String? value = Prefs.prefs!.getString(SharedPrefsKeys.userId);
    return value ?? '';
  }

  static String? setCompanyName(String userId) {
    Prefs.prefs!.setString(SharedPrefsKeys.company_name, userId);
  }

  static String getCompanyName() {
    final String? value = Prefs.prefs!.getString(SharedPrefsKeys.company_name);
    return value ?? '';
  }

  static String? setEmail(String email) {
    Prefs.prefs!.setString(SharedPrefsKeys.email, email);
  }

  static String getEmail() {
    final String? value = Prefs.prefs!.getString(SharedPrefsKeys.email);
    return value ?? '';
  }

  static String? setphone(String phone) {
    Prefs.prefs!.setString(SharedPrefsKeys.phone, phone);
  }

  static String getphone() {
    final String? value = Prefs.prefs!.getString(SharedPrefsKeys.phone);
    return value ?? '';
  }

  static String? setGender(String gender) {
    Prefs.prefs!.setString(SharedPrefsKeys.gender, gender);
  }

  static String getGender() {
    final String? value = Prefs.prefs!.getString(SharedPrefsKeys.gender);
    return value ?? '';
  }

  static String? setemployeeNo(String employeeNo) {
    Prefs.prefs!.setString(SharedPrefsKeys.employeeNo, employeeNo);
  }

  static String getemployeeNo() {
    final String? value = Prefs.prefs!.getString(SharedPrefsKeys.employeeNo);
    return value ?? '';
  }

  static String? setonboardingFlag(String onboardingFlag) {
    Prefs.prefs!.setString("onboardingFlag", onboardingFlag);
  }

  static String getonboardingFlag() {
    final String? value = Prefs.prefs!.getString("onboardingFlag");
    return value ?? '';
  }

  static String? setjobTitle(String jobTitle) {
    Prefs.prefs!.setString(SharedPrefsKeys.jobTitle, jobTitle);
  }

  static String getjobTitle() {
    final String? value = Prefs.prefs!.getString(SharedPrefsKeys.jobTitle);
    return value ?? '';
  }

  static String? setProfileImage(String profileimage) {
    Prefs.prefs!.setString(SharedPrefsKeys.profileimage, profileimage);
  }

  static String getProfileImage() {
    final String? value = Prefs.prefs!.getString(SharedPrefsKeys.profileimage);
    return value ?? '';
  }

  static String? setProfileImageID(String profileimageID) {
    Prefs.prefs!.setString('profileimageID', profileimageID);
  }

  static String getProfileImageID() {
    final String? value = Prefs.prefs!.getString('profileimageID');
    return value ?? '';
  }

  // onboarding personaldetails

  static String? setSalut(String salut) {
    Prefs.prefs!.setString('salut', salut);
  }

  static String getSalut() {
    final String? value = Prefs.prefs!.getString('salut');
    return value ?? '';
  }

  static String? setFirstName(String firstname) {
    Prefs.prefs!.setString(SharedPrefsKeys.firstname, firstname);
  }

  static String getFirstName() {
    final String? value = Prefs.prefs!.getString(SharedPrefsKeys.firstname);
    return value ?? '';
  }

  static String? setLastName(String lastname) {
    Prefs.prefs!.setString(SharedPrefsKeys.lastname, lastname);
  }

  static String getLastName() {
    final String? value = Prefs.prefs!.getString(SharedPrefsKeys.lastname);
    return value ?? '';
  }

  static String? setMiddleName(String middlename) {
    Prefs.prefs!.setString('middlename', middlename);
  }

  static String getMiddleName() {
    final String? value = Prefs.prefs!.getString('middlename');
    return value ?? '';
  }

  static String? setNickName(String nickname) {
    Prefs.prefs!.setString('nickname', nickname);
  }

  static String getNickName() {
    final String? value = Prefs.prefs!.getString('nickname');
    return value ?? '';
  }

  static String? setBirthday(String birthday) {
    Prefs.prefs!.setString(SharedPrefsKeys.birthday, birthday);
  }

  static String getBirthday() {
    final String? value = Prefs.prefs!.getString(SharedPrefsKeys.birthday);
    return value ?? '';
  }

  static String? setpronoun(String pronoun) {
    Prefs.prefs!.setString('pronoun', pronoun);
  }

  static String getpronoun() {
    final String? value = Prefs.prefs!.getString('pronoun');
    return value ?? '';
  }

  static String? setindigenousFlag(String indigenousFlag) {
    Prefs.prefs!.setString('indigenousFlag', indigenousFlag);
  }

  static String getindigenousFlag() {
    final String? value = Prefs.prefs!.getString('indigenousFlag');
    return value ?? '';
  }

  static String? setAddress(String address) {
    Prefs.prefs!.setString('address', address);
  }

  static String getAddress() {
    final String? value = Prefs.prefs!.getString('address');
    return value ?? '';
  }

  static String? setTypeofBusiness(String address) {
    Prefs.prefs!.setString('type_of_business', address);
  }

  static String getTypeofBusiness() {
    final String? value = Prefs.prefs!.getString('type_of_business');
    return value ?? '';
  }

  static String? setState(String State) {
    Prefs.prefs!.setString('State', State);
  }

  static String getState() {
    final String? value = Prefs.prefs!.getString('State');
    return value ?? '';
  }

  static String? setSuburb(String Suburb) {
    Prefs.prefs!.setString('Suburb', Suburb);
  }

  static String getSuburb() {
    final String? value = Prefs.prefs!.getString('Suburb');
    return value ?? '';
  }

  static String? setPincode(String Pincode) {
    Prefs.prefs!.setString('Pincode', Pincode);
  }

  static String getPincode() {
    final String? value = Prefs.prefs!.getString('Pincode');
    return value ?? '';
  }

  static String? setAddressType(String AddressType) {
    Prefs.prefs!.setString('AddressType', AddressType);
  }

  static String getAddressType() {
    final String? value = Prefs.prefs!.getString('AddressType');
    return value ?? '';
  }

  static String? setPerAddressType(String PerAddressType) {
    Prefs.prefs!.setString('PerAddressType', PerAddressType);
  }

  static String getPerAddressType() {
    final String? value = Prefs.prefs!.getString('PerAddressType');
    return value ?? '';
  }

  static String? setPerAddress(String Peraddress) {
    Prefs.prefs!.setString('Peraddress', Peraddress);
  }

  static String getPerAddress() {
    final String? value = Prefs.prefs!.getString('Peraddress');
    return value ?? '';
  }

  static String? setPerState(String PerState) {
    Prefs.prefs!.setString('PerState', PerState);
  }

  static String getPerState() {
    final String? value = Prefs.prefs!.getString('PerState');
    return value ?? '';
  }

  static String? setPerSuburb(String PerSuburb) {
    Prefs.prefs!.setString('PerSuburb', PerSuburb);
  }

  static String getPerSuburb() {
    final String? value = Prefs.prefs!.getString('PerSuburb');
    return value ?? '';
  }

  static String? setPerPincode(String PerPincode) {
    Prefs.prefs!.setString('PerPincode', PerPincode);
  }

  static String getPerPincode() {
    final String? value = Prefs.prefs!.getString('PerPincode');
    return value ?? '';
  }

  // onboarding emergency info

  static String? setRelationship(String Relationship) {
    Prefs.prefs!.setString('Relationship', Relationship);
  }

  static String getRelationship() {
    final String? value = Prefs.prefs!.getString('Relationship');
    return value ?? '';
  }

  static String? setEmergencSalut(String EmergencSalut) {
    Prefs.prefs!.setString('EmergencSalut', EmergencSalut);
  }

  static String getEmergencSalut() {
    final String? value = Prefs.prefs!.getString('EmergencSalut');
    return value ?? '';
  }

  static String? setEmergencFirstName(String EmergencFirstName) {
    Prefs.prefs!.setString('EmergencFirstName', EmergencFirstName);
  }

  static String getEmergencFirstName() {
    final String? value = Prefs.prefs!.getString('EmergencFirstName');
    return value ?? '';
  }

  static String? setEmergencLastName(String EmergencLastName) {
    Prefs.prefs!.setString('EmergencLastName', EmergencLastName);
  }

  static String getEmergencLastName() {
    final String? value = Prefs.prefs!.getString('EmergencLastName');
    return value ?? '';
  }

  static String? setEmergencMiddleName(String EmergencMiddleName) {
    Prefs.prefs!.setString('EmergencMiddleName', EmergencMiddleName);
  }

  static String getEmergencMiddleName() {
    final String? value = Prefs.prefs!.getString('EmergencMiddleName');
    return value ?? '';
  }

  static String? setEmergencyEmail(String EmergencyEmail) {
    Prefs.prefs!.setString('EmergencyEmail', EmergencyEmail);
  }

  static String getEmergencyEmail() {
    final String? value = Prefs.prefs!.getString('EmergencyEmail');
    return value ?? '';
  }

  static String? setEmergencyMobile(String EmergencyMobile) {
    Prefs.prefs!.setString('EmergencyMobile', EmergencyMobile);
  }

  static String getEmergencyMobile() {
    final String? value = Prefs.prefs!.getString('EmergencyMobile');
    return value ?? '';
  }

  static String? setEmergencyAddress(String EmergencyAddress) {
    Prefs.prefs!.setString('EmergencyAddress', EmergencyAddress);
  }

  static String getEmergencyAddress() {
    final String? value = Prefs.prefs!.getString('EmergencyAddress');
    return value ?? '';
  }

  static String? setEmergencyState(String EmergencyState) {
    Prefs.prefs!.setString('EmergencyState', EmergencyState);
  }

  static String getEmergencyState() {
    final String? value = Prefs.prefs!.getString('EmergencyState');
    return value ?? '';
  }

  static String? setEmergencySuburb(String EmergencySuburb) {
    Prefs.prefs!.setString('EmergencySuburb', EmergencySuburb);
  }

  static String getEmergencySuburb() {
    final String? value = Prefs.prefs!.getString('EmergencySuburb');
    return value ?? '';
  }

  static String? setEmergencyPinCode(String EmergencyPinCode) {
    Prefs.prefs!.setString('EmergencyPinCode', EmergencyPinCode);
  }

  static String getEmergencyPinCode() {
    final String? value = Prefs.prefs!.getString('EmergencyPinCode');
    return value ?? '';
  }

  // onboarding license info

  static String? setLicenseFront(String LicenseFront) {
    Prefs.prefs!.setString('LicenseFront', LicenseFront);
  }

  static String getLicenseFront() {
    final String? value = Prefs.prefs!.getString('LicenseFront');
    return value ?? '';
  }

  static String? setLicenseBack(String LicenseBack) {
    Prefs.prefs!.setString('LicenseBack', LicenseBack);
  }

  static String getLicenseBack() {
    final String? value = Prefs.prefs!.getString('LicenseBack');
    return value ?? '';
  }

  static String? setLicenseNumber(String LicenseNumber) {
    Prefs.prefs!.setString('LicenseNumber', LicenseNumber);
  }

  static String getLicenseNumber() {
    final String? value = Prefs.prefs!.getString('LicenseNumber');
    return value ?? '';
  }

  static String? setLicenseIssuedIN(String LicenseIssuedIN) {
    Prefs.prefs!.setString('LicenseIssuedIN', LicenseIssuedIN);
  }

  static String getLicenseIssuedIN() {
    final String? value = Prefs.prefs!.getString('LicenseIssuedIN');
    return value ?? '';
  }

  static String? setLicenseExpiry(String LicenseExpiry) {
    Prefs.prefs!.setString('LicenseExpiry', LicenseExpiry);
  }

  static String getLicenseExpiry() {
    final String? value = Prefs.prefs!.getString('LicenseExpiry');
    return value ?? '';
  }

  static String? setdeclarationStatus(String declarationStatus) {
    Prefs.prefs!.setString('declarationStatus', declarationStatus);
  }

  static String getdeclarationStatus() {
    final String? value = Prefs.prefs!.getString('declarationStatus');
    return value ?? '';
  }

  static String? setsignatureImageId(String signatureImageId) {
    Prefs.prefs!.setString('signatureImageId', signatureImageId);
  }

  static String getsignatureImageId() {
    final String? value = Prefs.prefs!.getString('signatureImageId');
    return value ?? '';
  }

  static String? setsignatureImageURL(String signatureImageURL) {
    Prefs.prefs!.setString('signatureImageURL', signatureImageURL);
  }

  static String getsignatureImageURL() {
    final String? value = Prefs.prefs!.getString('signatureImageURL');
    return value ?? '';
  }

  // onboarding bank details

  static String? setAccountholderName(String AccountholderName) {
    Prefs.prefs!.setString('AccountholderName', AccountholderName);
  }

  static String getAccountholderName() {
    final String? value = Prefs.prefs!.getString('AccountholderName');
    return value ?? '';
  }

  static String? setAccountNumber(String AccountNumber) {
    Prefs.prefs!.setString('AccountNumber', AccountNumber);
  }

  static String getAccountNumber() {
    final String? value = Prefs.prefs!.getString('AccountNumber');
    return value ?? '';
  }

  static String? setBankName(String BankName) {
    Prefs.prefs!.setString('BankName', BankName);
  }

  static String getBankName() {
    final String? value = Prefs.prefs!.getString('BankName');
    return value ?? '';
  }

  static String? setBsbNumber(String BsbNumber) {
    Prefs.prefs!.setString('BsbNumber', BsbNumber);
  }

  static String getBsbNumber() {
    final String? value = Prefs.prefs!.getString('BsbNumber');
    return value ?? '';
  }

  static String? setsecondaryAccount(String secondaryAccount) {
    Prefs.prefs!.setString('secondaryAccount', secondaryAccount);
  }

  static String getsecondaryAccount() {
    final String? value = Prefs.prefs!.getString('secondaryAccount');
    return value ?? '';
  }

  static String? setpayslipByEmail(String payslipByEmail) {
    Prefs.prefs!.setString('payslipByEmail', payslipByEmail);
  }

  static String getpayslipByEmail() {
    final String? value = Prefs.prefs!.getString('payslipByEmail');
    return value ?? '';
  }

  static String? setFixedAmount(String FixedAmount) {
    Prefs.prefs!.setString('FixedAmount', FixedAmount);
  }

  static String getFixedAmount() {
    final String? value = Prefs.prefs!.getString('FixedAmount');
    return value ?? '';
  }

  static String? setSecondryAccountHolderName(
      String SecondryAccountHolderName) {
    Prefs.prefs!
        .setString('SecondryAccountHolderName', SecondryAccountHolderName);
  }

  static String getSecondryAccountHolderName() {
    final String? value = Prefs.prefs!.getString('SecondryAccountHolderName');
    return value ?? '';
  }

  static String? setSecondryAccountNumber(String SecondryAccountNumber) {
    Prefs.prefs!.setString('SecondryAccountNumber', SecondryAccountNumber);
  }

  static String getSecondryAccountNumber() {
    final String? value = Prefs.prefs!.getString('SecondryAccountNumber');
    return value ?? '';
  }

  static String? setSecondryBankName(String SecondryBankName) {
    Prefs.prefs!.setString('SecondryBankName', SecondryBankName);
  }

  static String getSecondryBankName() {
    final String? value = Prefs.prefs!.getString('SecondryBankName');
    return value ?? '';
  }

  static String? setSecondryBsbNumber(String SecondryBsbNumber) {
    Prefs.prefs!.setString('SecondryBsbNumber', SecondryBsbNumber);
  }

  static String getSecondryBsbNumber() {
    final String? value = Prefs.prefs!.getString('SecondryBsbNumber');
    return value ?? '';
  }

  //onboarding TFN details

  static String? settaxPayerType(String taxPayerType) {
    Prefs.prefs!.setString('taxPayerType', taxPayerType);
  }

  static String gettaxPayerType() {
    final String? value = Prefs.prefs!.getString('taxPayerType');
    return value ?? '';
  }

  static String? settncAcceptance(String tncAcceptance) {
    Prefs.prefs!.setString('tncAcceptance', tncAcceptance);
  }

  static String gettncAcceptance() {
    final String? value = Prefs.prefs!.getString('tncAcceptance');
    return value ?? '';
  }

  static String? setTFNNumber(String TFNNumber) {
    Prefs.prefs!.setString('TFNNumber', TFNNumber);
  }

  static String getTFNNumber() {
    final String? value = Prefs.prefs!.getString('TFNNumber');
    return value ?? '';
  }

  static String? sethaveTFN(String haveTFN) {
    Prefs.prefs!.setString('haveTFN', haveTFN);
  }

  static String gethaveTFN() {
    final String? value = Prefs.prefs!.getString('haveTFN');
    return value ?? '';
  }

  static String? setclaimTaxfreeThreshold(String claimTaxfreeThreshold) {
    Prefs.prefs!.setString('claimTaxfreeThreshold', claimTaxfreeThreshold);
  }

  static String getclaimTaxfreeThreshold() {
    final String? value = Prefs.prefs!.getString('claimTaxfreeThreshold');
    return value ?? '';
  }

  static String? sethaveanyDebt(String haveanyDebt) {
    Prefs.prefs!.setString('haveanyDebt', haveanyDebt);
  }

  static String gethaveanyDebt() {
    final String? value = Prefs.prefs!.getString('haveanyDebt');
    return value ?? '';
  }

  // onboarding superannuation info

  static String? setfillSuperFundNow(String fillSuperFundNow) {
    Prefs.prefs!.setString('fillSuperFundNow', fillSuperFundNow);
  }

  static String getfillSuperFundNow() {
    final String? value = Prefs.prefs!.getString('fillSuperFundNow');
    return value ?? '';
  }

  static String? setSupersignatureId(String SupersignatureId) {
    Prefs.prefs!.setString('SupersignatureId', SupersignatureId);
  }

  static String getSupersignatureId() {
    final String? value = Prefs.prefs!.getString('SupersignatureId');
    return value ?? '';
  }

  static String? setSupersignatureURL(String SupersignatureURL) {
    Prefs.prefs!.setString('SupersignatureURL', SupersignatureURL);
  }

  static String getSupersignatureURL() {
    final String? value = Prefs.prefs!.getString('SupersignatureURL');
    return value ?? '';
  }

  static String? setSuperpaidAsperMychoice(String SuperpaidAsperMychoice) {
    Prefs.prefs!.setString('SuperpaidAsperMychoice', SuperpaidAsperMychoice);
  }

  static String getSuperpaidAsperMychoice() {
    final String? value = Prefs.prefs!.getString('SuperpaidAsperMychoice');
    return value ?? '';
  }

  static String? setSuperc_abn(String Superc_abn) {
    Prefs.prefs!.setString('Superc_abn', Superc_abn);
  }

  static String getSuperc_abn() {
    final String? value = Prefs.prefs!.getString('Superc_abn');
    return value ?? '';
  }

  static String? setSuperc_fundName(String Superc_fundName) {
    Prefs.prefs!.setString('Superc_fundName', Superc_fundName);
  }

  static String getSuperc_fundName() {
    final String? value = Prefs.prefs!.getString('Superc_fundName');
    return value ?? '';
  }

  static String? setSuperc_address(String Superc_address) {
    Prefs.prefs!.setString('Superc_address', Superc_address);
  }

  static String getSuperc_address() {
    final String? value = Prefs.prefs!.getString('Superc_address');
    return value ?? '';
  }

  static String? setSuperc_suburb(String Superc_suburb) {
    Prefs.prefs!.setString('Superc_suburb', Superc_suburb);
  }

  static String getSuperc_suburb() {
    final String? value = Prefs.prefs!.getString('Superc_suburb');
    return value ?? '';
  }

  static String? setSuperc_state(String Superc_state) {
    Prefs.prefs!.setString('Superc_state', Superc_state);
  }

  static String getSuperc_state() {
    final String? value = Prefs.prefs!.getString('Superc_state');
    return value ?? '';
  }

  static String? setSuperc_postCode(String Superc_postCode) {
    Prefs.prefs!.setString('Superc_postCode', Superc_postCode);
  }

  static String getSuperc_postCode() {
    final String? value = Prefs.prefs!.getString('Superc_postCode');
    return value ?? '';
  }

  static String? setSuperc_fundPhone(String Superc_fundPhone) {
    Prefs.prefs!.setString('Superc_fundPhone', Superc_fundPhone);
  }

  static String getSuperc_fundPhone() {
    final String? value = Prefs.prefs!.getString('Superc_fundPhone');
    return value ?? '';
  }

  static String? setSuperc_usi(String Superc_usi) {
    Prefs.prefs!.setString('Superc_usi', Superc_usi);
  }

  static String getSuperc_usi() {
    final String? value = Prefs.prefs!.getString('Superc_usi');
    return value ?? '';
  }

  static String? setSuperc_accountName(String c_accountName) {
    Prefs.prefs!.setString('c_accountName', c_accountName);
  }

  static String getSuperc_accountName() {
    final String? value = Prefs.prefs!.getString('c_accountName');
    return value ?? '';
  }

  static String? setSuperc_membername(String c_membername) {
    Prefs.prefs!.setString('c_membername', c_membername);
  }

  static String getSuperc_membername() {
    final String? value = Prefs.prefs!.getString('c_membername');
    return value ?? '';
  }

  static String? setSuperc_attachmentId(String c_attachmentId) {
    Prefs.prefs!.setString('c_attachmentId', c_attachmentId);
  }

  static String getSuperc_attachmentId() {
    final String? value = Prefs.prefs!.getString('c_attachmentId');
    return value ?? '';
  }

  static String? setSuperc_attachmentURL(String c_attachmentURL) {
    Prefs.prefs!.setString('c_attachmentURL', c_attachmentURL);
  }

  static String getSuperc_attachmentURL() {
    final String? value = Prefs.prefs!.getString('c_attachmentURL');
    return value ?? '';
  }

  static String? setSupers_tncAcceptance(String s_tncAcceptance) {
    Prefs.prefs!.setString('s_tncAcceptance', s_tncAcceptance);
  }

  static String getSupers_tncAcceptance() {
    final String? value = Prefs.prefs!.getString('s_tncAcceptance');
    return value ?? '';
  }

  static String? setSupers_accountNumber(String s_accountNumber) {
    Prefs.prefs!.setString('s_accountNumber', s_accountNumber);
  }

  static String getSupers_accountNumber() {
    final String? value = Prefs.prefs!.getString('s_accountNumber');
    return value ?? '';
  }

  static String? setSupers_attachmentId(String s_attachmentId) {
    Prefs.prefs!.setString('s_attachmentId', s_attachmentId);
  }

  static String getSupers_attachmentId() {
    final String? value = Prefs.prefs!.getString('s_attachmentId');
    return value ?? '';
  }

  static String? setSupers_abn(String Supers_abn) {
    Prefs.prefs!.setString('Supers_abn', Supers_abn);
  }

  static String getSupers_abn() {
    final String? value = Prefs.prefs!.getString('Supers_abn');
    return value ?? '';
  }

  static String? setSupers_address(String Supers_address) {
    Prefs.prefs!.setString('Supers_address', Supers_address);
  }

  static String getSupers_address() {
    final String? value = Prefs.prefs!.getString('Supers_address');
    return value ?? '';
  }

  static String? setSupers_attachmentURL(String Supers_attachmentURL) {
    Prefs.prefs!.setString('Supers_attachmentURL', Supers_attachmentURL);
  }

  static String getSupers_attachmentURL() {
    final String? value = Prefs.prefs!.getString('Supers_attachmentURL');
    return value ?? '';
  }

  static String? setSupers_bsbCode(String s_bsbCode) {
    Prefs.prefs!.setString('s_bsbCode', s_bsbCode);
  }

  static String getSupers_bsbCode() {
    final String? value = Prefs.prefs!.getString('s_bsbCode');
    return value ?? '';
  }

  static String? setSupers_esa(String s_esa) {
    Prefs.prefs!.setString('s_esa', s_esa);
  }

  static String getSupers_esa() {
    final String? value = Prefs.prefs!.getString('s_esa');
    return value ?? '';
  }

  static String? setSupers_fundName(String s_fundName) {
    Prefs.prefs!.setString('s_fundName', s_fundName);
  }

  static String getSupers_fundName() {
    final String? value = Prefs.prefs!.getString('s_fundName');
    return value ?? '';
  }

  static String? setSupers_fundPhone(String s_fundPhone) {
    Prefs.prefs!.setString('s_fundPhone', s_fundPhone);
  }

  static String getSupers_fundPhone() {
    final String? value = Prefs.prefs!.getString('s_fundPhone');
    return value ?? '';
  }

  static String? setSupers_postCode(String s_postCode) {
    Prefs.prefs!.setString('s_postCode', s_postCode);
  }

  static String getSupers_postCode() {
    final String? value = Prefs.prefs!.getString('s_postCode');
    return value ?? '';
  }

  static String? setSupers_state(String s_state) {
    Prefs.prefs!.setString('s_state', s_state);
  }

  static String getSupers_state() {
    final String? value = Prefs.prefs!.getString('s_state');
    return value ?? '';
  }

  static String? setSupers_suburb(String s_suburb) {
    Prefs.prefs!.setString('s_suburb', s_suburb);
  }

  static String getSupers_suburb() {
    final String? value = Prefs.prefs!.getString('s_suburb');
    return value ?? '';
  }



  // onboarding membership

  static String? setlongServiceLeaveScheme(String longServiceLeaveScheme) {
    Prefs.prefs!.setString('longServiceLeaveScheme', longServiceLeaveScheme);
  }

  static String getlongServiceLeaveScheme() {
    final String? value = Prefs.prefs!.getString('longServiceLeaveScheme');
    return value ?? '';
  }


  static String? setredundancyScheme(String redundancyScheme) {
    Prefs.prefs!.setString('redundancyScheme', redundancyScheme);
  }

  static String getredundancyScheme() {
    final String? value = Prefs.prefs!.getString('redundancyScheme');
    return value ?? '';
  }

  static String? setlongServiceSchemeMemberShipNo(String longServiceSchemeMemberShipNo) {
    Prefs.prefs!.setString('longServiceSchemeMemberShipNo', longServiceSchemeMemberShipNo);
  }

  static String getlongServiceSchemeMemberShipNo() {
    final String? value = Prefs.prefs!.getString('longServiceSchemeMemberShipNo');
    return value ?? '';
  }

  static String? setlongServiceSchemeName(String longServiceSchemeName) {
    Prefs.prefs!.setString('longServiceSchemeName', longServiceSchemeName);
  }

  static String getlongServiceSchemeName() {
    final String? value = Prefs.prefs!.getString('longServiceSchemeName');
    return value ?? '';
  }

  static String? setredundancySchemeName(String redundancySchemeName) {
    Prefs.prefs!.setString('redundancySchemeName', redundancySchemeName);
  }

  static String getredundancySchemeName() {
    final String? value = Prefs.prefs!.getString('redundancySchemeName');
    return value ?? '';
  }


  static String? setredundancySchemeMemberShipNo(String redundancySchemeMemberShipNo) {
    Prefs.prefs!.setString('redundancySchemeMemberShipNo', redundancySchemeMemberShipNo);
  }

  static String getredundancySchemeMemberShipNo() {
    final String? value = Prefs.prefs!.getString('redundancySchemeMemberShipNo');
    return value ?? '';
  }


  static String? setlicenceImageId(String licenceImageId) {
    Prefs.prefs!.setString('licenceImageId', licenceImageId);
  }

  static String getlicenceImageId() {
    final String? value = Prefs.prefs!.getString('licenceImageId');
    return value ?? '';
  }

  static String? setlicenceImageURL(String licenceImageURL) {
    Prefs.prefs!.setString('licenceImageURL', licenceImageURL);
  }

  static String getlicenceImageURL() {
    final String? value = Prefs.prefs!.getString('licenceImageURL');
    return value ?? '';
  }


  static String? setlicenceBackImageId(String licenceBackImageId) {
    Prefs.prefs!.setString('licenceBackImageId', licenceBackImageId);
  }

  static String getlicenceBackImageId() {
    final String? value = Prefs.prefs!.getString('licenceBackImageId');
    return value ?? '';
  }



  static String? setlicenceBackImageURL(String licenceBackImageURL) {
    Prefs.prefs!.setString('licenceBackImageURL', licenceBackImageURL);
  }

  static String getlicenceBackImageURL() {
    final String? value = Prefs.prefs!.getString('licenceBackImageURL');
    return value ?? '';
  }




  static String? logout() {
    Prefs.prefs!.clear();
  }
}
