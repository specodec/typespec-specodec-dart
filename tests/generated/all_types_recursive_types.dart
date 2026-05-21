import 'dart:typed_data';
import 'package:specodec/specodec.dart' show SpecUndefined, SpecWriter, SpecReader, SpecCodec;
import 'all_types.dart';

class RecList {
  final int value;
  final RecList? next;
  RecList({required this.value, this.next});
}

void writeRecList(SpecWriter w, RecList obj) {
  var fieldCount = 1;
  if (obj.next != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('value'); w.writeInt32(obj.value);
  if (obj.next != null) { w.writeField('next'); RecListCodec.encode(w, obj.next!); }
  w.endObject();
}

final SpecCodec<RecList> RecListCodec = SpecCodec<RecList>(
  encode: (w, obj) => writeRecList(w, obj),
  decode: (r) {
    int valueVal = 0;
    RecList? nextVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'value': valueVal = r.readInt32(); break;
        case 'next': {
          RecList? tmp74;
          if (r.isNull()) {
            r.readNull();
            tmp74 = null;
          } else {
            tmp74 = RecListCodec.decode(r);
          }
          nextVal = tmp74;
          break;
        }
        default: r.skip();
      }
    }
    r.endObject();
    return RecList(value: valueVal, next: nextVal);
  },
);

class RecTree {
  final String value;
  final RecTree? leftNode;
  final RecTree? rightNode;
  RecTree({required this.value, this.leftNode, this.rightNode});
}

void writeRecTree(SpecWriter w, RecTree obj) {
  var fieldCount = 1;
  if (obj.leftNode != null) fieldCount++;
  if (obj.rightNode != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('value'); w.writeString(obj.value);
  if (obj.leftNode != null) { w.writeField('left_node'); RecTreeCodec.encode(w, obj.leftNode!); }
  if (obj.rightNode != null) { w.writeField('right_node'); RecTreeCodec.encode(w, obj.rightNode!); }
  w.endObject();
}

final SpecCodec<RecTree> RecTreeCodec = SpecCodec<RecTree>(
  encode: (w, obj) => writeRecTree(w, obj),
  decode: (r) {
    String valueVal = '';
    RecTree? leftNodeVal;
    RecTree? rightNodeVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'value': valueVal = r.readString(); break;
        case 'left_node': {
          RecTree? tmp75;
          if (r.isNull()) {
            r.readNull();
            tmp75 = null;
          } else {
            tmp75 = RecTreeCodec.decode(r);
          }
          leftNodeVal = tmp75;
          break;
        }
        case 'right_node': {
          RecTree? tmp76;
          if (r.isNull()) {
            r.readNull();
            tmp76 = null;
          } else {
            tmp76 = RecTreeCodec.decode(r);
          }
          rightNodeVal = tmp76;
          break;
        }
        default: r.skip();
      }
    }
    r.endObject();
    return RecTree(value: valueVal, leftNode: leftNodeVal, rightNode: rightNodeVal);
  },
);

class RecChain {
  final int id;
  final String label;
  final RecChain? next;
  RecChain({required this.id, required this.label, this.next});
}

void writeRecChain(SpecWriter w, RecChain obj) {
  var fieldCount = 2;
  if (obj.next != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('id'); w.writeInt32(obj.id);
  w.writeField('label'); w.writeString(obj.label);
  if (obj.next != null) { w.writeField('next'); RecChainCodec.encode(w, obj.next!); }
  w.endObject();
}

final SpecCodec<RecChain> RecChainCodec = SpecCodec<RecChain>(
  encode: (w, obj) => writeRecChain(w, obj),
  decode: (r) {
    int idVal = 0;
    String labelVal = '';
    RecChain? nextVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'id': idVal = r.readInt32(); break;
        case 'label': labelVal = r.readString(); break;
        case 'next': {
          RecChain? tmp77;
          if (r.isNull()) {
            r.readNull();
            tmp77 = null;
          } else {
            tmp77 = RecChainCodec.decode(r);
          }
          nextVal = tmp77;
          break;
        }
        default: r.skip();
      }
    }
    r.endObject();
    return RecChain(id: idVal, label: labelVal, next: nextVal);
  },
);

class RecWrap {
  final Uint8List payload;
  final RecWrap? nested;
  RecWrap({required this.payload, this.nested});
}

void writeRecWrap(SpecWriter w, RecWrap obj) {
  var fieldCount = 1;
  if (obj.nested != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('payload'); w.writeBytes(obj.payload);
  if (obj.nested != null) { w.writeField('nested'); RecWrapCodec.encode(w, obj.nested!); }
  w.endObject();
}

final SpecCodec<RecWrap> RecWrapCodec = SpecCodec<RecWrap>(
  encode: (w, obj) => writeRecWrap(w, obj),
  decode: (r) {
    Uint8List payloadVal = Uint8List(0);
    RecWrap? nestedVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'payload': payloadVal = r.readBytes(); break;
        case 'nested': {
          RecWrap? tmp78;
          if (r.isNull()) {
            r.readNull();
            tmp78 = null;
          } else {
            tmp78 = RecWrapCodec.decode(r);
          }
          nestedVal = tmp78;
          break;
        }
        default: r.skip();
      }
    }
    r.endObject();
    return RecWrap(payload: payloadVal, nested: nestedVal);
  },
);

class RecWide {
  final int a;
  final String b;
  final double c;
  final RecWide? child;
  RecWide({required this.a, required this.b, required this.c, this.child});
}

void writeRecWide(SpecWriter w, RecWide obj) {
  var fieldCount = 3;
  if (obj.child != null) fieldCount++;
  w.beginObject(fieldCount);
  w.writeField('a'); w.writeInt32(obj.a);
  w.writeField('b'); w.writeString(obj.b);
  w.writeField('c'); w.writeFloat64(obj.c);
  if (obj.child != null) { w.writeField('child'); RecWideCodec.encode(w, obj.child!); }
  w.endObject();
}

final SpecCodec<RecWide> RecWideCodec = SpecCodec<RecWide>(
  encode: (w, obj) => writeRecWide(w, obj),
  decode: (r) {
    int aVal = 0;
    String bVal = '';
    double cVal = 0.0;
    RecWide? childVal;
    r.beginObject();
    while (r.hasNextField()) {
      switch (r.readFieldName()) {
        case 'a': aVal = r.readInt32(); break;
        case 'b': bVal = r.readString(); break;
        case 'c': cVal = r.readFloat64(); break;
        case 'child': {
          RecWide? tmp79;
          if (r.isNull()) {
            r.readNull();
            tmp79 = null;
          } else {
            tmp79 = RecWideCodec.decode(r);
          }
          childVal = tmp79;
          break;
        }
        default: r.skip();
      }
    }
    r.endObject();
    return RecWide(a: aVal, b: bVal, c: cVal, child: childVal);
  },
);
