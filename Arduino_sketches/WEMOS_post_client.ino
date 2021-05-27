/**
   PostHTTPClient.ino

    Created on: 21.11.2016

*/

#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <PolledTimeout.h>
#define USE_SERIAL Serial

/* this can be run with an emulated server on host:
        cd esp8266-core-root-dir
        cd tests/host
        make ../../libraries/ESP8266WebServer/examples/PostServer/PostServer
        bin/PostServer/PostServer
   then put your PC's IP address in SERVER_IP below, port 9080 (instead of default 80):
*/
//#define SERVER_IP "10.0.1.7:9080" // PC address with emulation on host
#define SERVER_IP "192.168.4.1"

#ifndef STASSID
#define STASSID "Wemos_access_point_name"
#define STAPSK  "access_point_password"
#endif
IPAddress ip(192, 168, 4, 2);
IPAddress gateway(192, 168, 4, 1);
IPAddress subnet(255, 255, 255, 0);
IPAddress dns1(192, 168, 4, 1);
//esp8266::polledTimeout::periodicFastUs halfPeriod(100000);

void setup() {
  pinMode(D5, INPUT_PULLUP);
  pinMode(D1, INPUT_PULLUP);

  USE_SERIAL.begin(115200);
  USE_SERIAL.println();

  WiFi.mode(WIFI_STA);
//  WiFi.config(ip, gateway, subnet, dns1);
  WiFi.begin(STASSID, STAPSK);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    USE_SERIAL.print(".");
  }
  USE_SERIAL.println("");
  USE_SERIAL.print("Connected! IP address: ");
  USE_SERIAL.println(WiFi.localIP());
 
}

void loop() {
  // wait for WiFi connection
  while (digitalRead(D5)) {
    yield();
  }
    if ((WiFi.status() == WL_CONNECTED)) {

    WiFiClient client;
    HTTPClient http;

    USE_SERIAL.print("[HTTP] begin...\n");
    // configure traged server and url
    http.begin(client, "http://"SERVER_IP"/postplain/"); //HTTP
    http.addHeader("Content-Type", "application/json");

    USE_SERIAL.print("[HTTP] POST...\n");
    // start connection and send HTTP header and body
    int httpCode = http.POST("bot1=1");
    USE_SERIAL.printf("[HTTP] POST... code: %d\n", httpCode);
        
    // httpCode will be negative on error
    if (httpCode > 0) {
      // HTTP header has been send and Server response header has been handled

      // file found at server
      if (httpCode == HTTP_CODE_OK) {
        const String& payload = http.getString();
        USE_SERIAL.println("received payload:\n<<");
        USE_SERIAL.println(payload);
        USE_SERIAL.println(">>");
      }
      while (!digitalRead(D5)) {delay(20);}
    } else {
      USE_SERIAL.printf("[HTTP] POST... failed, error: %s\n", http.errorToString(httpCode).c_str());
    }

    http.end();
  }
  delay(300);
}
