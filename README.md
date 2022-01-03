# Swift Programming 🏆

This repo will contain a wide range of different apps written with Swift on purpose to make me a better programmer. </br>
The level of difficulty will increase with time. </br>
I would like to relearn the basics to have solid knowledge and then make more demanding apps. </br>
All App here are part of this [course](https://codewithchris.com/) and this [course](https://www.udemy.com/course/ios-13-app-development-bootcamp/) 👀.</br>
I try to learn things that I don't know and also add some extra features. </br>
Take a look and ask my questions about it❕ </br>


# Swift foundations 👶

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

## Guessing picture - guess where are the same picture!
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
  
  game won: </br>
  <img src="readme_files/guessing_game_won.gif" alt="guessing_game_won" width="892"/>  </br>
</details>

## Star Wars Delegate-Protocol - app to show how delegate-protocol works!
<details>
  <summary>Click to expand details!</summary>
  This app is based on turoial* which helped me to understand how delegating in Swift works. </br>
  Delegate - Protocol is similar to master - slave. </br>
  FirstScreen (just showing something) is slave and SecondScreen(know information from user and send it to first screen) is master. </br>
  Base on the picked side (in SecondScreen) we are showing specific data back on the FirstScreen. </br>
  In the and we can use the function in the FirstScreen when arguments to it come from this function being called in SecondScreen. </br> </br>
  
  [*link to the tutorial](https://youtu.be/DBWu6TnhLeY)
  
  ### Demo:
 
 <img src="readme_files/Delegate.gif" alt="Delegate" width="340"/>  </br>
  
</details>

## Quiz app - parsing JSON into a quiz!
<details>
  <summary>Click to expand details!</summary>
  Quiz app that uses JSON to create the whole quiz. </br>
  The user has to click on the right answer and then the user's choice is being checked. </br>
  If it's the right answer user gets a point and if he/she is wrong there's no point. </br>
  After all question popup window with a score and restart button is being shown. </br>
  If users close this app, the state of the game is being saved and loaded using UserDefaults. </br> </br>
  
  What I ahve learned and applied in this app:
  - delegate / protocol patern
  - JSON decoding and parsing
  - Networking used to dowload JSON
  - TableView
  - UserDefaults
  - basic animations
  
  Please take a look at app and all its functionality: </br>
  
  ### Demo:
 
 <img src="readme_files/Quiz_game.gif" alt="quiz game" width="386"/>  </br>
 
 ### Saving context:
 
 <img src="readme_files/Quiz_saving_context.gif" alt="quiz saving" width="386"/>  </br>
 
 ### End of game:
 
 <img src="readme_files/Quiz_gameover.gif" alt="quiz end of game" width="386"/>  </br>
  
</details>

## News app - using API to dowload news!
<details>
  <summary>Click to expand details!</summary>
  News app is an app that help user to find best news. </br>  
  In this app I am using news API to fetch most important news for US (this could be changed).  </br> 
  The main screen of the app is just a TableView with title and photo (if exists) of every article. </br>
  The user can click on each article to open its full version via WebView. </br> </br>
  
  What I ahve learned and applied in this app:
  - using API to download and data
  - performing segues and using NavigationController
  - using WebView
  - using activity indicator
  
  [news API link](https://newsapi.org/) </br>
  
  Please take a look at app and all its functionality: </br>
  
  ### Demo:
 
 <img src="readme_files/News_app.gif" alt="News App" width="386"/>  </br>
 
 ### Details:
 
 <img src="readme_files/News_details.gif" alt="news details" width="386"/>  </br>
 
  
</details> </br>

# Databases 💾

## Firebase basics
<details>
  <summary>Click to expand details!</summary>
  This app is just a project where I have been learning CRUD with Firebase. </br>
  I won't attach any gifs because all this app does is perform CRUD with no visual effects. </br>
  
</details>

## Journal App - Firebase powered app for saving and quering notes!
<details>
  <summary>Click to expand details!</summary>
  Journal app for saving notes with help of Firebase. </br>
  I have been using Firebase methods to CRUD data and also created a basic UI. </bd>
  
  ### Demo:
 
 <img src="readme_files/JournalAppDemo.gif" alt="News App" width="350"/>  </br>
  
</details>


## PhotoApp - UIImagepicker, Firebase auth and listeners
<details>
  <summary>Click to expand details!</summary>
  In this app I have implemented:
  - authentication and login in with Firebase auth
  - uploading and downloading photos with Firebase storage
  - Taking pictures or picking pictures with UIImagepicker
  
  All of the functions mentioned above are shown on gifs:
  
  ### Creating a user:
 <img src="readme_files/Photo_creatingnewuser.gif" alt="News App" width="350"/>  </br>
 
  ### Log in:
 <img src="readme_files/Photo_LoginIn.gif" alt="News App" width="350"/>  </br>
 
 ### Upload a new photo:
 <img src="readme_files/Photo_new_photo.gif" alt="News App" width="350"/>  </br>
 
 ### Sign out:
 <img src="readme_files/Photo_signout.gif" alt="News App" width="350"/>  </br>
 
</details>

## Guidebook App (CoreData) - Using CoreData as DB, MapView and mooooore!
<details>
  <summary>Click to expand details!</summary>
  An app containing CoreData as database technology. </br>
  Users can view locations, add notes about them and see them in mapView. </br>
  All the data is being stored inside CoreData so users don't have to worry about losing data when the app will be closed. </br>
  
  ### Demo:
 
 <img src="readme_files/GuideBook_coredata_demo.gif" alt="News App" width="350"/>  </br>
  
</details>


## Guidebook App (Realm) - upgraded verion of previous app now using Realm DB.
<details>
  <summary>Click to expand details!</summary>
  In this app I have used Mongo DB Realm database. </br>
  Futhermore app works similar to previous verions with few upgrades. </br>
  User now can calculate route to the specyfic point or locate user. </br>
  
  ### Demo:
 
 <img src="readme_files/GuideBook_demo.gif" alt="News App" width="350"/>  </br>
 
 ### Route:
 
 <img src="readme_files/GuideBook_route.gif" alt="News App" width="350"/>  </br>
  
</details>

# iOS App Design 

## MealApp - building iOS App with Figma design.
<details>
  <summary>Click to expand details!</summary>
  The purpose of this project was to build an app from Figma UI design. </bd>
  The case of this app was to try to rebuild the app as it was designed in Figma. </br>
  Also besides building UI in Swift, I have learned the basics of UI.UX design and Figma. </br> <br>
  
  Here are screeanshots of Figma design: </br>
  <img src="readme_files/figma1.png" alt="News App" width="719"/>  </br>
  <img src="readme_files/figma2.png" alt="News App" width="707"/>  </br>
  
  ### App Demo:
 <img src="readme_files/MealAppDemo.gif" alt="News App" width="350"/>  </br>
  
</details>
