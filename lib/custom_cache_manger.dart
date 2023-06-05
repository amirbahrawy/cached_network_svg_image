import 'dart:collection';
import 'dart:io';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';

/// The DefaultCacheManager that can be easily used directly. The code of
/// this implementation can be used as inspiration for more complex cache
/// managers.

class CustomCacheManager extends CacheManager with ImageCacheManager {
  static const key = 'libCachedImageData';
  static final cache = HashMap<String, File>();

  static final CustomCacheManager _instance = CustomCacheManager._();
  factory CustomCacheManager() {
    return _instance;
  }

  CustomCacheManager._() : super(Config(key));

  Future<File> fetchSingleFile(String url,
      {String? key, Map<String, String>? headers}) async {
    final file = await super.getSingleFile(url, key: key, headers: headers);
    cache[url] = file;
    return file;
  }

  File? fetchFileFromMemory(String url) {
    return cache[url];
  }
}
