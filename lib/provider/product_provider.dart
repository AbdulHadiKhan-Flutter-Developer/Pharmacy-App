import 'package:flutter/material.dart';

import 'package:hoormedicalstore/provider/product.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _items = [
    Product(
      id: DateTime.now().toString(),
      title: 'Panadol',
      description:
          'This drug is used to treat mild to moderate pain (from headaches, menstrual periods,toothaches, back pain, osteoarthritis, or cold/flu aches and pain) and to reduce fever.',
      category: 'Tablet',
      imageurl: 'assets/images/panadol.jpeg',
      Price: 5.0,
    ),
    Product(
      id: DateTime.now().toString(),
      title: 'Rigix',
      description:
          'This combination medication is used to temporarily relieve symptoms caused by the common cold, flu, allergies, or other breathing illnesses (such as sinusitis, bronchitis). Antihistamines help relieve watery eyes, itchy eyes/nose/throat, runny nose, and sneezing.',
      category: 'Syrup',
      imageurl: 'assets/images/rigix.jpeg',
      Price: 199.00,
    ),
    Product(
      id: DateTime.now().toString(),
      title: 'Synalgo',
      description:
          'Synalgo contains diclofenac, which reduces pain and inflammation. Dentists may prescribe Synalgo tablet uses for toothache in severe cases.',
      category: 'Tablet',
      imageurl: 'assets/images/synalgo.jpeg',
      Price: 16.45,
    ),
    Product(
      id: DateTime.now().toString(),
      title: 'Treviamet 50/500',
      description:
          'TREVIAMET (Sitagliptin+ Metformin HCl) is indicated as: - Initial therapy in patients with type 2 diabetes mellitus to improve glycemic control when diet and exercise do not provide adequate glycemic control.',
      category: 'Tablet',
      imageurl: 'assets/images/treviamet.jpeg',
      Price: 17.00,
    ),
    Product(
      id: DateTime.now().toString(),
      title: 'Solvocef 200mg',
      description:
          'Solocef O 200mg Tablet is an antibiotic belonging that is used to treat a variety of bacterial infections. It is effective in infections of the respiratory tract (eg. pneumonia), urinary tract, ear, nasal sinus, throat, and some sexually transmitted diseases.',
      category: 'Tablet',
      imageurl: 'assets/images/solvocef.jpeg',
      Price: 7.66,
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  Product findbyid(String id) {
    return items.firstWhere((prodid) => prodid.id == id);
  }
}
