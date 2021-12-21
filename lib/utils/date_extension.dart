extension DateTimeAgo on DateTime {
  String timeAgo({bool numericDates = true}) {
    final now = DateTime.now();
    final difference = now.difference(this);

    if ((difference.inDays / 365).floor() >= 1) {
      final years = (difference.inDays / 365).floor();
      if (years > 1) {
        return (numericDates) ? '$years years ago' : 'Last years';
      }
      return numericDates ? '1 year ago' : 'Last year';
    } else if ((difference.inDays / 30).floor() >= 1) {
      final months = (difference.inDays / 30).floor();
      if (months > 1) {
        return (numericDates) ? '$months months ago' : 'Last months';
      }
      return numericDates ? '1 month ago' : 'Last month';
    } else if ((difference.inDays / 7).floor() > 0) {
      if ((difference.inDays / 7).floor() > 1) {
        return (numericDates)
            ? '${(difference.inDays / 7).floor()} week ago'
            : 'Last weeks';
      }
      return (numericDates) ? '1 week ago' : 'Last week';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays > 0) {
      return (numericDates) ? '1 day ago' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours > 0) {
      return (numericDates) ? '1 hour ago' : 'An hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes > 0) {
      return (numericDates) ? '1 minute ago' : 'A minute ago';
    } else if (difference.inSeconds >= 30) {
      return '${difference.inSeconds} seconds ago';
    } else {
      return 'Just now';
    }
  }
}
