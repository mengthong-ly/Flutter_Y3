import 'dart:async';
import 'dart:io';

enum Branch { Chaktomok }

//  client side
class BankAccount {
  // attributes here pa pa mak mak
  final int accountId;
  String accountOwner;
  String? phoneNumber;
  String? nationality;
  String? createYear;
  String? gender;
  double _balance;
  bool isActive;

  // double get balance => _balance;

  // constructor here pa pa
  BankAccount({required this.accountId, required this.accountOwner})
      : this.gender = null,
        this._balance = 0,
        this.isActive = true;

  // method

  double get checkBalance => _balance;

  void withdraw(double amount) {
    double tempBalance = _balance;
    _withdrawOperation(tempBalance, amount);
  }

  void _withdrawOperation(double tempBalance, double amount) {
    (tempBalance >= 0 && tempBalance > amount.abs() && amount != 0)
        ? {
            _balance = _balance - amount.abs(),
            print(
                ' ✅ you have successfully withdraw $amount\$ from your account')
          }
        : throw Exception(' ❌  withdraw unsuccessful, inficient balance');
  }

  void credit(double amount) {
    _balance += amount.abs();
  }
}

// server side - bank side

class Bank {
  // attributes
  final String name;
  final Branch branch;
  final List<BankAccount> _accounts = [];
  final bool isOpen = false;
  double _balance = 10000000;
  final double _exchangeRate;

  double get balance => _balance;
  double get exchange => _exchangeRate;

  Bank({
    required this.name,
    required this.branch,
    required double exchangeRate,
  }) : this._exchangeRate = exchangeRate;

  // method
  BankAccount createAccount(int accountId, String AccountOwner) {
    BankAccount tempAccount =
        BankAccount(accountId: accountId, accountOwner: AccountOwner);

    (_UniquessIdIdentifier(tempAccount.accountId) == true)
        ? {_accounts.add(tempAccount)}
        : throw Exception('❌ this account ID is already been created');
    return tempAccount;
  }

  bool _UniquessIdIdentifier(int accountId) {
    // if any of the account element is already done
    bool isVerify = !_accounts.any((element) => element.accountId == accountId);
    return isVerify;
  }

  @override
  String toString() {
    return '--- Bank Detail: \n        - Exchange: $exchange% \n        - Bank Balance: $balance\$  \n\n--- Total Account: ${_accounts.length}\n--- AccountOwner:\n ${_accounts.map((e) => '👉🏻 ' + e.accountOwner + ' (Id:' + e.accountId.toString() + '), Balance:' + e.checkBalance.toString() + '\$').join(',\n ')} ';
  }
}

Future<void> showProgress(String message) async {
  const List<String> spinner = ['|', '/', '-', '\\'];
  const String cyan = '\x1B[36m'; // Cyan color for the spinner
  const String reset = '\x1B[0m'; // Reset color
  int i = 0;

  Timer.periodic(Duration(milliseconds: 200), (Timer timer) {
    if (i >= 15) {
      timer.cancel();
      stdout.write('\r\n done!\n'); // Move to new line when done
    } else {
      // Print the icon in cyan color
      stdout.write(
          '\r ${cyan}${spinner[i % spinner.length]} $message$reset'); // Clear line and rewrite
      i++;
    }
  });
  await Future.delayed(Duration(milliseconds: 200) * 20);
}

Future<void> main() async {
  Bank bank =
      Bank(name: 'ABC Bank', branch: Branch.Chaktomok, exchangeRate: 1.4);

  BankAccount account1 = bank.createAccount(12345, 'Menthong ly');
  BankAccount account2 = bank.createAccount(1234, 'lylin');

  // i give the account1 balance more 10000 and withdraw from it 100
  account1.credit(10000);
  account1.withdraw(100);

  // i give the account2 balance more 5000 and withdraw from it 800
  account2.credit(5000);
  account2.withdraw(800);

  await showProgress('start fetching');
  print(bank);
}
