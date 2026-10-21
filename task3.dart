
 // task 3

class Wallet {
  final String owner;
  final String mobileNo;

  double _balance = 0;
  String _pin;

  static const String companyName = "easypaisa";
  static int totalWallets = 0;

  Wallet({
    required this.owner,
    required this.mobileNo,
    required String pin,
    double openingBalance = 0,
  }) : _pin = pin {
    if (openingBalance < 0 || !openingBalance.isFinite) {
      throw ArgumentError("Invalid balance");
    }

    if (openingBalance > 0) {
      _balance = openingBalance;
    }

    totalWallets++;
  }

  double get balance => _balance;

  set pin(String newPin) {
    if (newPin.length == 4 &&
        int.tryParse(newPin) != null) {
      _pin = newPin;
      print("PIN change hogaya.");
    } else {
      print("PIN 4 digits ka hona chahiye");
    }
  }

  void addMoney(double amount) {
    if (amount <= 0 || !amount.isFinite) {
      print("Invalid amount");
      return;
    }

    _balance += amount;
  }

  void sendMoney(double amount, String pin, Wallet receiver) {
    if (pin != _pin) {
      print("Ghalat PIN");
      return;
    }

    if (amount <= 0 || !amount.isFinite) {
      print("Invalid amount");
      return;
    }

    if (amount > _balance) {
      print("Insufficient balance");
      return;
    }

    _balance -= amount;
    receiver.addMoney(amount);

    print("$owner ne $amount ${receiver.owner} ko bheje.");
  }

  void showInfo() {
    print("Owner: $owner || Mobile: $mobileNo || Balance: $_balance");
  }

  static void showCompanyInfo() {
    print("Company: $companyName || Total Wallets: $totalWallets");
  }
}

void main() {
  Wallet wallet1 = Wallet(
    owner: "Ali",
    mobileNo: "0300-1234567",
    pin: "1234",
    openingBalance: 5000,
  );

  Wallet wallet2 = Wallet(
    owner: "Sara",
    mobileNo: "0301-1234567",
    pin: "2345",
    openingBalance: 1000,
  );

  Wallet wallet3 = Wallet(
    owner: "Ahmed",
    mobileNo: "0302-1234567",
    pin: "3456",
    openingBalance: 500,
  );

  wallet1.sendMoney(2000, "1234", wallet2);
  wallet1.sendMoney(500, "9999", wallet2);
  wallet2.sendMoney(5000, "2345", wallet1);

  wallet1.pin = "12";
  wallet1.pin = "5678";

  wallet1.sendMoney(500, "5678", wallet2);

  wallet1.showInfo();
  wallet2.showInfo();
  wallet3.showInfo();

  Wallet.showCompanyInfo();
}


  // wallet1.balance = 100000;
  // Error: acha joh balance hai uoska setter nahi hai.

  // wallet1.owner = "Ahmed";
  // Error: owner final hai aur ye change nahi ho sakta.

  // aur maney pin ka getter nhi banaya kiukeh pin private hoti hai obv.

  // Is task mein maney Wallet class banayi hai jo EasyPaisa jaisa kaam karti hai. Ismein owner, mobile number, balance aur PIN hai. Constructor wallet banata hai, addMoney() paisay add karta hai aur sendMoney() PIN aur balance check karke paisay transfer karta hai. Getter se balance check hota hai aur setter se PIN change hota hai. static total wallets count karta hai, final owner ko change hone se rokta hai aur _balance aur _pin private hain. PIN ka getter nahi banaya kyun ke PIN secret rakhna hota hai.
  
  // PIN check mein int.tryParse(newPin) != null bhi hona chahiye  taake abcd jaisa text valid PIN na ban sake. Aur sendMoney() mein pehle PIN phir amount aur balance validate hona chahiye.
 
  // throw ArgumentError ka matlab hai “Ghalat input mila hai isliye error do aur aage ka kaam rok do.”
