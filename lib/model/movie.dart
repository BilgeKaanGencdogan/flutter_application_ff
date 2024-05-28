// ignore_for_file: public_member_api_docs, sort_constructors_first
class Movie {
  String? name;
  String? director;
  String? description;
  String? publishDate;
  String? duration;
  String? category;
  String? imdb;
  String? actor;
  Movie({
    this.name,
    this.director,
    this.description,
    this.publishDate,
    this.duration,
    this.category,
    this.imdb,
    this.actor,
  });

  get getImbd => imdb;

  set setImbd(imdb) => this.imdb = imdb;

  get getactor => actor;

  set setactor(imdb) => this.actor = actor;

  get getCategory => category;

  set setCategory(category) => this.category = category;

  get getName => name;

  set setName(name) => this.name = name;

  get getDirector => director;

  set setDirector(director) => this.director = director;

  get getDescription => description;

  set setDescription(description) => this.description = description;

  get getPublishDate => publishDate;

  set setPublishDate(publishDate) => this.publishDate = publishDate;

  get getDuration => duration;

  set setDuration(duration) => this.duration = duration;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'director': director,
      'description': description,
      'publishDate': publishDate,
      'duration': duration,
      'category': category,
      'imdb': imdb,
      'actor': actor,
    };
  }

  @override
  @override
  String toString() {
    return 'Movie(name: $name, director: $director, description: $description, publishDate: $publishDate, duration: $duration, category: $category)';
  }

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      name: json['name'],
      description: json['description'],
      director: json['director'],
      duration: json['duration'],
      publishDate: json['publishDate'],
      category: json['category'],
      imdb: json['imdb'],
      actor: json['actor'],
    );
  }
}
