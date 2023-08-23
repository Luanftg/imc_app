import 'package:flutter/material.dart';
import 'package:web/imc_bloc.dart';
// import 'package:web/imc_controller.dart';
import 'package:web/imc_model.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({super.key, required this.title});

  final String title;

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  bool isMale = true;
  String gender = 'Masculino';
  String genderDescription =
      'A medida da circunferência abdominal reﬂete de forma indireta o conteúdo de gordura entre os órgãos da região. A Organização Mundial da Saúde estabelece que a medida igual ou superior a 94 cm em homens e 80 cm em mulheres.';
  TextEditingController altura = TextEditingController();
  TextEditingController peso = TextEditingController();
  GlobalKey key = GlobalKey();

  // late ImcController imcController;
  late ImcBloc imcBloc;

  @override
  void initState() {
    super.initState();
    // imcController = ImcController();
    imcBloc = ImcBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width < 600
              ? MediaQuery.of(context).size.width * 0.8
              : MediaQuery.of(context).size.width * 0.4,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 16),
                Image.network('https://i.imgflip.com/7s0e4v.jpg'),
                const SizedBox(height: 16),
                const Text(
                    'O índice de massa corporal de um adulto é o seu peso em quilos (por exemplo, 80 kg), dividido por sua altura ao quadrado (vamos imaginar, 1,80 m x 1,80 m).',
                    textAlign: TextAlign.justify),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Masculino'),
                    Switch(
                      value: isMale,
                      onChanged: (bool male) {
                        setState(() {
                          if (male) {
                            isMale = true;
                            gender = 'Masculino';
                          } else {
                            isMale = false;
                            gender = 'Feminino';
                          }
                        });
                      },
                    ),
                    const Text('Feminino'),
                  ],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Insira a sua altura'),
                  controller: altura,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: 'Insira o seu peso'),
                  controller: peso,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // setState(() {
                    //   imcController.calculate(altura.text, peso.text);
                    // });
                    imcBloc.calculate(altura.text, peso.text);
                  },
                  child: const Text('Calcular'),
                ),
                const SizedBox(height: 16),
                StreamBuilder<ImcModel>(
                    stream: imcBloc.state,
                    builder: (context, snapshot) {
                      return Column(
                        children: [
                          Text(
                            // imcController.result,
                            snapshot.data?.result ?? '',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            // imcController.description,
                            snapshot.data?.description ?? '',
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
