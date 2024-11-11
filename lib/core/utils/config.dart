
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dot_env;


abstract class Config {
  static Future<void> loadEnv() async {
    const String env = String.fromEnvironment('app.env');
    debugPrint(env);
    const envFile = 'env/$env.env';
    await dot_env.load(fileName: envFile);
  }
}
