"Mission Impastable" by Kyle Hodgkinson, Prashant Jayaraman, Chris Pauley, Matthew Tong, and Giovanni Prinzivalli

Book  1 - Actions for asking and telling about things

Chapter  1 - Action Definitions

Section 1 - New actions and grammar

include Basic Help Menu by Emily Short;

When play begins:
	choose row 1 in Table of Basic Help Options;
	now description entry is "You're going to have so much fun.";
	
Table of Instruction Options (continued)
title	description
"Verbs"	"Combine something with something.  Ingite something.  Step on something.  Break something.  Talking to someone.  Ask someone about something.  Organize something.  Spank someone.  Pinch someone.  Smack someone.  Kick someone.  Unsummon someone.  Subjugate someone."


[Credit to I7 for the whole combine function from inform 7 learn website]
[Credit to Eric Eve's "Epistemology" and "Conversation Structure" for help with implementing asking and telling functionality]

A thing can be either seen or unseen. A thing is usually unseen.

Carry out looking (this is the mark items as seen when looking rule): 
  unless in darkness begin;    
  repeat with item running through things that are enclosed by the location begin;   
	   if the item is not enclosed by an opaque closed container, now the item is seen;  
  end repeat;
 end unless.

Carry out opening a container (this is the mark items as seen on opening a container rule):
  repeat with item running through things that are enclosed by the noun begin;   
	   if the item is unseen and the item is visible, now the item is seen;  
  end repeat.

The mark items as seen on opening a container rule is listed after the standard opening rule in the carry out opening rules.

A thing can be familiar or unfamiliar. A thing is usually unfamiliar.

Carry out examining something visible (this is the mark items as seen on examining rule):
 now the noun is familiar;
 now the noun is seen.

Definition: a thing is known if it is familiar or it is seen.
Definition: a thing is unknown if it is not known.

Requesting it for is an action applying to two visible things.
Imploring it for is an action applying to one visible thing and one topic.

Understand the command "ask" as something new.

Understand "ask [someone] about [text]" as asking it about.

Understand "ask [someone] for [any known thing]" as requesting it for.
Understand "ask [someone] for [text]" as imploring it for.

Quizzing it about is an action applying to two visible things.

Understand "ask [someone] about [any known thing]" as quizzing it about.

Informing it about is an action applying to two visible things.

Understand "tell [someone] about [any known thing]" as informing it about.

Section 2 - Specifications

The specification of the quizzing it about action is "This action responds to commands like ASK FRED ABOUT BOAT, where BOAT is a thing defined in the game, rather than a topic."

The specification of the informing it about action is "This action responds to commands like TELL FRED ABOUT BOAT, where BOAT is a thing defined in the game, rather than a topic."

The specification of the requesting it for action is "This action effectively replaces the library's asking it for action. Like asking it for it matches ASK BOB FOR SOMETHING, but unlike asking it for it makes no assumptions that this is equivalent to BOB, GIVE ME SOMETHING. Instead it can match any object known to the player, and the response can be anything we care to define."

The specification of the imploring it for action is "This action provides handling for ASK SOMEONE ABOUT SOMETHING where SOMETHING is a topic rather than a thing, e.g. ASK BILL FOR ADVICE."


Chapter  2 - Some useful default rules

Report informing someone about something (this is the block informing rule):
  say "There is no reply."

Report quizzing someone about something (this is the block quizzing rule):
  say "There is no reply."

Instead of asking a female person about "herself" (this is the asking a woman about herself rule):
  try quizzing the noun about the noun.

Instead of asking a male person about "himself" (this is the asking a man about himself rule):
  try quizzing the noun about the noun.


Book  2 - Abbreviated commands for addressing the current interlocutor

The current interlocutor is an object that varies.
The current interlocutor is nothing.

Implicit-asking is an action applying to one topic.

Understand "ask about [text]" or "a [text]" as implicit-asking.

implicit-telling is an action applying to one topic.

Understand "t [text]" as implicit-telling.

implicit-quizzing is an action applying to one visible thing.
  Understand "ask about [any known thing]" or "a [any known thing]" as implicit-quizzing.

implicit-informing is an action applying to one visible thing.
  Understand "t [any known thing]" or "talk about [any known thing]" as implicit-informing.

implicit-requesting is an action applying to one visible thing.
  Understand "ask for [any known thing]" as implicit-requesting.

implicit-imploring is an action applying to one topic.
  Understand "ask for [text]" as implicit-imploring.

implicit-asking is implicit-conversing. 
implicit-telling is implicit-conversing. 
implicit-quizzing is implicit-conversing. 
implicit-informing is implicit-conversing.
implicit-requesting is implicit-conversing.
implicit-imploring is implicit-conversing.

Before implicit-conversing when the current interlocutor is nothing (this is the implicit-conversing needs current interlocutor rule):
let np be the number of visible people who are not the player;
if np is 0,  say "There's no one here to talk to.";
if np > 1, say "You need to specify who you want to speak to.";
if np is not 1, stop the action;
let the interlocutor be a random visible person who is not the player;
 if the interlocutor is a person begin;
   say "(addressing [the interlocutor])";
   let sn be the second noun;
   implicitly greet the interlocutor;
   now the second noun is sn;
 otherwise ;
  say "You're not talking to anyone.";
  stop the action;
end if.

Before implicit-conversing when the current interlocutor is not visible and the current interlocutor is not nothing  (this is the can't converse with absent interlocutor rule):
  say "[The current interlocutor] isn't here.";
  reset the interlocutor instead.

Instead of implicit-asking:
  try asking the current interlocutor about it.

Instead of implicit-telling:
  try telling the current interlocutor about it.

Instead of implicit-quizzing:
  try quizzing the current interlocutor about the noun.

Instead of implicit-informing:
  try informing the current interlocutor about the noun.

Instead of implicit-requesting:
  try requesting the current interlocutor for the noun.

Instead of implicit-imploring:
  try imploring the current interlocutor for it.

[
After reading a command when the player's command matches "a [thing]" and the current interlocutor is not a person:
  if the number of visible people who are not the player > 1 begin;
	 say "Whom do you want to ask?";
	 reject the player's command;
  end if.
]

Book 3 - Greeting Protocols

Chapter 1 - Greeting Definitions

Asking someone about something is conversing.
Telling someone about something is conversing.
Quizzing someone about something is conversing.
Informing someone about something is conversing.
Answering someone that something is conversing.
Asking someone for something is conversing.
Requesting someone for something is conversing.
Imploring someone for something is conversing.

Asking someone about something is speaking.
Telling someone about something is speaking.
Quizzing someone about something is speaking.
Informing someone about something is speaking.
Answering someone that something is speaking.
Asking someone for something is speaking.
Requesting someone for something is speaking.
Imploring someone for something is speaking.


Saying yes is speaking.
Saying no is speaking.
Saying sorry is speaking.


Chapter  2 - Greeting

Before conversing when the noun is not the current interlocutor (this is the greet a new interlocutor rule):
  implicitly greet the noun;
  if the noun is not the current interlocutor, stop the action.

Before showing something to someone when the second noun is not the current interlocutor (this is the showing needs an interlocutor rule):        
  implicitly greet the second noun;
  if the second noun is not the current interlocutor,  stop the action.
 
Before giving something to someone when the second noun is not the current interlocutor (this is the giving needs an interlocutor rule):
  if the current interlocutor is not a person, abide by the implicit-conversing needs current interlocutor rule;
  implicitly greet the second noun;
  if the second noun is not the current interlocutor, stop the action.

Before asking someone to try doing something when the person asked is not the current interlocutor (this is the giving orders needs an interlocutor rule):
  implicitly greet the person asked;
  if the person asked is not the current interlocutor, stop the action.

To implicitly greet (character - a thing):
  now the greeting type is implicit;
  try saying hello to the character.

Saying hello to is an action applying to one visible thing.

Understand "greet [something]" or "say hello/hi to [something]" as saying hello to.

Check saying hello to a person when the noun is the current interlocutor (this is the can't greet current interlocutor rule):
	if the noun is the player, say "Talking to yourself is unrewarding." instead;
	say "You are already talking to [the noun]." instead.


Carry out saying hello to a person (this is the note current interlocutor when greeted rule):
  now the current interlocutor is the noun.

Report saying hello to something that is not a person (this is the can't greet inanimate objects rule):
  say "[The noun] do[if the noun is not plural-named and the noun is not the player]es[end if] not respond."

Report saying hello to someone when the greeting type is explicit (this is the default greeting rule):
  say "You say hello to [the noun]."

Hailing is an action applying to nothing.

Understand "hello" or "hi" or "say hello/hi" as hailing.

Before asking someone to try hailing (this is the change greeting command to greeting rule):  
  now the greeting type is explicit;
  try saying hello to the person asked;
  rule succeeds.

The change greeting command to greeting rule is listed before the giving orders needs an interlocutor rule in the before rules.

Check hailing (this is the check what's being hailed rule):
  if the current interlocutor is a visible person, 
	say "You are already talking to [the current interlocutor]." instead;
  now the noun is a random visible person who is not the player;
  if the noun is a person and the noun is not yourself and the noun is not the player,  
	say "(addressing [the noun])";
  otherwise say "There's no one here but you." instead.

Carry out hailing (this is the standard hailing rule):
  try saying hello to the noun.
  

Persuasion rule for asking people to try hailing (this is the allow hailing rule): persuasion succeeds.

A protocol type is a kind of value. The protocol types are implicit and explicit.

Greeting type is a protocol type that varies. Greeting type is explicit.

When play begins: reset the interlocutor.

Chapter 2  - Saying Goodbye

Farewell type is a protocol type that varies. Farewell type is explicit.

[ This is the only way I could figure to effectively change the current interlocutor to no one]

To reset the interlocutor:
  now the current interlocutor is nothing. [a random person who is not a person]

Leavetaking is an action applying to nothing.

Understand "bye" or "goodbye" or "cheerio" or "farewell" as leavetaking.

Saying goodbye to is an action applying to one visible thing.

Understand "say bye/goodbye/farewell/cheerio to [someone]" as saying goodbye to.

Check saying goodbye to something when the noun is not the current interlocutor (this is the can't say goodbye to someone you're not talking to rule):
  say "You're not talking to [the noun]." instead.

Carry out saying goodbye to something (this is the reset interlocutor on saying goodbye rule):   
  reset the interlocutor.

Check leavetaking when the current interlocutor is not a visible person (this is the don't allow saying goodbye to no-one rule):
  say "You're not talking to anyone." instead.

Carry out leavetaking (this is the standard leavetaking rule):
  try saying goodbye to the current interlocutor.

Persuasion rule for asking people to try leavetaking (this is the alllow leavetaking rule): persuasion succeeds.

Carry out someone trying leavetaking (this is the convert npc leavetaking to player leavetaking rule):
  try saying goodbye to the person asked.

Report saying goodbye to someone when the farewell type is explicit (this is the default saying goodbye rule):
   say "You say goodbye to [the noun]."

This is the say goodbye when moving rule:
	if the current interlocutor is a person enclosed by the location begin;
		now the farewell type is implicit;
		try saying goodbye to the current interlocutor;
   end if.


The say goodbye when moving rule is listed first in the carry out going rules.

[
Before going from somewhere when the current interlocutor is a person in the location (this is the say goodbye when moving rule):
  change the farewell type to implicit;
  try saying goodbye to the current interlocutor.  

The say goodbye when moving rule is listed first in the before rules.
]

Chapter 3 - Reset protocol each turn

Every turn (this is the reset protocol rule):
  now the farewell type is explicit;
  now the greeting type is explicit.

Book 4 - Yes, No and Sorry

saying yes is implicit-conversing.
saying no is implicit-conversing.
saying sorry is implicit-conversing.

Before asking someone to try saying yes (this is the greet before saying yes rule):
  if the person asked is not the current interlocutor, implicitly greet the person asked;
  try saying yes instead.

Before asking someone to try saying no (this is the greet before saying no rule):
  if the person asked is not the current interlocutor, implicitly greet the person asked;
  try saying no instead.

Before asking someone to try saying sorry (this is the greet before saying sorry rule):
  if the person asked is not the current interlocutor, implicitly greet the person asked;
  try saying sorry instead.

Before answering someone that "yes" (this is the change answering yes to saying yes rule):
  try saying yes instead.

Before answering someone that "no" (this is the change answering no to saying no rule):
  try saying no instead.

Before answering someone that "sorry" (this is the change answering sorry to saying sorry rule):
  try asking the noun to try saying sorry instead.

Understand "tell [someone] [text]" as answering it that. Understand "tell [someone] that [text]" as answering it that.


Book 5 - Limiting what can be spoken about

Check quizzing someone about something unknown (this is the block asking about something unknown rule):
  abide by the block asking rule.

Check informing someone about something unknown (this is the block telling about something unknown rule):
  abide by the block telling rule.

To say make (obj - a thing) known/familiar:
  now obj is familiar.

Book 6 - Functions

Chapter 0 - Setting Up

When play begins:
	change the left hand status line to "Minutes until ritual : [TimeCount]";
	say "In San Luis Obispo lies a piece of history, a quiet mission in a quiet town. Many members of the flock call this church their spiritual home. What they don’t know is that the Deacon of the mission actually worships a malevolent power. Even worse, he’s planning on resurrecting his dark lord on Halloween.
	[paragraph break]
	It is October 30, 2013. You have been chosen by Deacon Dean Darkmaster and his demonic henchmen to be a sacrifice. You only have five hours to prevent your own death and the rise of a great evil. The Mission has been taken over in secret by this dark cult, and there is no escaping...".
		
Chapter 1 - Time Function
		
Every Turn:
	if HalfCount is 0:
		now HalfCount is 1;
	otherwise:
		now HalfCount is 0;
		now the TimeCount is the TimeCount minus 1.
		
After going:
	now the TimeCount is the TimeCount minus 1;
	continue the action;

HalfCount is a number that varies.
HalfCount is usually 0.	
	
TimeCount is a number that varies.
TimeCount is usually 300.

Chapter 2 - Bonus Time

Instead of giving groundskeeper's shovel to the groundskeeper:
	now the TimeCount is the TimeCount + 25;
	move groundskeeper's shovel to the groundskeeper;
	say “‘There she is!’ the Groundskeeper exclaims ‘Thank you for returning my trusty ol’ shovel!  Been looking for it everywhere! Time to go knock some heads.’[paragraph break] A mischevious smile spreads across his face as he hefts the shvoel onto hsi shoulder. He walks boldly toward the mission. After a few minutes, he returns. You wisely decide not to ask. On the bright side, the ritual will take longer to complete now!”;
	
Instead of giving groundskeeper's wallet to the groundskeeper:
	now the TimeCount is the TimeCount + 25;
	move groundskeeper's wallet to the groundskeeper;
	say “‘My wallet!  Bless your soul, brave adventurer!’ the Groundskeeper exclaims.[paragraph break] One good act deserves another, and the groundskeeper disappears briefly. When he returns, you can see him smiling. He says to you, 'That should delay the ritual. My debt is repaid!'”;
	
Instead of giving groundskeeper's plunger to the groundskeeper:
	now the TimeCount is the TimeCount + 25;
	move the groundskeeper's plunger to the groundskeeper;
	say “‘Not exactly sure how I lost this… I guess some things are better left unknown!’[paragraph break] The groundskeeper scurries off, likely to do something dubious to the plumbing. In mere seconds, you hear a muffled [italic type]BANG[roman type] and see him scurrying towards you. Whatever he did worked, it sounds like the ritual has been delayed!”;

Chapter 3 - Region Function

When play begins, change the right hand status line to "[map region of the location]";

Chapter 4 - Variables

Section 1 - Numbers

IsSmelled is a number that varies.
IsSmelled is usually 1.

HasTakenNote is a number that varies.
HasTakenNote is usually 0.

HasTakenBottle is a number that varies.
HasTakenBottle is usually 0.

FirstNorth is a number that varies.
FirstNorth is usually 0.

WalrusBeaten is a number that varies.
WalrusBeaten is usually 0.

RescuedGround is a number that varies.
RescuedGround is usually 0.

talkTo is a number variable. 
talkTo is usually 0.

FinalConf is a number that varies.
FinalConf is usually 0.

MeatBallBossActive is a number that varies.
MeatBallBossActive is usually 0. 

MeatBallBossDead is a number that varies.
MeatBallBossDead is usually 0.

Satisfied is a number variable. 
Satisfied is usually 0.

DoorFlag is a number variable.
DoorFlag is usually 0.

ConvoFlag is a number variable.
ConvoFlag is normally 0.

NastyDead is a number variable.
NastyDead is normally 0.

Section 2 - People

The groundskeeper is a man; he is in the restroom; he is undescribed.

the Flying Spaghetti Monster is a person.

Hector the Custodian is a man; he is in the Chapel; he is undescribed.

The Saucy Sorceress is a person; she is in the Main Entrance. "[If Saucy Sorceress is in the Main Entrance]Standing at the top of the stairs is the Saucy Sorceress.  She is an overconfident, cocky, saucy sorceress.  She won't stop pontificating about the glories of the Flying Spaghetti Monster."  The description of the Saucy Sorceress is "This sorceress just won't stop talking, she just keeps going."

Section 3 - Objects

The flowerbed is a thing; it is a container; it is fixed in place; it is undescribed; it is in the West Garden.
flowers are a thing. They are scenery. They are in the flowerbed.
The groundskeeper's watch is a thing; the description of the groundskeeper's watch is "If lost, return to me. -- Me".

The desk is a thing; it is scenery; it is in the Rectory.
The drawer is a container. It is opaque; it is scenery; it is closed; it is openable; it is in the Rectory.
The bottle is a container; it is closed; it is openable; it is transparent; it is in the drawer.
The sauce is a thing; it is edible; it is in the bottle.
The notebook is a thing; it is undescribed; it is on the desk. 

A rusty key is a thing.

A note is a kind of thing.

A pew is a kind of thing; it is scenery. There are 20 pews in the Main Church.

A closet is a kind of thing.

Cooked spaghetti is a thing.

The description of cooked spaghetti is “Perfectly cooked spaghetti noodles…  I bet you could [italic type]combine[roman type] this with something to really make a meal!”

A stool is a kind of supporter.  A stool is portable.

The description of meatball bits is “Scrumptious meat in tiny bits!  I should [italic type]combine[roman type] this with something else to create a delicious dish!”

Deacon's car is a closed transparent scenery container; it is in the garage.  Deacon's car is openable.  
Understand "car window" as Deacon's car.  Understand "window" as Deacon's car.
Understand "car windows" as Deacon's car.  Understand "windows" as Deacon's car.
Understand "glass" as Deacon's car.
Deacon's car can be broken.

the sink is scenery in the restroom.
the stall is scenery in the restroom.

the groundskeeper's plunger is an object in the restroom.  "There's a plunger near the stall.";
the description of the groundskeeper’s plunger is “This plunger belongs to the groundskeeper...Strange… But you should give it to him!”;


A table is a kind of thing.  The description of the table is "A table for eating and for events to happen.  Nothing obvious on or under them." A table is fixed in place. 

A bookshelf is a thing; it is in the mission lobby.  The description of the bookshelf is "A place to store books. This one is currently empty."  A bookshelf is fixed in place.

A book is a thing.  The description of the book is "Runes are inscribled on the side of the book, as you examine them closer, you notice they say, something about a fish." The book is undescribed.  A trashcan is a thing in the mission lobby.  "In the far east corner of the lobby, there looks to be a filled trash can ready to be taken out."  A trashcan contains a book. The description of the trashcan is "Most of the trash seems inconsequential, but one book in particular catches your eye.".

A picture is a thing in the mission lobby.  "The picture says 'Touched by his noodly appendage'."  The picture is fixed in place.

A chair is a thing in the mission lobby. The description of a chair is "Something to sit on."



Chapter 5 - Verbs

Understand "read [any note]" as examining.

Subjugating is an action applying to one thing.
Understand "subjugate [someone]" as subjugating.

unsummoning is an action applying to one thing.
Understand "unsummon [someone]" as unsummoning.

killing is an action applying to one thing.
Understand "kill [someone]" as killing.

shooting is an action applying to one thing.
Understand "shoot [someone]" as shooting.

Talking to is an action applying to one visible thing.
Understand "talk to [someone]" as talking to. 
Understand "talk to [something]" as talking to. 

Ignition is an action applying to one thing.
Understand "flip on [any lighter]" or "flick on [any lighter]" or "ignite [any lighter]" as ignition.

Understand "blow out [something]" or "extinguish [something]" or "put out [something]" as blowing out. 
Understand the command "snuff" as "extinguish". Blowing out is an action applying to one thing.

Understand "burn [unlit candle]" as burning.

Stepping on is an action applying to one thing.
Understand "step on [any stool]" as stepping on;

Understand "breaking" as attacking.  

Understand "combine [something] with [something]" as combining it with.  Combining it with is an action applying to two carried things.

Understand "stab" as attacking.

Understand "slap [something]" as attacking.
Understand "kick [something]" as attacking.
Understand "pinch [something]" as attacking.
Understand "smack [something]" as attacking.

Chapter 6 - Verb Replacement 

Carry out subjugating:
	say "You can't express dominion over that.".
	
Carry out unsummoning:
	say "You don't have the magical talent required to unsommon that. Besdies, it is in its home dimension.".

Carry out killing:
	say "Violence isn't the answer.".
	
Carry out shooting:
	say "You don't have the magical talent required to take a shot. Besides, violence isn't the answer.".
	
Carry out ignition:
	if the zippo lighter is empty:
		if the player is carrying the lighter fluid:
			say "Perhaps try putting that lighter fluid you found in the zippo, first?";
		otherwise:
			say "Unfortunately, this lighter needs [italic type]lighter fluid[roman type] to be ignited!  Now where would someone keep their lighter fluid…";	
	otherwise:
		say "The zippo lighter is lit!  You have successfully harnessed the magnificent element of fire!";
		now the zippo lighter is lit.
		
Carry out stepping on:
	if the player is carrying the step stool:
		say "It might be a good idea to drop the step stool before stepping on it.";
	otherwise:
		say "You have stepped up your step stool[paragraph break]";
		now the player is on the step stool;

Book 7 - The World

Chapter 1 - Rooms and Regions

Section 1 - Public Area

The West Parking Lot is west of the East Parking Lot.  "The West Parking Lot is all but deserted.  You can see gardens north of here, restrooms to the south, and the Youth Center to the southeast.  There's additional parking to the east."

The East Parking Lot is a room.  "...Nothing but a few parked cars here.  You can spot gardens to the north, a garage to the south, and the Youth Center to the southwest.  There's additional parking to the west and to the southeast."

The Parking Lot Edge is southeast of the East Parking Lot.  "It's desolate.  You can see the chapel to the east, and a garage to the west.  There's additional parking to the northwest and a garage to the west."

The Youth Center is southeast of the West Parking Lot and southwest of the East Parking Lot. "The youth center is well-lit and welcoming.  The walls are lined with motivational posters, and colorful books and stationary line the shelves. [if the child is in the Youth Center] You see a child here.  He looks no older than 7, and is wearing a uniform bearing the Darkmaster emblem and the words 'Deacon Youth' below it.[end if]

 [if not visited] The child’s eyes widen when he sees you.  'You’re the bad guy Dean Darkmaster was talkin about!' he exclaims.  Then his eyes turn mischievous, and he grins.  'Well you’re never gonna get to him, mister!' 'Why’s that?' 'Ha ha!  I’m not telling!' You feign disinterest: 'I wasn’t really interested anyway.  A little kid like you wouldn’t know anything.'  The Deacon Youth’s facial expression becomes as dark as the Darkmaster himself.  'That’s not true!  I’m very important!' he says.  'Prove it,' you reply.

He reveals a key: 'You won’t get to Dean Darkmaster without this!  This is the main entrance key!  Stupid-head!  All hail the great Flying Spaghetti Monster!' You pause.  Why would Darkmaster entrust an important key to a child?  The Deacon Youth must be bluffing.  Still, it does look like a real key to something."


The Garage is south of the East Parking Lot, east of the Youth Center, and west of the Parking Lot Edge.  "There's a single car parked here whose license plate reads DARKLRD.  In the corner of the garage you see a standard garage closet with a toolbox lying on the floor next to it.  To the left, you notice an old workbench with a rusty drawer attached to it. You see exits north and east of here."

The Restroom is south of the RR door.  "It's just a normal unisex restroom, with a sink and a stall."

The Public Area is a region.  The East Parking Lot, West Parking Lot, Parking Lot Edge, Youth Center, Garage, and Restroom are in the Public Area.

Section 2 - North Wing

The Parish Hall is a room. "This is where receptions and events are held. It's mostly clean, but you do see a few bits of trash lying around. Perhaps the Deacon forgot to clean up after himself and his minions after throwing a party in here."

The Dining Area is east of the Parish Hall. "[if MeatBallBossDead is 1] You see nothing of interest now that the meatball is gone[otherwise if not visited]
As you enter the area, you see a fleshy, bulbous mass on the table in the center of the room. Several massive chains extend from the mass to hooks on the walls of the room. You step closer, having never seen anything this unusual in your life. Suddenly, the mass springs to life and starts speaking to you. 'Hello friend - or should I say, my future dinner. I am the Big Beef, the Super Steakball, the Prime Cut - I am the Murderous Meatball - and tonight, you'll dine with ME!'
The mass shows off a grin- the meatball's mouth is lined with incredibly sharp teeth.
[end if]
[if MeatBallBossActive is 1] 
Sensing that you're prepared to fight back, the mass finally breaks free from the chains that bound it. It begins to slither towards you with alarming speed - do something![end if] You can see exits to the southwest and west."

The Gift Shop is a room. "You are in the Gift Shop, what wonders await you here? The shelves are lined with various knickknacks: rosaries, bibles, posters, and postcards -- all of them mission-themed... Well, the church needs to support itself somehow, and selling junk to tourists is one way to do it.[paragraph break] The Gift Shop has an exit to the west, and the museum lies to the east."

The Museum is a room. "[if player is in Museum and player does not have the knife]You're not interested in the history. There might not even be a history to learn if you don't finish your task tonight. You see various nicknacks and aftifacts lining the walls, but only a crucifix on the far wall catches your eye.[end if][if player is in Museum and player has knife]You're not interested in the history. There might not even be a history to learn if you don't finish your task tonight. You see various nickknacks and artifacts lining the walls.";

The North Wing is a region.  The Gift Shop, Museum, Parish Hall, and Dining Area are in the North Wing.

The Blank Room is a room. There is a knife in the room. There is a fork in the room. There is meatball bits in the room.

Section 3 - East Wing

The Chapel is east of the Parking Lot Edge.  "[if not visited]You enter the Chapel and somehow feel out of place.  In such a small room, you can almost feel the spiritual intensity. In the far corner of the Chapel you can see an old chapel closet.[paragraph break]You also see a man who appears to be a custodian, in the far corner.  You glean his name is [Hector] from his craftily sewed on nametag.  Once Hector catches your glance, he gives you a warm, welcoming smile and a wave.  Almost immediately, Hector seems like someone you can trust.[paragraph break]A path leads west and north.[otherwise]Back in the chapel.  There is a closet in the corner and Hector quietly doing his tasks.  You can go north or west from here."  

The Parish Office is north of the Chapel.  "[if not visited]You find yourself in a smaller portion of the east wing:  the Parish Office.  This disheveled place is literally in shambles.  A tornado probably passed through the tiny office itself… Or worse.  You would expect the Parish Office to be a bit more organized.
[paragraph break]On the left side of the room there is an incredibly messy office desk with papers sprawled all over it.  On the corner of the desk you notice an opened cookbook.  On the right side of the room you notice an old, rickety candle stand with a thin drawer attached to it.  There are three beautiful, candles placed on the candle stand.
[paragraph break]A path leads north and south.
[otherwise]You find yourself back in the Parish Office.  An office desk, a candle stand , and three candles are present in the room.  You can move north or south from here."

The Serra Center is north of the Parish Office.  "[if not visited]As you enter the Serra Center, your heart sinks and you palms begin to sweat as you see what you believe to be a…a… giant, uncooked, [italic type]Nasty Noodle![roman type][otherwise if emergency fire sprinkler is switched off]You are in the Serra Center with the Nasty Noodle!  You must defeat this uncooked condiment![otherwise]You feel bad for the damage you may have caused to the Serra Center, but you gotta do what you gotta do.[end if][paragraph break]You can travel west and south from here."

The East Wing is a region.  The Chapel, Parish Office, and Serra Center are in the East Wing.

Section 4 -The Gardens
		
The West Garden is north of the West Parking Lot and west of the Middle Garden and southeast of the Gift Shop and southwest of the Parish Hall.  "Flowers line the pathways in this section of the Gardens [if TimeCount is greater than 100]and you can hear birdsong in the distance[end if].[if IsSmelled is 1] Maybe you should stop to smell the flowers.[end if] You can glimpse more gardens to the east, a parking lot south of here, and doors leading inside the mission to the northwest, north, and northeast."

The Middle Garden is south of the Parish Hall. "[if not visited]The sweet smell of grapes hangs thick in the air; a short stroll under the arbor helps calm your nerves.[otherwise]You return to the middle garden.[end if] The gardens continue east and west. There is also a door to the north."

The East Garden is north of the East Parking Lot and east of the Middle Garden and southeast of the Parish Hall and southwest of the Dining Area and west of the Serra Center and northwest of the Parish Office. "[if not visited]You awake surrounded by green. For whatever reason, you're in the East Garden of Mission San Luis Obispo. This is strange, but it's not the first time you've had a little too much and woken up in a strange place... You can't remember what you were doing last night. Well, you might as well take a look around before you head home.[paragraph break][end if]
The wide open area in the East Garden would be perfect for a picnic; the gardens are quite beautiful [if TimeCount is greater than 100]in the evening. [otherwise]at night.[end if] More gardens lie to the west. You can glimpse the parking lot to the south. There are doors to the mission northeast, northwest, east, and southeast of here."; the player is here.

The Gardens is a region.  The West Garden, Middle Garden, and East Garden are in the Gardens.

Section 5 - The Rectory

The Private Garden is east of the Rectory. "[if not visited]The grounds outside the rectory are foreboding at this time of night. Each shadow seems to jump out at you, each creaking of a branch sounds like a banshee’s howl. Is it just your nerves, or is something really wrong with this place? For whatever reason, your unease is tied to this place, like a bad memory. [otherwise if the Rectory is visited]The private garden is nearly deserted. Crying under a tall tree is the Saucy Sorceress you scared away earlier. She appears to be lost in her misery. [otherwise]The private grounds are completely empty, save for the tall tree near the entrance to the Rectory.[end if] The entrance to the Rectory lies west of here, and a door to the northwest leads indoors."

The Rectory is a room. "[if not visited] You navigate your way inside the Rectory. You seem to have no trouble finding your way, as if you’ve been here before. Is something guiding your hand or… No, there’s no time to get lost in thought. There has to be a reason you came here, right?[end if] In the study, there is a desk with a small drawer. [if HasTakenNote is 0] On the desk next to it is a small black notebook, no doubt well used by the Deacon.[end if][if the drawer is open and HasTakenBottle is 0] You can glimpse a bottle inside the drawer.[end if] The exit to the Rectory lies to the east."

The Private Residence is a region.  The Rectory and Private Garden are in the Private Residence.

Section 6 - Final Wing

The Statue Room is a room. "[if not visited]Father Serra stands here, a resolute testament to this Mission’s endurance. He almost appears to be staring at you, offering you one last bit of peace before the final confrontation and warning you from going further. [otherwise]A monument to father Serra stands here. Not much else is really noticeable. The main entranceway to the south is barricaded with pews and other large objects. [end if]You can see exits to the southwest, north."

The Bear Fountain is north of the Statue Room. "A ritual circle has been set up around an ursine sculpture. From the distance you can see a smattering of cultists chanting away. [if HasTakenBottle is 1]You’ve done all you could to slow and weaken the ritual magic. It’s now or never. You steel your nerves and walk towards the ritual circle. You hope that you look confident as you stride in and the cultists notice you. You don’t. [otherwise]The ritual itself seems to be progressing slower than Deacon Dan appreciates. Still, you’re not entirely sure you can take them head on just yet. You had better steer clear of this area for now or risk being spotted. Father Serra's statue can be seen to the south."

The Fountain Area is southwest of the Statue Room. "[if not visited]You walk into the Fountain Area and immediately notice something amiss. A bloated, bemoustached walrus has occupied the small fountain in the clearing. He appears to be guarding the area. [otherwise]You walk back to the fountain.[end if] The walrus turns to face you before speaking. [if not visited]'Now kiddo, don’t go thinking you can pull a fast one on me. In order to pass, you must first solve my riddles. If you fail, then I won’t let you pass.' He smiles as only a walrus can – poorly. 'Best of luck with these. Nobody has been able to solve them in the last 1500 years.' What choice do you have? Good luck with this one. 'That damn absurdist stole this one from me 150 years ago. Not a single creative bone in his body. So, what IS the difference between a raven and a writing-desk?' [otherwise if WalrusBeaten is 0]'Well, do you give up? I’ll just ask you a harder riddle. You can't just walk past me, like it'd be that easy.' [otherwise]'You cheater! How dare you walk on by here like nothing happened! I want my answer, curse you!' [end if]There is a door to the south. You can see Father Serra's statue northeast of here."

The Final Wing is a region. The Statue Room, Bear Fountain, and Fountain Area is in the Final Wing.

Section 7 - West Wing

The Main Entrance is west of the Gift Shop. "You are amazed by the entirety of the Church to the south.  Stairs lined with pillars take you to the grand wooden door.  To the north there appears to be some sort of statue and eastward there is a tiny gift shop selling things for the Mission."

The Main Church is south of the grand wooden door. "An oppressive aura fills the air here. The church is lined by rows of pews and an altar stands at the head, covered in a white linen cloth. The Mission Lobby lies to the south of the author."

The Mission Lobby is south of the Main Church, east of the Annex. "There is a sign that reads 'Mission Lobby'.  This place is usually bustling immediately after mass, but right now it is deserted. A sturdy oak door lies to the east, and exits to the south and west."

The Annex is west of the Mission Lobby.  "The annex is brightly lit, yet deathly still.  The beacon lives here but is currently away. There is a bed in the corner with a night stand and a closet on the sides.  The bed is not made and the blankets are scattered around, looks like someone left in a hurry. You can exit to the southeast and north from here."

The Sacristy is south of the Mission Lobby.  "This is a room where the priests and beacons can prepare for the upcoming masses and rituals.  The walls are mostly barren, but a few small objects can be seen. On the east wall, a single picture hangs on the wall and a candle lights the room. On the south wall, a clothes rack can be seen. The west wall is dark and forboding for some reason..."

The West Wing is a region.  The Main Entrance, Sacristy, Main Church, Mission Lobby, and Annex are in the West Wing.
	
Chapter 2 - Doors

Section 1 - Public Area

The RR door is a closed door.  It is south of the west parking lot.  The RR door can be locked.  The RR door is locked.

instead of opening locked RR door:
	if player has rest key:
		Now the RR door is not locked;
		try opening RR door;
	otherwise:
		say "The restroom door is locked.  There's a sign on the door that says 'For The Darkmaster Only'.".

Section 2 - North Wing

The museum door is a door; it is north of the West Garden and south of the Museum. The museum door is lockable and locked. The museum key unlocks the museum door. "This door appears to be closed with a much older lock than the rest of the mission. Where could the key be?"

A gift shop door is west of the Museum and east of the Gift Shop. The gift shop door is a door. The gift shop door is lockable and locked. The museum key unlocks the gift shop door.

Section 3 - West Wing

The grand wooden door is south of the main entrance and north of the main church.  The grand wooden door is a door.  The grand wooden door is lockable and locked.  The description of the grand wooden door is "It is sealed in the doorway pretty well, a strong force would be required to loosen it up."
	
The rusty door is southeast of annex and northwest of Private Garden.  The rusty door is a door.  The rusty door is lockable and locked.  The description of the rusty door is "It is locked, you need a key."  The rusty key unlocks the rusty door.

The oak door is north of the annex and south of the fountain area.  The oak door is a door.  The oak door is lockable and locked.  The description of the oak door is "It is locked, you need a key."  The oak key unlocks the oak door.

The oak door2 is west of the west garden and east of mission lobby.  oak door2 is a undescribed door.  The oak door2 is lockable and locked.
Understand "oak door" as oak door2.

The barricade is north of the main entrance and south of the statue room.  The barricade is a door.  The barricade is lockable and locked.  The description of the barricade is "There is a bunch of stairs and pews stacked up.  It looks like they are remodeling the church."

Instead of opening the locked grand wooden door:
	say "Its sealed shut.";

Instead of opening the locked rusty door:
	say "It is locked, you need a key.";

Instead of opening the locked oak door:
	say "It is locked, you need a key.";

Instead of opening the locked oak door2:
	say "You can't go this way.  There is a door blocking your way.";

Instead of opening the locked barricade:
	say "Even if you climbed this barricade the fall would break a bone.  Maybe you should try a different way.";
		
Book 9 - Events and Scripting

Chapter 0 - PORTALS, MOTHERFUCKER

instead of going northwest from West Garden:
	if DoorFlag is 0:
		say "That door is locked. Who would have the key?";
	otherwise:
		continue the action.
		
instead of going northeast from West Garden:
	if DoorFlag is 0:
		say "That door is locked. Who would have the key?";
	otherwise:
		continue the action.
		
instead of going north from Middle Garden:
	if DoorFlag is 0:
		say "That door is locked. Who would have the key?";
	otherwise:
		continue the action.

instead of going northwest from East Garden:
	if DoorFlag is 0:
		say "That door is locked. Who would have the key?";
	otherwise:
		continue the action.

instead of going northeast from East Garden:
	if DoorFlag is 0:
		say "That door is locked. Who would have the key?";
	otherwise:
		continue the action.
		
instead of going east from East Garden:
	if DoorFlag is 0:
		say "That door is locked. Who would have the key?";
	otherwise:
		continue the action.
		
instead of going southeast from East Garden:
	if DoorFlag is 0:
		say "That door is locked. Who would have the key?";
	otherwise:
		continue the action.
		
instead of going southeast from West Parking Lot:
	if DoorFlag is 0:
		say "That door is locked. Who would have the key?";
	otherwise:
		continue the action.

instead of going southwest from East Parking Lot:
	if DoorFlag is 0:
		say "That door is locked. Who would have the key?";
	otherwise:
		continue the action.
		
instead of going east from Parking Lot Edge:
	if DoorFlag is 0:
		say "That door is locked. Who would have the key?";
	otherwise:
		continue the action.
		
instead of going west from Garage:
	if DoorFlag is 0:
		say "That door is locked. Who would have the key?";
	otherwise:
		continue the action.

Chapter 1 -  Meeting the Groundskeeper

Section 1 - Getting the Watch

Understand “flower” as flowers.

instead of examining the flowers:
	if isSmelled is 1:
		say "As you admire the flowers, you notice something glinting in the low light – it’s a watch!";
		now the watch is in the flowerbed;
		now the flowerbed is described;
		now IsSmelled is 0;
	otherwise:
		say “What lovely flowers!”;

instead of smelling the flowers:
	if isSmelled is 1:
		say "As you bend over to take in a big whiff of pollen, you notice something glinting in the low light – it’s a watch!";
		now the watch is in the flowerbed;
		now the flowerbed is described;
		now IsSmelled is 0;
	otherwise:
		say “The flowers' aroma is quite refreshing!”;
		
instead of taking the watch:
	now the flowerbed is undescribed;
	continue the action;

Section 2 - Unlocking the Doors

Every Turn:
	If the player is in the restroom:
		if the groundskeeper is in the restroom:
			say "Without warning, a disembodied voice speaks to you.";
			if RescuedGround is 0:
				say "'Oh hello! I don't suppose you could do me a favor? I seem to have lost my watch in the gardens. Be a gent and grab it for me, will you?'";
				now RescuedGround is 1;
			otherwise if RescuedGround is 1:
				say "'Hello? Is anyone there? Do you have my watch?'".
				
Every Turn:
	If the player is in the restroom:
		if the groundskeeper is in the restroom:
			if the player has the watch:
				say "'Ah, there you are! I – just a moment –' You hear a zipper being tightened followed by a loud *flush*. 'Now where was I? Oh yes, there you are!' A wizened man in overalls and a plaid shirt comes out of the farthest stall and begins to wash his hands. He then walks right up to you and snatches the watch you found. 'I’ve been waiting for you to wake up, there isn’t much time left. In fact, this is all the time I have.' He points to the watch and grins.
				[paragraph break]
				Ugh, puns… [italic type]Left for what, you wonder.[roman type] As if reading your mind, he continues, 'the Deacon of the mission has been preparing a sacrificial ritual for many years, waiting for the right moment to revive the evil master he worships.' [italic type]Wow, that does sound serious. How much time is left? 
				[paragraph break]
				He’s actually really good at this guessing game, because he speaks again.[roman type] 'The ritual is tonight, in only 5 hours. I pulled you out of their cell to delay the ritual and to get you to help me stop it.' [italic type]Wait, WHAT? My cell?! [roman type]His mind reading powers are exceptional. 'Great power lies inside you. You were to be their grand sacrifice, but you also have the power to stop it, so they imprisoned you. [italic type]I[roman type] rescued you.' He seems so proud of himself.
				[paragraph break]
				'If you want to escape, you're going to have to stop his lieutenants. Demons, called forth from some unknown hell, have infested the different wings of the mission. Their power keeps you from just walking out. Lucky for you, they're not very bright. If you can defeat them, you might stand a chance at disrupting the ritual and breaking free.'
				[paragraph break]
				'Since the ritual isn't ready yet, they arent actively hunting for you. If you run out of time, all bets are off...' [italic type] Creepy... [roman type]
				[paragraph break]
				'Come on, now. Follow me.' he hurries out of the restroom.";
				move the watch to the groundskeeper;
				now the groundskeeper is in West Parking.
								
Every Turn:
	If the player is in West Parking:
		if the groundskeeper is in West Parking:
			say "Following behind, you catch him headed east.";
			now the groundskeeper is in East Parking.
		
Every Turn:
	If the player is in East Parking:
		if the groundskeeper is in East Parking:
			say "You can see the groundskeeper ahead of you. He stops for a second, makes a sudden turn, and then heads southeast.";
			now the groundskeeper is in Parking Lot Edge.

Every Turn:
	If the player is in Parking Lot Edge:
		if the groundskeeper is in Parking Lot Edge:
			say "He finally stops outside the doors to the Chapel. 'Here we are. I’ve unlocked the doors for you. You should be able to access most of the mission now! You can find me in the East Gardens if you need any help. Well, there’s only [TimeCount] minutes left! Get a move on!'";
			now the groundskeeper is in East Garden;
			now the groundskeeper is described;
			now DoorFlag is 1.

Section 3 - Sexposition 

instead of talking to the groundskeeper:
	if ConvoFlag is 0:
		say “'What are you doing here? I’ve finished unlocking the doors. If you have time to dawdle here, you have time to check out the Youth Center, don’t you? Scat!'”;
	otherwise if ConvoFlag is 2:
		say "'I see you got the Main Entrance key from that little brat.' He looks at you slyly. 'I didn't think you had it in you. You monster.'";
		if MeatBallBossDead is 0:
			say "'I'd check out the North Wing if I were you. One of Darkmaster's lieutenants is there.";
	otherwise if ConvoFlag is 3:
		say "'Had yourself a meaty snack, eh?'";
	otherwise if ConvoFlag is 5:
		say "So I heard you got past the walrus! What are you doing back here? The ritual is starting soon!";
	otherwise if ConvoFlag is 6:
		say "'You've managed to demoralize a witch! That's no mean feat. I must saym I'm impressed. You should be able to get to the ritual circle now. None of his lieutenants remain, just that... thing...' He shudders at the thought of... something.";
	otherwise:
		say "Oh, hello again. How goes the not dying?";
	now ConvoFlag is 1.

Chapter 3 - The Saucy Sorceress

Every Turn:
	If the Rectory is visited:
		now the Saucy Sorceress is in the Private Garden;
		now the Saucy Sorceress is undescribed.

Instead of talking to Saucy Sorceress:
	if talkTo is 0:
		say "'What do YOU want, heathen? I have nothing to say to you after you committed such a vile act. Our gods were supposed to be perfect. PERFECT!' It appears that she blames you for all that’s happened, but the talking seems to be doing her some good.";
	if talkTo is 1:
		say "'Our master told me he had plans to [italic type]subjugate[roman type] the Flying Spaghetti Monster. He promised me! He promised that we’d make the world better. If we had control over the god, we would have been able to solve all the world’s problems. Now it’s RUINED!' You can’t help but feel a little sorry for the girl. She was misled by a bad man, another victim in this silly drama.";
	if talkTo is 2:
		say "'When I went back to him, he told me that I was useless; that I couldn’t even catch you. He threw me away! What do I do now?' She glowers at you for a few moments, then goes back to sobbing. Maybe you should leave her alone for now.";
	if talkTo is 3:
		say "I'm tired of talking, I have nothing more to say to you.";
	now talkTo is talkTo + 1;

Chapter 4 - The Rectory

instead of taking the notebook:
	now HasTakenNote is 1;
	continue the action.
	
instead of taking the bottle:
	now HasTakenBottle is 1;
	continue the action.

The oak key is a thing in the drawer.	
	
instead of opening the drawer:
	say "You cautiously open the drawer and look inside. You spot a half-full bottle of marinara sauce near the back. It is cool to the touch. Behind that, you find a key inset with solid oak.";
	now the drawer is open.
	
instead of examining the notebook:
	say "You skip the older entries; something tells you that you don’t have enough time to read them all. On the final page of writing, there are two entries: one from yesterday and one from today… You read on.
	[paragraph break]
	[bold type]Yesterday
	
	[italic type]****** Journal entry 29 Oct, 2013.
	[paragraph break]
	[roman type]The ritual is proceeding as planned. I have issued a statement regarding the closure of the Mission in preparation for All Saints Day. Now the only ones left on the premises are my faithful, and the sacrifice. Powerful blood flows through that child’s veins, and I intend to finally make use of it. Now after all these years, HE shall reawaken! I must go now, and see to preparations.
	[paragraph break]
	[bold type]Today
	
	[italic type]****** Journal entry 30 Oct, 2013.
	[paragraph break]
	[roman type]NO! My vessel has gone missing! Someone must have had a hand in the escape. There is no way that child could have broken out on their own. I have used some of my power to cook up a summoning spell. With my demonic assistance, nobody will be able to leave this place unnoticed, and they will be able to help fuel the ritual. The vessel must be recaptured. Others will be able to hold HIS form, but none are so perfect, so suited to the task as the child. I will not be stopped.
	[paragraph break]
	My reserves of sauce run low. I should not need the sauce to perform this ritual now, and I am not sure if I will be able to make more. Still, the rush it has given me was… exhilarating. "

Chapter 5 - The Walrus

instead of going northeast:
	if the player is in the Fountain Area:
		if FirstNorth is 0:
			now FirstNorth is 1;
			say "'Hey wait! I told you you need to answer my riddle first! Or is that too difficult for you?' [italic type]He leers at you, waiting for a response.[roman type]”;
		otherwise if FirstNorth is 1:
			say "[italic type]This riddle is nonsense! [roman type]Ignoring the fat mammal, you begin striding north anyway. The walrus looks at you pointedly but doesn’t actually DO anything. All he manages is a stuttering 'W-w-wait! You have to answer my r-riddles before you may pass! This isn’t f-f-fair! STOP!!' It’s really quite pitiful, seeing a talking walrus reduced to tears, but you have a schedule to keep. You press forward.";
			now FirstNorth is 2;
			now WalrusBeaten is 1;
			now ConvoFlag is 5;
			continue the action;
	otherwise:
		continue the action.

Chapter 6 - The Final Battle

Every turn:
	if HasTakenBottle is 1:
		if the player is in the Bear Fountain:
			now FinalConf is 1.

FinConOne is a scene. FinConOne begins when FinalConf is 1. 
FinConOne ends poorly when time since FinConOne began is 5 minutes.
FinConOne ends happily when FinalConf is 2.

FinConTwo is a scene. FinConTwo begins when FinConOne ends happily.
FinConTwo ends poorly when time since FinConTwo began is 4 minutes.
FinConTwo ends happily when FinalConf is 3.

FinConThree is a scene. FinConThree begins when FinConTwo ends happily.
FinConThree ends poorly when time since FinConThree began is 4 minutes.
FinConThree ends happily when FinalConf is 4.
FinConThree ends mysteriously when FinalConf is 5.
FinConThree ends evily when FinalConf is 6.

BadEndOne is a scene. BadEndOne begins when FinConOne ends poorly.
BadEndTwo is a scene. BadEndTwo begins when FinConTwo ends poorly.
BadEndThree is a scene. BadEndThree begins when FinConThree ends poorly.
GoodEndOne is a scene. GoodEndOne begins when FinConThree ends happily.
GoodEndTwo is a scene. GoodEndTwo begins when FinConThree ends mysteriously.
GoodEndThree is a scene. GoodEndThree begins when FinConThree ends evily.

When FinConOne begins:
	say "Dean Darkmaster turns slowly to face you. You catch a flash of a wide smile as he recognizes you. 'Well, well. I didn’t even have to hunt you down; you came right to me. Welcome to the party! All of this is just for you!' He has turned to face you completely now, overbearingly tall and menacing. With a flash of his hands, you become rooted in place. 'I am too powerful for you, child. There is nothing you can do to stop me. You have nothing left to aid you!' [italic type]Or do you?";

Instead of looking during FinConOne:
	say "All you have time to notice is the big, angry cult leader marching towards you."

Every Turn during FinConOne:
	say "He inches closer. Hurry up and act!".

Instead of eating the sauce:
	if FinConOne has not happened:
		say "You're not really sure about eating this just yet...";
	otherwise:
		now FinalConf is 2.
	
Instead of going during FinConOne:
	say "You can't leave!".

When FinConTwo begins:
		say "[roman type]It smells pretty vile for Marinara Sauce, but what choice do you have? It’s your only hope. While he’s still walking toward you, you take a swig. Immediately, you feel his grip loosening on you. Surprise registers on his face. It is briefly replaced by alarm before settling on anger. 'WHERE DID YOU GET THAT?' he bellows. The Deacon begins sprinting towards you. He barrels into you and you both crash to the ground. Normally, you wouldn’t stand a chance against this giant of a man, but the sauce appears to be giving you extra strength. 'I. MADE. YOU.' he shrieks as you fight. 'You owe me everything!' 
		[paragraph break]
		It all comes rushing back to you. No wonder you know so much about the mission, this was your home once. Many years ago, you fled, rightfully fearing for your life. Your father, Deacon Dean Darkmaster, your father, had once before tried to use you as a sacrifice for the Flying Spaghetti Monster. You ran for days on end, and eventually found refuge in an orphanage in Ventura, California. As the memories flood back in, a rage takes over. You begin to pummel your crappy father in his crappy face until he’s crappy unconscious. The red begins to fade a little and you vaguely notice a ring around you and Deacon Dean Darkmaster. The ritual! You can feel the magic buildup is about to reach its climax and you’re in the last place you want to be.";
		now the sauce is in the Blank Room;
		
Instead of looking during FinConTwo:
	say "Magical buildup is blurring the surrounding areas."		
		
Every Turn during FinConTwo:
	say "You don't have much time. Move!".

instead of jumping during FinConTwo:
	now FinalConf is 3.

instead of going during FinConTwo:
	now FinalConf is 3.
		
When FinConThree Begins:
	say "You barely manage to make it out of the way in time. The ritual reaches its conclusion with your father in the center. Already, you can see changes taking place; it appears that he was a suitable vessel as well. His body is already becoming more wobbly, his arms and legs dividing into smaller and smaller bits.
	[paragraph break]
	After a scant 15 seconds, all that remains of your father are his clothes. In his place is his master, the Flying Spaghetti Monster. It still appears weak from the effects of the ritual, and it doesn’t appear to be fully aware of its surroundings just yet. Now is your chance! You have just enough magic power left from drinking the sauce to muster up one shot of pure killing magic. Make it count.";
	now the Flying Spaghetti Monster is in the Bear Fountain; 
	now the Flying Spaghetti Monster is undescribed.	
	
instead of killing the Flying Spaghetti Monster during FinConThree:
	now FinalConf is 4.
	
instead of shooting the Flying Spaghetti Monster during FinConThree:
	now FinalConf is 4.
	
instead of unsummoning the Flying Spaghetti Monster during FinConThree:
	now FinalConf is 5.
	
instead of subjugating the Flying Spaghetti Monster during FinConThree:
	now FinalConf is 6.
	
Instead of looking during FinConThree:
	say "A giant flying mass of spaghetti and meatballs fills your vision. It's the Flying Spaghetti Monster!You find it impossible to tear your eyes off him to observe the surrounding area."		
	
When BadEndOne begins:
	say "Deacon Jimmy Dean has overpowered you. Unable to resist, he drags you to the ritual circle and binds you there. The magic reaches critical mass and the ritual is complete. Horrified, you stare at your hands as they begin to melt into a much looser and noodly form. After all that, you weren’t able to stop your destiny. Eventually, a foreign consciousness overpowers you and everything fades to black. The Flying Spaghetti monster claims its first victims. The world is doomed.";
	end the story finally.
	
When BadEndTwo begins:
	say "You fail to get out of the circle in time. The magic reaches critical mass and the ritual is complete. Horrified, you stare at your hands as they begin to melt into a much looser and noodly form. After all that, you weren’t able to stop your destiny. Eventually, a foreign consciousness overpowers you and everything fades to black. The Flying Spaghetti monster claims its first victims. The world is doomed.";
	end the story finally.

When BadEndThree begins:	
	say "The Flying Spaghetti Monster seems to finally become fully aware. He senses the remaining magical power in you and decides you’ll make a fine snack. It’s been SO LONG since he’s had a decent meal...";
	end the story finally.
	
When GoodEndOne begins:
	say "With the last of your energy, you fire a magic missile right at the Flying Spaghetti Monster’s… face? Regardless, you manage to blow it to smithereens. Even as you drop to the ground in exhaustion, the remaining pastafarian cultists flee in terror of your god-slaying might. There will be time to reflect on your actions later. For now, all you can manage to do is pass out.
	You come to in the same gardens where you started. Apparently the groundskeeper managed to carry you all the way here. He is standing a short ways off, gazing at the stars. He sees you, awake, and smiles. 'Good job, kiddo. My old man must be pretty happy right about now.' [italic type]His old man?[roman type] Yup. He smiles and points to his nametag. You can barely make it out in the low light. It reads JESUS. [italic type]Wait what?! [roman type]'Yeah, Father Serra was my grandfather. I’ve been watching over this mission since I was a kid. What, you think I thought GOD was my father? What are you, crazy?'”;
	end the story finally.
	
When GoodEndTwo begins:
	say "With a tremendous effort, you manage to open a portal back to the Flying Spaghetti Monster’s home dimension. The portal is unstable, but remains open long enough to suck in the flying spaghetti monster and most of the cultists. The few that remain flee instantly. There will be time to reflect on your actions later. For now, all you can manage to do is pass out.
	You come to in the same gardens where you started. Apparently the groundskeeper managed to carry you all the way here. He is standing a short ways off, gazing at the stars. He sees you, awake, and smiles. 'Good job, kiddo. My old man must be pretty happy right about now.' [italic type]His old man?[roman type] Yup. He smiles and points to his nametag. You can barely make it out in the low light. It reads JESUS. [italic type]Wait what?! [roman type]'Yeah, Father Serra was my grandfather. I’ve been watching over this mission since I was a kid. What, you think I thought GOD was my father? What are you, crazy?";
	end the story finally.

When GoodEndThree begins:
	say "With your dwindling reserves of power, you exert your will over the Flying Spaghetti Monster. He puts up some initial resistance, but finally yields to your will. Where your father failed, you have succeeded. The demon and his legions are yours to command. The cultists immediately around you throw themselves at your feet.
	Curiously, you feel refreshed, stronger than you’ve ever felt. You will be unstoppable! Nothing will stand in your way as you make preparations to rule the world. You will make them all pay. In the distance, you sense the presence of another great power, but before you can identify the source, it disappears. Maybe this won’t be as easy as you think, but you will not be cowed. A GOD is serving you, after all…";
	end the story finally.

Chapter 7 - Meatball Monster

Section 1 - The Museum

There is a crucifix in the Museum. The crucifix is fixed in place.

Instead of examining the crucifix:
	say "This crucifix is, pardon the pun, immaculately conceived. It's made of smooth wood, but there is a little silver stripe going around the lengthy part of the cross shape. The stripe says 'The Lord protects those in times of need.' You wonder if perhaps it's concealing something.";
	
Instead of opening or pulling the crucifix: 
	say "You give the shorter end of the crucifix a tug. With a loud, metallic ping, a knife emerges from the crucifix. The crucifix was a secret sheath!";
	remove crucifix from play;
	move knife to location;
	now player has knife;
	
Instead of examining knife:
	say "It seems to be pretty sharp. You notice that it says 'The Lord protects those in times of need.' You're definitely in a time of need.";

Section 2 - The Gift Shop

There is a souvenir bible in the Gift Shop. There is a postcard in the Gift Shop. There is a rosary in the Gift Shop. There is a cash register in the Gift Shop. The Cash Register is a closed container. The Cash Register is openable. The cash register is locked. The cash register is fixed in place. The Cash Register contains money. The postcard unlocks the Cash Register. There is a poster A in the gift shop. The poster A is fixed in place. There is a poster B in the gift shop. The poster B is fixed in place.

Instead of examining or taking the souvenir bible:
	say “It’s a bible. There’s probably hundreds of these throughout the building, and there’s nothing that makes this one special.”;

Instead of examining the rosary:
	say "You run the beads through your fingers. Perhaps it will give you good luck.";

Instead of examining the postcard:
	say "This postcard says, in gaudy cursive lettering, 'Greetings from Mission San Luis Obispo!' The thin postcard is made of surprisingly tough and durable material- when you bend it, it immediately straightens back into place.";

Before taking the rosary:
	if player has the rosary:
		say “You already have a rosary.”;
		stop the action;

Before taking the postcard:
	if player has the postcard:
		say “You already have a postcard.”;
		stop the action;
		
Instead of examining or opening the register:
	if Cash Register is locked:
		say "You press the button to open it, but it appears to be jammed. A thin, strong souvenir might be able to assist in getting it open.";
	otherwise:
		continue the action;
		
Instead of examining museum key:
	say "It says 'museum' on it."
	
Instead of examining poster A:
	say "The poster lists the Ten Commandments in pseudo- Olde English font. You apologize for any commandment breaking you'll be doing tonight.";
	
Instead of examining poster B:
	say "The poster is a photograph of Mission San Luis Obispo. You must admit, when the Mission isn't about to be taken over by the Flying Spaghetti Monster and his minions, it looks quite peaceful.";
	
After taking money:
	if player does not have museum key:
		say "As you take the money from the register, you notice a small key underneath the rows of cash. Clever! Or perhaps maybe really idiotic.";
		move museum key to cash register;
	otherwise:
		say "Do you really need this cash right now?"

Section 3 - The Parish Hall

There is a donut in the Parish Hall. There is a countertop in the parish hall. There is a trash can in the parish hall. The trash can is an open container. The trash can is fixed in place. The countertop is fixed in place.

Instead of eating or examining donut:
	say "You prepare to eat the donut, but then you realize that it's stale. It’s no better than garbage now."
	
Instead of inserting the donut into the trash can:
	say "You have performed a valuable public service. The trees salute you.";
	remove donut from play;
	move fork to the trash can;
	say "As you toss the stale doughnut away, you notice a sharp-looking fork lying in the trash. It might serve as a makeshift weapon..."	

Before taking the fork:
	say "You steel your nerves and plunge your hand into the trash can to pull out the fork.";
		
Section 4 - The Dining Hall

The Murderous Meatball is a female animal in the Dining Area. 

Instead of examining murderous meatball:
	say “The meatball grosses you out. It’s strange to think that food can swallow you, instead of you swallowing food.”
	
Every turn:
	if the player has fork:
		if the player has knife:
			if MeatBallBossDead is 0:
				now MeatBallBossActive is 1.
			
Instead of attacking Murderous Meatball when MeatBallBossActive is 0:
	say "You're ill equipped to attack it. Look for some sliverware.";
			
Instead of attacking Murderous Meatball when MeatBallBossActive is 1:
	if the player has fork:
		if the player has knife:
			say "With the silverware in hand, you eviscerate the meatball with the same ease that you do when eating meatballs at home. As you slice it into pieces, it sings 'On top of Spaghetti' at the top of its lungs before eventually collapsing into a heap of meatball bits. You pocket a few as evidence of your victory.";
			now player has meatball bits;
			now MeatBallBossActive is 0;
			now MeatBallBossDead is 1;
			now ConvoFlag is 3;
			remove murderous meatball from play;
		otherwise:
			say "Although you have a good grip on the meatball with your fork, you can't cut it apart. Your fork needs a mate. The meatball shakes you loose and swallows you whole. You don't know what's going on, but you the safe bet would be be that you're going to be a sacrifice after all. Darkness overtakes you.
			[paragraph break]
			You awake just as the ritual reaches its conclusion. Horrified, you stare at your hands as they begin to melt into a much looser and noodly form. After all that, you weren’t able to stop your destiny. Eventually, a foreign consciousness overpowers you and everything fades to black. The Flying Spaghetti monster claims its first victims. The world is doomed.";
			end the story;
	otherwise:
		say "You attempt to stop the mass from moving, but you don't have anything to pin it to the ground. [if player has knife] Your knife needs a mate to fully finish this meal. [otherwise] Mom always said to never eat food with your fingers. [end if]  The meatball shakes you loose and swallows you whole. You don't know what's going on, but you the safe bet would be be that you're going to be a sacrifice after all. Darkness overtakes you.
		[paragraph break]
		You awake just as the ritual reaches its conclusion. Horrified, you stare at your hands as they begin to melt into a much looser and noodly form. After all that, you weren’t able to stop your destiny. Eventually, a foreign consciousness overpowers you and everything fades to black. The Flying Spaghetti monster claims its first victims. The world is doomed.";
		end the story.

Chapter 8 - Deacon Youth 

the parked cars are scenery in the west parking lot.

the few parked cars are scenery in the east parking lot. 
	
the motivational posters are an undescribed object in the youth center.
the colorful books are an undescribed object in the youth center.
the stationary is an undescribed object in the youth center.
the uniform is an undescribed object in the youth center.
the Darkmaster emblem is an undescribed object in the youth center.

your eyes are an undescribed open container in the youth center.  your eyes are openable.  
the child's eyes are an undescribed object in the youth center.

the child is a person in the youth center.  understand "kid" as child.  understand "Deacon Youth" as child.  understand "youth" as child.  the child can be removed.  "He looks no older than 7, and is wearing a uniform bearing the Darkmaster emblem and the words 'Deacon Youth' below it.  He's telling you about the greatness of the Flying Spaghetti Monster, and how you will be easily defeated."

the unknown key is an object in the youth center.  "The child has a key that he claims is for the main entrance."

instead of examining your eyes:
	say "They're fine."

away is an undescribed object in the youth center. away can be confirmed.

instead of taking unknown key:
	if child is not removed:
		if player is wearing gloves:
			say "'I need that key,' you say.  'Come and get it,' the kid replies.  You attempt to wrestle the key away from him...and he scratches your face!  'ACH!' you yell, recoiling.  Maybe this kid will need more forceful convincing.";
		otherwise:
			say "'Give me the key,' you say.  'Make me,' the kid replies.  You attempt to wrestle the key away from him...and he bites your hand!  'YEOWCH!' you yell, recoiling.  Maybe this kid will need more forceful convincing.";
	otherwise:
		continue the action.


			
instead of attacking child:
	if your eyes are closed or away is confirmed:
		say "'Ow!' he says.  'You win!'.  He hands the key to you and runs away crying.";
		remove the child from play;
		now the child is removed;
		try taking unknown key;
		now ConvoFlag is 2;
	otherwise:
		say "You prepare to attack, but as you do, the child’s expression becomes innocent and angelic.  You can’t do it.  Not while looking at that face anyway.";

after closing your eyes:
	say "You close your eyes.  The Deacon Youth continues to endlessly yammer about the glory of his noodly holiness, the Flying Spaghetti Monster.";
	
after examining away:
	Now away is confirmed;
	say "You look away from the Deacon Youth.  He continues to endlessly yammer about the glory of his noodly holiness, the Flying Spaghetti Monster.";

Chapter 9 - Nasty Noodle

Section 1 - The Lighter

A lighter is a kind of container. 
A lighter can be lit or unlit.  A lighter is usually not lit.

Definition:  a container is empty if no thing is in it.
The zippo lighter is a lighter.	
	

The description of the zippo lighter is "This lighter was probably used for various religious rituals involving… well… lighting things.  
Often times candles are lit in hopes of gaining a favor from God or a specific saint.  You wonder what particular favor this
lighter could be used for.  Ignite the zippo and see what it can do![paragraph break]
	[if zippo lighter is empty]This lighter is currently empty… pretty useless without [italic type]lighter fluid[roman type]. 
	[otherwise]The lighter is filled to the brim with beautiful, liquid lighter fuel!"

Section 2 - The Noodle

Every turn:
	if location is the Serra Center:
		if the player is on the step stool:
			if the zippo lighter is lit:
				if player is wearing the heatproof suit:
					say "You lift the lit zippo lighter near the sprinkler, and before you know it… hundreds of pounds of water come raining down form the ceiling.  The water is incredibly hot, just as Hector predicted.  But as the water dumps on the room, you realize the nasty noodle is becoming weaker, smaller, less nasty.  It only takes 30 seconds for the nasty noodle to be stripped of his power.  Now there are pieces of cooked spaghetti all over the room!";
					Now there is cooked spaghetti in the Serra Center;
					Now the emergency fire sprinkler is switched on;
					Now the zippo lighter is unlit;	
				otherwise:
					say "You quickly flip turn off your zippo, realizing it might be the best idea to put on some sort of protective clothing before dousing the room in boiing hot water… the room you are in of course.";
					Now the zippo is unlit;
				
Section The Chapel

The Chapel Closet is an undescribed closed openable fixed in place container in the Chapel.
The description of the Chapel Closet is "[if Chapel Closet is closed] Maybe try opening it, first?  But hey, the door is nice, too.[otherwise]Just your basic custodial closet!"

There is a step stool in the Chapel Closet.  A step stool is a stool.  
The description of the step stool is "A step stool for stepping up and reaching things!  Who would have thought…  Good for [italic type]reaching high places![roman type]"

The description of Hector is "Hector is [if Hector is the current interlocutor]leaning on his mop, talking with you.[otherwise]quietly going about his Chapel duties."

After saying hello to Hector when the greeting type is explicit:
	  say "'Hello there, Hector!' you say.[paragraph break]Hector looks up from his current duty and smiles.  'Why hello to you, too!'";

After saying hello to Hector when the greeting type is implicit:
	  say "You attract Hector's attention with a cough.  He looks up to hear what you have to say.";
	
After quizzing Hector about Hector:
	  say "'How's it goin['], Hector?' you ask.[paragraph break]'I'm doing just fine.  No complaints, here.' Hector responds.";

After quizzing Hector about the Chapel Closet:
	say "'Mr. Hector, anything interesting in that closet over there?' you ask. [paragraph break]
	'Eh, just some basic cleaning supplies.  you can go check it out if you like,' said Hector.
	[paragraph break]'Thank you!'";
	
After quizzing Hector about emergency fire sprinkler:
	say "'Hey Hector, what's the deal with the note next to the sprinkler?' you ask. [paragraph break]
	'Ah yes!  You saw my note,' replies Hector.  'Well, you see, there's been some bizarre mishap with our water
	pipes throughout the entire [italic type]East Wing![roman type]  All of the running water is [italic type]boiling hot[roman type]!
	Can you believe it?  It's the most peculiar thing!'  [paragraph break]
	'Geez that is wacky.  Well, thank you for the information, Hector!'";

After quizzing Hector about handwritten note:
	try quizzing Hector about the emergency fire sprinkler;
	
After quizzing Hector about nasty noodle:
	say "'Um, Hector, what the HECK is that nasty-noodle-thing?!,' you ask.
	[paragraph break]'Oh ho ho!  So you found the beast!' Hector replies.  'Yeeahhh, he's been fumbling around in there for approximately 20 years now… I guess that makes sense for the lack of visitors…  Hmm, yes.  But beware, he is VERY dangerous!  I would stay as far away as possible!'";
	
Section The Parish Office

A cookbook is a note.

The office desk is a supporter in the Parish Office.  There is are some papers and a cookbook on the office desk.  There is a small silver key on the office desk.  The small silver key is undescribed.
The office desk is undescribed.

The description of cookbook is "The cookbook is open to a spaghetti recipe.  It reads:
[paragraph break][italic type]Step 1: Boil Water.
[paragraph break]Step 2: Insert raw spaghetti into pot of boiling water
[paragraph break]…[roman type]"

The description of some papers is "[if the small silver key is undescribed]A random assortment of documents, notes, files… nothing of specific importance… Needs some [italic type]organizing[roman type]…[otherwise]Finally, some method to this mess of papers."

Paper organizing is an action applying to things.
Understand "organize [any things]" as paper organizing.

Carry out paper organizing:
	if the small silver key is undescribed:
		say "As you begin to sift through the mess of papers, you come across a small silver key buried under the pile of papers!";
		Now the small silver key is described;
	otherwise:
		say "These papers appear to be organized already!  Well done!"
	
The description of the office desk is "[if small silver key is described]With the papers partially organized, it is much easier to see what is on the desk.[otherwise]Ugh, this desk is a COMPLETE mess.  If someone would just [italic type]organize[roman type] this mess of papers…";

The corner stand is a supporter in the Parish Office.  The thin drawer is part of the corner stand.  The thin drawer is a fixed in place closed locked openable container.

The description of the corner stand is "This holy candle stand serves as the supporter for three very important candles… Unfotunately you are not exactly sure of their importance.  But the three candles on the stand are adorned with gold and silver accents.  Attached to the stand is a thin drawer."

The description of the thin drawer is "[if thin drawer is closed]You are curious as to why this drawer is locked.  Maybe it's related to the candles?  You are itching to find out what is inside.[otherwise]The thin drawer opened smoothly."

The small silver key unlocks the thin drawer.
The description of the small silver key is "This tiny, polished key is small.  But that does not undermine its potential…";
The zippo lighter and small engraving are in the thin drawer.
The small engraving is fixed in place.
The description of small engraving is "You have to squint to read it, but you can make out 2 numbers…[paragraph break]
[bold type]1 _ 3[roman type][paragraph break]You wonder what this code could translate to…";

Instead of taking some papers:
	say “These appear to be someone’s papers.  You should probably leave them alone.”;


Section Bonus Puzzle

A candle is a kind of thing.  A candle is usually unlit.
Understand the lit property as describing a candle.

Instead of burning a candle: 
	if the player is carrying a lighter:
		now the noun is lit;
		say "You light [the noun].";
	otherwise:
		say “You need something to light this candle with!”;

Instead of blowing out a candle: 
   	now the noun is unlit; 
	say "You put out [the noun]."

The first candle, second candle, and third candle are candles on the corner stand.

instead of taking candles:
	say "You decide against removing the candleabra. There's something about it..."

Instead of taking first candle:
	say "Not sure if this would have the best consequences…  Better leave this candle here."
	
Instead of taking second candle:
	say "Not sure if this would have the best consequences…  Better leave this candle here."
	
Instead of taking third candle:
	say "Not sure if this would have the best consequences…  Better leave this candle here."

The corner stand is undescribed.

The description of first candle is "The first candle on the candle stand.  This candle is decorated with gold streamers.
[paragraph break][if first candle is unlit]The first candle is unlit.
[otherwise]The first candle is lit!"

The description of second candle is "The second candle on the candle stand.  Burned slightly less than the other two candles...
[paragraph break][if second candle is unlit]The second candle is unlit.
[otherwise]The second candle is lit!"

The description of third candle is "The third candle on the candle stand.  This candle is adorned with various, rare stones.
[paragraph break][if third candle is unlit]The third candle is unlit.
[otherwise]The third candle is lit!"

The secret compartment is a closed openable scenery container in the Parish Office.

The description of secret compartment is "A secret compartment cleverly hidden below the candle stand."

The groundskeeper's wallet is in the secret compartment.
The description of the groundskeeper's wallet is "This is the groundskeeper's wallet he lost!  You should give it to him immediately!" 

Every turn:
	If the first candle is lit:
		If the third candle is lit:
			If the second candle is unlit:
				say "After lighting the first and third candles, you notice a [italic type]secret compartment[roman type] below the corner stand.";
				now the secret compartment is described;
				now the first candle is unlit;
				now the third candle is unlit;


Section The Serra Center

A sprinkler is a kind of thing.  A sprinkler can be switched on or switched off.
An emergency fire sprinkler is a switched off fixed in place sprinkler in the Serra Center.

The description of the emergency fire sprinkler is "[if the emergency fire sprinkler is switched off]This sprinkler may be old, but could easily douse the entire room in hundreds of pounds of water.  Good thing its high up on the ceiling, out of reach…[otherwise]The emergency sprinkler is DUMPING water on the room!";

Instead of switching on the emergency fire sprinkler, say "Now how do you imagine doing that?"

A handwritten note is a fixed in place note in the Serra Center; the description of the handwritten note is "[italic type]DANGER!  DANGER!  Sprinkler defective! - Hector[roman type][paragraph break]Interesting…  you should probably talk to Hector about this.";

The Nasty Noodle is in the Serra Center; it is undescribed; the description of the nasty noodle is "[if the emergency fire sprinkler is switched off]The Nasty Noodle is too [italic type]tough and strong[roman type]…and menacing to fight as is!![otherwise]The Nasty Noodle is withered, soft, and much more… noodly?";

Instead of attacking the nasty noodle, say "The Nasty Noodle is just a bit too raw to fight!  Trying to attack it would seriously hurt your hand!!"

Before eating the nasty noodle: 
	if the emergency fire sprinkler is switched off:
		say "Mmmm, uncooked noodle… your favorite… oh wait…";
		stop the action;
	otherwise:
		say “After defeating the monster, you’re not so sure if you have an appetite for noodles anymore”;

Instead of taking the nasty noodle, say "Yes.  Let's just stuff the noodle boss monster in your pocket…  Better think of something else!"

	
Chapter 10 - The Garage

The garage closet is a fixed in place closed openable container in the garage.
The heatproof suit is a wearable thing in the garage closet.

The description of the garage closet is "An old closet nestled in the corner of the garage."

The description of the heatproof suit is "Hmm, an orange jumpsuit.  You've always wanted one of these.  After further inspection of the suit, you discover that this suit is particulary designed to resist extremely hot temperatures."

The workbench is a fixed in place supporter in the garage.  

The description of the workbench is "An old, worn out, loved work bench.  Many a projects must have been conceived on this very spot.  There is a very rusty drawer attatched to the bottom of the workbench."

The rusty drawer is part of the workbench; the description of the rusty drawer is "[if rusty drawer is closed]This drawer is rusted shut![otherwise]The rusty drawer is open revealing: [list of things in rusty drawer]"; the rusty drawer is a fixed in place closed openable container.
There is lighter fluid in the rusty drawer.  The lighter fluid is undescribed.

The tool box is a closed openable fixed in place container in the garage; the description of the tool box is "A tool box left carelessly on the floor of the garage…"; it is undescribed.  Understand "toolbox" as tool box.
A pair of work gloves is a wearable thing in the tool box; the description of the work gloves is "Tough work gloves!  Perfect for jobs tough on the hands!".

The workbench is undescribed.
The garage closet is undescribed.

Instead of taking the tool box:
	say "With all of your superhuman strength, you miraculously heave the extremely tool box in your inventory…![paragraph break]
	Oh wait… you don't have super strength.  The tool box is a tad bit too heavy for carrying!"

Instead of opening the rusty drawer:
	if player is wearing work gloves:
		say "Now with the afforded durability of the [italic type]handy[roman type] work gloves you procured, you are
		able to force the rusty drawer open revealing: 
		[list of things in the rusty drawer]";
		Now the rusty drawer is open;
	otherwise:
		say "The rusty drawer is [italic type]rusted shut[roman type], you're gonna need to be wearing something
		protective on your hands to open it!";

the rest key is an undescribed object in the Deacon's car.  Understand "restroom key" as rest key.  
Every turn:
	Change the printed name of the rest key to "restroom key".;

instead of examining Deacon's car:
	if Deacon's car does not contain rest key:
		say "There's nothing else in the car.";
	otherwise if the Deacon's car is not broken:
		say "You can see a key through the car window.  How careless.  The key has a small label that reads 'Restroom'";	
	otherwise:
		say "Lying amid the broken glass, you can see a key labeled 'Restroom'".

Instead of attacking Deacon's car:
	if Deacon's car is broken:
		say "I think you've done enough damage to the poor car…";
	otherwise:
		say "You shove your elbow into the car window as hard as you can.  The window breaks!  (Your elbow might be broken too.)";
		Now Deacon's car is broken.;
		try opening Deacon's car;

after opening Deacon's car:
	if Deacon's car is not broken:
		try closing Deacon's car.;

after closing Deacon's car:
	say "The car is locked.  And, most likely, Deacon has the car key with him.";


Chapter 11 - The West Wing

Instead of asking the Saucy Sorceress about something:
say "[one of]The FSM shall live on.  Bow down now[or]My minions will destroy this town little by little[or]You can’t defeat me, I feel no emotions[at random].";

Instead of eating the Delicious Spaghetti Dish:
	if location is Main Entrance:
		remove Delicious Spaghetti Dish from play;
		now the grand wooden door is unlocked;
		now the oak door2 is unlocked;
		say “The Saucy Sorceress Screams ‘The horror!  My precious creation!  What have you done?!  This is unspeakable.’  You feel the room shake and you hear a high pitched sound, like something scraping against the floor. She flees inside the Church.”;
		now the Saucy Sorceress is in the Blank Room;
		now ConvoFlag is 6;
	otherwise:
		say “As delicious as this dish is, you decide to save it for now.”;

[MC]
Instead of taking pew:
	say "This appears to be stuck in the floor."

An altar is a thing.  The altar is in the main church.  The altar is fixed in place.  "The altar is made of granite marble." The description of the altar is "Upon looking closer, you notice a few blood spots."

A Priest is a person in the main church.  "A wizened priest strolls around the church, cleaning things and greeting anyone that comes in.  He seems willing to answer any questions, although you may not get the response you want."

After quizzing the Priest about altar:
	say "He looks at the altar with a serene expression. 'I usually pray at the altar each day at noon.'";
After quizzing the Priest about Priest:
	say "Oh, I'm just a lonely priest that's been living here since before the current Deacon. Say, young man... I need some help collecting a few items.  It will be worth your while, I promise. I would like a filled beaker and my special book from the rooms south of here.";
After asking the Priest about [any thing]:
	say "Oh, I'm not so sure about that. However, I need your help. Could you fetch me a special book and a beaker combined with liquid from the other room?";
Instead of talking to the priest:
	say "Hello, child. I hope you are well today. Say, could you do a favor for an old man like myself? Could you fetch my book and a filled beaker from nearby?"

Instead of giving filled beaker to Priest:
	Now Satisfied is Satisfied + 1;
	move filled beaker to Priest;
	say "'Thank you, child. You're pretty sharp, I didn't even tell you what book I wanted!'"
Instead of giving book to Priest:
	Now Satisfied is Satisfied + 1;
	move book to Priest;
	say "Well... I did ask for a filled beaker. I suppose you've completed this part of the request like I asked."

Every turn:
	If Satisfied is 2:
		now Satisfied is Satisfied + 1;
		move rusty key to the player;
		say "'Here you go, your reward as promised. One rusty, old, key!'"

Instead of taking table:
	say "This table is too heavy for your weak body to lift.";

A clothes rack is a thing in the sacristy.  "Clothes are hanging from the rack for the next mass."  A clothes rack is fixed in place.
A shirt and a robe and a jacket are things.  The clothes rack contains a shirt, a robe, and a jacket.  
The description of a shirt is "A couple of strands of linen."  
The description of a robe is "A long formal garment to wear for the celebration of holiness. There appears to be something in the robe pocket..."  
The description of a jacket is "A long-sleeved comfy piece of clothing for cold weather. The picture on the front is of a little cute cat. Hello, kitty!"
The pocket is a container; it is scenery; it is in the robe. "There's a small, empty beaker in the pocket!"
A empty beaker is a container.  The empty beaker is contained in the pocket.  The empty beaker is undescribed.

The west wall is a thing; it is in the sacristy. The description of the west wall is "A mayo stain on the wall has begun to harden, leaving a slight trail towards the floor. You could probably scoop up the remaining... liquid?"  
A mayo stain is a thing.  The mayo stain is on the west wall.  The mayo stain is undescribed.

[Give priest beaker and book, take items, and give another to open door to white rooms]

The annex closet is a undescribed fixed in place closet in the annex. The description of the closet is "A place where the deacon keeps his clothes and possessions."

A groundskeeper's shovel is a undescribed thing in the annex.  The description of the shovel is "The handle says 'owned by the groundskeeper'  I should probably give this to him."

After taking blanket:
	say "The bed is a little less messy now.";
	now the description of the bed is "Since the clutter is gone, you can look under the bed.";
	
Instead of looking under bed:
	say "You find a shovel underneath the bed.";
	

A bed is scenery; it is in the annex.  The description of the bed is "The blanket is scattered everywhere, it is blocking the view of the bed."
A blanket is a undescribed thing in the annex.  

Chapter 12 - Combining

The combining it with action has an object called the item built.

Setting action variables for combining something with something:
	let X be a list of objects;
	add the noun to X;
	add the second noun to X;
	sort X;
	repeat through the Table of Outcome Objects:
		let Y be the component list entry;
		sort Y;
		if X is Y:
			now the item built is the result entry.
Carry out combining it with:
	move the item built to the holder of the noun;
	remove the noun from play;
	remove the second noun from play;

Report combining it with:
	say "You now have [an item built]."

A filled beaker is a thing.
Delicious Spaghetti Dish is a thing.  The Delicious Spaghetti Dish is edible.

Table of Outcome Objects
component list	result
{empty beaker, mayo stain}	filled beaker
{Cooked spaghetti, Meatball bits}	Delicious Spaghetti Dish

Chapter 13 - Running Out of Time

Every turn:
	If TimeCount is 0:
		say "Oh no! The bell has struck. The ritual is ready for you, and that means Dean Darkmaster can focus his attention entirely on you. Sure enough, in mere minutes, you hear hurried footsteps. The Deacon appears before you, a wicked smile on his face. With a few words, he casts a spell that binds you to the floor. You don't know what's going on, but you the safe bet would be be that you're going to be a sacrifice after all. Darkness overtakes you.
		[paragraph break]
		You awake just as the ritual reaches its conclusion. Horrified, you stare at your hands as they begin to melt into a much looser and noodly form. After all that, you weren’t able to stop your destiny. Eventually, a foreign consciousness overpowers you and everything fades to black. The Flying Spaghetti monster claims its first victims. The world is doomed.";
		end the story finally.
