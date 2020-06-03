class Utils {
  static String getUsername(String email) {

    return "live:${email.split('@')[0]}";

  }

  static String getInitials(String name) {
    List<String> nameSplit = name.split(" ");
    String first = nameSplit[0][0];
    String last = nameSplit[1][0];
    return first + last;
  }
}