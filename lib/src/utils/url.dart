String normalizeUrl(String url) {
  if (url.startsWith('://')) {
    return 'https$url';
  }
  if (url.startsWith('//')) {
    return 'https:$url';
  }
  return url;
}