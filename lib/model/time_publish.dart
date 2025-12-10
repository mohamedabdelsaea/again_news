class TimePublish {
  static String format(String dateTimeString) {
    final dateTime = DateTime.parse(dateTimeString).toLocal();
    final now = DateTime.now();

    final diff = now.difference(dateTime);

    if (diff.inSeconds < 60) {
      return "Just now";
    } else if (diff.inMinutes < 60) {
      return "${diff.inMinutes} minute ago";
    } else if (diff.inHours < 24) {
      return "${diff.inHours} hour ago";
    } else if (diff.inDays < 7) {
      return "${diff.inDays} day ago";
    } else if (diff.inDays < 30) {
      return "${(diff.inDays / 7).floor()} week ago";
    } else if (diff.inDays < 365) {
      return "${(diff.inDays / 30).floor()} month ago";
    } else {
      return "${(diff.inDays / 365).floor()} year ago";
    }
  }
}
