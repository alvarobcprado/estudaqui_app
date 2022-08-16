import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Loads the environment variables from the .env file.
abstract class EnvConfig {
  static String twitterApiKey = dotenv.get('TWITTER_API_KEY');
  static String twitterApiSecret = dotenv.get('TWITTER_API_SECRET');
}
