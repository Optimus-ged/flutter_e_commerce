class Ticker {
  Stream<int> tick({int ticks}) {
    return Stream.periodic(Duration(hours: 1), (x) => ticks - x - 1)
        .take(ticks);
  }
}

/// TODO: Remettre le tick en seconde
