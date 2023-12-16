// ignore_for_file: camel_case_types

class Model_on_boarding {
  String img, title, subtitle;
  Model_on_boarding(
      {required this.img, required this.title, required this.subtitle});
}

List<Model_on_boarding> onboarding = [
  Model_on_boarding(
      img: "images/one.jpg",
      title: "Manage your tasks",
      subtitle:
          "You can easily manage all of your daily tasks in DoMe for free"),
  Model_on_boarding(
      img: "images/tow.jpg",
      title: "Create daily routine",
      subtitle:
          "In Uptodo you can create your personalized routine to stay productive"),
  Model_on_boarding(
      img: "images/three.jpg",
      title: "Organaize your tasks",
      subtitle:
          "You can organize your daily tasks by adding your tasks into separate categories")
];
