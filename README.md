# Project Room Management System
This repo contains an implementation of a project room management system using *Verilog* on an *Altera DE2-115* board.

## Description
This system is an implementation to how a door lock system would function. It has two modes, *normal mode* and *administrator mode*, each with a set of features and privileges.

## Hardware Used
- Altera DE2-115 FPGA board
- PS2 keyboard

## Software Used
- Altera Quartus II Version 9.1 Web Edition

## Components Used
The components of the FPGA used were:
- LCD
- LEDs
- Push button
- Switches

## Design 
The project was tackled through the use of a *Finite State Machine*.
![fsmproject](https://user-images.githubusercontent.com/92987443/173163881-73d1bd1b-bac1-4b37-808d-7f8d1bd666ed.png)


## Normal Mode Features
- A user which is part of originally five registered users would enter their ID.
  - If the ID is valid, the user is allowed access.
  - Else, access is denied and the door stays locked.
  - If the room is full (capacity initially set to 2) the user is denied access.
- A user inside the room can press on the relevant push button to leave the room.

The relevant statements displayed on the LCD and LEDs toggling patterns is established (further elaborated in the report).

## Administrator Mode Features
- An admin which is part of originally two registered admins would enter their ID, after pressing *Alt+Ctrl+A* simultaneously on the keyboard.
  - If the user's ID is a valid admin ID, they are allowed access into admin mode.
  - Else, the system would go back to normal mode.
- After five seconds of entering the admin mode, the admin can choose two options.
  1. Override the room capacity.
  2. Add new user ID.
- If the admin presses 1 on the keyboard, they are prompted to enter the desired room capacity number. 
  - Once entered, they are asked to confirm this number. The system then returns to normal mode.
- If the admin pressed 2, they are prompted to enter the new user's ID (made of nine digits).
  - If the ID already exists, it prompts the admin to insert another one.
  - Else, it adds this new ID and returns to normal mode.
