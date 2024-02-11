class MedicineModel {
  String? name;
  String? description;
  String? image;
  String? type;

  MedicineModel({
    this.name,
    this.description,
    this.image,
    this.type,
  });

  static List<MedicineModel> getMedicineList() {
    return [
      MedicineModel(
        name: "Flexi®",
        description: "NSAIDs",
        image: "assets/images/paracetamol.png",
        type: "Tablet",
      ),
      MedicineModel(
        name: "Tylace™",
        description: "Cough and Cold Preparation",
        image: "assets/images/paracetamol.png",
        type: "Tablet",
      ),
      MedicineModel(
        name: "Virux®",
        description: "Systemic Antifungal, Antiviral and Antiprotozoal Agents",
        image: "assets/images/paracetamol.png",
        type: "Tablet",
      ),
      MedicineModel(
        name: "Virux Tablet®",
        description: "Topical Preparations",
        image: "assets/images/paracetamol.png",
        type: "Tablet",
      ),
      MedicineModel(
        name: "Virux® HC",
        description: "Skin Preparations",
        image: "assets/images/paracetamol.png",
        type: "Tablet",
      ),
      MedicineModel(
        name: "AclitolTM Cozycap",
        description: "Antiasthma",
        image: "assets/images/paracetamol.png",
        type: "Tablet",
      ),
      MedicineModel(
        name: "Virux® IV Injection",
        description: "Systemic Antiviral",
        image: "assets/images/paracetamol.png",
        type: "Tablet",
      ),
      MedicineModel(
        name: "Fona®",
        description: "Skin Preparations",
        image: "assets/images/paracetamol.png",
        type: "Tablet",
      ),
    ];
  }
}
