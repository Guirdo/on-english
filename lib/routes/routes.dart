import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:on_english/pages/profile_page.dart';
import 'package:on_english/pages/record_page.dart';
import 'package:on_english/pages/register_page.dart';
import 'package:on_english/pages/activities/complete_sentence_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'record'              : (BuildContext context) => RecordPage(),
    'mates'               : (BuildContext context) => RegisterPage(),
    'dictionary'          : (BuildContext context) => CompleteSentencePage(),
    'profile'             : (BuildContext context) => ProfilePage(),
  };
}
