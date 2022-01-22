class PaymentMethod {
  String nameOnCard;
  String cardNumber;
  String expireDate;
  int cvv;
  CardType cardType;
  bool defaultMethod;
  PaymentMethod({
    required this.nameOnCard,
    required this.cardType,
    required this.cardNumber,
    required this.expireDate,
    required this.cvv,
    this.defaultMethod = false,
  });

  String get endCardNumber => cardNumber.substring(cardNumber.length - 5);
  String get cardNumberPresentation => "**** **** **** $endCardNumber";
  String get cardTypeName =>
      cardType == CardType.masterCard ? "MasterCard" : "Visa";
  String get presentation =>
      "$cardTypeName **${cardNumber.substring(cardNumber.length - 2)}";

  static String cardLogo(CardType cardType) {
    if (cardType == CardType.masterCard) {
      return "assets/images/bag/mastercard_logo.png";
    } else {
      return "assets/images/bag/visa_logo.png";
    }
  }

  String get cardImage {
    if (cardType == CardType.masterCard) {
      return "assets/images/bag/mastercard.png";
    } else {
      return "assets/images/bag/visa_card.png";
    }
  }
}

enum CardType { visa, masterCard }
