import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:patungkuy/models/order.dart';
import 'package:patungkuy/screens/home/orders.dart';
import 'package:patungkuy/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  List<Order> _orderListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Order(
        name: doc.data['name'] ?? '',
        price: doc.data['price'] ?? 0,
        quantity: doc.data['quantity'] ?? 0,
        category: doc.data['category'] ?? '',
      );
    }).toList();
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(uid: snapshot.data['id'], email: snapshot.data['email'], balance: snapshot.data['balance']);
  }

  // collection reference
  final CollectionReference orderCollection =
      Firestore.instance.collection('orders');
  
  final CollectionReference userCollection =
      Firestore.instance.collection('users');


  Future updateUserData(
      String name, String email, int balance) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'email': email,
      'balance': balance,
    });
  }

  Future updateOrderData(
      String name, int price, int quantity, String category) async {
    return await orderCollection.document(uid).setData({
      'name': name,
      'price': price,
      'quantity': quantity,
      'category': category
    });
  }

  Future<bool> itemExist(String item) async {
    if ( await orderCollection.where('name', isEqualTo: item).snapshots().isEmpty) {
      return false;
    } else {
      return true;
    }
  }


  Stream<List<Order>> get orders {
    return orderCollection.snapshots().map(_orderListFromSnapshot);
  }

  Stream<UserData> get userData {
    return userCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }

}
