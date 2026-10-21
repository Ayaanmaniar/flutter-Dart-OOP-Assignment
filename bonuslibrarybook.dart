
class LibraryBook {
  final String title;
  final String author;

  bool _isIssued = false;

  static int totalIssued = 0;

  LibraryBook(this.title, this.author);

  bool get isIssued => _isIssued;

  void issueBook() {
    if (_isIssued == true) {
      print("Pehle se issued hai");
    } else {
      _isIssued = true;
      totalIssued++;
      print("$title issued hogi");
    }
  }

  void returnBook() {
    if (_isIssued == false) {
      print("Yeh book issued hi nahi thi");
    } else {
      _isIssued = false;
      totalIssued--;
      print("$title return hogi");
    }
  }
}

void main() {
  LibraryBook book1 = LibraryBook("Dart Basics", "Ali");
  LibraryBook book2 = LibraryBook("Flutter Guide", "Sara");
  LibraryBook book3 = LibraryBook("Learn Coding", "Ahmed");

  book1.issueBook();
  book2.issueBook();
  book2.issueBook();

  book3.returnBook();

  book1.returnBook();

  print("Total Issued: ${LibraryBook.totalIssued}");
}

// Is task mein maney LibraryBook class banayi hai jismein title aur author hain. final ki wajah se title aur author change nahi ho sakte. _isIssued check karta hai ke book issue hui hai ya nahi, aur getter se hum iska status dekh sakte hain. issueBook() book issue karta hai aur totalIssued ko 1 se barhata hai. returnBook() book return karta hai aur count ko 1 se kam karta hai. Agar book pehle se issue ho ya issue hi na hui ho, toh message print hota hai.