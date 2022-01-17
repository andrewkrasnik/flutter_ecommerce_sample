String priceToString(double price) {
  if (price.truncate() == price) {
    return price.toStringAsFixed(0);
  } else {
    return price.toStringAsFixed(2);
  }
}
