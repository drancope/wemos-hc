# This is first basic info for a Wemos Home Control project.
The first atempt was built in summer 2020, controls two ceiling lamps, and uses a wemos wired to the main door switches and to a kicad home made PCB with a pair of opto-couplers (moc3121) and triacs (bt136). It's been working for a year with only two reset problemas, before I engage in this description of the project and a propper redesign.
Two more wemos are also used to emit wifi orders (post http method). These ones are placed in the bed sides for convenience.
The main server creates its own local wifi lan, and mobile phones can get an ip and access the wemos web server, displaying a page where the user can turn on/off the lights.
Code is based on ESP8266 examples

# Goals:
- learning and experimenting with mc and electronics
 -- programming servers, use of wifi libraries
 -- making PCBs with power devices

- use of wemos minicontrollers to switch lights at home,
  -- server to accept mobile orders
  -- reliable if home router fails
  -- initially, does not depend on iot standards, but considering learning about that.
  
- Expandable
 -- accepting internet orders
   --- a second wemos wired to main wemos, to provide connection to local network.
   --- future use of cloud computing, or aws iot messages.