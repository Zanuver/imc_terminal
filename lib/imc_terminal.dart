import 'dart:ffi';
import 'dart:io';
import 'dart:math';

class Pessoa {
  String? _nome;
  double? _peso;
  double? _altura;
  Pessoa(String nome, double peso,double altura){
    _nome = nome;
    _altura = altura;
    _peso = peso;
  }
  
  void mostraNome(){
    print(_nome);
  }
  void imc(){
      if(_peso != null && _altura != null){
        double total = _peso!/pow(_altura!, 2);
        print( "O total do IMC do(a) $_nome é ${total.toStringAsFixed(2)}, indica ${_classificarIMC(total)}");
    }else{
      print("Altura ou peso incorretos");
    }
    
  }
  
}

Map<String,dynamic> comecoclass(){
  String nome = _comecoNome();
  double altura = _comecodouble("Altura");
  double peso = _comecodouble("Peso");
  Map<String,dynamic> pessoa = {
    "Nome" : nome,
    "Altura" : altura,
    "Peso" : peso
  };

  return pessoa;
}

String _classificarIMC(double imc) {
  if (imc < 16) return 'Magreza grave';
  else if (imc >= 16 && imc < 17) return 'Magreza moderada';
  else if (imc >= 17 && imc < 18.5) return 'Magreza leve';
  else if (imc >= 18.5 && imc < 25) return 'Saudável';
  else if (imc >= 25 && imc < 30) return 'Sobrepeso';
  else if (imc >= 30 && imc < 35) return 'Obesidade Grau 1';
  else if (imc >= 35 && imc < 40) return 'Obesidade Grau 2(Severa)';
  else return 'Obesidade Grau 3(Morbida)';
}

String _comecoNome(){
  String? nome;
  while (true) {
    stdout.write("Digite o nome: ");
    nome = stdin.readLineSync();
    if (nome != null && nome.isNotEmpty) {
      break;
    } else{
      print("Nome incorreto, tente novamente.");
    }
  }
  
  return nome;
}

double _comecodouble(String tipo){
  double? number;

  while (true) {
    stdout.write("Digite o(a) $tipo: ");
    String? input = stdin.readLineSync();

    if (input != null && input.isNotEmpty) {
      try {
        number = double.parse(input);
        if (number>0) {
          return number;
        }else{
          print("Digite um numero maior que 0, tente novamente. ");
          continue;
        }
        
      } on FormatException {
        print("Digite apenas numeros, tente novamente. ");
      }
    }else{
      print("Digite um numero");
    }
  }
  
}