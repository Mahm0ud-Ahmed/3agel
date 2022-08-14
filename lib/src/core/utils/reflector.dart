import 'package:reflectable/reflectable.dart';

class ModelReflector extends Reflectable {
  const ModelReflector() : super(
    invokingCapability,
    typingCapability,
    declarationsCapability,
    reflectedTypeCapability,
  );
}
const modelReflector = ModelReflector();
