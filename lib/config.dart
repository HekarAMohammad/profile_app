class User {
  String? bio;
  String? title;
  String? name;
  String? imageLink;
  String? location;
  String? job;
  List<SocialMedia>? socialMedia;
  List<Contacts>? contacts;

  User({
    this.job,
    this.title,
    this.name,
    this.imageLink,
    this.location,
    this.bio,
    this.socialMedia,
    this.contacts,
  });
}

class SocialMedia {
  String? name;
  String? link;
  String? imageName;

  SocialMedia({
    this.name,
    this.link,
    this.imageName,
  });
}

class Contacts {
  String? name;
  String? link;
  String? imageName;

  Contacts({
    this.name,
    this.link,
    this.imageName,
  });
}

User user = User(
    job: "Programmer",
    name: "Hekar A. Mohammed",
    bio: 'Programmer at UOD Since 2009',
    imageLink: "hekar.jpg",
    location: "Iraq - Duhok",
    socialMedia: [
      SocialMedia(
          name: "LinkedIn",
          link:
              "https://www.linkedin.com/in/hekar-azwar-mohammed-salih-579a601a6/",
          imageName: "linkedin.png"),
      SocialMedia(
          name: "GitHub",
          link: "https://github.com/HekarAMohammad",
          imageName: "github.png"),
      SocialMedia(
          name: "StackOverFlow",
          link:
              "https://stackoverflow.com/users/13974543/hekar-azwar-mohemmad-salih",
          imageName: "stack.png"),
      SocialMedia(
          name: "Youtube",
          link: "https://www.youtube.com/channel/UC8LGJEctS3NkXtYIAWHfNmQ",
          imageName: "youtube.png"),
    ],
    contacts: [
      Contacts(
          name: "WhatsApp",
          link: "https://wa.me/+9647504030788",
          imageName: "whatsapp.png"),
      Contacts(
          name: "Viber",
          link: "viber://contact?number=+9647504030788",
          imageName: "viber.png"),
      Contacts(name: "phone", link: "+9647504030788", imageName: "phone.png"),
    ]);
