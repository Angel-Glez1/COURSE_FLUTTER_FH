enum FromWho { me, hers }

class Message {
  final String message;
  final String? url;
  final FromWho fromWho;

  Message({
    required this.message,
    required this.fromWho,
    this.url,
  });
}
