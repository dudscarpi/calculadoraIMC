import 'dart:convert';
import 'dart:io';

class Pessoa {
  String nome;
  double peso;
  double altura;

  Pessoa(this.nome, this.peso, this.altura);
}

double calcularIMC(double peso, double altura) {
  if (altura <= 0) {
    throw Exception("Altura deve ser maior que zero.");
  }

  return peso / (altura * altura);
}

String classificarIMC(double imc) {
  if (imc < 16) {
    return "Magreza grave";
  } else if (imc < 17) {
    return "Magreza moderada";
  } else if (imc < 18.5) {
    return "Magreza leve";
  } else if (imc < 25) {
    return "Saudável";
  } else if (imc < 30) {
    return "Sobrepeso";
  } else if (imc < 35) {
    return "Obesidade Grau I";
  } else if (imc < 40) {
    return "Obesidade Grau II (severa)";
  } else {
    return "Obesidade Grau III (mórbida)";
  }
}

void main(List<String> arguments) {
  print("Bem-vindo à calculadora de IMC!");

  print("Informe o seu nome: ");
  var nome = stdin.readLineSync(encoding: utf8) ?? "";

  try {
    print("Informe o seu peso (em kg): ");
    var peso = double.tryParse(stdin.readLineSync(encoding: utf8) ?? "0") ?? 0;

    print("Informe a sua altura (em metros): ");
    var altura =
        double.tryParse(stdin.readLineSync(encoding: utf8) ?? "0") ?? 0;

    var pessoa = Pessoa(nome, peso, altura);
    var imc = calcularIMC(pessoa.peso, pessoa.altura);
    var categoria = classificarIMC(imc);

    print("O IMC de ${pessoa.nome} é: $imc");
    print("Classificação: $categoria");
  } catch (e) {
    print("Erro: $e");
  }
}
