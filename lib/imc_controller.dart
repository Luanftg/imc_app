class ImcController {
  bool isMale = true;
  String gender = '';
  String result = '';
  String description = '';

  void calculate(String altura, String peso) {
    double? alturaDouble = double.tryParse(altura);
    double? pesoDouble = double.tryParse(peso);

    if (alturaDouble != null && pesoDouble != null) {
      double imc = pesoDouble / (alturaDouble * alturaDouble);
      if (imc > 40) {
        result = 'Obesidade grau III';
        description =
            'Aqui o sinal é vermelho, com forte probabilidade de já existirem doenças muito graves associadas. O tratamento deve ser ainda mais urgente.';
      } else if (imc >= 35 && imc <= 39.9) {
        result = 'Obesidade grau II';
        description =
            'Mesmo que seus exames aparentem estar normais, é hora de se cuidar, iniciando mudanças no estilo de vida com o acompanhamento próximo de profissionais de saúde.';
      } else if (imc >= 30 && imc <= 34.9) {
        result = 'Obesidade grau I';
        description =
            'Sinal de alerta! Chegou na hora de se cuidar, mesmo que seus exames sejam normais. Vamos dar início a mudanças hoje! Cuide de sua alimentação. Você precisa iniciar um acompanhamento com nutricionista e/ou endocrinologista.';
      } else if (imc >= 25 && imc <= 29.9) {
        result = 'Sobrepeso';
        description =
            'Ele é, na verdade, uma pré-obesidade e muitas pessoas nessa faixa já apresentam doenças associadas, como diabetes e hipertensão. Importante rever hábitos e buscar ajuda antes de, por uma série de fatores, entrar na faixa da obesidade pra valer.';
      } else if (imc >= 18.6 && imc <= 24.9) {
        result = 'Normal';
        description =
            'Que bom que você está com o peso normal! E o melhor jeito de continuar assim é mantendo um estilo de vida ativo e uma alimentação equilibrada.';
      } else {
        result = 'Abaixo do normal';
        description =
            'Procure um médico. Algumas pessoas têm um baixo peso por características do seu organismo e tudo bem. Outras podem estar enfrentando problemas, como a desnutrição. É preciso saber qual é o caso.';
      }
    }
  }
}
