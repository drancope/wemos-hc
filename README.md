# This is first basic info for a Wemos Home Control project.
The first atempt was built in summer 2020, controls two ceiling lamps, and uses a wemos wired to the main door switches and to a home made PCB with a pair of opto-couplers (moc3121) and triacs (bt136). It's been working for a year with only two reset problemas, before I engage in this description of the project and a propper redesign.
Two more wemos are also used to emit wifi orders (post http method). These ones are placed in the bed sides for convenience.
The main server creates its own local wifi lan, and mobile phones can get an ip and access the wemos web server, displaying a page where the user can turn on/off the lights.

# Goals:
- use of wemos minicontrollers to switch lights at home,
  -- server to accept mobile orders
  -- reliable if home router fails
  
- Expandable
 -- accepting internet orders
   --- a second wemos wired to main wemos, to provide connection to local network.