import 'package:flutter/material.dart';
import 'package:myapp/providers/cep_provider.dart';
import 'package:myapp/widgets/cep_info_widget.dart';
import 'package:provider/provider.dart';

class CepPage extends StatefulWidget {
  const CepPage({super.key});

  @override
  State<CepPage> createState() => _CepScreenState();
}

class _CepScreenState extends State<CepPage> {
  final TextEditingController _cepController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    CepProvider provider = Provider.of<CepProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Busca CEP'), centerTitle: true, backgroundColor: Colors.redAccent),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            //Image.asset('assets/cep.png'),
            const SizedBox(height: 12),
            TextField(
              controller: _cepController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                String cep = _cepController.text.trim();
                if (cep.isNotEmpty) {
                  provider.searchCep(cep);
                }
              },
              child: const Text('Buscar CEP'),
            ),
            const SizedBox(height: 12),
            if (provider.isLoading) const CircularProgressIndicator(),
            if (provider.errorMessage != null) Text(provider.errorMessage!),
            if (provider.cepData != null) CepInfoWidget(cepModel: provider.cepData!),
          ],
        ),
      ),
    );
  }
}
