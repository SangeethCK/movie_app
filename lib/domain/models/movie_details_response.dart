

class MovieDetails {
    int? id;
    String? url;
    String? name;
    String? type;
    String? language;
    List<String>? genres;
    String? status;
    int? runtime;
    int? averageRuntime;
    DateTime? premiered;
    DateTime? ended;
    String? officialSite;
    Schedule? schedule;
    Rating? rating;
    int? weight;
    Network? network;
    dynamic webChannel;
    dynamic dvdCountry;
    Externals? externals;
    Image? image;
    String? summary;
    int? updated;
    Links? links;

    MovieDetails({
        this.id,
        this.url,
        this.name,
        this.type,
        this.language,
        this.genres,
        this.status,
        this.runtime,
        this.averageRuntime,
        this.premiered,
        this.ended,
        this.officialSite,
        this.schedule,
        this.rating,
        this.weight,
        this.network,
        this.webChannel,
        this.dvdCountry,
        this.externals,
        this.image,
        this.summary,
        this.updated,
        this.links,
    });

    factory MovieDetails.fromJson(Map<String, dynamic> json) => MovieDetails(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        type: json["type"],
        language: json["language"],
        genres: json["genres"] == null ? [] : List<String>.from(json["genres"]!.map((x) => x)),
        status: json["status"],
        runtime: json["runtime"],
        averageRuntime: json["averageRuntime"],
        premiered: json["premiered"] == null ? null : DateTime.parse(json["premiered"]),
        ended: json["ended"] == null ? null : DateTime.parse(json["ended"]),
        officialSite: json["officialSite"],
        schedule: json["schedule"] == null ? null : Schedule.fromJson(json["schedule"]),
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
        weight: json["weight"],
        network: json["network"] == null ? null : Network.fromJson(json["network"]),
        webChannel: json["webChannel"],
        dvdCountry: json["dvdCountry"],
        externals: json["externals"] == null ? null : Externals.fromJson(json["externals"]),
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        summary: json["summary"],
        updated: json["updated"],
        links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": name,
        "type": type,
        "language": language,
        "genres": genres == null ? [] : List<dynamic>.from(genres!.map((x) => x)),
        "status": status,
        "runtime": runtime,
        "averageRuntime": averageRuntime,
        "premiered": "${premiered!.year.toString().padLeft(4, '0')}-${premiered!.month.toString().padLeft(2, '0')}-${premiered!.day.toString().padLeft(2, '0')}",
        "ended": "${ended!.year.toString().padLeft(4, '0')}-${ended!.month.toString().padLeft(2, '0')}-${ended!.day.toString().padLeft(2, '0')}",
        "officialSite": officialSite,
        "schedule": schedule?.toJson(),
        "rating": rating?.toJson(),
        "weight": weight,
        "network": network?.toJson(),
        "webChannel": webChannel,
        "dvdCountry": dvdCountry,
        "externals": externals?.toJson(),
        "image": image?.toJson(),
        "summary": summary,
        "updated": updated,
        "_links": links?.toJson(),
    };
}

class Externals {
    int? tvrage;
    int? thetvdb;
    String? imdb;

    Externals({
        this.tvrage,
        this.thetvdb,
        this.imdb,
    });

    factory Externals.fromJson(Map<String, dynamic> json) => Externals(
        tvrage: json["tvrage"],
        thetvdb: json["thetvdb"],
        imdb: json["imdb"],
    );

    Map<String, dynamic> toJson() => {
        "tvrage": tvrage,
        "thetvdb": thetvdb,
        "imdb": imdb,
    };
}

class Image {
    String? medium;
    String? original;

    Image({
        this.medium,
        this.original,
    });

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        medium: json["medium"],
        original: json["original"],
    );

    Map<String, dynamic> toJson() => {
        "medium": medium,
        "original": original,
    };
}

class Links {
    Previousepisode? self;
    Previousepisode? previousepisode;

    Links({
        this.self,
        this.previousepisode,
    });

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: json["self"] == null ? null : Previousepisode.fromJson(json["self"]),
        previousepisode: json["previousepisode"] == null ? null : Previousepisode.fromJson(json["previousepisode"]),
    );

    Map<String, dynamic> toJson() => {
        "self": self?.toJson(),
        "previousepisode": previousepisode?.toJson(),
    };
}

class Previousepisode {
    String? href;

    Previousepisode({
        this.href,
    });

    factory Previousepisode.fromJson(Map<String, dynamic> json) => Previousepisode(
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
    };
}

class Network {
    int? id;
    String? name;
    Country? country;
    String? officialSite;

    Network({
        this.id,
        this.name,
        this.country,
        this.officialSite,
    });

    factory Network.fromJson(Map<String, dynamic> json) => Network(
        id: json["id"],
        name: json["name"],
        country: json["country"] == null ? null : Country.fromJson(json["country"]),
        officialSite: json["officialSite"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country?.toJson(),
        "officialSite": officialSite,
    };
}

class Country {
    String? name;
    String? code;
    String? timezone;

    Country({
        this.name,
        this.code,
        this.timezone,
    });

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"],
        code: json["code"],
        timezone: json["timezone"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "timezone": timezone,
    };
}

class Rating {
    double? average;

    Rating({
        this.average,
    });

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        average: json["average"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "average": average,
    };
}

class Schedule {
    String? time;
    List<String>? days;

    Schedule({
        this.time,
        this.days,
    });

    factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        time: json["time"],
        days: json["days"] == null ? [] : List<String>.from(json["days"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "time": time,
        "days": days == null ? [] : List<dynamic>.from(days!.map((x) => x)),
    };
}
