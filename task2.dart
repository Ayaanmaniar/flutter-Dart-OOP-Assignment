// task 2
class Product {
  String name;
  double price;
  int quantity;

  Product(this.name, this.price, this.quantity);

  double totalPrice() => price * quantity;  
  
  void applyDiscount(double percent) {
  if (percent < 0 || percent > 50 || !percent.isFinite) {
    print("Invalid discount");
    return;
  }

  price = price - (price * percent / 100);
}

  void showInfo() {
    print(
      'Name: $name || Price: $price || '
      'Quantity: $quantity || Total: ${totalPrice()}',
    );
  }
}

void main() {
  List<Product> cart = [
    Product("Keyboard", 1000, 2),
    Product("Mouse", 1500, 1),
    Product("Headphones", 3000, 2),
  ];

  for (Product product in cart) {
    product.showInfo();
  }

  double grandTotal = 0;

  for (Product product in cart) {
    grandTotal += product.totalPrice();
  }

  print("GRAND TOTAL: $grandTotal");

  cart[0].applyDiscount(10);
  cart[0].showInfo();

  cart[0].applyDiscount(70);
}
// nIs task mein maney Product naam ki class banayi hai jismein name, price aur quantity properties hain. totalPrice() price aur quantity ko multiply karta hai, applyDiscount() product ki price kam karta hai agar discount 0 se 50% ke darmiyan ho, aur showInfo() product ki details print karta hai. List aur for loop ki help se hum saare products display karte hain aur cart ka grand total calculate karte hain.