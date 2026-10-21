// task 1
class MobilePhone {
  String brand;
  String model;
  double price;
  int battery;

  MobilePhone(this.brand, this.model, this.price, this.battery);

  String showInfo() {
    return '$brand $model || Price: ${price.toInt()} || Battery: $battery%';
  }

  bool isExpensive() => price > 100000;

  void charge(int percent) {
    if (percent <= 0) {
      print("Invalid");
      return;
    }

    battery += percent;

    if (battery > 100) {
      battery = 100;
    }
  }
}

void main() {
  MobilePhone phone1 = MobilePhone("Samsung", "A15", 45000, 30);
  MobilePhone phone2 = MobilePhone("iPhone", "16 Pro", 350000, 60);

  print(phone1.showInfo());
  print(phone1.isExpensive());

  print(phone2.showInfo());
  print(phone2.isExpensive());

  phone1.charge(50);
  print(phone1.showInfo());

  phone1.charge(80);
  print(phone1.showInfo());
}
// Is task mein maney MobilePhone naam ki class banayi hai jismein brand, model, price aur battery properties hain. Constructor ki help se mobile ki values set hoti hain. showInfo() mobile ki details return karta hai, isExpensive() check karta hai ke price 100000 se zyada hai ya nahi, aur charge() battery increase karta hai lekin 100% se upar nahi jaane deta.

