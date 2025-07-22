import 'package:flutter/material.dart';

import 'package:hoormedicalstore/screen/product_overview_screen.dart';

class TermsCondition extends StatelessWidget {
  static const routeName = '/Terms&ConditionScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40))),
        toolbarHeight: 70,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 32, 58),
        leading: BackButton(
          color: Colors.white,
          onPressed: () => Navigator.of(context)
              .pushReplacementNamed(ProductOverviewScreen.routeName),
        ),
        title: Text(
          'terms & conditions',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(10),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      """
1. Acceptance of Terms

By downloading, installing, or using the App, you agree to be bound by these Terms. If you do not agree to these Terms, you must not use the App.
    
2. Eligibility

The App is intended for use by individuals who are 18 years of age or older. By using the App, you represent and warrant that you are at least 18 years old.
    
3. Registration and Account Security

To use the App, you may be required to create an account. You agree to provide accurate and complete information during the registration process and to update such information as necessary. You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account.
    
4. Ordering and Payment

The App allows you to order and purchase pharmaceutical products and services. You agree to pay for all orders made through the App. We reserve the right to modify or cancel any order at any time.
    
5. Product Information and Availability

We strive to provide accurate and up-to-date information about our products and services. However, we do not guarantee that product descriptions, pricing, or availability are accurate or up-to-date.
    
6. Disclaimer of Warranties
    
The App and all content, products, and services provided through it are provided on an "as is" and "as available" basis. We disclaim all warranties, express or implied, including but not limited to implied warranties of merchantability, fitness for a particular purpose, and non-infringement.
    
7. Limitation of Liability

In no event shall we be liable for any damages, including but not limited to incidental, consequential, or punitive damages, arising out of or in connection with your use of the App.
    
8. Indemnification
  
You agree to indemnify and hold us harmless from and against any claims, damages, losses, and expenses arising out of or in connection with your use of the App.
    
9. Termination
  
We may terminate or suspend your access to the App at any time, without notice, for any reason.
    
10. Governing Law

These Terms shall be governed by and construed in accordance with the laws of [State/Country]. Any disputes arising out of or in connection with these Terms shall be resolved through binding arbitration.
    
11. Changes to Terms
   
We reserve the right to modify or update these Terms at any time, without notice. Your continued use of the App shall be deemed to be your acceptance of any changes to these Terms.
    
By using the App, you acknowledge that you have read, understood, and agree to be bound by these Terms.""",
                      style: TextStyle(
                          fontSize: 12,
                          color: const Color.fromARGB(255, 0, 32, 58),
                          fontWeight: FontWeight.bold),
                    ),
                    Card(
                      color: const Color.fromARGB(255, 0, 32, 58),
                      child: Text(
                        """
        PLEASE READ THESE TERMS   
 CAREFULLY BEFORE USING THE APP """,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
