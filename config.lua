Config = {}

Config.PlateUseSpace = true
Config.PlateLetters = 3
Config.PlateNumbers = 3

--YOUR SERVER NAME [ALSO UPDATE THE NUI/ui.html Line:17]
Config.server = 'Dhruvam Roleplay'


----MARKER LOCATION - IN WHERE YOU HAVE TO PRESS 'E'
Config.bliploc = {
    x = -1038.067, y = -2738.274, z = 20.1693
}

---ENTER THE SPAWN CODE OF A CAR THAT YOU WANT TO GIVE THE PLAYER
Config.vehicle = 'sclkuz'

--- COORDS WHERE THE VEHICLE SPAWNES
Config.spawnVehiclecoords = {
    x = -1034.886, y = -2728.292, z = 20.131328, h = 243.31988
}

Config.SavetoDB = true


---------GUIDE HELP TEXT, [DO NOT UPDATE LINES]
Config.text = {
    a = 'Alexa: Hey! Alexa here to guide you as you begin on the server.',
    b = 'Alexa: Go to the marked waypoint.',
    c = 'Alexa: Great! This is our main garage where you can save or take vehicles.',
    d = 'Alexa: Here you can take jobs and grind from a variety of allowed jobs.',
    e = 'Alexa: You can buy vehicles from here.',
    f = 'Alexa: This is one of our bank branches where you can handle money activities.',
    g = 'Alexa: This is the hospital where you can heal yourself.',
}

-----HERE YOU CAN SET THE LOCATIONS FROM 1 TO 5, [DO NOT UPDATE LINES]
Config.locations = {
    a = {x = -273.0895, y = -884.7941, z = 31.187324},
    b = {x = -261.7196, y = -972.1386, z = 31.219902},
    c = {x = -61.52976, y = -1093.276, z = 26.486818},
    d ={x = 150.76847, y = -1035.346, z = 29.340122},
    e = {x = 272.44589, y = -605.6771, z = 42.863925},
}


------BLIP RADIUS
Config.radius = 4 ---IF the player is in the blip radiues 4 then the guide will trigger the next blip,  min 2


Config.SkipGuideMessage = "Use /skipguide to skip this!"
Config.AlreadyClaimedMesagge = "I already gave you a free car"
Config.ReciveMessage = "You received a Free Car"

Config.GeneratePlateExport = exports['vehicleshop']:GeneratePlate() -- If you are not using then put false

Config.ConfirmationLabel = 'Would you like to start the guide!'

function Notify(msg)
    TriggerEvent('esx:showNotification', string.format(msg))
end