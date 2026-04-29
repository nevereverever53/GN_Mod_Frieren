function scr_dia_tutorial_mouse()
{
    scr_text("Lilith", UnknownEnum.Value_4, "Welcome, little green ones...");
    scr_text("Lilith", UnknownEnum.Value_4, "Not sure how much you remember, but long story short, you Goblins caused way too many problems.");
    scr_text("Lilith", UnknownEnum.Value_4, "...and a certain goody two shoes 'Deity', decided to eradicate your kind.");
    scr_text("Lilith", UnknownEnum.Value_4, "You poor little 'Goblins' were extinct for over 2 years, until now...");
    scr_text("Lilith", UnknownEnum.Value_4, "I, 'Lilith', daughter of Hell!!... have chosen to return you to this mortal realm.");
    scr_text("Lilith", UnknownEnum.Value_4, "Now, why would I do such a generous thing? That isn't very Hell-ish of me...");
    scr_text("Lilith", UnknownEnum.Value_4, "Lets just say... I have my own, personal reasons.");
    scr_text("Lilith", UnknownEnum.Value_4, "Besides, who else would help you pitiful little Goblins?");
    scr_text("Lilith", UnknownEnum.Value_4, "Anyway, enough chit chat and let's get started.");
    scr_text("Lilith", UnknownEnum.Value_4, "First of all, Let's start with controls.");
    scr_text("Lilith", UnknownEnum.Value_8, "Left-click to interact with objects and Right-click to move the camera.");
    scr_text("Lilith", UnknownEnum.Value_9, "Use the mouse scroll wheel to zoom in and out.");
}

function scr_dia_tutorial_cell()
{
    scr_text("Lilith", UnknownEnum.Value_4, "Next, you need to learn how things work around here.");
    scr_text("Lilith", UnknownEnum.Value_4, "Let's start with building a 'Wall 1' cell.");
    scr_text("Lilith", UnknownEnum.Value_4, "I've sent you a quest. Complete it and you shall be rewarded.");
    scr_text("Lilith", UnknownEnum.Value_5, "Interact with cells or pillars to enter 'Create' or 'Edit' mode.");
}

function scr_dia_tutorial_quest()
{
    scr_text("Lilith", UnknownEnum.Value_4, "Very good, that looks sturdy enough. Now... for your reward.");
    scr_text("Lilith", UnknownEnum.Value_11, "The 'Quest Icon' is located on the left side of the screen, open it to view the quest window.");
    scr_text("Lilith", UnknownEnum.Value_12, "You can collect your rewards there.");
}

function scr_dia_tutorial_drag()
{
    scr_text("Lilith", UnknownEnum.Value_4, "Shall we put the 'Wall 1' cell to work?");
    scr_text("Lilith", UnknownEnum.Value_4, "I've sent you a captured 'Peasant', you can find her in the 'Prison Window'.");
    scr_text("Lilith", UnknownEnum.Value_4, "Drag the captured unit from there to the cell that you just created.");
    scr_text("Lilith", UnknownEnum.Value_13, "You can access the prison window by clicking the prison icon button at the bottom of the screen.");
    scr_text("Lilith", UnknownEnum.Value_14, "Hold left-click on the head icon to drag the unit, let go of left-click to drop the unit.");
}

function scr_dia_tutorial_birth()
{
    scr_text("Lilith", UnknownEnum.Value_4, "You will need a 'Birth' cell to repopulate.");
    scr_text("Lilith", UnknownEnum.Value_4, "When a unit is pregnant, move the captured unit to a 'Birth' cell.");
    scr_text("Lilith", UnknownEnum.Value_4, "You should have the gold needed from the quest rewards.");
    scr_text("Lilith", UnknownEnum.Value_6, "Click on a cell to create a 'Birth' cell and move units by dragging their head icons above their heads.");
    scr_text("Lilith", UnknownEnum.Value_16, "To make the head icons on cell visible, click on the head icon button on the top right side of the screen.");
}

function scr_dia_tutorial_raid_window()
{
    scr_text("Lilith", UnknownEnum.Value_4, "Unfortunately, there are more things to be mindful about than just moving units around.");
    scr_text("Lilith", UnknownEnum.Value_22, "Cells have a chance to get increasingly dirty after being used.");
    scr_text("Lilith", UnknownEnum.Value_25, "Food is needed to keep your population alive, they are consumed at the end of each day.");
    scr_text("Lilith", UnknownEnum.Value_4, "Making sure that your cells are clean and prepare enough food by the end of the day to keep the population happy.");
    scr_text("Lilith", UnknownEnum.Value_4, "Lastly, you will need to raid villages to capture more female units and get more resources.");
    scr_text("Lilith", UnknownEnum.Value_35, "Access your 'Raid Window' by clicking on the 'Raid Icon Button' on the bottom left.");
}

function scr_dia_tutorial_raid_drop()
{
    scr_text("Lilith", UnknownEnum.Value_36, "Drag troops from the nest section on the left side of the window to the 'Formation' section on the right side of the window.");
    scr_text("Lilith", UnknownEnum.Value_37, "You can choose to drop the troop in either the 'Front' or 'Back' line.");
}

function scr_dia_tutorial_end()
{
    scr_text("Lilith", UnknownEnum.Value_38, "For a succesful raid, your 'Front' and 'Back' AP (Attack Power) must both be higher than the enemy's AP.");
    scr_text("Lilith", UnknownEnum.Value_40, "Click on the 'Raid' button on the map to start the raid.");
    scr_text("Lilith", UnknownEnum.Value_84, "You can also visit the 'Shop' and 'Trader' to upgrade your nest, or trade for resources.");
    scr_text("Lilith", UnknownEnum.Value_7, "For more information, you can refer to the 'Guide' in the settings window.");
    scr_text("Lilith", UnknownEnum.Value_4, "Now that you have everything you need, you are ready to grow your army.");
    scr_text("Lilith", UnknownEnum.Value_4, "Although tiny, stupid, and weak, I see something special in your species... Do not disappoint me.");
    scr_text("Lilith", UnknownEnum.Value_4, "I'll return when you have a sizable army.");
    ds_list_add(global.new_guide_list, -1);
}

function scr_dia_lilith_cow_tip()
{
    scr_text("Lilith", UnknownEnum.Value_4, "Look at you, hard at work... seems like you're getting the hang of it.");
    scr_text("Lilith", UnknownEnum.Value_4, "I'd love to reward you somehow, but I'm busy dealing with... Hell stuff.");
    scr_text("Lilith", UnknownEnum.Value_4, "However, I did hear that a prominent 'Barbarian' is around the Village.");
    scr_text("Lilith", UnknownEnum.Value_4, "Mortals refer to her as the 'Goddess of Milk'... Just a cow with fat tits if you ask me.");
    scr_text("Lilith", UnknownEnum.Value_4, "She should be able to provide you with enough 'Milk' to sustain your colony.");
    scr_text("Lilith", UnknownEnum.Value_4, "That is if you manage to find and capture her...");
    scr_text("Lilith", UnknownEnum.Value_4, "A certain item from the shop should do the trick and lure her out into the open.");
    scr_text("Lilith", UnknownEnum.Value_4, "Good luck...");
}

function scr_dia_lilith_tent()
{
    scr_text("Lilith", UnknownEnum.Value_4, "You've made it quite far, how is the nest coming along?");
    scr_text("Lilith", UnknownEnum.Value_4, "I'm sure as your population grows, maintaining it has become more troublesome.");
    scr_text("Lilith", UnknownEnum.Value_4, "So, I've brought you a cute little friend of mine.");
    scr_text("Lilith", UnknownEnum.Value_4, "It will help you deal with some nest chores, treat it well...");
    scr_text("Lilith", UnknownEnum.Value_4, "The Elf Goddess of this forest is the reason behind your reckoning.");
    scr_text("Lilith", UnknownEnum.Value_4, "She brings life to the trees and loves her creation, capturing her will be no small feat.");
    scr_text("Lilith", UnknownEnum.Value_4, "But I'm sure you will find a way eventually... Like you always do.");
}

function scr_dia_cow_intro()
{
    scr_text("Hathor", UnknownEnum.Value_0, "The Village's bell has been stolen?");
    scr_text("Hathor", UnknownEnum.Value_0, "Goblins?? I thought those pests were wiped out years ago...");
    scr_text("Hathor", UnknownEnum.Value_0, "Fine, I'll personally make sure they go extinct this time.");
    global.unlock.boss[UnknownEnum.Value_0] = 0;
}

function scr_dia_lilith_cow_win()
{
    scr_text("Lilith", UnknownEnum.Value_4, "So you have managed to capture that cow...");
    scr_text("Lilith", UnknownEnum.Value_4, "Hmm... You guys are starting to grow on me.");
    scr_text("Lilith", UnknownEnum.Value_4, "Use the 'Milk' provided by her and the others to power up your troops.");
    scr_text("Lilith", UnknownEnum.Value_4, "Get strong fast and show me how much chaos you can wreck.");
}

function scr_dia_nyx_intro()
{
    scr_text("Nyx", UnknownEnum.Value_1, "From the shadows, they wont see me coming.");
    scr_text("Nyx", UnknownEnum.Value_1, "I will take them out slowly... one by one.");
    scr_text("Nyx", UnknownEnum.Value_1, "These vermin... have no place in this world.");
    global.unlock.boss[UnknownEnum.Value_1] = 0;
}

function scr_dia_lilith_nyx_win()
{
    scr_text("Lilith", UnknownEnum.Value_4, "Oh, that's an interesting specimen you've captured there.");
    scr_text("Lilith", UnknownEnum.Value_4, "Dark elves are notoriously good at hiding.");
    scr_text("Lilith", UnknownEnum.Value_4, "I bet it feels really good finally capturing that annoying little thief.");
    scr_text("Lilith", UnknownEnum.Value_4, "I wonder though... what kind of offsprings can you two create...");
}

function scr_dia_goddess_intro()
{
    scr_text("Selene", UnknownEnum.Value_2, "The world has once again entered the dark ages.");
    scr_text("Selene", UnknownEnum.Value_2, "Let us bless it with light...");
    scr_text("Selene", UnknownEnum.Value_2, "And send the ones who threaten it back to the void...");
    global.unlock.boss[UnknownEnum.Value_2] = 0;
}

function scr_dia_lilith_goddess_win()
{
    scr_text("Lilith", UnknownEnum.Value_4, "How the mighty have fallen...");
    scr_text("Lilith", UnknownEnum.Value_4, "I guess not even Goddesses can escape your grasp.");
    scr_text("Lilith", UnknownEnum.Value_4, "If this keeps up, You might really end up taking over the entire region... .");
}

function scr_dia_morrigan_intro()
{
    scr_text("Morrigan", UnknownEnum.Value_3, "The world... Broken");
    scr_text("Morrigan", UnknownEnum.Value_3, "The cure.... Destruction");
    global.unlock.boss[UnknownEnum.Value_3] = 0;
}

function scr_dia_lilith_morrigan_tip()
{
    scr_text("Lilith", UnknownEnum.Value_4, "You've really done it now... You have awakened destruction itself.");
    scr_text("Lilith", UnknownEnum.Value_4, "Morrigan is one of the Old Gods, born to wipe out civilizations when they reach a critical point.");
    scr_text("Lilith", UnknownEnum.Value_4, "You're on your own for this one...");
    scr_text("Lilith", UnknownEnum.Value_4, "I, however... will reserve myself a front row seat to the realm's demise...");
}

function scr_dia_lilith_end_1()
{
    scr_text("Lilith", UnknownEnum.Value_4, "Oh my... You Goblins actually did it. You have taken over the whole region.");
    scr_text("Lilith", UnknownEnum.Value_4, "Well done, I knew that I saw something in your kind, but never did I expect it to be this efficient...");
    scr_text("Lilith", UnknownEnum.Value_4, "You Goblins sure are hardy creatures.");
    scr_text("Lilith", UnknownEnum.Value_4, "Well... It seems like you won't be needing my guidance anymore, as you are fully capable of taking care of yourself now.");
    scr_text("Lilith", UnknownEnum.Value_4, "It has been a pleasure watching you.");
    
    if (global.unlock.boss[UnknownEnum.Value_4] == -1)
        global.unlock.boss[UnknownEnum.Value_4] = -2;
}

function scr_dia_lilith_intro()
{
    scr_text("Lilith", UnknownEnum.Value_4, "Oh, What is this... is this a shrine of me?");
    scr_text("Lilith", UnknownEnum.Value_4, "Once again, your kind surprises me. Never took your species to be the collectors type.");
    scr_text("Lilith", UnknownEnum.Value_4, "Don't ask me what it does, it's too complicated for your brains to compute.");
    scr_text("Lilith", UnknownEnum.Value_4, "However you have made my job a lot easier.");
    scr_text("Lilith", UnknownEnum.Value_4, "Looks like I am now free for the next few decades.");
    scr_text("Lilith", UnknownEnum.Value_4, "Hmm... now what could I offer you as a reward?");
    scr_text("Lilith", UnknownEnum.Value_4, "I could let you guys have some fun with me, but I prefer to be taken by force...");
    scr_text("Lilith", UnknownEnum.Value_4, "So, how about this...");
    scr_text("Lilith", UnknownEnum.Value_4, "I present you... an opportunity to challenge me instead.");
    scr_text("Lilith", UnknownEnum.Value_4, "Don't worry, I will only use a fraction of my power. I don't intend for you to go extinct again after all that.");
    scr_text("Lilith", UnknownEnum.Value_4, "If you can defeat me, you can take me back to your nest and do whatever you want with me.");
    scr_text("Lilith", UnknownEnum.Value_4, "Sounds good? I'll be waiting at the Tower in the East.");
    scr_text("Lilith", UnknownEnum.Value_4, "Come prepared...");
    global.unlock.boss[UnknownEnum.Value_4] = 0;
    scr_set_stage_data(UnknownEnum.Value_4, 0, false);
}

function scr_dia_lilith_end_2()
{
    scr_text("Lilith", UnknownEnum.Value_4, "Congratulations, you have passed the test.");
    scr_text("Lilith", UnknownEnum.Value_4, "Hmm? You want to know why did I bother ressurecting your kind when I could have easily wiped out the entire region myself?");
    scr_text("Lilith", UnknownEnum.Value_4, "You're not wrong, but I prefer nurturing a species that is able to survive on their own...");
    scr_text("Lilith", UnknownEnum.Value_4, "Not having to always rely on me to do their bidding.");
    scr_text("Lilith", UnknownEnum.Value_4, "And... I find you Goblins cute anyways <3.");
    scr_text("Lilith", UnknownEnum.Value_4, "I am sure it wasn't easy, probably took you quite some time as well..");
    scr_text("Lilith", UnknownEnum.Value_4, "But I am proud of you for reaching all this way to the end.");
    scr_text("Lilith", UnknownEnum.Value_4, "Congratulations, the region is all yours now, and so am I...");
}

function scr_dia_demo()
{
    scr_text("Demo End", UnknownEnum.Value_62, "You have reached the end of the demo, stay tuned for the full game release soon.");
}

function scr_dia_softlock()
{
    scr_text("Lilith", UnknownEnum.Value_4, "It seems that you have messed up, I'll revive some of you to get started again.");
    scr_text("Lilith", UnknownEnum.Value_4, "Be more careful next time...");
}

function scr_dia_lilith_no_food()
{
    scr_text("Lilith", UnknownEnum.Value_4, "Looks like some of your troops died due to having insufficient food.");
    scr_text("Lilith", UnknownEnum.Value_4, "Consider trading some of your milk or remaining troops for food from the 'Trader' on the map.");
}

function scr_dia_lilith_op()
{
    scr_text("Lilith", UnknownEnum.Value_62, "You have accumulated...");
    scr_text("Lilith", UnknownEnum.Value_62, "'" + string(global.val.money) + "' gold, and '" + string(global.val.food) + "' food from the demo.");
    scr_text("Lilith", UnknownEnum.Value_62, "I'm glad you had so much fun trying out the demo!");
    scr_text("Lilith", UnknownEnum.Value_62, "However, this might affect your experience moving forward by making the game too easy.");
    scr_text("Lilith", UnknownEnum.Value_62, "Perhaps starting a new save file could provide a better overall experience.");
    scr_text("Lilith", UnknownEnum.Value_62, "Alternatively, you can continue with this save file and take it easy.");
    scr_text("Lilith", UnknownEnum.Value_62, "The choice is yours...");
}

function scr_dia_frieren_intro()
{
    scr_text("Frieren", UnknownEnum.Value_95, "A goblin nest...? That wasn't here before.");
    scr_text("Frieren", UnknownEnum.Value_95, "Perhaps I'll go take care of it.");
    scr_text("Frieren", UnknownEnum.Value_95, "I can always slip away if it gets dangerous.");
    global.unlock.boss[UnknownEnum.Value_6] = 0;
}

function scr_dia_frieren_win()
{
    scr_text("Frieren", UnknownEnum.Value_96, "This... wasn't supposed to happen.");
    scr_text("Frieren", UnknownEnum.Value_96, "Why are there so many of you?");
    scr_text("Frieren", UnknownEnum.Value_96, "And... why are all of you naked?");
}

function scr_dia_frieren_hint()
{
    scr_text("Lilith", UnknownEnum.Value_4, "That elf is a slippery one, isn't she?.");
    scr_text("Lilith", UnknownEnum.Value_4, "You must be really tired of her getting away...");
    scr_text("Lilith", UnknownEnum.Value_4, "Maybe if your raids weren't so... obvious? You might be able to tie her down properly.");
    scr_text("Lilith", UnknownEnum.Value_4, "I'll look forward to seeing how you deal with her.");
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_11 = 11,
    Value_12,
    Value_13,
    Value_14,
    Value_16 = 16,
    Value_22 = 22,
    Value_25 = 25,
    Value_35 = 35,
    Value_36,
    Value_37,
    Value_38,
    Value_40 = 40,
    Value_62 = 62,
    Value_84 = 84,
    Value_95 = 95,
    Value_96
}
