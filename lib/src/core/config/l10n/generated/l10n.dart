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

  /// `Un-Expected Error`
  String get handle_error_status_connect_time_out {
    return Intl.message(
      'Un-Expected Error',
      name: 'handle_error_status_connect_time_out',
      desc: '',
      args: [],
    );
  }

  /// `The server connection was unexpectedly lost`
  String get handle_error_message_connect_time_out {
    return Intl.message(
      'The server connection was unexpectedly lost',
      name: 'handle_error_message_connect_time_out',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Request`
  String get handle_error_status_cancel {
    return Intl.message(
      'Cancel Request',
      name: 'handle_error_status_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Canceled Request`
  String get handle_error_message_cancel {
    return Intl.message(
      'Canceled Request',
      name: 'handle_error_message_cancel',
      desc: '',
      args: [],
    );
  }

  /// `3agel`
  String get app_bar_title {
    return Intl.message(
      '3agel',
      name: 'app_bar_title',
      desc: '',
      args: [],
    );
  }

  /// `No More Data!`
  String get no_more_data_state {
    return Intl.message(
      'No More Data!',
      name: 'no_more_data_state',
      desc: '',
      args: [],
    );
  }

  /// `Source:`
  String get category_item_source {
    return Intl.message(
      'Source:',
      name: 'category_item_source',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get setting_page_language {
    return Intl.message(
      'Language',
      name: 'setting_page_language',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get setting_page_theme {
    return Intl.message(
      'Theme',
      name: 'setting_page_theme',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get setting_page_light_theme {
    return Intl.message(
      'Light',
      name: 'setting_page_light_theme',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get setting_page_dark_theme {
    return Intl.message(
      'Dark',
      name: 'setting_page_dark_theme',
      desc: '',
      args: [],
    );
  }

  /// `Business`
  String get api_section_business {
    return Intl.message(
      'Business',
      name: 'api_section_business',
      desc: '',
      args: [],
    );
  }

  /// `Entertainment`
  String get api_section_entertainment {
    return Intl.message(
      'Entertainment',
      name: 'api_section_entertainment',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get api_section_general {
    return Intl.message(
      'General',
      name: 'api_section_general',
      desc: '',
      args: [],
    );
  }

  /// `Health`
  String get api_section_health {
    return Intl.message(
      'Health',
      name: 'api_section_health',
      desc: '',
      args: [],
    );
  }

  /// `Science`
  String get api_section_science {
    return Intl.message(
      'Science',
      name: 'api_section_science',
      desc: '',
      args: [],
    );
  }

  /// `Sports`
  String get api_section_sports {
    return Intl.message(
      'Sports',
      name: 'api_section_sports',
      desc: '',
      args: [],
    );
  }

  /// `Technology`
  String get api_section_technology {
    return Intl.message(
      'Technology',
      name: 'api_section_technology',
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
      Locale.fromSubtags(languageCode: 'ar', countryCode: 'EG'),
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
