typedef MapFunction<T, K> = T Function(K key);

extension MapKeysExtension<K, V> on Map<K, V> {
  Map<T, V> mapKeys<T>(MapFunction<T, K> keyMapper) =>
      map((key, value) => MapEntry(keyMapper(key), value));
}
