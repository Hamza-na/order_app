// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Crave It? Order It!`
  String get on_boarding_title_page_one {
    return Intl.message(
      'Crave It? Order It!',
      name: 'on_boarding_title_page_one',
      desc: '',
      args: [],
    );
  }

  /// `Track Your Meal’s Journey`
  String get on_boarding_title_page_two {
    return Intl.message(
      'Track Your Meal’s Journey',
      name: 'on_boarding_title_page_two',
      desc: '',
      args: [],
    );
  }

  /// `Exclusive Deals for Foodies`
  String get on_boarding_title_page_three {
    return Intl.message(
      'Exclusive Deals for Foodies',
      name: 'on_boarding_title_page_three',
      desc: '',
      args: [],
    );
  }

  /// `Explore a wide range of cuisines and restaurants at your fingertips. Satisfy your cravings anytime!`
  String get on_boarding_sub_title_page_one {
    return Intl.message(
      'Explore a wide range of cuisines and restaurants at your fingertips. Satisfy your cravings anytime!',
      name: 'on_boarding_sub_title_page_one',
      desc: '',
      args: [],
    );
  }

  /// `From kitchen to your doorstep, follow your meal in real-time. Fresh and fast, every time.`
  String get on_boarding_sub_title_page_two {
    return Intl.message(
      'From kitchen to your doorstep, follow your meal in real-time. Fresh and fast, every time.',
      name: 'on_boarding_sub_title_page_two',
      desc: '',
      args: [],
    );
  }

  /// `Enjoy discounts, offers, and rewards on your favorite meals. Deliciousness made affordable!`
  String get on_boarding_sub_title_page_three {
    return Intl.message(
      'Enjoy discounts, offers, and rewards on your favorite meals. Deliciousness made affordable!',
      name: 'on_boarding_sub_title_page_three',
      desc: '',
      args: [],
    );
  }

  /// `Login to your account`
  String get title_login_screen {
    return Intl.message(
      'Login to your account',
      name: 'title_login_screen',
      desc: '',
      args: [],
    );
  }

  /// `Phone :`
  String get phone {
    return Intl.message(
      'Phone :',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `PhoneConfiramtion`
  String get phone_confiramtion {
    return Intl.message(
      'PhoneConfiramtion',
      name: 'phone_confiramtion',
      desc: '',
      args: [],
    );
  }

  /// `phone must be 10 number`
  String get phone_condition_count_number {
    return Intl.message(
      'phone must be 10 number',
      name: 'phone_condition_count_number',
      desc: '',
      args: [],
    );
  }

  /// `Input must contain only numbers`
  String get phone_condition_number {
    return Intl.message(
      'Input must contain only numbers',
      name: 'phone_condition_number',
      desc: '',
      args: [],
    );
  }

  /// `phone not match`
  String get phone_confirmation_condition {
    return Intl.message(
      'phone not match',
      name: 'phone_confirmation_condition',
      desc: '',
      args: [],
    );
  }

  /// `LOGIN`
  String get login {
    return Intl.message(
      'LOGIN',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dont_have_account {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dont_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Register here`
  String get register_here {
    return Intl.message(
      'Register here',
      name: 'register_here',
      desc: '',
      args: [],
    );
  }

  /// `Create New Account`
  String get create_new_account {
    return Intl.message(
      'Create New Account',
      name: 'create_new_account',
      desc: '',
      args: [],
    );
  }

  /// `value cannot be empty`
  String get validate_null {
    return Intl.message(
      'value cannot be empty',
      name: 'validate_null',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get title_register_screen {
    return Intl.message(
      '',
      name: 'title_register_screen',
      desc: '',
      args: [],
    );
  }

  /// `Name :`
  String get name {
    return Intl.message(
      'Name :',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `name must me between 3 and 20 char`
  String get name_condition {
    return Intl.message(
      'name must me between 3 and 20 char',
      name: 'name_condition',
      desc: '',
      args: [],
    );
  }

  /// `Location :`
  String get loacation {
    return Intl.message(
      'Location :',
      name: 'loacation',
      desc: '',
      args: [],
    );
  }

  /// `Field must be between 3 and 200 characters`
  String get loacation_condition {
    return Intl.message(
      'Field must be between 3 and 200 characters',
      name: 'loacation_condition',
      desc: '',
      args: [],
    );
  }

  /// `Upload Your Image :`
  String get upload_your_image {
    return Intl.message(
      'Upload Your Image :',
      name: 'upload_your_image',
      desc: '',
      args: [],
    );
  }

  /// `REGISTER`
  String get regisger {
    return Intl.message(
      'REGISTER',
      name: 'regisger',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get already_have_account {
    return Intl.message(
      'Already have an account?',
      name: 'already_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Login here`
  String get login_here {
    return Intl.message(
      'Login here',
      name: 'login_here',
      desc: '',
      args: [],
    );
  }

  /// `Search resturant...`
  String get search_hint_home_screen {
    return Intl.message(
      'Search resturant...',
      name: 'search_hint_home_screen',
      desc: '',
      args: [],
    );
  }

  /// `Search for food...`
  String get search_hint_product_screen {
    return Intl.message(
      'Search for food...',
      name: 'search_hint_product_screen',
      desc: '',
      args: [],
    );
  }

  /// `Discover Amazing Restaurants!`
  String get container_text_home_screen {
    return Intl.message(
      'Discover Amazing Restaurants!',
      name: 'container_text_home_screen',
      desc: '',
      args: [],
    );
  }

  /// `App Name`
  String get app_name {
    return Intl.message(
      'App Name',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Products Screen`
  String get app_bar_products_screen {
    return Intl.message(
      'Products Screen',
      name: 'app_bar_products_screen',
      desc: '',
      args: [],
    );
  }

  /// `Product Details`
  String get app_bar_products_details_screen {
    return Intl.message(
      'Product Details',
      name: 'app_bar_products_details_screen',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `15 min`
  String get time {
    return Intl.message(
      '15 min',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `4.5 Rating`
  String get rating {
    return Intl.message(
      '4.5 Rating',
      name: 'rating',
      desc: '',
      args: [],
    );
  }

  /// `Show Cart`
  String get show_cart {
    return Intl.message(
      'Show Cart',
      name: 'show_cart',
      desc: '',
      args: [],
    );
  }

  /// `Chckout`
  String get check_out {
    return Intl.message(
      'Chckout',
      name: 'check_out',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `delivery Cost:`
  String get delivery_cost {
    return Intl.message(
      'delivery Cost:',
      name: 'delivery_cost',
      desc: '',
      args: [],
    );
  }

  /// `Delivary Time:`
  String get delivery_time {
    return Intl.message(
      'Delivary Time:',
      name: 'delivery_time',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Order`
  String get order {
    return Intl.message(
      'Order',
      name: 'order',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `No address selected`
  String get no_address_selected {
    return Intl.message(
      'No address selected',
      name: 'no_address_selected',
      desc: '',
      args: [],
    );
  }

  /// `change`
  String get change {
    return Intl.message(
      'change',
      name: 'change',
      desc: '',
      args: [],
    );
  }

  /// `Edit Address`
  String get edit_address {
    return Intl.message(
      'Edit Address',
      name: 'edit_address',
      desc: '',
      args: [],
    );
  }

  /// `locatinName`
  String get location_name {
    return Intl.message(
      'locatinName',
      name: 'location_name',
      desc: '',
      args: [],
    );
  }

  /// `example: Home, Work , Gym ,School, ex`
  String get location_name_hint {
    return Intl.message(
      'example: Home, Work , Gym ,School, ex',
      name: 'location_name_hint',
      desc: '',
      args: [],
    );
  }

  /// `town`
  String get town_name {
    return Intl.message(
      'town',
      name: 'town_name',
      desc: '',
      args: [],
    );
  }

  /// `Midan Town`
  String get town_hint {
    return Intl.message(
      'Midan Town',
      name: 'town_hint',
      desc: '',
      args: [],
    );
  }

  /// `Street`
  String get street {
    return Intl.message(
      'Street',
      name: 'street',
      desc: '',
      args: [],
    );
  }

  /// `Address Details`
  String get address_details {
    return Intl.message(
      'Address Details',
      name: 'address_details',
      desc: '',
      args: [],
    );
  }

  /// `example: first Build, second floor....`
  String get address_detail_hint {
    return Intl.message(
      'example: first Build, second floor....',
      name: 'address_detail_hint',
      desc: '',
      args: [],
    );
  }

  /// `Waiting`
  String get waiting_for_response {
    return Intl.message(
      'Waiting',
      name: 'waiting_for_response',
      desc: '',
      args: [],
    );
  }

  /// `In Way`
  String get in_way {
    return Intl.message(
      'In Way',
      name: 'in_way',
      desc: '',
      args: [],
    );
  }

  /// `Delivered`
  String get delivered {
    return Intl.message(
      'Delivered',
      name: 'delivered',
      desc: '',
      args: [],
    );
  }

  /// `preparing`
  String get period_of_editing {
    return Intl.message(
      'preparing',
      name: 'period_of_editing',
      desc: '',
      args: [],
    );
  }

  /// `Order Status`
  String get order_status {
    return Intl.message(
      'Order Status',
      name: 'order_status',
      desc: '',
      args: [],
    );
  }

  /// `Order Details`
  String get order_details {
    return Intl.message(
      'Order Details',
      name: 'order_details',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get quantity {
    return Intl.message(
      'Quantity',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `Total Price`
  String get total_price {
    return Intl.message(
      'Total Price',
      name: 'total_price',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get my_orders {
    return Intl.message(
      'My Orders',
      name: 'my_orders',
      desc: '',
      args: [],
    );
  }

  /// `profile`
  String get profile {
    return Intl.message(
      'profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get edit_profile {
    return Intl.message(
      'Edit Profile',
      name: 'edit_profile',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get select_Language {
    return Intl.message(
      'Select Language',
      name: 'select_Language',
      desc: '',
      args: [],
    );
  }

  /// `cancel`
  String get cancel {
    return Intl.message(
      'cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `No changes to update`
  String get no_change {
    return Intl.message(
      'No changes to update',
      name: 'no_change',
      desc: '',
      args: [],
    );
  }

  /// `LogOut`
  String get log_out {
    return Intl.message(
      'LogOut',
      name: 'log_out',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Likes`
  String get likes {
    return Intl.message(
      'Likes',
      name: 'likes',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Available Qauntity`
  String get available_quantity {
    return Intl.message(
      'Available Qauntity',
      name: 'available_quantity',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
