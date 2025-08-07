import 'dart:ffi';

import 'package:imc_terminal/imc_terminal.dart' as imc_terminal;
import 'package:imc_terminal/imc_terminal.dart';

void main(List<String> arguments) {
  

  Map<String,dynamic> iniciador = comecoclass();
  Pessoa pessoa = Pessoa(iniciador["Nome"],iniciador["Peso"],iniciador["Altura"]);
  // pessoa.mostraNome();
  pessoa.imc();
}
