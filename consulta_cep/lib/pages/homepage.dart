import 'package:consulta_cep/controllers/controller.dart';
import 'package:consulta_cep/models/exibition_model.dart';
import 'package:consulta_cep/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  TextEditingController textController = TextEditingController();
  List<ExibitionModel> list = [];
  Controller controller = Controller();
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultar Cep'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: widget.textController,
                    decoration: InputDecoration(
                      labelText: 'CEP',
                      hintText: 'Digite o CEP a ser consultado',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => widget.textController.clear(),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.controller.buscaCep(widget.textController.text);
                    });
                  },
                  child: const Text('Buscar'),
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(),
                  ),
                  child: FutureBuilder<List<ExibitionModel>>(
                    initialData: widget.list,
                    future: (widget.controller
                        .buscaCep(widget.textController.text)),
                    builder: (context, snapshot) {
                      widget.list = snapshot.data as List<ExibitionModel>;
                      return ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: widget.list.length,
                        itemBuilder: (_, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                data: 'Cep: ${widget.list[index].cep}',
                              ),
                              CustomText(
                                data:
                                    'Cidade: ${widget.list[index].localidade}',
                              ),
                              CustomText(
                                data: 'Bairoo: ${widget.list[index].bairro}',
                              ),
                              CustomText(
                                data:
                                    'Logradouro: ${widget.list[index].logradouro}',
                              ),
                              CustomText(
                                data: 'Uf: ${widget.list[index].uf}',
                              ),
                              CustomText(
                                data: 'DDD: ${widget.list[index].ddd}',
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
