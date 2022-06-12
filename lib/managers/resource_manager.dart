




class ResourceManager {
  static String getResource({required String name, ResourceType type = ResourceType.image}) {
    return 'assets/${_getResourceDirectory(type)}/$name';
  }

  static String _getResourceDirectory(ResourceType type) {
    switch (type) {
      case ResourceType.image:
        return 'images';
      case ResourceType.lang:
        return 'langs';
      case ResourceType.font:
        return 'fonts';
    }
  }
}

enum ResourceType { image, lang, font }
