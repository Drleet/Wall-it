import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

const apiKey = '451d0234-b309-45d0-a6c1-40ef2e34f5fc';
const baseUrl = 'https://pro-api.coinmarketcap.com/v1';
List<dynamic> cryptoData = [];

// Future<List<dynamic>> fetchCryptoData() async {
//   final response = await http.get(
//     Uri.parse('$baseUrl/cryptocurrency/listings/latest'),
//     headers: {
//       'X-CMC_PRO_API_KEY': apiKey,
//     },
//   );

//   if (response.statusCode == 200) {
//     final data = json.decode(response.body);
//     return data['data'];
//   } else {
//     throw Exception('Failed to fetch data');
//   }
// }

// Future<Map<String, dynamic>> fetchCryptoDetails(String symbol) async {
//   final response = await http.get(
//     Uri.parse('$baseUrl/cryptocurrency/quotes/latest?symbol=$symbol'),
//     headers: {
//       'X-CMC_PRO_API_KEY': apiKey,
//     },
//   );

//   if (response.statusCode == 200) {
//     final data = json.decode(response.body);
//     return data['data'][symbol];
//   } else {
//     throw Exception('Failed to fetch data');
//   }
// }
Future<Map<String, dynamic>> fetchCryptoDetails(String symbol) async {
  final response = await http.get(
    Uri.parse('$baseUrl/cryptocurrency/quotes/latest?symbol=$symbol'),
    headers: {
      'X-CMC_PRO_API_KEY': apiKey,
    },
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    if (data['data'] != null && data['data'][symbol] != null) {
      return data['data'][symbol];
    } else {
      throw Exception('Failed to fetch data for $symbol');
    }
  } else {
    throw Exception('Failed to fetch data');
  }
}

class _HomePageState extends State<HomePage> {
  // Future<void> _loadCryptoData() async {
  //   try {
  //     List<dynamic> data = await fetchCryptoData();
  //     setState(() {
  //       cryptoData = data;
  //     });
  //   } catch (e) {
  //     // Handle the error here
  //     print('Error fetching data: $e');
  //   }
  // }
  // //  coin['name']),
  // //  coin['symbol']),
  // //  '\$${coin['quote']['USD']['price']}'

  // void getcoin() {
  //   for (var i = 0; i < cryptoData.length; i++) {
  //     var coin = cryptoData[i];
  //   }
  // }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade600,
      // body: SafeArea(
      //     child: SingleChildScrollView(
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Container(
      //         padding: const EdgeInsets.all(16),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Row(
      //               children: [
      //                 Icon(Icons.account_circle_rounded,
      //                     size: 48, color: Colors.grey.shade300),
      //                 SizedBox(
      //                   width: MediaQuery.of(context).size.width * 0.02,
      //                 ),
      //                 Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     Text(
      //                       'Name Name',
      //                       style: TextStyle(
      //                           fontWeight: FontWeight.w500, fontSize: 16),
      //                     ),
      //                     Text(
      //                       'Network type',
      //                       style: TextStyle(
      //                           color: Colors.grey.shade400, fontSize: 12),
      //                     ),
      //                   ],
      //                 ),
      //               ],
      //             ),
      //             Icon(CupertinoIcons.bell,
      //                 size: 28, color: Colors.grey.shade300),
      //           ],
      //         ),
      //       ),
      //       SizedBox(
      //         height: MediaQuery.of(context).size.height * 0.02,
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 16),
      //         child: Text(
      //           'Base wallet',
      //           style: TextStyle(fontSize: 12),
      //         ),
      //       ),
      //       SizedBox(
      //         height: MediaQuery.of(context).size.height * 0.005,
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 16),
      //         child: Text(
      //           '4000.85\$',
      //           style: TextStyle(fontSize: 32),
      //         ),
      //       ),
      //       SizedBox(
      //         height: MediaQuery.of(context).size.height * 0.02,
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 16),
      //         child: Text(
      //           'wallet balance change',
      //           style: TextStyle(fontSize: 12),
      //         ),
      //       ),
      //       SizedBox(
      //         height: MediaQuery.of(context).size.height * 0.25,
      //       ),
      //       Container(
      //         padding: const EdgeInsets.symmetric(horizontal: 24),
      //         height: MediaQuery.of(context).size.height * 0.45,
      //         width: MediaQuery.of(context).size.width,
      //         decoration: BoxDecoration(
      //           color: Colors.white,
      //           borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      //         ),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             SizedBox(
      //               height: MediaQuery.of(context).size.height * 0.025,
      //             ),
      //             Text(
      //               'Assets',
      //               style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
      //             ),
      //             SizedBox(
      //               height: MediaQuery.of(context).size.height * 0.025,
      //             ),
      //             Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Row(
      //                   children: [
      //                     Image.network(
      //                       'https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579',
      //                       width: 40,
      //                       height: 40,
      //                     ),
      //                     SizedBox(
      //                       width: MediaQuery.of(context).size.width * 0.01,
      //                     ),
      //                     Column(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         Text(
      //                           'Assest name',
      //                         ),
      //                         Text(
      //                           'Assets short',
      //                           style: TextStyle(
      //                               color: Colors.grey.shade400, fontSize: 12),
      //                         ),
      //                       ],
      //                     ),
      //                   ],
      //                 ),
      //                 Column(
      //                   crossAxisAlignment: CrossAxisAlignment.end,
      //                   children: [
      //                     Text(
      //                       '122.8672',
      //                     ),
      //                     Text(
      //                       '=212.12\$',
      //                       style: TextStyle(
      //                           color: Colors.grey.shade400, fontSize: 12),
      //                     ),
      //                   ],
      //                 ),
      //               ],
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // )),
      
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchCryptoDetails(symbol),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final cryptoData = snapshot.data;
            if (cryptoData == null) {
              // Handle the case where the data is null (e.g., API response issue)
              return Center(
                  child: Text('Error: Unable to fetch data for $symbol'));
            }
            // Display the cryptocurrency details as before
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  cryptoData['logo_url'],
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: 20),
                Text('Name: ${cryptoData['name']}'),
                Text('Symbol: ${cryptoData['symbol']}'),
                Text('Price: \$${cryptoData['quote']['USD']['price']}'),
                // Display other details as needed
              ],
            );
          }
        },
      ),
    );
  }
}
