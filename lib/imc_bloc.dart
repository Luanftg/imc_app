import 'dart:async';
import 'dart:math';

import 'package:web/imc_model.dart';

class ImcEvent {
  ImcModel imcModel;
  ImcEvent({
    required this.imcModel,
  });
}

class ImcBloc {
  ImcModel _imcModel = ImcModel(
    isMale: true,
    gender: 'Masculino',
    altura: 0,
    peso: 0,
    description:
        'A medida da circunferência abdominal reﬂete de forma indireta o conteúdo de gordura entre os órgãos da região. A Organização Mundial da Saúde estabelece que a medida igual ou superior a 94 cm em homens e 80 cm em mulheres.',
  );

  final StreamController<ImcModel> _stateController =
      StreamController<ImcModel>();
  final StreamController<ImcEvent> _eventController =
      StreamController<ImcEvent>();

  ImcModel get initialData => _imcModel;
  Stream<ImcModel> get state => _stateController.stream;

  ImcBloc() {
    _eventController.stream.listen((event) {
      _handleEvent(event);
    });
  }

  void calculate(String altura, String peso) {
    double? alturaDouble = double.tryParse(altura);
    double? pesoDouble = double.tryParse(peso);

    if (alturaDouble != null && pesoDouble != null) {
      double result = pesoDouble / (alturaDouble * alturaDouble);
      if (result > 40) {
        _imcModel
          ..result = 'Obesidade grau III'
          ..description =
              'Aqui o sinal é vermelho, com forte probabilidade de já existirem doenças muito graves associadas. O tratamento deve ser ainda mais urgente.';
      } else if (result > 35 && result < 39.9) {
        _imcModel
          ..result = 'Obesidade grau II'
          ..description =
              'Mesmo que seus exames aparentem estar normais, é hora de se cuidar, iniciando mudanças no estilo de vida com o acompanhamento próximo de profissionais de saúde.';
      } else if (result > 30 && result < 34.9) {
        _imcModel
          ..result = 'Obesidade grau I'
          ..description =
              'Sinal de alerta! Chegou na hora de se cuidar, mesmo que seus exames sejam normais. Vamos dar início a mudanças hoje! Cuide de sua alimentação. Você precisa iniciar um acompanhamento com nutricionista e/ou endocrinologista.';
      } else if (result > 25 && result < 29.9) {
        _imcModel
          ..result = 'Sobrepeso'
          ..description =
              'Ele é, na verdade, uma pré-obesidade e muitas pessoas nessa faixa já apresentam doenças associadas, como diabetes e hipertensão. Importante rever hábitos e buscar ajuda antes de, por uma série de fatores, entrar na faixa da obesidade pra valer.';
      } else if (result > 18.6 && result < 24.9) {
        _imcModel
          ..result = 'Normal'
          ..description =
              'Que bom que você está com o peso normal! E o melhor jeito de continuar assim é mantendo um estilo de vida ativo e uma alimentação equilibrada.';
      } else {
        _imcModel
          ..result = 'Abaixo do normal'
          ..description =
              'Procure um médico. Algumas pessoas têm um baixo peso por características do seu organismo e tudo bem. Outras podem estar enfrentando problemas, como a desnutrição. É preciso saber qual é o caso.';
      }
    }

    _eventController.add(ImcEvent(imcModel: _imcModel));
  }

  _handleEvent(ImcEvent event) {
    _stateController.add(event.imcModel);
  }
}
