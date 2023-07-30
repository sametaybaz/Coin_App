import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:coin_app/api/api.dart';
//import 'dart:math';

/* class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CryptoRank cryptoRankAPI = CryptoRank();
  Map<String, dynamic>? responseData;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() {
    cryptoRankAPI.cryptocurrency("/currencies/1").then((result) {
      setState(() {
        responseData = jsonDecode(result)['data'];
      });
    }).catchError((e) {
      // Hata durumunu burada ele alabilirsiniz.
      // ignore: avoid_print
      print('API isteği başarisiz: $e');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: responseData != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    title: Text(responseData!['name']),
                    subtitle: Text(responseData!['symbol']),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'marketCap: ${responseData!['values']?['USD']?['marketCap'].toString() ?? 'N/A'}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                      Text(
                    'volume24h: ${responseData!['values']?['USD']?['volume24h'].toString() ?? 'N/A'}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed:
                        fetchData, // Butona basıldığında fetchData fonksiyonunu çağır
                    child: Text('Güncelle'),
                  ),
                ],
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
} */

/* class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CryptoRank cryptoRankAPI = CryptoRank();
  List<dynamic>? responseData;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() {
    cryptoRankAPI.cryptocurrency("/currencies").then((result) {
      setState(() {
        responseData = jsonDecode(result)['data'];
      });
    }).catchError((e) {
      // Hata durumunu burada ele alabilirsiniz.
      // ignore: avoid_print
      print('API isteği başarısız: $e');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: responseData != null
            ? ListView.builder(
                itemCount: responseData!.length,
                itemBuilder: (BuildContext context, int index) {
                  final coinData = responseData![index];
                  final marketCap = coinData['values']['USD']['marketCap'];
                  final volume24h = coinData['values']['USD']['volume24h'];
                  return ListTile(
                    title: Text(coinData['name']),
                    subtitle: Text(coinData['symbol']),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Market Cap: ${marketCap.toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Volume 24h: ${volume24h.toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  );
                },
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
} */

/* class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CryptoRank cryptoRankAPI = CryptoRank();
  Map<String, dynamic>? marketData;
  double? volatility;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() {
    cryptoRankAPI.cryptocurrency("/markets").then((result) {
      final parsedData = jsonDecode(result)['data'];
      setState(() {
        marketData = parsedData[0];
        volatility = calculateVolatility(marketData!);
      });
    }).catchError((e) {
      // Hata durumunu burada ele alabilirsiniz.
      // ignore: avoid_print
      print('API isteği başarısız: $e');
    });
  }

  double calculateVolatility(Map<String, dynamic> marketData) {
    final double high = marketData['high'];
    final double low = marketData['low'];
    final double open = marketData['open'];
    //final double last = marketData['last'];
    final double changeRange = high - low;
    final double volatility = (changeRange / open) * 100;
    return volatility;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: marketData != null && volatility != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    title: Text(marketData!['baseCurrency']['name']),
                    subtitle: Text(marketData!['baseCurrency']['symbol']),
                  ),
                  Text(
                    'Volatility: ${volatility?.toStringAsFixed(2)}%',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
} */

/* LAST  

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CryptoRank cryptoRankAPI = CryptoRank();
  List<dynamic>? responseData;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() {
    cryptoRankAPI.cryptocurrency("/currencies").then((result) {
      setState(() {
        responseData = jsonDecode(result)['data'];
      });
    }).catchError((e) {
      // Hata durumunu burada ele alabilirsiniz.
      // ignore: avoid_print
      print('API isteği başarısız: $e');
    });
  }

  void refreshData() {
    setState(() {
      responseData = null; // Önceki verileri temizle
    });
    fetchData(); // Yeni verileri getir
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: responseData != null
            ? ListView.separated(
                itemCount: responseData!.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    color: Colors.grey,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  final coinData = responseData![index];
                  final marketCap = coinData['values']['USD']['marketCap'];
                  final volume24h = coinData['values']['USD']['volume24h'];
                  return ListTile(
                    title: Text(coinData['name']),
                    subtitle: Text(coinData['symbol']),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Market Cap: ${marketCap.toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 14),
                        ),
                       const SizedBox(height: 10,),
                        Text(
                          'Volume 24h: ${volume24h.toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  );
                },
              )
            : const CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: refreshData, // Butona basıldığında verileri güncelle
        child: const Icon(Icons.refresh),
      ),
    );
  }
} 

*/

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CryptoRank cryptoRankAPI = CryptoRank();
  List<dynamic>? responseData = [];
  List<dynamic>? filteredData = [];
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() {
    cryptoRankAPI.cryptocurrency("/currencies").then((result) {
      setState(() {
        responseData = jsonDecode(result)['data'];
        filteredData =
            responseData; // İlk başta tüm verileri filtrelenmemiş olarak atayın
      });
    }).catchError((e) {
      // Hata durumunu burada ele alabilirsiniz.
      // ignore: avoid_print
      print('API isteği başarisiz: $e');
    });
  }

  void refreshData() {
    setState(() {
      isSearching = false; // Arama durumunu sıfırla
      filteredData = null; // Filtrelenmiş verileri temizle
    });
    fetchData(); // Yeni verileri getir
  }

  void filterData(String searchText) {
    setState(() {
      if (searchText.isEmpty) {
        isSearching = false; // Arama metni boşsa, arama durumunu sıfırla
        filteredData = responseData; // Tüm verileri göster
      } else {
        isSearching =
            true; // Arama metni varsa, arama durumunu true olarak ayarla
        filteredData = responseData
            ?.where((data) =>
                data['name'].toLowerCase().contains(searchText.toLowerCase()) ||
                data['symbol'].toLowerCase().contains(searchText.toLowerCase()))
            .toList(); // Arama metniyle eşleşen verileri filtrele (sırala)
      }
    });
  }

  @override
  void dispose() {
    searchController
        .dispose(); // Bellek sızıntısını önlemek için controller'ı dispose et
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearching ? _buildSearchField() : Text(widget.title),
        actions: _buildAppBarActions(),
      ),
      body: Center(
        child: filteredData != null
            ? ListView.separated(
                itemCount: filteredData!.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    color: Colors.grey,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  final coinData = filteredData![index];
                  final marketCap = coinData['values']['USD']['marketCap'];
                  final volume24h = coinData['values']['USD']['volume24h'];

                  return ListTile(
                    title: Text(coinData['name']),
                    subtitle: Text(coinData['symbol']),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        
                        Text(
                          'Market Cap: ${marketCap.toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 5), // Boşluk ekleyin
                        Text(
                          'Volume 24h: ${volume24h.toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  );
                },
              )
            : const CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: refreshData, // Butona basıldığında verileri güncelle
        child: const Icon(Icons.refresh),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: searchController,
      onChanged: filterData,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Coin ara...',
        hintStyle: const TextStyle(color: Colors.white60),
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: const Icon(Icons.search),
      ),
    );
  }

  List<Widget> _buildAppBarActions() {
    if (isSearching) {
      return [
        IconButton(
          onPressed: () {
            setState(() {
              isSearching = false; // Arama durumunu sıfırla
              searchController.clear();
              filteredData = responseData; // Tüm verileri göster
            });
          },
          icon: const Icon(Icons.close),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: () {
            setState(() {
              isSearching = true; // Arama durumunu true olarak ayarla
            });
          },
          icon: const Icon(Icons.search),
        ),
      ];
    }
  }
}
