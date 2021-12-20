enum ENDPOINTS {
  news,
  apiV3,
  apiV4,
  firebase,
}

enum EndPointType {
  staging,
  production,
}

extension EndPointExtension on ENDPOINTS {
  String data({EndPointType type = EndPointType.production}) {
    if (type == EndPointType.production) {
      switch (this) {
        case ENDPOINTS.news:
          return 'https://news.coinhako.com/api/v1/';
        case ENDPOINTS.apiV3:
          return 'https://www.coinhako.com/api/v3/';
        case ENDPOINTS.apiV4:
          return 'https://www.coinhako.com/api/v4/';
        case ENDPOINTS.firebase:
          return 'https://coinhako-1e092.firebaseio.com/';
      }
    } else {
      switch (this) {
        case ENDPOINTS.news:
          return 'https://news.coinhako.com/api/v1/';
        case ENDPOINTS.apiV3:
          return 'https://www.coinesto.com/api/v3/';
        case ENDPOINTS.apiV4:
          return 'https://www.coinesto.com/api/v4/';
        case ENDPOINTS.firebase:
          return 'https://coinhako-staging.firebaseio.com/';
      }
    }
  }
}
