
extension ListGetOrNull<T> on List<T> {
  T? getOrNull(int index) {
    return (index >= 0 && index < this.length) ? this[index] : null;
  }
}
