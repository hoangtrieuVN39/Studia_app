class MathUtil {
  static double calculateAverage(List<double> values, int decimalPlaces) {
    return double.parse(
      (values.reduce((a, b) => a + b) / values.length).toStringAsFixed(
        decimalPlaces,
      ),
    );
  }
}
