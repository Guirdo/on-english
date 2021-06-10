import 'package:flutter/material.dart';
import 'package:on_english/src/home_page.dart';
import 'package:on_english/src/pages/activities/complete_sentence_page.dart';
import 'package:on_english/src/pages/record_page.dart';
import 'package:on_english/src/pages/register_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/'                   : (BuildContext context) => HomePage(),
    'record'              : (BuildContext context) => RecordPage(),
    'mates'               : (BuildContext context) => RegisterPage(),
    'dictionary'          : (BuildContext context) => CompleteSentencePage(),
  };
}