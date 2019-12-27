import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class SelectorWidget extends SingleChildRenderObjectWidget {
  final int index;

  SelectorWidget({Widget child, this.index, Key key}) : super(child: child, key: key);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _SelectorWidget()..index = index;
  }

  @override
  void updateRenderObject(BuildContext context, _SelectorWidget renderObject) {
    renderObject..index = index;
  }
}

class _SelectorWidget extends RenderProxyBox {
  int index;
}