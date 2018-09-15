/* MINIMAL WEB SERVER: Create a WiFi access point and provide a web server on it. */

#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <ESP8266WebServer.h>

/* Set these to your desired credentials. */
const char *ssid = "MackieLand"; 
const char *password = "thereisnospoon";

ESP8266WebServer server(80);

/* Just a little test message.  Go to http://192.168.4.1 in a web browser
 * connected to this access point to see it.
 */
void handleRoot() {
        server.send(200, "text/html", 
                         "<p>Hello World</p>");
}

void setup() {
        delay(1000);
        Serial.begin(115200);
        Serial.println();
        Serial.print("Configuring access point...");
        WiFi.softAP(ssid, password);

        IPAddress myIP = WiFi.softAPIP();
        Serial.print("AP IP address: ");
        Serial.println(myIP);
        
        server.on("/", handleRoot);
        server.begin();
        Serial.println("HTTP server started");
}

void loop() {
        server.handleClient();
}


