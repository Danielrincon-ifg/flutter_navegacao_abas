import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Classe principal do aplicativo
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atividade BottomNavigationBar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MainPage(),
    );
  }
}

// Tela principal que gerencia o estado da barra de navegação inferior
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Índice inicial da aba selecionada (0 = Início)
  int _selectedIndex = 0;

  // Lista de telas correspondentes a cada aba
  static const List<Widget> _pages = <Widget>[
    InicioScreen(),
    NoticiasScreen(),
    PerfilScreen(),
  ];

  // Cores diferentes para cada aba, conforme os requisitos
  static const List<Color> _tabColors = <Color>[
    Colors.red, // Cor para a aba Início
    Colors.orange, // Cor para a aba Notícias
    Colors.blue, // Cor para a aba Perfil
  ];

  // Método chamado quando o usuário toca em uma aba
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App com BottomNavigationBar'),
        backgroundColor: _tabColors[_selectedIndex], // A cor do AppBar muda conforme a aba ativa
      ),
      body:
          _pages[_selectedIndex], // Exibe a tela correspondente ao índice atual
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Notícias'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor:
            _tabColors[_selectedIndex], // Cor do ícone/texto ativo
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

// 1. Tela Início: mostra texto de boas-vindas e uma imagem
class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bem-vindo!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Imagem da internet (exemplo de placeholder)
            Image.asset(
              'assets/image/ola-23.gif',
              height: 200,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}

// 2. Tela Notícias: mostra uma lista simples (ListView) com 5 manchetes fictícias
class NoticiasScreen extends StatelessWidget {
  const NoticiasScreen({super.key});

  // Lista com 5 manchetes fictícias
  final List<String> _manchetes = const [
    'Vscode: conheça as principais novidades do editor de código.',
    'JavaScript 2026: As principais tendências para desenvolvedores.',
    'Conheça as novas funcionalidades do Flutter 3.24.',
    'Inteligência Artificiaç ajuda no desenvolvimento de aplicativos.',
    'Novas funcionalidades chegam ao Flutter.',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _manchetes.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: ListTile(
            leading: const Icon(Icons.newspaper, color: Colors.black),
            title: Text(
              _manchetes[index],
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text('Manchete ${index + 1}'),
          ),
        );
      },
    );
  }
}

// 3. Tela Perfil: mostra o nome do usuário e sua imagem
class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Imagem de perfil circular
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage('https://picsum.photos/200'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Daniel Francisco de Maria da Fonseca Rincon',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Estudante de Sistemas de Informação - IF Goiano',
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
