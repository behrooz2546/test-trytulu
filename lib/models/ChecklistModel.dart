import 'package:trytulu/models/ItemModel.dart';

class CheckListModel {
  String name;
  List<ItemModel> items;
  bool isExpanded;

  CheckListModel({
    required this.name,
    required this.items,
    this.isExpanded = false,
  });

  static List<CheckListModel> getSample() {
    return [
      CheckListModel(
        name: "Before starting",
        items: [
          ItemModel(title: "Selfie with equipment", input: "photo"),
          ItemModel(title: "Record filling up bucket ", input: "video"),
          ItemModel(title: "Bucket soap measurement", input: "number"),
        ],
      ),
      CheckListModel(
        name: "Main Room",
        items: [
          ItemModel(title: "Photo of room", input: "photo"),
          ItemModel(title: "Mop the floor", input: "video"),
        ],
      ),
      CheckListModel(
        name: "Finishing",
        items: [
          ItemModel(
              title: "Clean equipment and dispose of rubbish", input: "photo"),
          ItemModel(title: "Equipment put back", input: "video"),
          ItemModel(title: "Building door locked", input: "checkbox"),
        ],
      )
    ];
  }
}
