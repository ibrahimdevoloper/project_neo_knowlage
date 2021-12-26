import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:project_neo_knowlage/MQTT/configuration.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  MQTTClient mqtt = MQTTClient(server: "192.168.1.11", clientID: "id1");
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    mqtt.connect().then((value) {
      if (value) {
        mqtt.subscribe("processing1", MqttQos.atLeastOnce);
        mqtt.subscribe("processing2", MqttQos.atLeastOnce);
        mqtt.publish("/hello", MqttQos.atLeastOnce, "hello from flutter");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: 100,
              width: double.infinity,
            ),
            const Text("data from MQTT"),
            SizedBox(
              width: 200,
              height: 100,
              child: StreamBuilder(
                stream: mqtt.client.updates,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Center(
                        child: Text(mqtt.getStringData(snapshot.data)));
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
