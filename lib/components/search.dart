import 'package:flutter/material.dart';
import 'package:kuliner_go_mobile/pages/restaurant_page.dart';
import 'package:kuliner_go_mobile/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController searchController = TextEditingController();
  List<DocumentSnapshot> searchResults = [];

  void performSearch(String query) {
    final CollectionReference restaurantsCollection =
        FirebaseFirestore.instance.collection('Restoran');

    restaurantsCollection
        .where('username', isEqualTo: query)
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        searchResults = querySnapshot.docs;
      });
    });

    restaurantsCollection
        .where('alamatRestoran', isEqualTo: query)
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        searchResults.addAll(querySnapshot.docs);
      });
    });
  }

  void clearSearch() {
    searchController.clear();
    setState(() {
      searchResults.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - (2 * 30),
      child: Column(
        children: [
          TextField(
            controller: searchController,
            onChanged: performSearch,
            decoration: InputDecoration(
              filled: true,
              fillColor: whiteColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              hintText: 'Cari restoran atau lokasi',
              hintStyle: const TextStyle(fontSize: 15),
              prefixIcon: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Image.asset('assets/search.png'),
              ),
              suffixIcon: searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(
                        Icons.clear,
                        color: Colors.black,
                      ),
                      onPressed: clearSearch,
                    )
                  : null,
              iconColor: blackColor,
            ),
          ),
          if (searchResults.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ListView.separated(
                  itemCount: searchResults.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final restaurantData =
                        searchResults[index].data() as Map<String, dynamic>;
                    final name = restaurantData['username'] as String;
                    final location = restaurantData['alamatRestoran'] as String;
                    final image = restaurantData['imageUrl'];

                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            title: Text(name),
                            subtitle: Text(location),
                            leading: image.isNotEmpty
                                ? Image.network(image)
                                : Image.asset('assets/emptyresto.png'),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => restaurantPage(
                                    resto: searchResults[index],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const Divider(),
                      ],
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
