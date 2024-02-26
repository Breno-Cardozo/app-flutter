import 'package:flutter/material.dart';
import 'package:flutter_gymapp/componentes/decoration_campo_autenticacao.dart';
import 'package:flutter_gymapp/telas/minhas_cores.dart';

class AutenticacaoTela extends StatefulWidget {
  const AutenticacaoTela({super.key});

  @override
  State<AutenticacaoTela> createState() => _AutenticacaoTelaState();
}

class _AutenticacaoTelaState extends State<AutenticacaoTela> {
  bool queroEntrar = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset('assets/smartfit.png', height: 200),
                  const Text(
                    "A academia Inteligente",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 165, 160, 160),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    decoration: getAuthenticationInputDecoration("E-mail"),
                    validator: (String? value) {
                      if (value == null) {
                        return "O e-mail não pode ser vazio";
                      }
                      if (value.length < 5) {
                        return "O e-mail é muito curto!";
                      }
                      if (!value.contains("@")) {
                        return "O e-mail não é válido!";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    decoration: getAuthenticationInputDecoration("Senha"),
                    obscureText: true,
                    validator: (String? value) {
                      if (value == null) {
                        return "A senha não pode ser vazia!";
                      }
                      if (value.length < 5) {
                        return "A senha é muito curta!";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  Visibility(
                    visible: !queroEntrar,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: getAuthenticationInputDecoration(
                              "Confirme sua Senha"),
                          obscureText: true,
                          validator: (String? value) {
                            if (value == null) {
                              return "A confirmação de senha não pode ser vazia!";
                            }
                            if (value.length < 5) {
                              return "A confirmação de senha não confere";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          decoration:
                              getAuthenticationInputDecoration("Nome completo"),
                          validator: (String? value) {
                            if (value == null) {
                              return "O nome não pode ser vazio";
                            }
                            if (value.length < 5) {
                              return "O nome é muito curto!";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      botaoPrincipalClicado();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MinhasCores.amareloFit,
                      elevation: 5,
                    ),
                    child: Text(
                      (queroEntrar) ? "Entrar" : "Cadastrar",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 0.0, top: 10.0),
                    child: Divider(),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        queroEntrar = !queroEntrar;
                      });
                    },
                    child: Text(
                      (queroEntrar)
                          ? "Ainda não tem uma conta? Cadastre-se!"
                          : "Já tem uma conta? Entre por aqui",
                      style: TextStyle(color: MinhasCores.amareloFit),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  botaoPrincipalClicado() {
    if (_formKey.currentState!.validate()) {
      print("valido");
    } else {
      print("invalido");
    }
  }
}
