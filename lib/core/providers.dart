import 'package:hooks_riverpod/hooks_riverpod.dart';

class Providers {
  // We create a "provider", which will store a value (here "Hello world").
// By using a provider, this allows us to mock/override the value exposed.
final helloWorldProvider = Provider((_) => 'Hello world');
}