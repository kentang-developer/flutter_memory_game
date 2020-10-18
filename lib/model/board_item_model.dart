class BoardItemModel {
  String imagePath;
  bool isRevealed;
  bool isCompleted;

  BoardItemModel(
      {this.imagePath, this.isRevealed = false, this.isCompleted = false});

  void setCompleted(bool isCompleted) {
    this.isCompleted = isCompleted;
  }

  void setRevealed(bool isRevealed) {
    this.isRevealed = isRevealed;
  }

  BoardItemModel copy() {
    return BoardItemModel(
        imagePath: this.imagePath,
        isRevealed: this.isRevealed,
        isCompleted: this.isRevealed);
  }
}
