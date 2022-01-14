class ProductSizes {
  static final xs = ProductSize("XS");
  static final s = ProductSize("S");
  static final m = ProductSize("M");
  static final l = ProductSize("L");
  static final xl = ProductSize("XL");

  static List<ProductSize> get values {
    return [xs, s, m, l, xl];
  }
}

class ProductSize {
  final String name;
  ProductSize(this.name);
}
