import 'package:logging/logging.dart';
import 'package:http/http.dart' as http;

class LoggingService {
  final Logger _logger = Logger('CalculaThor');

  LoggingService() {
    // Setting up Logger
    Logger.root.level = Level.INFO;
    /*
      Uncomment to print the log to the console
      
      Logger.root.onRecord.listen((LogRecord record) => print("[CALCULATHOR] ${record.level.name}: ${record.time} ${record.message}"));
    */
    Logger.root.onRecord.listen((LogRecord record) => _sendToLogstash(record));
  }

  void _sendToLogstash(LogRecord record) async {
    final logstashURI =
        Uri.https('calculathor-logstash-wvxbmc25wq-el.a.run.app', '/');
    final logString =
        "[CALCULATHOR] ${record.level.name}: ${record.time} ${record.message}";
    print(logString);
    try {
      var response = await http.post(logstashURI, body: logString);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    } catch (e) {
      print(e.toString());
    }
  }

  void log(String computationFunction, String variableX, String variableY,
      String answer) {
    String logMessage;

    logMessage = "$computationFunction($variableX,";
    if (variableY != null) logMessage += variableY;
    logMessage += ")=$answer";

    _logger.info(logMessage);
  }
}
