# BasicSwiftApps - UNDER DEVELOPMENT 🏆

This repo will contain a wide range of different apps written with Swift on purpose to make me a better programmer. </br>
The level of difficulty will increase with time. </br>
I would like to relearn the basics to have solid knowledge and then make more demanding apps. </br>
All App here is part of this [course](https://codewithchris.com/). I try to learn things that I don't know and also add some extra features to them. </br>
Take a look and ask my questions about it❕ </br>

## Table of Contents

- [Layout](#layout)

- [Card Wars](#card-wars)

- [Picture Guesser](#picture-guesser)

- [Cards war game](#improvements)


## Layout - first steps in creating a perfect layout for apps!
<details>
  <summary>Click to expand details!</summary>
  
  This section contains a few apps that helped me to learn layout using Storyboard. </br>
  However these apps don't work in any way, it's just a layout with no action (as this section I dedicated to layout). </br>
  Take a look at the results: </br>

  ### Layout1 app
  <img src="readme_files/layout2.gif" alt="layout2" width="340"/> </br>

  ### Layou2 app
  <img src="readme_files/layout3.gif" alt="layout3" width="340"/>  </br>

  ### Fitness app
  <img src="readme_files/fitness.gif" alt="fintess" width="340"/>  </br>

  ### Social Squid app
  <img src="readme_files/SocialSquid.gif" alt="sociasquid" width="340"/>  </br>
  </details>


## Card Wars - simple user/CPU game with a lot of fun!
<details>
  <summary>Click to expand details!</summary>
  My first bigger app was made with the help of this course. </br>
  This is a classic card war game. The purpose of this game is to compare card and user/CPU with bigger card wins. </br>
  Cards are being shown randomly as in real life. </br> 
  The user needs to press the "DEAL" button to start a new round. App automatically shows a card for user and CPU and gives a point to the winner. </br>
  Besides using StackView in layout, I have made IBOutlet and IBActions make it works. </br>
  Take a look at details in the project 👀.</br>
  ### Cards war game
 
 <img src="readme_files/cardswar.gif" alt="cardswar" width="340"/>  </br>
  
</details>

## Guessing picture - guess whre are the same picture!
<details>
  <summary>Click to expand details!</summary>
  Classic game where the user has to find the same pictures. </br>
  Each of the cards is upside down, by pressing on its the user can temporarily show the front of the card. </br>
  However, when she/he presses on the second card and the card aren't the same both of them are put upside-down once again. </br>
  Of course, when the user guesses two cards correctly there are being removed from the rest. </br>
 The goal of the game is to guess all the cards before time runs out. BE QUICK! </br>
  
  In this project I have used:
  - timer to measure time (it is working even when user is scrolling)
  - AVFoundation to play sounds
  - CollectionView
  - delegate and datasource for CollectionView
  - CocoaTouch classes


  ### Cards war game
  demo: </br>
  <img src="readme_files/guessing_demo.gif" alt="guessing_demo" width="892"/>  </br>
  
  game over: </br>
  <img src="readme_files/guessing_game_over.gif" alt="guessing_game_over" width="892"/>  </br>
  
  demo: </br>
  <img src="readme_files/guessing_game_won.gif" alt="guessing_game_won" width="892"/>  </br>
</details>
