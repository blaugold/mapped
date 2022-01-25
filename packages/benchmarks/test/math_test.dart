import 'package:benchmark_harness/benchmark_harness.dart';

enum ReduceMethod {
  iterable,
  manual,
}

class ReduceMultiplication extends BenchmarkBase {
  ReduceMultiplication({
    required this.elements,
    required this.method,
  })  : _data = List.generate(elements, (index) => index.toDouble()),
        super('ReduceMultiplication(elements: $elements, method: $method)');

  final int elements;

  final ReduceMethod method;

  final List<double> _data;

  @override
  void run() {
    switch (method) {
      case ReduceMethod.iterable:
        _iterableReduce();
        break;
      case ReduceMethod.manual:
        _manualReduce();
        break;
    }
  }

  double _iterableReduce() => _data.reduce((value, element) => value * element);

  double _manualReduce() {
    switch (elements) {
      case 2:
        return _data[0] * _data[1];
      case 3:
        return _data[0] * _data[1] * _data[2];
      case 4:
        return _data[0] * _data[1] * _data[2] * _data[3];
      case 5:
        return _data[0] * _data[1] * _data[2] * _data[3] * _data[4];
      case 6:
        return _data[0] * _data[1] * _data[2] * _data[3] * _data[4] * _data[5];
      case 7:
        return _data[0] *
            _data[1] *
            _data[2] *
            _data[3] *
            _data[4] *
            _data[5] *
            _data[6];
      case 8:
        return _data[0] *
            _data[1] *
            _data[2] *
            _data[3] *
            _data[4] *
            _data[5] *
            _data[6] *
            _data[7];
      case 9:
        return _data[0] *
            _data[1] *
            _data[2] *
            _data[3] *
            _data[4] *
            _data[5] *
            _data[6] *
            _data[7] *
            _data[8];
      case 10:
        return _data[0] *
            _data[1] *
            _data[2] *
            _data[3] *
            _data[4] *
            _data[5] *
            _data[6] *
            _data[7] *
            _data[8] *
            _data[9];
      case 11:
        return _data[0] *
            _data[1] *
            _data[2] *
            _data[3] *
            _data[4] *
            _data[5] *
            _data[6] *
            _data[7] *
            _data[8] *
            _data[9] *
            _data[10];
      case 12:
        return _data[0] *
            _data[1] *
            _data[2] *
            _data[3] *
            _data[4] *
            _data[5] *
            _data[6] *
            _data[7] *
            _data[8] *
            _data[9] *
            _data[10] *
            _data[11];
      default:
        throw UnsupportedError('Unsupported number of elements: $elements');
    }
  }
}

void main() {
  final benchmarks = [
    for (final i in [2, 6, 9, 12])
      for (final method in ReduceMethod.values)
        ReduceMultiplication(elements: i, method: method)
  ];

  for (final benchmark in benchmarks) {
    benchmark.report();
  }
}
