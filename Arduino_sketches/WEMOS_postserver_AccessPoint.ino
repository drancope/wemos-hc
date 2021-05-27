#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <ESP8266WebServer.h>
#include <ESP8266mDNS.h>
#include <string.h>

#ifndef STASSID
#define STASSID "your_wifi"
#define STAPSK  "your_wifi_passwd"
#endif
#ifndef APSSID
#define APSSID "this_wemos_wifi_access_point_name"
#define APPSK  "access_point_passwd"
#endif

#define SAL1 D3
#define SAL2 D2
#define ENT1 D5
#define ENT2 D6

const char *ssid     = APSSID;
const char *password = APPSK;
boolean estado1=0;
boolean estado2=0;

ESP8266WebServer server(80);

const int led = LED_BUILTIN;

const String postForms = "<html>\
  <head>\
    <title>ESP8266 Web Server POST handling</title>\
    <style>\
      body { background-color: #cccccc; font-size: xx-large; font-family: Arial, Helvetica, Sans-Serif; Color: #000088; }\
    </style>\
  </head>\
  <body>\
    <h1>POST plain text to /postplain/</h1><br>\
    <form method=\"post\" enctype=\"text/plain\" action=\"/postplain/\">\
      <div style=\"margin:10 80 40\">\
      <input type=\"submit\" style=\"font-size: 120px\" name=\"bot1\" value=\"1\"><br>\<br>\
      <input type=\"submit\" style=\"font-size: 120px\" name=\"bot2\" value=\"2\"><br>\
    </div>\
    </form>\
  </body>\
</html>";

const String redirige = "<html>\
    <head>\
        <meta http-equiv=\"refresh\" content=\"0; url=http://192.168.4.1/?\">\
<script type=\"text/javascript\">\
window.location.href = \"http://192.168.4.1\"\
</script>\
</head>\
</html>";


void handleRoot() {
  server.send(200, "text/html", postForms);
}

void handlePlain() {
  Serial.print(server.arg("plain"));
  
  if (server.method() != HTTP_POST) {
  //  server.send(405, "text/plain", "Method Not Allowed");
  } else {
   char dato = server.arg("plain")[5];
    if (dato=='1'){
      estado1 = !estado1;
      digitalWrite(SAL1, estado1);
    }
    else if (dato=='2') {
      estado2 = !estado2;
      digitalWrite(SAL2, estado2);
    }
   Serial.println(" recibido");
   Serial.print("Luz ");
   Serial.print(dato);
   switch(dato) {
    case '1':
     if (estado1==1) {Serial.println(" encendida");} else {Serial.println(" apagada");}
     break;
    case '2':
     if (estado2==1) {Serial.println(" encendida");} else {Serial.println(" apagada");}
     break;
    }
   }

    server.send(201, "text/html", redirige);
}
/*
void handleForm() {
  if (server.method() != HTTP_POST) {
  //  server.send(405, "text/plain", "Method Not Allowed");
  } else {
   char dato = server.arg("plain")[5];
   Serial.print(server.arg("plain"));
   Serial.println(" recibido");
    if (dato=='1'){
      estado1 = !estado1;
      digitalWrite(led, estado1);
    }
    else if (dato=='2') {
      estado2 = !estado2;
      digitalWrite(D3, estado2);
    }
    server.send(201, "text/html", redirige);
  }
}
*/
void handleNotFound() {
//  digitalWrite(led, 1);
  String message = "File Not Found\n\n";
  message += "URI: ";
  message += server.uri();
  message += "\nMethod: ";
  message += (server.method() == HTTP_GET) ? "GET" : "POST";
  message += "\nArguments: ";
  message += server.args();
  message += "\n";
  for (uint8_t i = 0; i < server.args(); i++) {
    message += " " + server.argName(i) + ": " + server.arg(i) + "\n";
  }
  server.send(404, "text/plain", message);
  Serial.println(message);
//  digitalWrite(led, 0);
}

void setup(void) {
  pinMode(SAL1, OUTPUT);
  pinMode(SAL2, OUTPUT);
  digitalWrite(SAL1, 0);
  digitalWrite(SAL2, 0);
  delay(400);
  Serial.begin(115200);
  Serial.println("");
  Serial.print("Configuring access point...");
  WiFi.softAP(ssid, password);
  IPAddress myIP = WiFi.softAPIP();
  Serial.print("AP IP address: ");
  Serial.println(myIP);
  server.on("/", handleRoot);
  server.on("/postplain/", handlePlain);
  server.onNotFound(handleNotFound);
  server.begin();
  Serial.println("HTTP server started");
  delay(1000);
  pinMode(SAL1, OUTPUT);
  pinMode(SAL2, OUTPUT);
  pinMode(ENT1, INPUT_PULLUP);
  pinMode(ENT2, INPUT_PULLUP);
  digitalWrite(SAL1, estado1);
  digitalWrite(SAL2, estado2);
}

void loop() {
  if (!digitalRead(ENT1)) {
    estado1 = !estado1;
    digitalWrite(SAL1, estado1);
    while(!digitalRead(ENT1)) {delay(20);}
  }
  if (!digitalRead(ENT2)) {
    estado2 = !estado2;
    digitalWrite(SAL2, estado2);
    while(!digitalRead(ENT2)) {delay(20);}
  }
  server.handleClient();
}
