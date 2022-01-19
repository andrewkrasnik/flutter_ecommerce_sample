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
  String get cardNumberPresentation => "**** **** **** ${endCardNumber}";
  String get cardLogo {
    if (cardType == CardType.MasterCard) {
      return "assets/images/bag/mastercard_logo.png";
    } else {
      return "assets/images/bag/visa_logo.png";
    }
  }
}

enum CardType { VISA, MasterCard }
