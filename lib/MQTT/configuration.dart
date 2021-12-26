// ignore_for_file: avoid_print

import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MQTTClient {
  late final MqttServerClient client;
  bool isConnected = false;
  MQTTClient({
    required String server,
    required String clientID,
  }) {
    client = MqttServerClient(server, clientID);
  }

  disconnect() {
    client.disconnect();
  }

  Future<bool> connect() async {
    print("Connecting MQTT Broker");

    client.logging(on: true);
    client.keepAlivePeriod = 20;
    client.port = 1883;
    client.secure = false;
    client.onConnected = onConnected;
    client.onDisconnected = onDisconnected;
    client.pongCallback = pong;

    await client.connect();
    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      print("Connected to Mosquitto Successfully!");
    } else {
      return false;
    }
    return true;
  }

  String getStringData(Object? streaming) {
    final mqttReceivedMessages =
        streaming as List<MqttReceivedMessage<MqttMessage?>>?;
    final data = mqttReceivedMessages![0].payload as MqttPublishMessage;
    return String.fromCharCodes(data.payload.message);
  }

  void subscribe(String topic, MqttQos qos) {
    if (isConnected) {
      print(topic);
      client.subscribe(topic, qos);
    }
  }

  void publish(String topic, MqttQos qos, String data) {
    final builder = MqttClientPayloadBuilder();
    builder.addString(data);
    if (isConnected) {
      client.publishMessage(
        topic,
        qos,
        builder.payload!,
      );
    }
  }

  void onConnected() {
    print("Client connection was successful");
    isConnected = true;
  }

  void onDisconnected() {
    print("Client Disconnected");
    isConnected = false;
  }

  void pong() {
    print('Ping response client callback invoked');
  }
}
