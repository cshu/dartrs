import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';
import 'package:async/async.dart';
import 'package:collection/collection.dart';
import 'package:convert/convert.dart';
import 'package:path/path.dart' as path;
import 'package:typed_data/typed_data.dart';
import 'package:dfrs/dfrs.dart';


String getFirstLineFromFile(String filenm) {
  //if(!FileSystemEntity.isFileSync(filenm)){
  //	throw CommonException(filenm+' is not found. Unable to proceed.');
  //}
  var lines = File(filenm).readAsLinesSync();
  if (0 == lines.length) {
    throw CommonException(
        filenm + ' does not contain anything. Unable to proceed.');
  }
  return lines[0];
}

String getNonEmptyFirstLineFromFile(String filenm) {
  var retval = getFirstLineFromFile(filenm);
  if (0 == retval.length) {
    throw CommonException(
        filenm + ' contains an empty first line. Unable to proceed.');
  }
  return retval;
}

String? getHomeDir() {
  if (Platform.isWindows) {
    return Platform.environment['USERPROFILE'];
  } else {
    return Platform.environment['HOME'];
  }
}

