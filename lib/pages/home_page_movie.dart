import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_ff/model/movie.dart';
import 'package:flutter_application_ff/pages/FetchJsonPage.dart';
import 'package:flutter_application_ff/services/firestore_movie.dart';

class HomePageMovie extends StatefulWidget {
  const HomePageMovie({Key? key}) : super(key: key);

  @override
  State<HomePageMovie> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageMovie> {
  final FireStoreService fireStoreService = FireStoreService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _directorController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _publishDateController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _imdbController = TextEditingController();
  final TextEditingController _actorController = TextEditingController();

  void openMovieBox({String? docID, Movie? movie}) {
    _nameController.text = movie?.name ?? '';
    _directorController.text = movie?.director ?? '';
    _descriptionController.text = movie?.description ?? '';
    _publishDateController.text = movie?.publishDate ?? '';
    _durationController.text = movie?.duration ?? '';
    _categoryController.text = movie?.category ?? '';
    _imdbController.text = movie?.imdb ?? '';
    _actorController.text = movie?.actor ?? '';
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: 'Enter movie name',
                ),
              ),
              TextField(
                controller: _directorController,
                decoration: const InputDecoration(
                  hintText: 'Enter movie director',
                ),
              ),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  hintText: 'Enter movie description',
                ),
              ),
              TextField(
                controller: _publishDateController,
                decoration: const InputDecoration(
                  hintText: 'Enter movie publish date',
                ),
              ),
              TextField(
                controller: _durationController,
                decoration: const InputDecoration(
                  hintText: 'Enter movie duration',
                ),
              ),
              TextField(
                controller: _categoryController,
                decoration: const InputDecoration(
                  hintText: 'Enter movie category',
                ),
              ),
              TextField(
                controller: _imdbController,
                decoration: const InputDecoration(
                  hintText: 'Enter movie imdb',
                ),
              ),
              TextField(
                controller: _actorController,
                decoration: const InputDecoration(
                  hintText: 'Enter movie actor',
                ),
              ),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              if (docID == null) {
                fireStoreService.addMovie(
                  Movie(
                    name: _nameController.text,
                    director: _directorController.text,
                    description: _descriptionController.text,
                    publishDate: _publishDateController.text,
                    duration: _durationController.text,
                    category: _categoryController.text,
                    imdb: _imdbController.text,
                    actor: _actorController.text,
                  ),
                );
              } else {
                fireStoreService.updateMovie(
                    Movie(
                      name: _nameController.text,
                      director: _directorController.text,
                      description: _descriptionController.text,
                      publishDate: _publishDateController.text,
                      duration: _durationController.text,
                      category: _categoryController.text,
                      imdb: _imdbController.text,
                      actor: _actorController.text,
                    ),
                    docID);
              }
              _nameController.clear();
              _directorController.clear();
              _descriptionController.clear();
              _publishDateController.clear();
              _durationController.clear();
              _categoryController.clear();
              _imdbController.clear();
              _actorController.clear();
              Navigator.pop(context);
            },
            child: Text(docID == null ? "Add" : "Update"),
          ),
        ],
      ),
    );
  }

  void deleteMovieBox({required String docID}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Are you sure you want to delete this movie?"),
        actions: [
          ElevatedButton(
            onPressed: () {
              fireStoreService.deleteMovie(docID);
              Navigator.pop(context);
            },
            child: const Text("Delete"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }

  // HOCAM BU FONKSİYONLAR SQFLİTE İÇİN

  // void showBottomSheet(String functionTitle, Function()? onPressed) {
  //   showModalBottomSheet(
  //       context: context,
  //       elevation: 5,
  //       isScrollControlled: true,
  //       builder: (_) => Container(
  //             padding: EdgeInsets.only(
  //               top: 15,
  //               left: 15,
  //               right: 15,
  //               bottom: MediaQuery.of(context).viewInsets.bottom + 120,
  //             ),
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               crossAxisAlignment: CrossAxisAlignment.end,
  //               children: [
  //                 TextField(
  //                   controller: nameController,
  //                   decoration: const InputDecoration(hintText: 'Title'),
  //                 ),
  //                 const SizedBox(
  //                   height: 10,
  //                 ),
  //                 TextField(
  //                   controller: priceController,
  //                   //keyboardType: TextInputType.languageress,
  //                   decoration: const InputDecoration(hintText: 'Price'),
  //                 ),
  //                 const SizedBox(
  //                   height: 20,
  //                 ),
  //                 ElevatedButton(
  //                   onPressed: onPressed,
  //                   child: Text(functionTitle),
  //                 )
  //               ],
  //             ),
  //           ));
  // }

  // void addMovieToLocal() {
  //   showBottomSheet('Add Product', () async {
  //     var Movie = Movie(
  //       id: Uuid().v4(),
  //       productName: nameController.text,
  //       productPrice: priceController.text,
  //     );
  //     bool res = await productProvider.insertProduct(product);
  //     if (res == true) {
  //       snackBarSuccessWidget(context, "Record Inserted");
  //       products = productProvider.getAllProducts();
  //     } else {
  //       snackBarErrorWidget(context, "Record cannot inserted");
  //     }

  //     setState(() {});
  //     nameController.clear();
  //     priceController.clear();
  //     Navigator.of(context).pop();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Database'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FetchJsonPage()),
              );
            },
            icon: Icon(Icons.get_app),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.abc))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => openMovieBox(),
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: fireStoreService.getMovies(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<DocumentSnapshot> movies = snapshot.data!.docs;
            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = movies[index];
                String docID = document.id;
                Map<String, dynamic> movieData =
                    document.data() as Map<String, dynamic>;
                Movie movie = Movie.fromJson(movieData);

                // Parse IMDb rating to determine if it is even or odd
                int? imdbRating = int.tryParse(movie.imdb ?? '');
                bool isEven = imdbRating != null && imdbRating % 2 == 0;

                if (isEven) {
                  return Card(
                    color: Colors.green,
                    child: ListTile(
                      title: Row(
                        children: [
                          Text(movie.name ?? 'Untitled'),
                          SizedBox(
                            width: 2,
                          ),
                          Text(movie.actor ?? 'Untitled'),
                        ],
                      ),
                      subtitle: Row(
                        children: [
                          Text(movie.imdb ?? 'No IMDb rating'),
                          IconButton(
                              onPressed: () {
                                // addMovieToLocal();
                              },
                              icon: Icon(Icons.favorite))
                        ],
                      ),
                      leading: IconButton(
                        onPressed: () => deleteMovieBox(docID: docID),
                        icon: const Icon(Icons.delete),
                      ),
                      trailing: IconButton(
                        onPressed: () =>
                            openMovieBox(docID: docID, movie: movie),
                        icon: const Icon(Icons.edit),
                      ),
                    ),
                  );
                } else {
                  return Container(
                    color: Colors.blue,
                    child: ListTile(
                      title: Text(movie.name ?? 'Untitled'),
                      subtitle: Row(
                        children: [
                          Text(movie.imdb ?? 'No IMDb rating'),
                          SizedBox(
                            width: 2,
                          ),
                          Text(movie.actor ?? 'No IMDb actor'),
                        ],
                      ),
                      leading: IconButton(
                        onPressed: () => deleteMovieBox(docID: docID),
                        icon: const Icon(Icons.delete),
                      ),
                      trailing: IconButton(
                        onPressed: () =>
                            openMovieBox(docID: docID, movie: movie),
                        icon: const Icon(Icons.edit),
                      ),
                    ),
                  );
                }
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
