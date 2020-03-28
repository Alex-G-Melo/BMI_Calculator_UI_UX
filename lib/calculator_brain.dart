import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;

  double _bmi;

  CalculatorBrain({this.height, this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 31) {
      return 'Sie haben Übergewicht.';
    } else if (_bmi > 26) {
      return 'Leichtes Übergewicht';
    } else if (_bmi > 20) {
      return 'Normalgewicht';
    } else {
      return 'Untergewicht';
    }
  }

  String getInterpretation() {
    if (_bmi >= 31) {
      return 'Ihr BMI weist auf Übergewicht hin. '
          'Das birgt die Gefahr von Krankheiten wie etwa Diabetes. '
          'Ihr Hausarzt und die Techniker unterstützen '
          'Sie gern bei einem gesunden Lebensstil.';
    } else if (_bmi > 26) {
      return 'Ihr BMI ist leicht erhöht. Achten Sie auf Ihre '
          'Ernährung und bewegen Sie sich regelmäßig. So können Sie das '
          'Risiko für mögliche Begleiterkrankungen minimieren.';
    } else if (_bmi > 20) {
      return 'Super! Ihr Gewicht ist gesund. Mit einer ausgewogenen '
          'Ernährung und regelmäßiger Bewegung wird das auch '
          'langfristig so bleiben.';
    } else {
      return 'Ihr BMI ist sehr niedrig. Versuchen Sie, etwas zuzunehmen, '
          'um langfristig gesund und leistungsfähig zu bleiben. '
          'Die Techniker oder Ihr Arzt unterstützen Sie gern dabei.';
    }
  }
}
