# Necessary Behavior App
## Overview
This is the beginning draft of an app that will generate tarot readings and daily affirmations. There is no UI since another team of people will be working on that portion. All of the coding was done using Swift in XCode.
## Code Description (TO BE EDITED)
Currently the tarot card portion of the app is functioning. When the user enters the app, they can click the tarot button which will bring them to a second screen and will initially run the code to show a singular random card and display the name. Since in a real tarot reading the cards can be "reversed", the app also allows for that to happen and will include "reversed" in the name of the card displayed. There is a button in the bottom menu that allows for users to have two cards pulled. This function does the same thing as a singular card except with an additional card added this time. The user can switch back and forth between having singular and double cards pulled.

This functions by having the cards sorted into an array. There is a function that gets the number of cards in the array and then shows a number of random cards before showing the final random card which will be what is chosen for the user. This allows for an animation that appears as if someone is shuffling the cards. 

When a person chooses the double cards option, a function resizes the singular card so that it is smaller and then adds the second card that is the same size as the resized singular card. A label is also added for the second card. 

When the user goes back to the singular card option after getting double cards, the second card is made invisible and the first card is resized back to the orignial size.

The daily affirmations section of the app will essentially have the same functions. We are waiting on the graphic design team to come up with those images.
## Bugs & Fixes
The sizing and proportions of the images might need to be fixed depending on what device the user is on. Additionally, a dictionary needs to be made so that the actual names of the cards will be aligned with the numbers currently associated with the images.
### Credits
The iOS back-end portion of the app is currently being worked on by Sinclaire Schuetze.
