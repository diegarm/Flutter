import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(leading: Container(), title: Text('Tarefas')),
        body: ListView(
          children: [
            Task('Tarefa 1', 'https://images.squarespace-cdn.com/content/v1/5a832f4ad0e62892b8e61f61/d04b7839-e580-4031-bba2-0e8fcd8af6e4/11.png?format=1500w'),
            Task('Tarefa 2', 'https://images.squarespace-cdn.com/content/v1/5a832f4ad0e62892b8e61f61/8dbf7793-852a-44b2-97fb-b79d1d5d71d5/18.png?format=1500w'),
            Task('Tarefa 3', 'https://images.squarespace-cdn.com/content/v1/5a832f4ad0e62892b8e61f61/fa2528eb-9865-447a-9a35-cce1aed53f83/1.png?format=1500w'),
            Task('Tarefa 4', 'https://images.squarespace-cdn.com/content/v1/5a832f4ad0e62892b8e61f61/07aa9b81-bda0-4136-9854-b24c135222e3/12.png?format=1500w'),
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {}),
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  const Task(this.nome, this.foto, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              color: Colors.blue,
              height: 140,
            ),
            Column(
              children: [
                Container(
                    color: Colors.white70,
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            color: Colors.black26,
                            width: 72,
                            height: 100,
                            child: Image.network(
                              widget.foto,
                              fit: BoxFit.cover,
                            )),
                        Text(widget.nome, style: TextStyle(fontSize: 24)),
                        Container(
                          height: 52,
                          width: 52,
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  nivel++;
                                });
                              },
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.arrow_drop_up),
                                  Text('UP', style: TextStyle(fontSize: 12))
                                ],
                              )),
                        )
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: LinearProgressIndicator(
                            color: Colors.white, value: nivel / 10),
                        width: 200,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text('Nivel: $nivel',
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ],
                )
              ],
            )
          ],
        ));
  }
}
