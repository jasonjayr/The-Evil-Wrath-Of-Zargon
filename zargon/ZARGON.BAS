DECLARE SUB battleset ()
DECLARE SUB boatman (switch!)
DECLARE SUB bubble ()
DECLARE SUB castle ()
DECLARE SUB castspell ()
DECLARE SUB charstatz ()
DECLARE SUB CheckLevel ()
DECLARE SUB ChexFoArmor ()
DECLARE SUB ChexFoWeaponz ()
DECLARE SUB crossroad ()
DECLARE SUB dbattleset ()
DECLARE SUB dhitback ()
DECLARE SUB drawhut ()
DECLARE SUB ending ()
DECLARE SUB fixground (a$)
DECLARE SUB flamesp ()
DECLARE SUB flipguy ()
DECLARE SUB found ()
DECLARE SUB fountain ()
DECLARE SUB healr (a$)
DECLARE SUB Hitback ()
DECLARE SUB HitBeast ()
DECLARE SUB hut (a$)
DECLARE SUB initgraphics ()
DECLARE SUB instructions ()
DECLARE SUB Magix ()
DECLARE SUB monstastaz ()
DECLARE SUB opengam (aaa!)
DECLARE SUB pall ()
DECLARE SUB refresh ()
DECLARE SUB savgam (aaa!)
DECLARE SUB seeitems ()
DECLARE SUB SelectMonsta ()
DECLARE SUB ShowMeDaGraphix ()
DECLARE FUNCTION storycheck! (x1!, x2!, x3!, x4!, x5!, x6!, x7!, x8!, x9!, x10!)
DECLARE SUB watersp ()
DECLARE SUB wepshop (a$)
DECLARE SUB where ()
DECLARE SUB WinBattle ()
DECLARE SUB beatzargon ()
DECLARE SUB delay (deltime!)
DECLARE SUB died ()
DECLARE SUB displayTile (TileId$, x!, y!)
DECLARE SUB fromjeff ()
DECLARE SUB hutsread (cast!(), huts!())
DECLARE SUB Lightning ()
DECLARE SUB oldgame ()
DECLARE SUB readjunk (joe!(), bat!(), slime!(), ghost!(), joeattax!(), flame!(), beleth!(), babble!(), spook!())
DECLARE SUB rotate (x AS DOUBLE, y AS DOUBLE, ptx AS INTEGER, pty AS INTEGER, angle AS DOUBLE)
DECLARE SUB title (gef$)
DECLARE SUB usnappa ()
DECLARE SUB charstatz ()
DECLARE SUB crossroad ()
DECLARE SUB ending ()
DECLARE SUB refresh ()
DECLARE SUB where ()
DECLARE SUB ABSPlace (CharID$, FILENAME$, ABSx%, ABSy%)
DECLARE FUNCTION fixdat! (thanx!)
DECLARE SUB hi (gef$, donde!)
DECLARE SUB showit (show!)
DECLARE FUNCTION xquad! (x!)
DECLARE FUNCTION yquad! (y!)


DECLARE SUB charstatz ()
DECLARE SUB crossroad ()
DECLARE SUB ending ()
DECLARE SUB refresh ()
DECLARE SUB where ()
DECLARE SUB ABSPlace (CharID$, FILENAME$, ABSx%, ABSy%)
DECLARE SUB delay (deltime!)
DECLARE FUNCTION fixdat! (thanx!)
DECLARE SUB hi (gef$, donde!)
DECLARE SUB showit (show!)
DECLARE FUNCTION xquad! (x!)
DECLARE FUNCTION yquad! (y!)


'**************************************************
'this game was created by many people, i am gregory milette
'to the programmers:
'i know that this programs is very messy and can be considered
'"spegetti code" but, it represents the trials and errors of me and my friends
'i realize now, that it takes a lot of organization to create something
'like this, and also better teamwork.. both of these things, i will
'work on when i create my next program.....
'**always keep the disk in the drive while running the game..
'**it runs off the disk
'oh yes there are probably more bugs in the game, but that is why i am not finished
'and am still working on it :)
'**************************************************


bust:
    
'geoff declares
COMMON SHARED stealgraphics
COMMON SHARED quad2, quad, mapx, mapy, cx, cy, a$
COMMON SHARED rock(), tree(), sand(), dude(), flor()
COMMON SHARED tree2(), water(), huts(), grass(), florwd()
COMMON SHARED hutspotx, hutspoty, s.spotx, s.spoty
COMMON SHARED storystatus, items() AS STRING
COMMON SHARED wepshopx, wepshopy, healx, healy
COMMON SHARED inship, ship
COMMON SHARED ll, Gain, path$
COMMON SHARED cLEV, ex, cAP, BcAP, cDP, BcDP, mon, M$, wgain, wstatus, astatus
COMMON SHARED mAP, mDP, cMP, BcMP, cLOSS, mloss, spelllev
COMMON SHARED gold, defence, lev, splev, howmuchbigger, cheat$, damage

'geoff dims

DIM SHARED joe(150), joeattax(150), bat(150), slime(150), ghost(150), spook(150)
DIM SHARED flame(150), monster(400), necro(150), beleth(200), babble(70)

DIM SHARED fboat(140), cast(140)
DIM SHARED cflor(130), ZARGON(450)
                                  'paths 1 bigger

CLEAR , , 20000

DIM SHARED donttouch(22, 12), ground(22, 12)'a few more 'top and bottom
DIM SHARED cir(130), squar(130), rock2(130), grav(130)
DIM SHARED front1(130), front2(130), back1(130), back2(130), sider(130), sidel(130)
DIM SHARED dude1(130), dude2(130), boat
DIM SHARED oldman(140), kraken(400), snake(350)
DIM SHARED nextlev
DIM rock(130), flor(130)    'change em to 125
DIM tree(130), tree2(130)
DIM sand(130), water(130), florwd(130)
DIM dude(130), huts(130), grass(130)
DIM items(10) AS STRING


RANDOMIZE TIMER
'now instructions
'library mode
ll = 0

CALL usnappa
CALL title("The evil wrath of Zargon")
'it goes faster after the title
CALL instructions
busted:
SCREEN 9
'*************Healer not there too!!!
gold = 20
inship = 0
ship = 0
storystatus = 1
cx = 15: cy = 8
mapx = 2: mapy = 4
'statz    'geoff starts crap
' cheat$ = "yes"
 BcAP = 3
 cAP = 3
 BcDP = 20
 cDP = 20   'cheat
 BcMP = 9
 cMP = 9
 nextlev = 20
 splev = 0
 lev = 1
 wstatus = 1
 checky = 1
 IF cheat$ = "yes" THEN cDP = 2000

RANDOMIZE TIMER

stealgraphics = 0

initgraphics
flipguy          'flips one of the graphics on it's axis.
ShowMeDaGraphix  'Load Reads from other mod

'drawgraphix for PUTing
INPUT "do you want to load a game?"; yo$
IF yo$ = "y" THEN opengam (99)
CALL crossroad
CALL where


bustout:
CALL savgam(0)
CLS
PRINT "it messed up sorry"
INPUT yo$
CLEAR , , 20000
CALL initgraphics
CALL flipguy
ShowMeDaGraphix
CALL opengam(0)
alpha = 1
RESUME NEXT

DEFINT A-Z
huts:
DATA 2,6,2,6,2,6,2,6,2,6,2,6,2,6,2,6,2,6,6,6,2,6,2,6,2,6,2,6,2,6
DATA 6,2,6,2,6,2,6,2,6,2,6,2,6,2,6,6,6,14,14,6,6,2,6,2,6,2,6,2,6,2
DATA 2,6,2,6,2,6,2,6,2,6,2,6,2,6,6,14,14,6,6,14,14,6,2,6,2,6,2,6,2,6
DATA 6,2,6,2,6,2,6,2,6,2,6,6,6,14,14,6,6,14,14,6,6,14,6,2,6,2,6,2,6,2
DATA 2,6,2,6,2,6,2,6,2,6,6,7,14,6,6,14,14,6,6,14,14,6,6,6,2,6,2,6,2,6
DATA 6,2,6,2,6,2,6,2,6,6,7,6,7,14,14,6,6,14,14,6,6,14,14,6,6,2,6,2,6,2
DATA 2,6,2,6,2,6,2,6,6,7,6,7,6,7,6,14,14,6,6,14,14,6,6,14,14,6,2,6,2,6
DATA 6,2,6,2,6,2,6,6,7,6,7,6,7,6,7,6,6,14,14,6,6,14,14,6,6,14,6,2,6,2
DATA 2,6,2,6,2,6,6,7,6,8,8,8,8,7,6,7,14,6,6,14,14,6,6,14,14,6,6,6,2,6
DATA 6,2,6,2,6,6,7,6,7,8,8,8,8,6,7,6,7,14,14,6,6,14,14,6,6,14,14,6,6,2
DATA 2,6,2,6,6,7,6,7,6,8,8,8,8,7,6,7,6,7,6,14,14,6,6,14,14,6,6,14,14,6
DATA 6,2,6,6,7,6,7,6,7,8,8,8,8,6,7,6,7,6,7,6,6,14,14,6,6,14,14,6,6,14
DATA 2,6,6,7,6,7,6,7,6,7,6,7,6,7,6,7,6,7,6,7,14,6,6,14,14,6,6,14,6,6
DATA 6,6,7,6,7,6,7,6,7,6,7,6,7,6,7,6,7,6,7,6,7,14,14,6,6,14,6,6,7,6
DATA 6,7,6,7,6,7,6,7,6,7,6,7,6,7,6,7,6,7,6,7,6,7,6,14,6,6,7,7,6,6
DATA 2,6,6,7,6,7,6,7,6,7,6,7,6,7,6,7,6,7,6,7,6,7,6,6,7,7,6,6,7,6
DATA 6,6,7,6,7,6,7,6,7,6,7,6,7,6,7,6,7,6,7,6,7,6,6,7,6,6,7,7,6,6
DATA 2,6,6,7,6,7,6,7,6,7,6,7,6,7,6,7,6,7,6,7,6,7,6,6,7,7,6,6,7,6
DATA 6,6,7,6,7,6,7,6,7,6,7,6,7,6,7,6,7,6,7,6,7,6,6,7,6,6,7,7,6,6
DATA 2,6,6,0,0,0,0,0,0,0,0,7,6,7,6,7,6,7,6,7,6,7,6,6,7,7,6,6,7,6
DATA 6,6,7,0,0,8,0,0,0,0,0,6,7,6,7,6,7,6,7,6,7,6,6,7,6,6,7,7,6,6
DATA 2,6,6,8,8,8,8,8,0,0,0,7,6,7,6,7,6,7,6,7,6,7,6,6,7,7,6,6,7,6
DATA 6,6,7,8,7,7,7,8,8,0,0,6,7,6,7,4,7,4,7,6,7,6,6,7,6,6,7,7,6,6
DATA 2,6,6,7,7,7,7,7,8,8,0,7,6,7,4,4,7,4,6,7,6,7,6,6,7,7,6,6,7,6
DATA 6,6,7,7,7,15,7,7,8,8,0,6,7,6,4,4,7,4,4,6,7,6,6,7,6,6,7,7,6,6
DATA 2,6,6,7,7,7,7,7,8,8,0,7,6,7,4,4,7,4,4,7,6,7,6,6,7,7,6,6,7,6
DATA 6,6,7,8,7,7,7,8,8,0,0,6,7,6,4,8,7,4,4,6,7,6,6,7,6,6,7,7,6,6
DATA 2,6,6,7,6,7,6,7,6,7,6,7,6,7,4,4,7,4,4,7,6,7,6,6,7,7,6,6,2,6
DATA 6,6,7,6,7,6,7,6,7,6,7,6,7,6,4,4,7,4,4,6,7,6,6,7,6,6,6,2,6,2
DATA 2,6,6,6,6,6,6,6,6,6,6,6,6,6,4,4,7,4,4,6,6,6,6,6,2,6,2,6,2,6

newcastle:
DATA 10,6,6,6,6,6,10,6,6,6,7,7,7,7,6,6,6,6,7,7,7,7,6,6,6,6,7,7,7,7
DATA 10,6,6,10,6,6,10,6,6,7,7,7,7,8,8,8,8,7,7,7,7,8,8,8,8,7,7,7,7,8
DATA 2,6,6,10,6,6,2,6,6,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8
DATA 2,6,6,2,6,6,6,7,7,7,7,8,8,8,8,8,8,8,8,8,8,8,8,7,7,7,7,8,8,8
DATA 6,6,6,2,6,6,7,7,7,7,8,8,6,6,6,6,6,6,6,6,6,6,7,7,7,7,8,8,8,8
DATA 6,6,6,6,6,7,7,7,7,8,8,6,6,6,6,6,6,6,6,6,6,7,7,7,7,8,8,8,8,6
DATA 10,6,6,6,6,8,8,8,8,8,6,6,6,6,6,6,6,6,6,6,6,8,8,8,8,8,8,8,6,6
DATA 10,6,6,7,7,7,7,8,8,6,6,6,6,6,6,6,6,6,6,7,7,7,7,8,8,8,8,10,6,6
DATA 2,6,7,7,7,7,8,8,6,6,7,7,7,7,6,6,6,6,7,7,7,7,8,8,8,8,6,10,6,6
DATA 2,7,7,7,7,7,8,6,6,7,7,7,7,7,6,6,6,7,7,7,7,8,8,8,8,7,6,2,6,6
DATA 8,8,8,8,7,7,6,6,8,8,8,8,7,7,6,6,8,8,8,8,8,8,8,8,7,7,6,2,6,6
DATA 8,8,8,8,7,7,7,7,8,8,8,8,7,7,7,7,8,8,8,8,8,8,8,0,7,7,6,6,6,6
DATA 8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,7,0,7,7,6,6,6,6
DATA 8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,0,7,0,7,7,6,10,6,6
DATA 8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,7,0,7,7,7,7,6,10,6,6
DATA 2,6,6,8,8,8,8,8,8,8,8,8,8,8,8,8,8,7,7,0,7,0,7,7,7,7,6,2,6,6
DATA 6,6,6,8,8,8,8,8,8,8,8,8,8,8,8,8,8,7,7,0,7,7,7,0,7,7,6,2,6,6
DATA 6,6,6,8,8,0,8,8,0,8,8,0,8,8,0,8,8,7,7,0,7,7,7,0,7,7,6,6,6,6
DATA 10,6,6,8,8,0,8,8,0,8,8,0,8,8,0,8,8,7,7,7,7,0,7,0,7,7,6,6,6,6
DATA 10,6,6,8,8,0,8,8,0,8,8,0,8,8,0,8,8,7,7,7,7,0,7,7,7,7,6,10,6,6
DATA 2,6,6,8,8,8,8,8,8,8,8,8,8,8,8,8,8,7,7,0,7,0,7,7,7,7,6,10,6,6
DATA 2,6,6,8,8,8,8,8,8,8,8,8,8,8,8,8,8,7,7,0,7,7,7,7,7,7,6,2,6,6
DATA 6,6,6,8,8,0,8,8,0,8,8,0,8,8,0,8,8,7,7,0,7,7,7,7,7,6,6,2,6,6
DATA 6,6,6,8,8,0,8,8,0,8,8,0,8,8,0,8,8,7,7,7,7,7,7,7,6,6,6,6,6,6
DATA 10,6,6,8,8,0,8,8,0,8,8,0,8,8,0,8,8,7,7,7,7,7,7,6,10,6,6,6,6,6
DATA 10,6,6,8,8,8,8,8,8,6,6,8,8,8,8,8,8,7,7,7,7,7,6,6,10,6,6,10,6,6
DATA 2,6,6,8,8,8,8,8,6,6,6,6,8,8,8,8,8,7,7,7,7,10,6,6,2,6,6,10,6,6
DATA 2,6,6,8,8,8,8,8,6,7,7,6,8,8,8,8,8,7,7,7,6,2,6,6,2,6,6,2,6,6
DATA 6,6,6,8,8,8,8,8,6,6,6,6,8,8,8,8,8,7,7,6,6,2,6,6,6,6,6,2,6,6
DATA 6,6,6,8,8,8,8,8,6,6,6,6,8,8,8,8,8,7,6,6,6,6,6,6,6,6,6,6,6,6


'biggy joe
DATA x,x,x,x,x,x,x,x,8,8,8,8,8,8,x,x,x,x
DATA x,x,x,x,x,x,x,8,8,8,8,8,8,8,8,x,x,x
DATA x,x,x,x,x,x,x,8,8,8,8,8,8,8,8,8,8,x
DATA x,x,x,7,x,x,x,5,5,5,5,5,5,8,8,8,8,x
DATA x,x,x,7,x,x,x,5,5,5,5,5,5,8,8,8,8,x
DATA x,x,x,7,x,x,8,8,8,8,8,8,8,8,8,8,8,x
DATA x,x,x,7,x,x,8,8,8,8,8,8,8,8,8,8,8,x
DATA x,x,x,7,x,x,8,8,8,8,8,8,8,8,8,8,8,x
DATA x,x,x,7,x,x,8,8,8,8,8,8,8,8,8,8,8,x
DATA x,x,x,7,x,x,x,x,9,9,9,9,9,x,x,x,x,x
DATA x,x,x,7,x,x,x,9,9,9,9,9,9,9,x,x,x,x
DATA x,7,x,7,x,7,9,9,9,8,8,8,9,9,9,x,x,x
DATA x,7,7,7,7,7,9,9,9,8,8,8,9,9,9,x,x,x
DATA x,x,x,8,8,8,8,8,8,8,8,8,9,9,9,x,x,x
DATA x,x,x,8,8,8,8,8,8,8,8,9,9,9,9,x,x,x
DATA x,x,x,7,x,9,9,8,8,8,9,9,9,9,9,x,x,x
DATA x,x,x,7,x,9,9,9,9,9,9,9,9,9,9,x,x,x
DATA x,x,x,x,x,9,9,9,9,9,9,9,9,9,9,x,x,x
DATA x,x,x,x,x,x,x,9,9,9,9,9,9,x,x,x,x,x
DATA x,x,x,x,x,8,8,8,8,x,8,8,8,8,x,x,x,x
DATA x,x,x,x,x,8,8,8,8,x,8,8,8,8,x,x,x,x
DATA x,x,x,x,8,8,8,8,x,x,8,8,8,8,x,x,x,x
DATA x,x,x,x,8,8,8,8,x,x,8,8,8,x,x,x,x,x
DATA x,x,x,x,8,8,8,x,x,x,8,8,8,x,x,x,x,x
DATA x,x,x,x,8,8,8,8,x,x,8,8,8,8,x,x,x,x
DATA x,x,x,x,8,8,8,8,x,x,8,8,8,8,x,x,x,x
DATA x,x,x,x,8,8,8,x,x,x,8,8,8,x,x,x,x,x
DATA x,x,x,x,2,2,2,x,x,x,2,2,2,x,x,x,x,x
DATA x,x,2,2,2,2,2,x,2,2,2,2,2,x,x,x,x,x
DATA x,x,2,2,2,2,2,x,2,2,2,2,2,x,x,x,x,x

'drake
DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x
DATA x,1,x,x,x,x,x,x,x,x,x,x,x,x,x,1,x
DATA x,1,1,x,x,x,x,x,x,x,x,x,x,x,1,1,x
DATA x,1,1,1,x,x,x,1,1,x,x,x,x,1,1,1,x
DATA x,1,1,1,1,x,1,1,1,1,x,x,1,1,1,1,x
DATA x,1,1,1,1,1,4,1,4,1,1,1,1,1,1,1,x
DATA x,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,x
DATA x,1,1,1,1,1,4,4,4,4,1,1,1,1,1,1,x
DATA x,1,1,1,x,x,1,1,1,1,x,x,1,1,1,1,x
DATA x,1,1,x,x,x,x,1,1,x,x,x,x,x,1,1,x
DATA x,1,x,x,x,x,x,x,x,x,x,x,x,x,x,1,x
DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x

'slime
'0 = black       4 = red           8 = grey             12 = light red
'1 = blue        5 = magenta       9 = light blue       13 = light magenta
'2 = green       6 = brown        10 = light green      14 = yellow
'3 = cyan        7 = white        11 = light cyan       15 = bright white

DATA x,x,x,x,x,x,x,x,2,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,2,2,2,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,2,2,2,2,2,x,x,x,x,x,x
DATA x,x,x,x,x,2,2,2,2,2,2,2,x,x,x,x,x
DATA x,x,x,x,2,2,2,2,2,2,2,2,2,x,x,x,x
DATA x,x,x,2,2,2,2,2,2,2,2,2,2,2,x,x,x
DATA x,x,2,2,2,7,7,2,2,7,7,2,2,2,2,x,x
DATA x,2,2,2,2,7,7,2,2,7,7,2,2,2,2,2,x
DATA 2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
DATA 2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
DATA 2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2
DATA x,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,x
DATA x,x,2,2,2,2,2,2,2,2,2,2,2,2,2,x,x
DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x

'ghost
DATA x,x,x,x,x,x,x,x,x,x,x,x,7,7,7,x,x,x,x,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,x,x,7,7,7,7,7,7,7,x,x,x,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,x,7,7,7,7,7,7,7,7,7,x,x,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,7,7,7,7,7,7,7,7,7,7,7,7,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,7,7,7,7,7,7,7,7,7,7,7,7,7,7,x,x,x,x,x,x,x
DATA x,x,x,x,x,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,x,x,x,x,x,x,x
DATA x,x,x,x,x,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,x,x,x,x,x,x,x
DATA x,x,x,x,x,7,7,7,4,4,4,7,7,7,4,4,4,7,7,7,7,x,x,x,x,x,x
DATA x,x,x,x,x,7,7,7,4,4,4,7,7,7,4,4,4,7,7,7,7,7,x,x,x,x,x
DATA x,x,x,x,7,7,7,7,4,4,4,7,7,7,4,4,4,7,7,7,7,7,7,x,x,x,x
DATA x,x,x,x,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,x,x,x,x
DATA x,x,x,x,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,x,x,x,x
DATA x,x,x,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,x,x,x,x
DATA x,x,x,7,7,7,7,4,4,4,4,4,4,4,4,4,4,4,4,4,7,7,7,x,x,x,x
DATA x,x,x,7,7,7,7,4,7,4,7,4,7,4,7,4,7,4,7,4,7,7,7,x,x,x,x
DATA x,x,x,7,7,7,7,4,4,4,4,4,4,4,4,4,4,4,4,4,7,7,7,x,x,x,x
DATA x,x,x,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,x,x,x,x
DATA x,x,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,x,x,x
DATA x,x,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,x,x,x
DATA x,x,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,x,x
DATA x,x,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,x,x
DATA x,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,x,x
DATA 7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,x
DATA 7,4,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,4,7
DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x

'attacking joe
DATA x,x,x,x,x,x,x,x,x,x,x,8,8,8,8,8,8,x,x,x,x
DATA x,x,x,x,x,x,x,x,x,x,8,8,8,8,8,8,8,8,x,x,x
DATA x,x,x,x,x,x,x,x,x,x,8,8,8,8,8,8,8,8,8,8,x
DATA x,x,x,x,x,x,x,x,x,x,5,5,5,5,5,5,8,8,8,8,x
DATA x,x,x,x,x,x,x,x,x,x,5,5,5,5,5,5,8,8,8,8,x
DATA x,x,x,x,x,x,x,x,x,8,8,8,8,8,8,8,8,8,8,8,x
DATA 7,x,x,x,x,x,x,x,x,8,8,8,8,8,8,8,8,8,8,8,x
DATA x,7,x,x,x,x,x,x,x,8,8,8,8,8,8,8,8,8,8,8,x
DATA x,x,7,x,x,x,x,x,x,8,8,8,8,8,8,8,8,8,8,8,x
DATA x,x,x,7,x,x,x,x,x,x,x,9,9,9,9,9,x,x,x,x,x
DATA x,x,x,x,7,x,x,x,x,x,9,9,9,9,9,9,9,x,x,x,x
DATA x,x,x,x,x,7,x,7,x,9,9,9,8,8,8,9,9,9,x,x,x
DATA x,x,x,x,x,x,7,7,x,9,9,9,8,8,8,9,9,9,x,x,x
DATA x,x,x,x,7,7,8,8,8,8,8,8,8,8,8,9,9,9,x,x,x
DATA x,x,x,x,x,x,8,8,7,8,8,8,8,8,9,9,9,9,x,x,x
DATA x,x,x,x,x,x,x,x,9,7,8,8,8,9,9,9,9,9,x,x,x
DATA x,x,x,x,x,x,x,x,9,9,9,9,9,9,9,9,9,9,x,x,x
DATA x,x,x,x,x,x,x,x,9,9,9,9,9,9,9,9,9,9,x,x,x
DATA x,x,x,x,x,x,x,x,x,x,9,9,9,9,9,9,x,x,x,x,x
DATA x,x,x,x,x,x,x,x,8,8,8,8,x,8,8,8,8,x,x,x,x
DATA x,x,x,x,x,x,x,x,8,8,8,8,x,8,8,8,8,x,x,x,x
DATA x,x,x,x,x,x,x,8,8,8,8,x,x,8,8,8,8,x,x,x,x
DATA x,x,x,x,x,x,x,8,8,8,8,x,x,8,8,8,x,x,x,x,x
DATA x,x,x,x,x,x,x,8,8,8,x,x,x,8,8,8,x,x,x,x,x
DATA x,x,x,x,x,x,x,8,8,8,8,x,x,8,8,8,8,x,x,x,x
DATA x,x,x,x,x,x,x,8,8,8,8,x,x,8,8,8,8,x,x,x,x
DATA x,x,x,x,x,x,x,8,8,8,x,x,x,8,8,8,x,x,x,x,x
DATA x,x,x,x,x,x,x,2,2,2,x,x,x,2,2,2,x,x,x,x,x
DATA x,x,x,x,x,2,2,2,2,2,x,2,2,2,2,2,x,x,x,x,x
DATA x,x,x,x,x,2,2,2,2,2,x,2,2,2,2,2,x,x,x,x,x

'flame!
DATA x,x,4,x,x,x,x,5,4,x,x,x,x,5,4,x,x,x,x,5,4,x,x,x,x,5,4,x,x,x,x,x,4,x,x,x,x,x,4,x,x,x,x,x,4,x,x,x,x,x,4,x,x,x,x,x,4,x,x,x,x,x,4,x,x,x,x,x,4,x,x,x,x,x,4,x,x,x,x,x
DATA x,x,5,4,x,x,5,4,5,4,x,x,5,4,5,4,x,x,5,4,5,4,x,x,5,4,x,4,x,x,x,4,x,4,x,x,x,4,x,4,x,x,x,4,x,4,x,x,x,4,x,4,x,x,x,4,x,4,x,x,x,4,x,4,x,x,x,4,x,4,x,x,x,4,x,4,x,x,x,4
DATA x,x,x,5,4,5,4,x,x,5,4,5,4,x,x,5,4,5,4,x,x,5,4,5,4,x,x,x,4,x,4,x,x,x,4,x,4,x,x,x,4,x,4,x,x,x,4,x,4,x,x,x,4,x,4,x,x,x,4,x,4,x,x,x,4,x,4,x,x,x,4,x,4,x,x,x,4,x,4,x
DATA x,x,x,x,5,4,x,x,x,x,5,4,x,x,x,x,5,4,x,x,x,x,5,4,x,x,x,x,x,4,x,x,x,x,x,4,x,x,x,x,x,4,x,x,x,x,x,4,x,x,x,x,x,4,x,x,x,x,x,4,x,x,x,x,x,4,x,x,x,x,x,4,x,x,x,x,x,4,x,x


'beleph
DATA x,x,x,x,x,x,7,7,7,x,x,x,x,8,x,x,x,x,x,x,x,x,x,x,x,x,x,8,x,x,x,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,7,x,x,x,7,x,8,8,8,x,x,x,x,x,x,x,x,x,x,x,x,x,8,8,8,x,x,x,x,x,x,x,x,x
DATA x,x,x,7,7,7,8,8,7,x,x,8,8,8,x,x,x,x,x,x,x,x,x,x,x,x,x,8,8,8,x,x,x,x,x,x,x,x,x
DATA x,x,7,x,x,x,7,7,8,8,8,8,8,8,8,x,x,x,x,x,x,x,x,x,x,x,8,8,8,8,8,x,x,x,x,x,x,x,x
DATA x,x,7,x,x,7,7,x,x,8,8,8,8,8,8,8,x,x,x,x,x,x,x,x,x,8,8,8,8,8,8,8,x,x,x,x,x,x,x
DATA x,7,x,x,7,7,x,8,8,8,8,8,8,8,8,8,x,x,x,7,x,7,x,x,x,8,8,8,8,8,8,8,8,8,x,x,x,x,x
DATA x,7,x,x,7,x,x,8,8,8,8,8,1,1,7,7,x,x,7,x,x,x,7,x,x,7,7,8,8,8,8,8,8,8,x,x,x,x,x
DATA x,7,x,7,x,8,8,8,8,8,8,1,1,1,7,7,x,7,x,14,x,14,x,7,x,7,7,8,8,8,8,8,8,8,8,8,x,x,x
DATA x,7,x,7,x,8,8,8,8,8,8,1,1,1,1,7,7,7,x,x,x,x,x,7,7,7,x,x,x,8,8,8,8,8,8,8,x,x,x
DATA x,7,7,x,8,8,8,8,8,x,1,1,1,x,8,8,1,7,x,x,x,x,x,7,x,x,x,x,x,x,x,x,8,8,8,8,8,x,x
DATA x,7,x,x,8,8,8,x,x,x,1,1,1,x,1,8,8,7,7,7,x,7,7,7,x,x,x,x,x,x,x,x,x,x,8,8,8,x,x
DATA x,x,x,x,8,x,x,x,x,1,1,1,x,x,1,1,8,8,7,x,7,x,7,7,1,1,1,x,x,x,x,x,x,x,x,x,8,x,x
DATA x,x,x,x,x,x,x,x,x,1,1,1,x,1,1,1,7,8,8,x,x,x,x,7,7,1,1,1,x,x,x,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,x,x,1,1,1,x,1,1,1,4,x,8,8,4,x,x,x,4,1,1,1,x,x,x,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,x,x,1,1,1,1,1,1,1,x,4,x,8,8,4,x,4,7,7,1,1,1,x,x,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,x,x,x,1,1,1,1,x,7,7,x,4,4,8,8,4,7,7,x,x,1,1,1,x,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,7,7,x,4,x,8,8,7,7,x,1,1,1,x,x,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,7,7,x,x,4,4,8,8,x,x,1,1,x,x,x,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,7,7,7,7,7,7,8,8,1,1,x,x,x,x,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,2,2,2,2,2,2,2,1,8,8,1,x,x,x,x,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,2,2,2,2,2,2,2,2,2,1,8,8,x,x,x,x,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,2,2,2,2,2,x,x,2,2,2,2,2,8,8,x,x,x,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,2,2,2,2,2,x,x,2,2,2,2,2,x,x,x,x,x,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,2,2,2,2,x,x,x,x,2,2,2,2,x,x,x,x,x,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,x,x,x,x,x,x,2,2,2,2,x,x,x,x,x,x,2,2,2,2,x,x,x,x,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,x,x,x,x,x,2,2,2,2,2,x,x,x,x,x,x,2,2,2,2,2,x,x,x,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,x,x,x,x,x,2,2,2,2,x,x,x,x,x,x,x,x,2,2,2,2,x,x,x,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,x,x,x,x,x,1,1,1,1,x,x,x,x,x,x,x,x,1,1,1,1,x,x,x,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,x,x,x,1,1,1,1,1,1,1,x,x,x,x,x,x,x,1,1,1,1,1,1,x,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x

'slime2
DATA x,x,x,x,x,x,x,x,x,x,2,x,x,x,x,x,2,x,x,x,x,x,x,x,x,x,x
DATA x,x,x,x,2,x,x,x,x,x,x,x,x,2,x,x,x,x,x,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,2,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,2,x,x,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,x,x,x,x,x,2,2,x,x,x,x,x,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,x,x,x,2,2,2,2,2,2,x,x,x,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,x,2,2,x,2,2,2,x,2,2,2,x,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,2,2,2,2,x,12,x,2,x,12,x,2,2,2,2,2,x,x,x,x,x,x
DATA x,x,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,x,x,x,x,x
DATA 2,2,2,x,x,2,2,x,2,2,2,x,x,x,2,2,x,x,2,2,2,2,2,2,x,x,x

'spook
DATA x,x,x,x,x,x,x,x,x,x,7,7,7,7,7,x,x,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,x,x,7,7,7,7,7,7,7,x,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,x,x,7,7,7,7,7,7,7,x,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,x,7,7,x,x,7,x,x,7,7,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,x,7,7,x,x,7,x,x,7,7,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,7,7,7,7,7,7,7,7,7,7,7,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,7,7,7,7,7,7,7,7,7,7,7,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,7,7,7,7,7,x,x,x,7,7,7,7,7,x,x,x,x,x,x
DATA x,x,x,x,x,x,7,7,7,7,x,x,x,x,x,7,7,7,7,x,x,x,x,x,x
DATA x,x,x,x,x,7,7,7,7,7,7,x,x,x,7,7,7,7,7,7,x,x,x,x,x
DATA x,x,x,x,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,x,x,x,x,x
DATA x,x,x,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,x,x,x,x
DATA x,x,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,x,x,x
DATA x,x,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,x,x
DATA x,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,x
DATA x,x,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,x,x
DATA x,x,x,7,7,7,7,x,7,7,7,7,x,7,7,7,7,x,7,7,7,7,x,x,x
DATA x,x,x,x,7,7,x,x,x,7,7,x,x,x,7,7,x,x,x,7,7,x,x,x,x
DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,x,8,8,8,8,8,8,8,8,8,x,x,x,x,x,x,x,x
DATA x,x,x,x,x,x,8,8,8,8,8,8,8,8,8,8,8,8,8,x,x,x,x,x,x
DATA x,x,x,x,x,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,x,x,x,x,x
DATA x,x,x,x,x,x,8,8,8,8,8,8,8,8,8,8,8,8,8,x,x,x,x,x,x
DATA x,x,x,x,x,x,x,x,8,8,8,8,8,8,8,8,8,x,x,x,x,x,x,x,x

DEFSNG A-Z
SUB ABSPlace (CharID$, FILENAME$, ABSx%, ABSy%)
IF Max.x% = 0 AND Max.y% = 0 THEN
     Max.x% = 640
     Max.y% = 350
END IF
POP = FREEFILE
OPEN FILENAME$ FOR BINARY AS POP
IF LOF(POP) = 0 THEN
     CLOSE POP
     KILL FILENAME$
     EXIT SUB
END IF
GET #POP, , NumberOfRecords&

DIM RedTileID AS STRING * 15, FileLoc&, Length%, TempDisplay%(0)

FOR x = 1 TO NumberOfRecords&
     GET #POP, , RedTileID
     GET #POP, , FileLoc&

     IF UCASE$(CharID$) = UCASE$(LTRIM$(RTRIM$(RedTileID))) THEN
          GET #POP, FileLoc& + 1, IMGWidth%
          GET #POP, , IMGLength%

          GET #POP, , Length%
          ArrayString$ = SPACE$(Length%)
          GET #POP, , ArrayString$

          GOSUB intStringToArraySub

          IF ABSx + IMGWidth% > Max.x% THEN
               EXIT FOR
          ELSE
               IF ABSy + IMGLength% > Max.y% THEN
                    EXIT FOR
               ELSE
                    PUT (ABSx, ABSy), TempDisplay%, PSET '******************
               END IF
          END IF
          EXIT FOR
     END IF
NEXT x
CLOSE #POP
EXIT SUB

intStringToArraySub:
intString$ = ArrayString$
REDIM TempDisplay%(LEN(intString$) \ 2)
StringPos = 1
FOR x = 0 TO (LEN(intString$) \ 2) - 1
     TempDisplay%(x) = CVI(MID$(intString$, StringPos, 2))
     StringPos = StringPos + 2
NEXT x
RETURN

END SUB

SUB battleset

PALETTE
'play some kind of you have been attacked stuff
FOR x = 1 TO 3
  delay (.2)
  PUT (xquad(cx), yquad(cy)), dude1, PRESET
  'IF ll <> 1 THEN PLAY "o3 l8 c<<c"
  'CALL fromjeff(1)
  delay (.2)
  PUT (xquad(cx), yquad(cy)), dude1, PSET
NEXT x

SCREEN 9, 0, 0, 0
CLS

'selex random monstaz
SelectMonsta


'enemybox
LINE (7, 7)-(600, 190), 3, B
'charstazbox
LINE (7, 190)-(80, 290), 7, B
'monstastazbox
LINE (89, 190)-(170, 290), 7, B
'functionbox
LINE (300, 195)-(400, 300), 7, B
'message box
LINE (175, 190)-(290, 290), 7, B

PUT (400, 100), joe


updatex:
charstatz
monstastaz
ChexFoWeaponz   'how much damage good guy will do
ChexFoArmor
refresh


'alpha menu
LOCATE 15, 40: PRINT "1.)Attack!"
LOCATE 16, 40: PRINT "2.)Magick"
LOCATE 17, 40: PRINT "3.)Run!"
doitagain:
LOCATE 18, 40: INPUT a

'searcher
IF a = 1 THEN HitBeast: monstastaz: Hitback: GOTO updatex
IF a = 2 THEN Magix: GOTO updatex
IF a = 3 THEN    'run
  Ch = INT(RND * 4) + 1
  IF Ch = 1 THEN PRINT "you run away!": CALL pall: CALL crossroad: CALL where
  Hitback
  GOTO updatex
END IF

'chexit up
IF a > 3 THEN GOTO doitagain
IF a < 1 THEN GOTO doitagain
END SUB

SUB beatzargon

PALETTE 0, 0: PALETTE 1, 4: PALETTE 2, 48: PALETTE 3, 2
PALETTE 4, 6: PALETTE 5, 54: PALETTE 6, 10: PALETTE 7, 38
PALETTE 8, 46: PALETTE 9, 5: PALETTE 10, 25: PALETTE 11, 7
PALETTE 12, 57: PALETTE 13, 63: PALETTE 14, 9: PALETTE 15, 59

CLS
PRINT "cool you kicked his ass!"
PRINT "you are the bomb shiznit"

LOCATE 23: INPUT "hit enter to continue"; yo$

inship = 0
mapx = 4: mapy = 3
cx = 10: cy = 5
CALL crossroad: CALL where

END SUB

SUB boatman (switch)

SELECT CASE storystatus
CASE 1 TO 1.5
'IF switch = 0 THEN PUT (xquad(10), yquad(6)), oldman
y = 7
FOR x = 1 TO 20
IF y > 0 THEN PUT (xquad(x), yquad(y)), rock, XOR
  y = y - 1
NEXT x
IF switch = 0 THEN PUT (xquad(2), yquad(2)), oldman
 CASE 2
  PUT (xquad(2), yquad(2)), oldman
  CASE ELSE
  PUT (xquad(10), yquad(6)), oldman
' CALL hut(a$)
END SELECT

END SUB

SUB bubble

DIM xloc AS INTEGER
DIM yloc AS INTEGER
DIM y AS DOUBLE
DIM x AS DOUBLE
SCREEN 9
             'gain must be shared
Gain = INT(RND * 20) + 1 * lev  'bigger the lev, bigger the spels

bubradius = 40
xloc = 300
yloc = 100

delay (1)

x = xloc
y = yloc - bubradius

FOR bub = 1 TO 12
CIRCLE (x, y), 16, 8
CIRCLE (x, y), 10, 15, 1.7, 2.7
FOR s = 100 TO 1000 STEP 25: SOUND s, .06: NEXT s
CALL rotate(x, y, xloc, yloc, 30)
NEXT bub

FOR i = 1 TO 5000: NEXT i

CIRCLE (xloc, yloc), 55, 7
CIRCLE (xloc, yloc), 48, 15, 1.7, 2.7
FOR s = 100 TO 1000 STEP 10: SOUND s, .06: NEXT s

FOR i = 1 TO 10000: NEXT i

FOR bub = 1 TO 12
CIRCLE (x, y), 16, 0
CIRCLE (x, y), 10, 0, 1.7, 2.7
FOR p = 1 TO 10
px = INT(RND * 40) + x - 20
py = INT(RND * 40) + y - 20
LINE (x, y)-(px, py), 8
NEXT p
FOR s = 1000 TO 100 STEP -50: SOUND s, .06: NEXT s
LINE (x - 20, y - 20)-(x + 20, y + 20), 0, BF
CALL rotate(x, y, xloc, yloc, 30)
FOR i = 1 TO 500: NEXT i
NEXT bub

FOR i = 1 TO 7000: NEXT i

CIRCLE (xloc, yloc), 55, 0
CIRCLE (xloc, yloc), 48, 0, 1.7, 2.7

FOR s = 1000 TO 100 STEP -1
IF s MOD 20 = 0 THEN
px = INT(RND * 150)
py = INT(RND * 150)
LINE (xloc - 15 + px / 5, yloc - 15 + py / 5)-(px + xloc - 75, py + yloc - 75), 14
END IF
SOUND INT(RND * s) + 38, .04
IF s MOD 20 = 1 THEN LINE (xloc - 15 + px / 5, yloc - 15 + py / 5)-(px + xloc - 75, py + yloc - 75), 0
NEXT s

LINE (xloc - 75, yloc - 75)-(xloc + 75, yloc + 75), 0, BF


Power = 45
cMP = cMP - 25
mDP = mDP - (Power + Gain)
damage = (Power + Gain)
IF mDP < 0 THEN mDP = 0
LINE (410, 195)-(550, 349), 0, BF

charstatz


END SUB

SUB castle
CLS

PRINT "Do you wish to enter the castle?"
INPUT yo$
IF yo$ = "n" THEN GOTO getmyasout
'draw the dam castle
FOR x = 1 TO 20
 FOR y = 1 TO 2
  IF y = 1 THEN PUT (xquad(x), yquad(y)), cflor
 NEXT y
NEXT x
FOR y = 1 TO 10
 FOR x = 1 TO 2
  IF x = 1 THEN PUT (xquad(1), yquad(y)), cflor
  IF x = 2 THEN PUT (xquad(20), yquad(y)), cflor
 NEXT x
NEXT y
'puts the character, you then the bad guy
PUT (xquad(10), yquad(10)), back1
PUT (xquad(10), yquad(6)), ZARGON

question1$ = "Who are you!?!"
 answer1$ = "I AM ZARGON RULER OF THIS REALM, WHY HAVE YOU COME HERE!!!!"
question2$ = "I'm tired and I need to escape"', I have heard of an airship you may possess"
 answer2$ = "HA! those elves that used to live her had an airship, yes but when i crushed their pathetic souls they took it with them.. actually he took it with him! THERE WERE NO SURVIVORS!!!!!!(except one)MAHAHAHAHHAA!"
question3$ = "I've come to rid this land of your evil! Come on!"
 answer3$ = "HA! you and your pathetic dreams, they shall die as you will. Just as i squashed all the elves. PREPARE TO DIE!!!!!! I will slay you!"

DO
LOCATE 19, 6: PRINT "1)"; question1$
LOCATE 20, 6: PRINT "2)"; question2$
LOCATE 21, 6: PRINT "3)"; question3$
LOCATE 22, 6: PRINT "4)Run and be a coward!"
LOCATE 9, 30: PRINT "what do you want?"
LOCATE 23, 6: INPUT yo
LOCATE 10, 15
SELECT CASE yo
 CASE 1:
  PRINT answer1$
 CASE 2:
  PRINT answer2$
 CASE 3:
  PRINT answer3$
  CALL dbattleset
 CASE 4:
  PRINT "you make haste and escape, and all that you hear is laughter! HAMAHAHAHAHA!!! run you fool run and dont ever come back to meet your death!!"
  delay (2)
  you$ = "suck"
END SELECT

LOOP UNTIL you$ = "suck"





getmyasout:
SELECT CASE a$
CASE "m": cy = cy - 1
CASE "i": cy = cy + 1
CASE "j": cx = cx + 1
CASE "l": cx = cx - 1
END SELECT
CALL crossroad
CALL where

END SUB

SUB castspell

LOCATE 22
FOR x = 1 TO splev
IF x = 2 THEN PRINT "1) cure";
IF x = 3 THEN PRINT "2) maximize";
IF x = 4 THEN PRINT "3) warp";
NEXT x
PRINT
doover:
LOCATE 23: INPUT "what spell do you wish to cast?"; wha
SELECT CASE wha
CASE 1
 IF cMP < 3 OR splev < 3 THEN GOTO doover
 FOR snd = 100 TO 240 STEP 1: SOUND snd, .1: NEXT
 cMP = cMP - 3:
 damage = INT(RND * 6) + 6 * lev
 IF cDP + damage < BcDP THEN cDP = cDP + damage ELSE cDP = BcDP
CASE 2 'need cool sounds
 IF cMP < 5 OR splev < 6 THEN GOTO doover
 FOR snd = 1000 TO 100 STEP -75: SOUND snd, .1: NEXT
 cMP = cMP - 5:
 damage = 1
 IF cDP + damage < (BcDP + 30) THEN cDP = cDP + damage ELSE LOCATE 22: PRINT "no effect"
CASE 3 'need cool sounds
 IF cMP < 7 OR splev < 8 THEN GOTO doover
  IF ll <> 1 THEN PLAY "o5 l16 a<a<a<a<a l64 a>a>a>a>a"
  inship = 0
  mapx = 2: mapy = 4
  cx = 15: cy = 8   'healr
 CALL crossroad
 CALL where
END SELECT

refresh
LOCATE 23: PRINT "gold:"; gold, "DP"; cDP, "MP"; cMP, "xp:"; ex, "next:"; nextlev

END SUB

SUB charstatz




LOCATE 15, 2: PRINT "   Joe"
LOCATE 16, 2: PRINT " AP / DP"
LOCATE 17, 2: PRINT cAP; " "; cDP
LOCATE 18.5, 2: PRINT "   MP"
LINE (7, 236)-(80, 236)

CIRCLE (37, 273), 18, 2
LOCATE 20.5, 4: PRINT cMP

END SUB

SUB CheckLevel
levfact1 = INT(RND * lev) + 2
levfact2 = INT(RND * lev) + 1
levfact3 = INT(RND * lev) + 1
'moving up a lev
 IF lev <> checky THEN
     checky = lev   ''took out plus 3 and 6 on each adding  changed 6's to 3
     'good stuff!!
  cAP = BcAP:
  cDP = BcDP:
  cMP = BcMP:  'maxstuff
  BcAP = BcAP + levfact1
  BcDP = BcDP + 4 + levfact2
  BcMP = BcMP + 3 + levfact3                'gainstuff
  cAP = BcAP: cDP = BcDP: cMP = BcMP          'max again
   LINE (176, 191)-(289, 289), 0, BF
   LOCATE 16, 24: PRINT "JOE has raised"
   LOCATE 17, 24: PRINT "to level"
   LOCATE 18, 24: PRINT lev; "!"
   LOCATE 19, 24: PRINT "AP rises to"; cAP
   LOCATE 20, 24: PRINT "DP rises to"; cDP
   LOCATE 21, 24: PRINT "MP rises to"; cMP:
  END IF
END SUB

SUB ChexFoArmor

SELECT CASE astatus
  CASE 1: defence = 1
  CASE 2: defence = 2
  CASE 3: defence = 3
  CASE 4: defence = 5
  CASE 5: defence = 6
  CASE 6: defence = 7
  CASE 7: defence = 8
  CASE 8: defence = 15
END SELECT

END SUB

SUB ChexFoWeaponz
SELECT CASE wstatus
  CASE 1: wgain = INT(RND * 3) + 1
  CASE 2: wgain = INT(RND * 5) + 2
  CASE 3: wgain = INT(RND * 7) + 3
  CASE 4: wgain = INT(RND * 10) + 5
  CASE 5: wgain = INT(RND * 12) + 6
  CASE 6: wgain = INT(RND * 15) + 7
  CASE 7: wgain = INT(RND * 16) + 8
  CASE 8: wgain = INT(RND * 20) + 9
END SELECT

END SUB

SUB crossroad

hutspotx = 0
hutspoty = 0
s.spotx = 0
s.spoty = 0
wepshopx = 0
wepshopy = 0
healx = 0
healy = 0

mapx$ = RIGHT$(STR$(mapx), 1)
mapy$ = RIGHT$(STR$(mapy), 1)
fil$ = path$ + "map" + mapx$ + mapy$ + ".lvl"
CLOSE #1
OPEN fil$ FOR INPUT AS #1

SCREEN 9, 0, 0, 0
CLS
'lets draw my datashiznit
FOR y = 0 TO 9
 FOR x = 1 TO 20
 INPUT #1, z$          '1,0
  IF z$ = "a" THEN z$ = "4" 'im too lazy to change the a's to 4's
  SELECT CASE z$
  CASE "r"
   PUT (xquad(x), yquad(y)), rock2, PSET  'rubble

   g = 1
  CASE "R"
   PUT (xquad(x), yquad(y)), rock, PSET   'mountain
  
   g = 1
  CASE "t"
   PUT (xquad(x), yquad(y)), tree2, PSET
   g = 1
  CASE "T"                               'DisplayTile "rock-2", x, Y
   PUT (xquad(x), yquad(y)), tree, PSET
   g = 1
  CASE "w"
   PUT (xquad(x), yquad(y)), water, PSET
   g = 1
  CASE "4" 'water you can walk on    'change "a" to 4
   PUT (xquad(x), yquad(y)), water, PSET
   M = 1
  CASE "G"
   PUT (xquad(x), yquad(y)), grav, PSET
   g = 1
  CASE "h"
   PUT (xquad(x), yquad(y)), huts, PSET
  CASE "0"
   PUT (xquad(x), yquad(y)), flor, PSET
   M = 1
  CASE "D"
   PUT (xquad(x), yquad(y)), florwd, PSET
  CASE "1"
   PUT (xquad(x), yquad(y)), grass, PSET
   M = 1
  CASE "2"
   PUT (xquad(x), yquad(y)), sand, PSET
   M = 1
  CASE "C"
   PUT (xquad(x), yquad(y)), cast, PSET
  CASE "W"
   PUT (xquad(x), yquad(y)), huts, PSET
    wepshopx = x: wepshopy = y
  CASE "H"
   PUT (xquad(x), yquad(y)), huts, PSET
    healx = x: healy = y
   END SELECT          ' 1, 0
 IF g = 1 THEN donttouch(x, y + 1) = 1 ELSE donttouch(x, y + 1) = 0
 g = 0     'heh cool heh heh heh heh                   'adding 1
 IF M = 1 THEN ground(x, y + 1) = VAL(z$) ELSE ground(x, y + 1) = 9
 M = 0
NEXT
NEXT

INPUT #1, hutspotx
INPUT #1, hutspoty
INPUT #1, s.spotx
INPUT #1, s.spoty

CLOSE #1

mapx$ = RIGHT$(STR$(mapx), 1)
mapy$ = RIGHT$(STR$(mapy), 1)
IF mapx$ + mapy$ = "24" THEN
 IF storystatus >= 5.5 THEN
   PUT (xquad(18), yquad(4)), fboat
   ship = 1
   donttouch(18, 5) = 0
  ELSE                      'boat thing
   donttouch(18, 5) = 1
  END IF
END IF
LINE (0, 301)-(640, 350), 7, BF

'castle stuff
 IF mapx$ + mapy$ = "32" THEN
 FOR y = 5 TO 7
 FOR x = 14 TO 17     'add 1 from the y's
 donttouch(x, y) = 1
 NEXT x
 NEXT y
 donttouch(15, 7) = 0
 donttouch(16, 7) = 0
 END IF

LOCATE 23: PRINT "gold:"; gold, "DP"; cDP, "MP"; cMP, "xp:"; ex, "next:"; nextlev

PCOPY 0, 1
SCREEN 9, 0, 1, 1

END SUB

SUB dbattleset

PALETTE

FOR x = 1 TO 3
  delay (.2)
  PUT (xquad(10), yquad(10)), dude1, PRESET
  delay (.2)
  PUT (xquad(10), yquad(10)), dude1, PSET
NEXT x


SCREEN 9, 0, 0, 0
CLS
                     '50
M$ = "ZARGON": mAP = 60: mDP = 300:
IF cheat$ = "yes" THEN mAP = 10
PUT (270, 83), ZARGON: bname$ = "ZARGON"
                '250
'enemybox
LINE (7, 7)-(600, 190), 3, B
'charstazbox
LINE (7, 190)-(80, 290), 7, B
'monstastazbox
LINE (89, 190)-(170, 290), 7, B
'functionbox
LINE (300, 195)-(400, 300), 7, B
'message box
LINE (175, 190)-(290, 290), 7, B

PUT (400, 100), joe

update2:
charstatz

monstastaz
ChexFoWeaponz
ChexFoArmor

'alpha menu
LOCATE 15, 40: PRINT "1.)Attack!"
LOCATE 16, 40: PRINT "2.)Magick"
LOCATE 17, 40: PRINT "3.)BE A WIMP!"
doitagain2:
LOCATE 18, 40: INPUT a
IF a = 1 THEN HitBeast: dhitback: GOTO update2
IF a = 2 THEN Magix: GOTO update2
IF a = 3 THEN    'run
  Ch = INT(RND * 4) + 1
  Ch = 4
  IF Ch = 4 THEN PRINT "you run away, and ZARGON laughs!!!": CALL pall: CALL crossroad: CALL where
  Hitback
  CALL pall
  GOTO update2
END IF

'chexit up
IF a > 3 THEN GOTO doitagain2
IF a < 1 THEN GOTO doitagain2



END SUB

SUB delay (deltime!)
dtx! = TIMER
WHILE TIMER < dtx! + deltime!: WEND
END SUB

SUB dhitback

x = 300: y = 83
SCREEN 9, 0, 1, 1
CLS
mloss = INT(RND * 20)          ' 4-int(rnd*4)+1 == int(rnd*1-4)
'nonoverlapper
dx = 350

SCREEN 9, 0, 0, 0
PUT (270, 83), ZARGON
x = 270                                   'took out xor
DO: PUT (x, y), ZARGON, XOR: PUT (x, y), ZARGON, XOR: x = x + 2
LOOP UNTIL x >= dx

FOR d = 1 TO 3       'changed 100 to 75
PUT (dx, 83), ZARGON, XOR
FOR joe = 1 TO 10
 sd = INT(RND * 300) + 37
 IF ll <> 1 THEN SOUND sd, .1
NEXT joe

delay (.1)
PUT (dx, 83), ZARGON, XOR
PUT (dx, 83), ZARGON, XOR      'flash weird?
delay (.3)
PUT (dx, 83), ZARGON, XOR
NEXT d
PUT (270, 83), ZARGON, XOR
'((((((((((((((((((((((((((((((((((((

bdam = (mAP - mloss - defense)
IF bdam < 0 THEN bdam = 0
cDP = cDP - bdam

LOCATE 16, 24: PRINT M$
LOCATE 17, 24: PRINT "hits for:"
LOCATE 18, 24: PRINT "  "; bdam
LOCATE 19, 24: PRINT " Damage!"
delay (1)
LINE (176, 191)-(289, 289), 0, BF

'FOR x = 1 TO 200: PUT (400, 100), joe, XOR: NEXT
IF cDP < 0 THEN cDP = 0
IF cDP = 0 THEN LOCATE 17, 2: PRINT cAP; cDP: PRINT "u iz dead": CALL died

END SUB

SUB died

CLS
PRINT "u iz dead"
PRINT "i am sorry"
CALL hi("thank you for playing!", 3)
END

END SUB

SUB displayTile (TileId$, x, y)

PALETTE 0, 0: PALETTE 1, 4: PALETTE 2, 48: PALETTE 3, 2
PALETTE 4, 6: PALETTE 5, 54: PALETTE 6, 10: PALETTE 7, 38
PALETTE 8, 46: PALETTE 9, 5: PALETTE 10, 25: PALETTE 11, 7
PALETTE 12, 57: PALETTE 13, 63: PALETTE 14, 9: PALETTE 15, 59

xxx% = xquad(x)
yyy% = yquad(y)
ABSPlace TileId$, path$ + "TILES.wad", xxx%, yyy%
'row 'col


'SCREEN 0
'SCREEN 9

END SUB

SUB drawhut
CLS
SCREEN 9, 0, 0, 0
'draws the cave
CLS
FOR x = 1 TO 20
 FOR y = 1 TO 2
  IF y = 1 THEN PUT (xquad(x), yquad(y)), rock
' IF y = 2 AND x < 8 OR x > 12 THEN PUT (xquad(x), yquad(10)), rock
 NEXT y
NEXT x
FOR y = 1 TO 10
 FOR x = 1 TO 2
  IF x = 1 THEN PUT (xquad(1), yquad(y)), rock
  IF x = 2 THEN PUT (xquad(20), yquad(y)), rock
 NEXT x
NEXT y
'puts the character, you then the bad guy
PUT (xquad(10), yquad(10)), back1
IF mapx <> 2 AND mapy <> 4 THEN PUT (xquad(10), yquad(6)), oldman
'dont let em in untill they have all the items
 IF items(3) = "boat list" AND storystatus = 3.2 AND mapx = 2 AND mapy = 4 AND cx = 17 AND cy = 5 THEN
 LOCATE 10, 15: PRINT "he isnt here,..you see a messages that says 'i am not feeling well, comeback when you have all the items that i need'"
 PRINT "you leave"
 delay (3)
 SELECT CASE a$
 CASE "m": cy = cy - 1
 CASE "i": cy = cy + 1
 CASE "j": cx = cx + 1
 CASE "l": cx = cx - 1    'make you leave
 END SELECT
 CALL crossroad
 CALL where
END IF

refresh

END SUB

SUB drawmain

SCREEN 9, 0, 0, 0
'lets draw my datashiznit
FOR y = 0 TO 9
 FOR x = 1 TO 20
  READ z$
  SELECT CASE z$
  CASE "r"
   PUT (xquad(x), yquad(y)), rock
  CASE "t"
   PUT (xquad(x), yquad(y)), tree
  CASE "0"
   PUT (xquad(x), yquad(y)), flor
 END SELECT
 NEXT
NEXT
LINE (0, 301)-(640, 350), 7, BF
'301
'LOCATE 23: PRINT "SNAPPAHEDs ROCK!"
'LOCATE 1, 77: PRINT "YO"
PCOPY 0, 1
SCREEN 9, 0, 1, 1

END SUB

SUB ending

CLS
PRINT "you win"
PRINT "you get da air ship and you escape! yey!"
PRINT "but what lies beyond the land of GEF no one knows"
INPUT yo$

SCREEN 9
DO

FOR scre = 1 TO 3     'terrain 'dudes 'monsters
CALL fromjeff
CLS
IF scre < 3 THEN CALL pall ELSE PALETTE
FOR y = 0 TO 9
 FOR x = 1 TO 20
IF scre = 1 THEN pick = INT(RND * 12) + 1
IF scre = 2 THEN pick = INT(RND * 6) + 13
IF scre = 3 THEN pick = INT(RND * 8) + 19   'added 2
SELECT CASE pick
 CASE 1
   PUT (xquad(x), yquad(y)), rock2, PSET  'rubble
 CASE 2
   PUT (xquad(x), yquad(y)), rock, PSET   'mountain
 CASE 3
   PUT (xquad(x), yquad(y)), tree2, PSET
 CASE 4
  PUT (xquad(x), yquad(y)), tree, PSET
 CASE 5
   PUT (xquad(x), yquad(y)), water, PSET
 CASE 6
   PUT (xquad(x), yquad(y)), grav, PSET
 CASE 7
   PUT (xquad(x), yquad(y)), huts, PSET
 CASE 8
   PUT (xquad(x), yquad(y)), flor, PSET
 CASE 9
   PUT (xquad(x), yquad(y)), tree, PSET
 CASE 10
  PUT (xquad(x), yquad(y)), grass, PSET
 CASE 11
   PUT (xquad(x), yquad(y)), sand, PSET
 CASE 12
   PUT (xquad(x), yquad(y)), cast, PSET
 CASE 13
   PUT (xquad(x), yquad(y)), front1, PSET
 CASE 14
   PUT (xquad(x), yquad(y)), front2, PSET
 CASE 15
   PUT (xquad(x), yquad(y)), back1, PSET
 CASE 16
   PUT (xquad(x), yquad(y)), back2, PSET
 CASE 17
   PUT (xquad(x), yquad(y)), sidel, PSET
 CASE 18
   PUT (xquad(x), yquad(y)), sider, PSET
 CASE 19
   PUT (xquad(x), yquad(y)), slime, PSET
 CASE 20
   PUT (xquad(x), yquad(y)), beleth, PSET
 CASE 21
   PUT (xquad(x), yquad(y)), babble, PSET
 CASE 22
   PUT (xquad(x), yquad(y)), necro, PSET
 CASE 23
   PUT (xquad(x), yquad(y)), bat, PSET
 CASE 24
   PUT (xquad(x), yquad(y)), spook, PSET
 CASE 25:
   PUT (xquad(x), yquad(y)), snake, PSET
 CASE 26:
   PUT (xquad(x), yquad(y)), kraken, PSET
END SELECT
NEXT: NEXT


LOCATE 23:
SELECT CASE scre
 CASE 1:
    ffuu = INT(RND * 3) + 1
      IF ffuu = 1 THEN PRINT "thanks for playing                          "
      IF ffuu = 2 THEN PRINT "Thanks for supporting snappahed software    "
      IF ffuu = 3 THEN PRINT "Thank You for being you!                    "
  CASE 2:
    ffuu = INT(RND * 3) + 1
      IF ffuu = 1 THEN PRINT "Jeff Gariepy sounds like diesel             "
      IF ffuu = 2 THEN PRINT "Greg Milette RULES                          "
      IF ffuu = 3 THEN PRINT "Geoff Graves is da Bomb                     "
CASE 3:
    ffuu = INT(RND * 3) + 1
      IF ffuu = 1 THEN PRINT "ZARGON IS DEFEATED!!                        "
      IF ffuu = 2 THEN PRINT "you rule!                                   "
      IF ffuu = 3 THEN PRINT "you have conquered! the land of GEF         "
END SELECT
delay (1)
NEXT scre

LOOP UNTIL INKEY$ <> ""

CLS

PUT (xquad(5), yquad(5)), ZARGON
LOCATE 12
PRINT "Zargon will await you in you next life"
END

END SUB

FUNCTION fixdat (thanx)

'PALETTE 0, 0: PALETTE 1, 4: PALETTE 2, 48: PALETTE 3, 2
'PALETTE 4, 6: PALETTE 5, 54: PALETTE 6, 10: PALETTE 7, 38
'PALETTE 8, 46: PALETTE 9, 5: PALETTE 10, 25: PALETTE 11, 7
'PALETTE 12, 57: PALETTE 13, 63: PALETTE 14, 9: PALETTE 15, 59
SELECT CASE thanx
 CASE 0: x = 0
 CASE 1: x = 14
 CASE 2: x = 3
 CASE 3: x = 6
 CASE 4: x = 1
 CASE 5: x = 9
 CASE 6: x = 8
 CASE 7: x = 13
 CASE 8: x = 11
 CASE 9: x = 15
 CASE 10: x = 3
 CASE 11: x = 12
 CASE 12: x = 1
 CASE 13: x = 9
 CASE 14: x = 5
 CASE 15: x = 13
 END SELECT


fixdat = x
END FUNCTION

SUB fixground (a$)
SHARED fuk
SELECT CASE a$
 CASE "m"
  til = ground(cx, cy)
  grx = xquad(cx): gry = yquad(cy - 1)
 CASE "i"
  til = ground(cx, cy + 2)
  grx = xquad(cx): gry = yquad(cy + 1)
 CASE "j"
  til = ground(cx + 1, cy + 1)
  grx = xquad(cx + 1): gry = yquad(cy)
 CASE "l"
  til = ground(cx - 1, cy + 1)
  grx = xquad(cx - 1): gry = yquad(cy)
END SELECT

SELECT CASE til
 CASE 1
  PUT (grx, gry), grass, PSET
 CASE 2
  PUT (grx, gry), sand, PSET
 CASE 0
  PUT (grx, gry), flor, PSET
 CASE 4
  PUT (grx, gry), water, PSET  'agua?
         'it will write bad stuff if you walk over good stuff. oh well
END SELECT
 
'IF fuk <> 1 THEN IF a$ = "m" THEN LOCATE 23: PRINT "til:"; til, grx, gry: INPUT yo$: fuk = 1

END SUB

SUB flamesp

Gain = INT(RND * 10) + 1 * lev  'bigger the lev, bigger the spels

FOR g = 1 TO 3: PUT (325, 110), flame, XOR

'****************
FOR p = 1 TO 5
FOR i = 100 TO 2000 STEP 75
IF ll <> 1 THEN SOUND i, .05
NEXT i
NEXT p
delay (.4): PUT (325, 110), flame, XOR: delay (.2)
NEXT g
'%%%%%%%%%%

cMP = cMP - 3
mDP = mDP - (10 + Gain)
damage = (10 + Gain)
IF mDP < 0 THEN mDP = 0
charstatz
LINE (410, 195)-(550, 349), 0, BF

END SUB

SUB flipguy
DIM sides(30, 30)
CLS
LINE (0, 0)-(50, 50), 10, BF
displayTile "dude-sidel", 1, 1
IF stealgraphics = 1 THEN
  DO: LOOP UNTIL INKEY$ <> ""
END IF
GET (1, 1)-(30, 30), sidel

FOR y = 1 TO 30
 FOR x = 1 TO 30
   sides(x, y) = POINT(x, y)
 NEXT x
NEXT y

x1 = 0
x2 = 31
 DO UNTIL x1 = 15
   x1 = x1 + 1
   x2 = x2 - 1
  FOR ys = 1 TO 30
    SWAP sides(x1, ys), sides(x2, ys)
   NEXT ys
 LOOP

LOCATE 15
'INPUT yo$
'LINE (0, 0)-(300, 300), 13, BF
CLS
FOR y = 1 TO 30
 FOR x = 1 TO 30
  PSET (x, y), sides(x, y)
 NEXT x
NEXT y
GET (1, 1)-(30, 30), sider
IF stealgraphics = 1 THEN
  DO: LOOP UNTIL INKEY$ <> ""
END IF


END SUB

SUB found

CLS
PRINT "you found something.."
delay (.5)

mapx$ = RIGHT$(STR$(mapx), 1)
mapy$ = RIGHT$(STR$(mapy), 1)
SELECT CASE mapx$ + mapy$
 CASE "44"
   item$ = "dynomite"
   items(1) = item$
CASE "14"
   item$ = "dead wood"
   items(2) = item$
CASE "24"
  item$ = "rutter"
   items(4) = item$
CASE "13"
  item$ = "cloth"
   items(5) = item$
CASE "22"
  item$ = "wood"
   items(6) = item$
END SELECT
PRINT "you found the "; item$
INPUT "hit enter to continue"; yo$

CALL crossroad
CALL where

END SUB

SUB fountain

CLS
PRINT "hi mr. fountain!"
CALL drawhut
SCREEN 9, 0, 0, 0


DO
PUT (xquad(10), yquad(6)), tree, PSET
PUT (xquad(10), yquad(6)), water, OR
LOCATE 19, 6: PRINT "1) bathe"
LOCATE 20, 6: PRINT "2) drink"
LOCATE 21, 6: PRINT "3) pass"
LOCATE 22, 6: PRINT "4) save"

LOCATE 9, 30: PRINT "what do you want?"
LOCATE 23, 6: INPUT yo
badw = INT(RND * 5) + 1
IF yo = 9 THEN END
refresh
LOCATE 10, 15
heald = 0
'answers and actions
SELECT CASE yo
 CASE 1
   PRINT "you feel much better"
 CASE 2
   PRINT "you drink and.";
   delay (.2): PRINT "."; : delay (.2): PRINT "."; : delay (.2): PRINT "."
   IF badw = 2 THEN PRINT "bad water!": cDP = cDP - 10 'you might die
   IF badw <> 2 THEN PRINT "your wounds close": cDP = BcDP
 CASE 3
  PRINT "good get to heck out"
  getout = 1
 CASE 4
   CALL savgam(99)
END SELECT
IF heald = 1 AND getout = 0 THEN
 IF ll <> 1 THEN PLAY "l32 o1 c>c>c>c>c"
  PRINT "sure my son"
END IF

LOOP UNTIL getout = 1





SELECT CASE a$
CASE "m": cy = cy - 1
CASE "i": cy = cy + 1
CASE "j": cx = cx + 1
CASE "l": cx = cx - 1
END SELECT
CALL crossroad
CALL where



END SUB

SUB fromjeff STATIC

jcount = jcount + 1
IF jcount > 14 THEN jcount = 1

SELECT CASE jcount
CASE 1
PLAY "mb o1 ml l3 c g f a "
CASE 2
PLAY "mb o1 mn l58 gg>c<gg>c<gg>c<gg>c<gg>c<gg>c<gg>c<gg>c"
CASE 3
PLAY "mb o1 l58    gg>g<gg>g<gg>g<gg>g<gg>g<gg>g<gg>g<gg>g"
CASE 4
PLAY "mb o1 l58    gg>f<gg>f<gg>f<gg>f<gg>f<gg>f<gg>f<gg>f"
CASE 5
PLAY "mb o1 l58    gg>a<gg>a<gg>a<gg>a<gg>a<gg>a<gg>a<gg>a"
CASE 6
PLAY "mb o2 mn l58 gg>c<gg>c<gg>c<gg>c<gg>c<gg>c<gg>c<gg>c"
CASE 7
PLAY "mb o2 l58    gg>g<gg>g<gg>g<gg>g<gg>g<gg>g<gg>g<gg>g"
CASE 8
PLAY "mb o2 l58    gg>f<gg>f<gg>f<gg>f<gg>f<gg>f<gg>f<gg>f"
CASE 9
PLAY "mb o2 l58    gg>a<gg>a<gg>a<gg>a<gg>a<gg>a<gg>a<gg>a"
CASE 10
PLAY "mb  o3 p16 g3 c12c2"
PLAY "mb o3 l16 p16 ml c6 g6 e12c10f3 mn a12 a2"
CASE 11
PLAY "mb o3 ml l16 p12 a9b9>c6 p24 c<bab9 p24 baga9 p24 agfg p24 gfef p24 mn cc2"
PLAY "mb o3 l16 ml g p24 mn cc2"
CASE 12
PLAY "mb  o3 p16 g3 c12c2"
PLAY "mb o3 l16 p16 ml c6 g6 e12c10f3 mn a12 a2"
CASE 13
PLAY "mb o3 ml l16 p12 a9b9>c6 p24 c<bab9 p24 baga9 p24 agfg p24 gfef p24 mn cc2"
PLAY "mb o3 l16 ml g p24 mn cc2"
END SELECT

'FOR i = 1 TO 2
'PLAY "mb  o3 p16 g3 c12c2"
'PLAY "mb o3 l16 p16 ml c6 g6 e12c10f3 mn a12 a2"
'PLAY "mb o3 ml l16 p12 a9b9>c6 p24 c<bab9 p24 baga9 p24 agfg p24 gfef p24 mn cc2"
'
'PLAY "mb o3 l16 ml g p24 mn cc2"
'NEXT i

END SUB

SUB grid2

COLOR 6
FOR x = 0 TO 600 STEP 30   '630    '600
LINE (x, 0)-(x, 300)
NEXT x
FOR y = 0 TO 320 STEP 30     '350    '320
LINE (0, y)-(600, y)
NEXT y
                    '11 times 21

END SUB

SUB healr (a$)
CLS
PRINT "hi mr. healer!"
CALL drawhut
DO
LOCATE 18, 6: PRINT "1) healing        3gp"
LOCATE 19, 6: PRINT "2) magic healing  3gp"
LOCATE 20, 6: PRINT "3) complete rest  5gp "
LOCATE 21, 6: PRINT "4) shall i save your game?"
LOCATE 22, 6: PRINT "5) i've had enough of this guy"
LOCATE 9, 30: PRINT "what do you want?"
LOCATE 23, 6: INPUT yo
IF yo = 8 THEN END'fu
refresh
LOCATE 10, 15
heald = 0
'answers and actions
SELECT CASE yo
 CASE 1
  IF gold - 3 > 0 THEN cDP = BcDP: heald = 1: gold = gold - 3
 CASE 2
  IF gold - 3 > 0 THEN cMP = BcMP: heald = 1: gold = gold - 3
 CASE 3
  IF gold - 5 > 0 THEN cMP = BcMP: cDP = BcDP: heald = 1: gold = gold - 5
 CASE 5
  PRINT "bye"
  GOTO outtee
 CASE 4
  CALL savgam(99)
  GOTO outtee
END SELECT
IF heald = 1 THEN  'and getout=0
  IF ll <> 1 THEN PLAY "l32 o1 c>c>c>c>c"
  PRINT "sure my son"
 ELSE
  PRINT "you dont have enough gold"
END IF


LOOP UNTIL getout = 1
outtee:




SELECT CASE a$
CASE "m": cy = cy - 1
CASE "i": cy = cy + 1
CASE "j": cx = cx + 1
CASE "l": cx = cx - 1
END SELECT
CALL crossroad
CALL where


END SUB

SUB hi (gef$, donde)

REM give me a word and i will display it in random colors

DIM tre(LEN(gef$))
DO
FOR f = 1 TO LEN(gef$)
tre(f) = INT(RND * 15) + 1
NEXT f
LOCATE donde
FOR f = 1 TO LEN(gef$)
COLOR tre(f): PRINT MID$(gef$, f, 1);
NEXT f
PRINT
LOOP UNTIL INKEY$ <> ""

END SUB

SUB Hitback
x = 300: y = 100
'SCREEN 9, 0, 1, 1
CLS
SELECT CASE mAP / howmuchbigger
 CASE 2
  PUT (1, 1), bat
  GET (1, 1)-(17, 15), monster
  mloss = INT(RND * 2)
 CASE 4
  PUT (1, 1), babble
  GET (1, 1)-(27, 10), monster
  mloss = INT(RND * 3)
 CASE 6
  PUT (1, 1), spook
  GET (1, 1)-(27, 26), monster 'change ap
  mloss = INT(RND * 4)          ' 4-int(rnd*4)+1 == int(rnd*1-4)
 CASE 8
  PUT (1, 1), beleth
  GET (1, 1)-(39, 32), monster
  mloss = INT(RND * 5)

 CASE 1
  PUT (1, 1), slime
  GET (1, 1)-(39, 32), monster
  mloss = INT(RND * 1)

 CASE 12
  PUT (1, 1), snake
  GET (1, 1)-(42, 54), monster
  mloss = INT(RND * 6)

 CASE 13
  PUT (1, 1), necro
  GET (1, 1)-(39, 32), monster
  mloss = INT(RND * 7)

 CASE 25                  'kraken
  PUT (1, 1), kraken
  GET (1, 1)-(54, 54), monster
  mloss = INT(RND * 7)
END SELECT

IF M$ = "Bat" THEN dx = 383
IF M$ = "Babble" THEN dx = 378
IF M$ = "Spook" THEN dx = 375
IF M$ = "Beleth" THEN dx = 355
IF M$ = "Slime" THEN dx = 383   '?
IF M$ = "Necro" THEN dx = 375
IF M$ = "SkanderSnake" THEN dx = 375
IF M$ = "Kraken" THEN dx = 375


'CALL refresh
SCREEN 9, 0, 0, 0
 IF M$ = "baleth" THEN PUT (280, 100), monster ELSE PUT (300, 100), monster ''error '300 to 280
 DO: PUT (x, y), monster, XOR: PUT (x, y), monster, XOR: x = x + 2
 LOOP UNTIL x >= dx

FOR d = 1 TO 3
PUT (dx, 100), monster, XOR
FOR joe = 1 TO 10
 sd = INT(RND * 300) + 37
IF ll <> 1 THEN SOUND sd, .1
NEXT joe

delay (.1)
PUT (dx, 100), monster, XOR
PUT (dx, 100), monster, XOR
delay (.3)
PUT (dx, 100), monster, XOR
NEXT d
PUT (300, 100), monster, XOR
'((((((((((((((((((((((((((((((((((((


bdam = (mAP - mloss - defense)
IF bdam < 0 THEN bdam = 0
cDP = cDP - bdam

LOCATE 16, 24: PRINT M$
LOCATE 17, 24: PRINT "hits for:"
LOCATE 18, 24: PRINT "  "; bdam
LOCATE 19, 24: PRINT " Damage!"
delay (1)
LINE (176, 191)-(289, 289), 0, BF

'FOR x = 1 TO 200: PUT (400, 100), joe, XOR: NEXT
IF cDP < 0 THEN cDP = 0
IF cDP = 0 THEN LOCATE 17, 2: PRINT cAP; cDP: PRINT "u iz dead": CALL died


END SUB

SUB HitBeast


'cLOSS = INT(RND * 3)

'$$$$$$$$$$$$$$$$$$$$$$$$
'LETZ ANIMATE HIM

x = 400: y = 100
PUT (400, 100), joe, XOR

DO
PUT (x, y), joe, XOR
PUT (x, y), joe, XOR
x = x - 10
LOOP UNTIL x <= 330
           
FOR d = 1 TO 3
PUT (330, 100), joeattax, XOR
sp = (INT(RND * 40) + 150) * -1
FOR joe = 800 TO 100 STEP sp
 IF ll <> 1 THEN SOUND joe, 1
NEXT joe

'FOR joe = 1 TO 10
's1 = INT(RND * 200) + 37
'SOUND s1, .1
'NEXT joe
'FOR joe = 1 TO 30
's2 = INT(RND * 200) + 237
'SOUND s2, .1
'NEXT joe

delay (.1)
PUT (330, 100), joeattax, XOR
PUT (330, 100), joe, XOR
delay (.3)
PUT (330, 100), joe, XOR
NEXT d

PUT (400, 100), joe, XOR

'LETZ QUIT ANIMATING HIM
'$$$$$$$$$$$$$$$$$$$$$$$$$$
'random miss?
mDP = mDP - (cAP + wgain)               'wgain?
                                        'cAP attack points
                                           'mDP bad hp
LOCATE 16, 24: PRINT "Joe hits for:"
LOCATE 17, 24: PRINT "  "; (cAP + wgain)
LOCATE 18, 24: PRINT " Damage!"
delay (1)
LINE (176, 191)-(289, 289), 0, BF

'FOR x = 190 TO 40 STEP -20
'SOUND x, 1
'NEXT x

IF mDP < 0 THEN mDP = 0
LOCATE 18, 14: PRINT mAP; mDP
'im putting an if here so that you can beat zargon ok.,?
IF M$ = "ZARGON" AND mDP = 0 THEN CALL beatzargon
IF mDP = 0 THEN WinBattle

END SUB

SUB hut (a$)
top:
CALL drawhut
thisisasub = storycheck(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

mapx$ = RIGHT$(STR$(mapx), 1)
mapy$ = RIGHT$(STR$(mapy), 1)
'sets what questions will be asked when
SELECT CASE mapx$ + mapy$
CASE "32"
 CALL fountain
CASE "11" 'save the game at the fountains
 CALL fountain
CASE "24"
 SCREEN 9, 0, 0, 0
LOCATE 1, 30: PRINT storystatus
 CALL boatman(0)
 CALL refresh
  IF storystatus < 2 THEN
   question1$ = "what happened??"
    answer1$ = "monsters attacked me, but their mage blasted down these rocks...now i am stuck, please help!!!"
   question2$ = "how can i help?"
    IF storystatus = 1.5 THEN question2$ = "use the dynomite"
    answer2$ = "blast me out of here!!.. use the dynomite, the sandman knows where it is, i think.."
   question3$ = "why should i help you?"
    answer3$ = "because i am a boat master.. i can build you a boat!!!! ooo ouch! help!"
  END IF
  IF storystatus < 3 AND storystatus >= 2 THEN
    question1$ = "how can we get out of here?"
     answer1$ = "well there used to be a warper, in the old castle, but it is currently overrun by monsters, the island is the only way out"
    question2$ = "how can we get to this island?"
     answer2$ = "duh? i am a boatmaker, i guess i could make you a boat seeing that you saved my life and all.. i'll need some materials though.."
    question3$ = "what do you need and where do i find it?"
     answer3$ = "i'll need wood first, but not any old wood..it has to be nearly dead and dried. Almost as if the sand had blown its strength into it"
    IF storystatus = 2.5 THEN
      question3$ = "(give him the wood)"
      answer3$ = "ahh yes thankyou, i will build you the boat soon enough, but i am tired, and i need to get some rest, so please excuse me, oh here is what i need(he gives you the boat plans)": items(3) = "boat list"
    END IF
  END IF
  IF storystatus >= 3 AND storystatus < 4 THEN
   question1$ = "what happened!?!, I got you your stinkin' items!!! I WANT MY SHIP!!!"
    answer1$ = "he isnt moving"
   question2$ = "(poke at him/wake him up)"
    answer2$ = "you poke him, but he doesnt move, you push him over and a drop of blood escapes from his mouth, he's dead"
   question3$ = "search him"
    answer3$ = "in his left hand, you find the plans for the ship...you pick them up and decide to read them later(hit I then choose them)"
  IF storystatus >= 4 AND storystatus < 5 THEN question3$ = "kick dirt in the deadman's face": answer3$ = "nope, he still does not move"
  END IF
  IF storystatus >= 5 AND storystatus < 6 THEN
   question1$ = "hello?"
    answer1$ = "yes? what do you want?"
   question2$ = "now, can you build the ship"
    answer2$ = "yes..give me the plans. i will build your ship"
   IF storystatus = 5.5 THEN
    question2$ = "cool, how do i use it?"
    answer2$ = "just walk into the ship, and you will be able to travel the river"
   END IF
   question3$ = "are you ok now"
    answer3$ = "yes i am fine"
  END IF
 'sand man
 CASE "14"
   question1$ = "how can i escape?"
   IF storystatus = 1 THEN
   question2$ = "(ask him about the dynomite)"
   ELSE
   question2$ = "what's up with this place?"
   END IF
   question3$ = "do you dig the sand?"
   answer1$ = "the only way i know of is through the river"
   IF storystatus = 1 THEN
   answer2$ = "the dynomite? hmm.. it lies on the east side of the TWO GREAT ROCKS OF THE UNIVERSE, but beware, monsters tend to spurt out, be careful, may the sands be with u"
   ELSE
   answer2$ = "This is the land of Gef. The great river splits the forest of the land from the rocks and mountains. In the middle of the island is the castle where the elves used to live, i have no knowledge of what is going on there now"
   END IF
   answer3$ = "yea it rules man."
   IF storystatus >= 3 AND storystatus < 4 THEN
    question1$ = "where is the cloth, oh wisest man of the sands?"
     answer1$ = "it is, my friend, where the lion slashed the trees, and left the man's cloth"
    question2$ = "where is the wood so that we may construct a ship"
     answer2$ = "the wood lies, in between the two great forests, their stong limbs will help you along"
    question3$ = "where is the rutter?"
     answer3$ = "i am afraid it is too obvious, it is right under you're nose..where the rocks of the east meet with the trees of the west"
   END IF
   IF storystatus >= 4 AND storystatus < 5 THEN
   question1$ = "ho w can i get off this darn island?"
    answer1$ = "well, the only way is to go to the castle by boat.."
   question2$ = "the boatman is dead! WHAT DO I DO NOW?"
    answer2$ = "bring him back from the dead!"
   question3$ = "HUH?"
    answer3$ = "i know of a man, who can help you. He lives in the northeast. Its dangerous though, he lives in a graveyard, this man is a NECROMANCER!!!!"
   END IF
 'death master
 CASE "41"
  IF storystatus < 4 OR storystatus >= 5 THEN
   question1$ = ""
   answer1$ = "there is no one here"
   question2$ = ""
   answer2$ = "there is no one here"
   question3$ = ""
   answer3$ = "there is no one here"
  END IF
  IF storystatus >= 4 AND storystatus < 5 THEN
   'bargining for his help
   question1$ = "hello mr. necromancer, i have to ask you for something"
    answer1$ = "WHAT DO YOU WANT? YOU PATHETIC MORTALS?"
   question2$ = "well sir(gulp) the boatman died and i was told you could bring him back."
    answer2$ = "WHAT?.. you are asking quite a favor, you know how many pathetic creatures come to me and as me that same question? Well i am a nice guy, so OCCASIONALLY i"
    answer2$ = answer2$ + "will do it, but ya see i aint gunna do it no more, it has made me too weak. NO.. the answer is NO!"
   question3$ = "well, perhaps we can offer you something"
    answer3$ = "well i need a soul it takes a toll on my body's whole. you see everytime i use my black arts. i grow weaker, my soul is drained, if you could get me another soul....perhaps we could talk again"
    'give him the soul
    IF storystatus = 4.3 THEN
      question3$ = "(give him the soul)"
      answer3$ = "ahhhhh yes, fresh blood...there, i will restore your friend..hopefully he'll do the same for you when you die MAHAHAHAHAAA!!" '--light flashes
    END IF
  END IF
 'mountainjack
 CASE "43"
  IF storystatus < 4 THEN
   answer1$ = "there is no one here"
   answer2$ = "there is no one here"
   answer3$ = "there is no one here"
  END IF
  IF storystatus >= 4 THEN 'AND storystatus < 5 THEN
   question1$ = "how can i escape from here?"
    answer1$ = "well lemme see here, that there island wit da castle on it, well, i do declare, that if a fella like you could make it there, you might have some luck"
   question2$ = "do you know where i can find a soul?"
    answer2$ = "what in tarnation!. oh a soul..well i once knew a fella who was trapped behind a mountain. yea, hes long dead i reckon"
   IF storystatus = 4.3 THEN
    question2$ = "see i found the soul!"
    answer2$ = "good for you tiger"
   END IF
   question3$ = "did you marry your cousin by any chance"
    answer3$ = "yea, so?"
  END IF
 'the trapped soul
 CASE "42"
  question1$ = "hello?"
   answer1$ = "(no answer)"
  question2$ = "are you a soul?"
   answer2$ = "(he is a soul)"
  question3$ = "(TAKE HIM)"
   answer3$ = "WHO DARES DISTURB ME?!?"
  IF storystatus >= 4.3 THEN
   question1$ = ""
   question2$ = ""
   question3$ = ""
   answer1$ = "there is no one here"
   answer2$ = "there is no one here"
   answer3$ = "there is no one here"
  END IF
 'old man
 CASE "44"
 question1$ = "how can i escape??"
  answer1$ = "well the castle used to have a couple of airships, but i gather that they wer destroyed.. they had regular exports from the country."
 question2$ = "are you the old man??"
  answer2$ = "who says?..oh yes, i have been around here for quite a while, i've seen empires rise and fall, and people live and die. i am a very old man"
 question3$ = "do you have an airship?"
  answer3$ = "yes, and i see you have a ship..well, i will loan you this orb which will allow you to control it, but... you must prove yourself worthy, here is my riddle....."
END SELECT

getout = 0
'prints the questions
DO
LOCATE 19, 6: PRINT "1)"; question1$
LOCATE 20, 6: PRINT "2)"; question2$
LOCATE 21, 6: PRINT "3)"; question3$
LOCATE 22, 6: PRINT "4)i've had enough of this guy"
LOCATE 9, 30: PRINT "what do you want?"
LOCATE 23, 6: INPUT yo
IF yo = 9 THEN END
refresh
LOCATE 10, 15
'answers and actions
SELECT CASE yo
 CASE 1
  PRINT answer1$
 CASE 2
  IF storystatus <> 1.5 THEN PRINT answer2$
  IF mapx$ + mapy$ = "24" AND storystatus = 1.5 THEN
   LOCATE 23: INPUT "use the dynomite?"; yn$
   'add some animation here
   IF yn$ = "y" THEN
    FOR x = 1 TO 4
     CALL boatman(99)
FOR joe = 1 TO 1500 STEP 5
s = INT(RND * joe) + 38
IF ll <> 1 THEN SOUND s, .025
NEXT joe
FOR joe = 1500 TO 1 STEP -2
s = INT(RND * joe) + 38
IF ll <> 1 THEN SOUND s, .025
NEXT joe
  NEXT x
       CALL boatman(99)
  FOR joe = 1 TO 100
   s = INT(RND * 100) + 38
  IF ll <> 1 THEN SOUND s, .025
  NEXT joe
    items(1) = "dynomite(used)"
   delay (.5)
   GOTO top
   'CALL boatman(0)
   END IF
  END IF
  IF storystatus = 5 AND mapx$ + mapy$ = "24" THEN
   items(8) = "ship"
 FOR x = 1 TO 15
 SELECT CASE x
  CASE 1 TO 5
   IF ll <> 1 THEN PLAY "l64 o1 gp64"
   delay (.5)
  CASE 6 TO 10
   IF ll <> 1 THEN PLAY "l64 o2 cp64"
   delay (.5)
  CASE 11 TO 15
   IF ll <> 1 THEN PLAY "l64 o2 gp64"
   delay (.5)
  END SELECT
 NEXT x
 CALL hut(a$)
  END IF
 CASE 3
  PRINT answer3$
  IF mapx$ + mapy$ = "44" THEN CALL oldgame
  'kicks u out and boatman dies                                                                       'storystaus=3
  IF mapx$ + mapy$ = "24" AND storystatus = 2.5 THEN delay (1): LOCATE 22: INPUT "do you leave"; yo$: items(2) = "dead wood(used)": IF yo$ = "y" THEN getout = 1 ELSE PRINT "you better let him get to work, he kicks you out": delay (1): getout = 1
  IF mapx$ + mapy$ = "24" AND storystatus = 3.8 THEN items(3) = "boat plans":
  IF mapx$ + mapy$ = "42" AND storystatus = 4 THEN PRINT "he attacks you": CALL battleset 'you have to fight him
  IF mapx$ + mapy$ = "41" AND storystatus = 4.3 THEN
    delay (1)
    items(7) = "trapped soul(used)"
    SCREEN 9, 0, 1, 1: LINE (0, 0)-(640, 350), 4, BF
        FOR x = 1 TO 4
        LOCATE 10, 15 + (x * 5): PRINT "rise!";
        FOR joe = 2000 TO 3500 STEP 2
        s = INT(RND * joe) + joe
       IF ll <> 1 THEN SOUND s, .025
                SCREEN 9, 0, 1, 1    'the screen flashes, heh i spell
                SCREEN 9, 0, 0, 0
        NEXT joe
   NEXT x
   delay (1)
   GOTO top
 END IF
 CASE 4
  PRINT "bye"
  getout = 1
END SELECT
LOOP UNTIL getout = 1
answer1$ = ""
answer2$ = ""
answer3$ = ""
question1$ = ""
question2$ = ""
question3$ = ""


SELECT CASE a$
CASE "m": cy = cy - 1
CASE "i": cy = cy + 1
CASE "j": cx = cx + 1
CASE "l": cx = cx - 1
END SELECT
CALL crossroad
CALL where
END SUB

SUB hutsread (cast(), huts())
FOR y = 0 TO 29
  FOR x = 0 TO 29
    READ p
    g = fixdat(p)
    PSET (x, y), g
  NEXT x
NEXT y
GET (0, 0)-(29, 29), huts
IF stealgraphics = 1 THEN
  DO: LOOP UNTIL INKEY$ <> ""
END IF

CLS
FOR y = 0 TO 29
  FOR x = 0 TO 29
    READ poin
    poin = fixdat(poin)
    PSET (x, y), poin
  NEXT x
NEXT y
GET (0, 0)-(29, 29), cast
IF stealgraphics = 1 THEN
  DO: LOOP UNTIL INKEY$ <> ""
END IF

END SUB

SUB initgraphics
'lets make a dark green for the background.. palette
'cut 'em down and then put 'em in different backgrounds
CLS

OPEN path$ + "bomb.sht" FOR INPUT AS #1
DO
CLS
INPUT #1, xlim
INPUT #1, ylim
INPUT #1, name$
IF name$ = "flor" THEN GOTO fll
IF name$ = "florwd" THEN GOTO fll
IF name$ = "fboat" OR name$ = "cflor" THEN GOTO fll
' LINE (0, 0)-(100, 100), 2, BF
FOR y = 1 TO ylim
  FOR x = 1 TO xlim
   INPUT #1, g
'   IF x = xlim AND g = 0 AND name$ <> "necro" AND name$ <> "ZARGON" AND name$ <> "oldman" THEN g = 4
'   IF y = ylim AND g = 0 AND name$ <> "necro" AND name$ <> "ZARGON" AND name$ <> "oldman" THEN g = 4
   PSET (x, y), g
  NEXT x
NEXT y
fll:
SELECT CASE name$
        CASE "flor"
        FOR y = 1 TO ylim
          FOR x = 1 TO xlim
           INPUT #1, g
           die = fixdat(g)
           PSET (x, y), die
          NEXT x
        NEXT y
          GET (1, 1)-(29, 29), flor
          PUT (29, 29), flor, PSET
          PUT (0, 29), flor, PSET
          PUT (29, 0), flor, PSET
          GET (3, 3)-(33, 33), flor
        IF stealgraphics = 1 THEN
          DO: LOOP UNTIL INKEY$ <> ""
        END IF

         CASE "rock1"
           GET (1, 1)-(30, 30), rock
          PUT (29, 29), rock, PSET
          PUT (0, 29), rock, PSET
          PUT (29, 0), rock, PSET
          GET (1, 1)-(30, 30), rock
        IF stealgraphics = 1 THEN
          DO: LOOP UNTIL INKEY$ <> ""
        END IF

         CASE "rock2"
           GET (1, 1)-(30, 30), rock2
          PUT (29, 29), rock2, PSET
          PUT (0, 29), rock2, PSET
          PUT (29, 0), rock2, PSET
          GET (1, 1)-(30, 30), rock2
        IF stealgraphics = 1 THEN
          DO: LOOP UNTIL INKEY$ <> ""
        END IF

         CASE "tree2"
           GET (1, 1)-(30, 30), tree2
          PUT (29, 29), tree2, PSET
          PUT (0, 29), tree2, PSET
          PUT (29, 0), tree2, PSET
          GET (1, 1)-(30, 30), tree2
        IF stealgraphics = 1 THEN
          DO: LOOP UNTIL INKEY$ <> ""
        END IF

         CASE "tree1"
           GET (1, 1)-(30, 30), tree
          PUT (29, 29), tree, PSET
          PUT (0, 29), tree, PSET
          PUT (29, 0), tree, PSET
          GET (1, 1)-(30, 30), tree
        IF stealgraphics = 1 THEN
          DO: LOOP UNTIL INKEY$ <> ""
        END IF

         CASE "water"
           GET (1, 1)-(30, 30), water
          PUT (29, 29), water, PSET
          PUT (0, 29), water, PSET
          PUT (29, 0), water, PSET
          GET (1, 1)-(30, 30), water
        IF stealgraphics = 1 THEN
          DO: LOOP UNTIL INKEY$ <> ""
        END IF

         CASE "huts"
           GET (1, 1)-(30, 30), huts
           'need graphic filler
           'hut graphic is messed up
        IF stealgraphics = 1 THEN
          DO: LOOP UNTIL INKEY$ <> ""
        END IF

        CASE "florwd"
        FOR y = 1 TO ylim
          FOR x = 1 TO xlim
           INPUT #1, g
           die = fixdat(g)
           PSET (x, y), die
          NEXT x
        NEXT y
          GET (1, 1)-(30, 30), florwd
        IF stealgraphics = 1 THEN
          DO: LOOP UNTIL INKEY$ <> ""
        END IF

         CASE "cir"
           GET (1, 1)-(30, 30), cir
        IF stealgraphics = 1 THEN
          DO: LOOP UNTIL INKEY$ <> ""
        END IF

         CASE "fboat"
        FOR y = 1 TO ylim
          FOR x = 1 TO xlim
           INPUT #1, g
           die = fixdat(g)
           PSET (x, y), die
          NEXT x
        NEXT y
           GET (1, 1)-(30, 30), fboat
        IF stealgraphics = 1 THEN
          DO: LOOP UNTIL INKEY$ <> ""
        END IF

         CASE "cflor"
        FOR y = 1 TO ylim
          FOR x = 1 TO xlim
           INPUT #1, g
           die = fixdat(g)
           PSET (x, y), die
          NEXT x
        NEXT y
          GET (1, 1)-(30, 30), cflor
        IF stealgraphics = 1 THEN
          DO: LOOP UNTIL INKEY$ <> ""
        END IF

        CASE "oldman"
          GET (1, 1)-(29, 29), oldman
        IF stealgraphics = 1 THEN
          DO: LOOP UNTIL INKEY$ <> ""
        END IF

        CASE "ZARGON"
          GET (1, 1)-(57, 50), ZARGON
        IF stealgraphics = 1 THEN
          DO: LOOP UNTIL INKEY$ <> ""
        END IF

        CASE "necro"
          GET (1, 1)-(32, 34), necro
        IF stealgraphics = 1 THEN
          DO: LOOP UNTIL INKEY$ <> ""
        END IF

        CASE "snake"
         GET (1, 1)-(42, 54), snake
        IF stealgraphics = 1 THEN
          DO: LOOP UNTIL INKEY$ <> ""
        END IF

        CASE "kraken"
         GET (1, 1)-(54, 54), kraken
        IF stealgraphics = 1 THEN
          DO: LOOP UNTIL INKEY$ <> ""
        END IF
END SELECT

'LOCATE 7: INPUT di$
LOOP UNTIL EOF(1)
CLOSE #1

hutsread cast(), huts()



'grass
CLS
displayTile "grass", x, y
GET (0, 0)-(29, 29), grass
PUT (29, 0), grass, PSET
PUT (29, 29), grass, PSET
PUT (0, 29), grass, PSET
'CALL searcher
GET (0, 0)-(30, 30), grass
IF stealgraphics = 1 THEN
  DO: LOOP UNTIL INKEY$ <> ""
END IF
CLS

displayTile "sand", x, y
GET (0, 0)-(29, 29), sand
PUT (29, 0), sand, PSET
PUT (29, 29), sand, PSET
PUT (0, 29), sand, PSET
'CALL searcher
GET (0, 0)-(30, 30), sand
IF stealgraphics = 1 THEN
  DO: LOOP UNTIL INKEY$ <> ""
END IF

'florwd
CLS
LINE (0, 0)-(640, 350), 6, BF
LINE (0, 0)-(31, 31), 6, BF
LINE (17, 17)-(23, 23), 4, BF
PSET (18, 17), 14: DRAW "u4"
GET (0, 0)-(30, 30), florwd
IF stealgraphics = 1 THEN
  DO: LOOP UNTIL INKEY$ <> ""
END IF


'circle
CLS
LINE (0, 0)-(33, 33), 6, BF
CIRCLE (15, 15), 10, 4
GET (0, 0)-(30, 30), cir
IF stealgraphics = 1 THEN
  DO: LOOP UNTIL INKEY$ <> ""
END IF

'square
CLS
LINE (0, 0)-(31, 31), 6, BF
LINE (10, 10)-(20, 20), 1, B
'gravestone
CLS
displayTile "gravestone", x, y
GET (0, 0)-(30, 30), grav
IF stealgraphics = 1 THEN
  DO: LOOP UNTIL INKEY$ <> ""
END IF

dudes:
CLS
LINE (0, 0)-(50, 50), 10, BF
displayTile "dude-sidel", x, y
GET (0, 0)-(30, 30), sider
'GET (6, 4)-(21, 26), sider
'CALL searcher
IF stealgraphics = 1 THEN
  DO: LOOP UNTIL INKEY$ <> ""
END IF

CLS
LINE (0, 0)-(50, 50), 10, BF
displayTile "dude-front1", x, y
GET (0, 0)-(30, 30), front1
GET (0, 0)-(30, 30), dude1
IF stealgraphics = 1 THEN
  DO: LOOP UNTIL INKEY$ <> ""
END IF

CLS
LINE (0, 0)-(50, 50), 10, BF
displayTile "dude-front2", x, y
GET (0, 0)-(30, 30), front2
GET (0, 0)-(30, 30), dude2
IF stealgraphics = 1 THEN
  DO: LOOP UNTIL INKEY$ <> ""
END IF

CLS
LINE (0, 0)-(50, 50), 10, BF
displayTile "dude-back2", x, y
GET (0, 0)-(30, 30), back2
IF stealgraphics = 1 THEN
  DO: LOOP UNTIL INKEY$ <> ""
END IF

CLS
LINE (0, 0)-(50, 50), 10, BF
displayTile "dude-back1", x, y
GET (0, 0)-(30, 30), back1
IF stealgraphics = 1 THEN
  DO: LOOP UNTIL INKEY$ <> ""
END IF

END SUB

SUB instructions

CLS
PRINT "HI welcome to the world of GEF!"
PRINT "All you can remember is that you were sailing on a ship and a great sea serpent came and caused your ship to crash"
PRINT "This is where you woke up, in the land of GEF. Your thoughts drift back to home, and that has become your goal, to get home"
PRINT "The land of GEF offers such a way to escape, and you must discover it by adventuring and seeking the various inhabitants of the land"
PRINT "good luck"
PRINT ""
PRINT "you control joe using the arrow keys"
PRINT "To look at your inventory, just press capital I"
PRINT "The only one you will want to look at is the ship plans which is number 3"
PRINT "if i have missed any instructions, email me at marabitz@loa.com and i'll answer you questions"

PRINT

path$ = "c:\zargon\"


INPUT "do you want library mode?(y/n)"; yo$
 IF yo$ = "y" THEN ll = 1 ELSE ll = 0

PRINT

LOCATE 23: PRINT "hit any key to continue"
 DO: LOOP UNTIL INKEY$ <> ""
 CLS

END SUB

SUB Lightning

Gain = INT(RND * 15) + 1 * lev  'bigger the lev, bigger the spels


       'from 50
vrange = 100
xstart = 370
xEND = 320
ybegin = 100
numbolts = 15


FOR bolt = 1 TO numbolts
y = ybegin
FOR x = xstart TO xEND + INT(RND * 7) - 3 STEP -1     'can only go left
y = y + INT(RND * 3) - 1
IF y < ybegin - vrange / 2 THEN y = ybegin - vrange / 2
IF y > ybegin + vrange / 2 THEN y = ybegin + vrange / 2
LINE (x + 20, ybegin - vrange / 2 - 3)-(x + 20, ybegin + vrange / 2 + 3), 0
LINE (x, y - 2)-(x, y + 2), 8
LINE (x, y - 1)-(x, y + 1), 7
LINE (x, y)-(x, y), 15
NEXT x

refresh
'LINE (xend, y - 14)-(xend + 25, y + 14), 0, BF

FOR zap = 1 TO 40
xzap = INT(RND * 30) + xEND - 15
yzap = INT(RND * 30) + y - 15
LINE (xEND, y)-(xzap, yzap), 15
s = INT(RND * (1000 - zap * 20)) + 38
IF ll <> 1 THEN SOUND s, .05
NEXT zap
refresh
'LINE (xend - 15, y - 15)-(xend + 15, y + 15), 0, BF
NEXT bolt


Power = 25
cMP = cMP - 12
mDP = mDP - (Power + Gain)
damage = (Power + Gain)
IF mDP < 0 THEN mDP = 0
charstatz

LINE (410, 195)-(550, 349), 0, BF

charstatz
'monstastaz

END SUB

SUB Magix
CONST joex = 400
CONST joey = 100

'PCOPY 0, 1
'SCREEN 9, 0, 1, 1


RANDOMIZE TIMER

LINE (410, 195)-(550, 349), 7, B
LINE (410, 210)-(550, 210), 7

again:
IF cheat$ = "yes" THEN splev = 6
FOR x = 1 TO splev
LOCATE 15, 57: PRINT "Magicks"

IF cheat$ = "yes" THEN cMP = 100

charstatz
IF x = 1 THEN LOCATE 17, 56: PRINT "1.) Flame "
IF x = 2 THEN LOCATE 18, 56: PRINT "2.) Cure "
IF x = 3 THEN LOCATE 19, 56: PRINT "3.) Water"
IF x = 4 THEN LOCATE 20, 56: PRINT "4.) Lightning"
IF x = 5 THEN LOCATE 21, 56: PRINT "5.) BubbleBlast"
NEXT x
LOCATE 22, 56: PRINT "6.) Forget it"
LOCATE 23, 56: INPUT spell
IF spell = 6 THEN LINE (410, 195)-(550, 349), 0, BF: EXIT SUB
IF spell > splev THEN GOTO again



SELECT CASE spell
CASE 1:
 IF cMP < 3 THEN GOTO again
 CALL flamesp
CASE 2
 IF cMP < 4 THEN GOTO again
 FOR snd = 100 TO 240 STEP 1: SOUND snd, .1: NEXT
 GainH = INT(RND * 4) + 1 * lev  'bigger the lev, bigger the spels
 cMP = cMP - 4: IF cDP + (6 + GainH) < BcDP THEN cDP = cDP + (6 + GainH) ELSE cDP = BcDP
 CALL charstatz
 LINE (410, 195)-(550, 349), 0, BF
 GOTO notadamagespell:
CASE 3
 IF cMP < 8 THEN GOTO again
 watersp
CASE 4
  IF cMP < 12 THEN GOTO again
  Lightning
CASE 5
  IF cMP < 25 THEN GOTO again
  bubble
CASE ELSE: EXIT SUB

END SELECT



LOCATE 16, 24: PRINT "Spell deals:"
LOCATE 17, 24: PRINT "  "; damage
LOCATE 18, 24: PRINT " Damage!"
damage = 0
delay (1)
LINE (176, 191)-(289, 289), 0, BF
 IF mDP <= 0 THEN WinBattle
notadamagespell:
LINE (410, 195)-(550, 349), 0, BF
LOCATE 18, 14: PRINT mAP; mDP:

'hitem back
IF M$ = "ZARGON" THEN CALL dhitback: EXIT SUB
Hitback


'took out refresh
END SUB

SUB monstastaz
'prints out monsterstats
LOCATE 17, 14: PRINT "mAP/mDP"
LOCATE 18, 14: PRINT mAP; ""; mDP
END SUB

SUB oldgame
SHARED gotright
delay (3)
refresh
'CALL drawhut

LOCATE 18, 6: PRINT "this is 1:-->"; : COLOR 1: PRINT CHR$(219): COLOR 7
delay (1)
LOCATE 19, 6: PRINT "this is 2:-->"; : COLOR 2: PRINT CHR$(219): COLOR 7
delay (1)
LOCATE 20, 6: PRINT "this is 3:-->"; : COLOR 3: PRINT CHR$(219): COLOR 7
delay (1)
LOCATE 21, 6: PRINT "this is 4:-->"; : COLOR 4: PRINT CHR$(219): COLOR 7
delay (1)
LOCATE 22, 6: PRINT "this is 5:-->"; : COLOR 5: PRINT CHR$(219): COLOR 7
delay (1)
LOCATE 23, 6: INPUT "if you can get three in a row, you win. got it?"; yo$
refresh
oldshow = 5
DO
beginning:
LOCATE 9, 15: PRINT "                          "
show = INT(RND * 5) + 1
LOCATE 18, 6: PRINT "1"; : showit (1)
LOCATE 19, 6: PRINT "2"; : showit (2)
LOCATE 20, 6: PRINT "3"; : showit (3)
LOCATE 21, 6: PRINT "4"; : showit (4)
LOCATE 22, 6: PRINT "5"; : showit (5)
LOCATE 10, 15: PRINT "what's this: ";
CALL showit(show)
LOCATE 23, 6: INPUT "your answer(9 to quit)"; guess
IF guess = 9 THEN refresh: EXIT SUB
IF oldshow = guess THEN
 LOCATE 9, 15
 PRINT "You got it right!"
 delay (.5)
 gotright = gotright + 1
 EXIT DO
 ELSE
 LOCATE 9, 15
 gotright = 0
 PRINT "no that was  ";
 CALL showit(oldshow)
END IF
oldshow = guess
delay (1)
refresh
LOOP

IF gotright = 3 THEN CALL ending ELSE GOTO beginning

END SUB

SUB opengam (aaa)

IF aaa <> 0 THEN
'PRINT "note: if the program errored enter your name as -- greg -- "
INPUT "what is your name so i can open your saved game"; gam$
gam$ = path$ + gam$ + ".sav"
ELSE
gam$ = path$ + "greg.sav"
END IF

OPEN gam$ FOR INPUT AS #2
'map status
INPUT #2, BcAP
INPUT #2, cAP
INPUT #2, BcDP
INPUT #2, cDP
INPUT #2, BcMP
INPUT #2, cMP
INPUT #2, nextlev
INPUT #2, lev
INPUT #2, wstatus
INPUT #2, checky
INPUT #2, splev
'checky = lev

INPUT #2, ex

INPUT #2, cx
INPUT #2, cy
INPUT #2, mapx
INPUT #2, mapy
INPUT #2, gold
INPUT #2, ship
INPUT #2, inship
INPUT #2, storystatus

'could fix the items
INPUT #2, a$

FOR u = 1 TO 8
INPUT #2, items(u)
NEXT u

INPUT #2, astatus


CLOSE #2

SELECT CASE a$
CASE "m": cy = cy - 1
CASE "i": cy = cy + 1
CASE "j": cx = cx + 1
CASE "l": cx = cx - 1
END SELECT

CALL crossroad
CALL where


END SUB

SUB pall

PALETTE 0, 0: PALETTE 1, 4: PALETTE 2, 48: PALETTE 3, 2
PALETTE 4, 6: PALETTE 5, 54: PALETTE 6, 10: PALETTE 7, 38
PALETTE 8, 46: PALETTE 9, 5: PALETTE 10, 25: PALETTE 11, 7
PALETTE 12, 57: PALETTE 13, 63: PALETTE 14, 9: PALETTE 15, 59

END SUB

SUB readjunk (joe(), bat(), slime(), ghost(), joeattax(), flame(), beleth(), babble(), spook())
FOR y = 1 TO 30
  FOR x = 1 TO 18
    READ bitpixel$
    IF bitpixel$ = "x" THEN
    PSET (x, y), 0
    ELSE
    PSET (x, y), VAL(bitpixel$)
    END IF
  NEXT
NEXT
GET (1, 1)-(18, 30), joe
IF stealgraphics = 1 THEN
  DO: LOOP UNTIL INKEY$ <> ""
END IF
CLS

FOR y = 1 TO 15
  FOR x = 1 TO 17
    READ bitpixel$
    IF bitpixel$ = "x" THEN
    PSET (x, y), 0
    ELSE
    PSET (x, y), VAL(bitpixel$)
    END IF
  NEXT
NEXT
GET (1, 1)-(17, 15), bat
IF stealgraphics = 1 THEN
  DO: LOOP UNTIL INKEY$ <> ""
END IF
CLS

'slime
FOR y = 1 TO 15
  FOR x = 1 TO 17
    READ bitpixel$
    IF bitpixel$ = "x" THEN
    PSET (x, y), 0
    ELSE
    PSET (x, y), VAL(bitpixel$)
    END IF
  NEXT
NEXT
GET (1, 1)-(17, 15), slime
IF stealgraphics = 1 THEN
  DO: LOOP UNTIL INKEY$ <> ""
END IF
CLS

'ghost
FOR y = 1 TO 26
FOR x = 1 TO 27
READ bitpixel$
IF bitpixel$ = "x" THEN
PSET (x, y), 0
ELSE
PSET (x, y), VAL(bitpixel$)
END IF
NEXT: NEXT
GET (1, 1)-(27, 26), ghost
IF stealgraphics = 1 THEN
  DO: LOOP UNTIL INKEY$ <> ""
END IF
CLS

'joe attax
FOR y = 1 TO 30
FOR x = 1 TO 21
  READ bitpixel$
  IF bitpixel$ = "x" THEN
  PSET (x, y), 0
  ELSE
  PSET (x, y), VAL(bitpixel$)
  END IF
NEXT: NEXT
GET (1, 1)-(21, 30), joeattax
IF stealgraphics = 1 THEN
  DO: LOOP UNTIL INKEY$ <> ""
END IF
CLS

'fire
FOR y = 1 TO 4
  FOR x = 1 TO 80
    READ bitpixel$
    IF bitpixel$ = "x" THEN
    PSET (x, y), 0
    ELSE
    PSET (x, y), VAL(bitpixel$)
    END IF
  NEXT
NEXT
GET (1, 1)-(80, 4), flame
IF stealgraphics = 1 THEN
  DO: LOOP UNTIL INKEY$ <> ""
END IF
CLS

'beleth
FOR y = 1 TO 32
FOR x = 1 TO 39
READ bitpixel$
IF bitpixel$ = "x" THEN
PSET (x, y), 0
ELSE
PSET (x, y), VAL(bitpixel$)
END IF
NEXT: NEXT
GET (1, 1)-(39, 32), beleth
'LOCATE 12, 12: INPUT e
IF stealgraphics = 1 THEN
  DO: LOOP UNTIL INKEY$ <> ""
END IF
CLS

'babble
FOR y = 1 TO 10
FOR x = 1 TO 27
READ bitpixel$
IF bitpixel$ = "x" THEN
PSET (x, y), 0
ELSE
PSET (x, y), VAL(bitpixel$)
END IF
NEXT: NEXT
GET (1, 1)-(27, 10), babble
IF stealgraphics = 1 THEN
  DO: LOOP UNTIL INKEY$ <> ""
END IF
CLS

'spook
FOR y = 1 TO 25
FOR x = 1 TO 25
READ bitpixel$
IF bitpixel$ = "x" THEN
PSET (x, y), 0
ELSE
PSET (x, y), VAL(bitpixel$)
END IF
NEXT: NEXT
GET (1, 1)-(25, 25), spook
IF stealgraphics = 1 THEN
  DO: LOOP UNTIL INKEY$ <> ""
END IF

CLS

END SUB

SUB refresh

PCOPY 0, 1
SCREEN 9, 0, 1, 1
IF items(8) = "ship" AND mapx = 2 AND mapy = 4 AND inship = 1 THEN
 PUT (xquad(18), yquad(4)), water, PSET  'erase the ship you're in
END IF


END SUB

SUB rotate (x AS DOUBLE, y AS DOUBLE, ptx AS INTEGER, pty AS INTEGER, angle AS DOUBLE) STATIC

ang = 3.141592 * angle / 180
xnew = x - ptx
ynew = y - pty

x = (xnew * COS(ang) + ynew * SIN(ang)) + ptx
y = (ynew * COS(ang) - xnew * SIN(ang)) + pty

END SUB

SUB savgam (aaa)

IF aaa <> 0 THEN
INPUT "what is your name so i can save it"; gam$
gam$ = path$ + gam$ + ".sav"
ELSE
gam$ = path$ + "greg.sav"
END IF

OPEN gam$ FOR OUTPUT AS #2
'map status
WRITE #2, BcAP
WRITE #2, cAP
WRITE #2, BcDP
WRITE #2, cDP
WRITE #2, BcMP
WRITE #2, cMP
WRITE #2, nextlev
WRITE #2, lev
WRITE #2, wstatus
WRITE #2, checky
WRITE #2, splev
'checky = lev

WRITE #2, ex

WRITE #2, cx
WRITE #2, cy
WRITE #2, mapx
WRITE #2, mapy
WRITE #2, gold
WRITE #2, ship
WRITE #2, inship
WRITE #2, storystatus

WRITE #2, a$

'save items
FOR u = 1 TO 8
WRITE #2, items(u)
NEXT u

WRITE #2, astatus

CLOSE #2




END SUB

SUB searcher
cx = 400: cy = 100
DO
  LOCATE 6, 10: PRINT ; "cx:"; cx, "cy:"; cy
  LET a$ = INKEY$
  IF a$ <> "" THEN
    PSET (cx, cy), 0
    SELECT CASE a$
      CASE "i": cy = cy - 1
      CASE "m": cy = cy + 1
      CASE "j": cx = cx - 1
      CASE "l": cx = cx + 1
      CASE "D": EXIT DO
      CASE "2": END
    END SELECT
    PSET (cx, cy), 9
  END IF
LOOP UNTIL a$ = "2"

END SUB

SUB seeitems
DO
thisisasub = storycheck(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
bgn:
CLS
FOR x = 1 TO 10
PRINT x; ")"; items(x)
NEXT x
PRINT
PRINT "view which(0 to escape)"
PRINT
PRINT
'put the spells here
PRINT "spells:"
PRINT
COLOR 4
FOR x = 1 TO splev
SELECT CASE x
  CASE 1
   PRINT "flame"
  CASE 2
   PRINT "cure"
  CASE 3
   PRINT "water"
   PRINT "maximize"
  CASE 4
   PRINT "lightning"
   PRINT "warp"
  CASE 5
   PRINT "bubbleblast"
END SELECT
NEXT x
PRINT
COLOR 15
LOCATE 13: INPUT yo

'this is my cheat
SELECT CASE yo
 CASE 1
  items(1) = "dynomite"
 CASE 1.5
  items(1) = "dynomite(used)"
 CASE 2
  items(2) = "dead wood"
 CASE 2.5
  items(2) = "dead wood(used)"
 CASE 3.1
  items(3) = "boat list"
 CASE 3.5
  items(3) = "boat plans"
 CASE 4
  items(4) = "rutter"
 CASE 5
  items(5) = "cloth"
 CASE 6
  items(6) = "wood"
 CASE 7
  items(7) = "trapped soul"
 CASE 7.5
  items(7) = "trapped soul(used)"
 CASE 8
  items(8) = "ship"
 CASE 99
  items(1) = "dynomite"
thisisasub = storycheck(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
  items(1) = "dynomite(used)"
thisisasub = storycheck(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
  items(2) = "dead wood"
thisisasub = storycheck(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
  items(2) = "dead wood(used)"
thisisasub = storycheck(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
  items(3) = "boat list"
thisisasub = storycheck(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
  items(3) = "boat plans"
thisisasub = storycheck(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
  items(4) = "rutter"
thisisasub = storycheck(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
  items(5) = "cloth"
thisisasub = storycheck(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
  items(6) = "wood"
thisisasub = storycheck(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
  items(7) = "trapped soul"
thisisasub = storycheck(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
  items(7) = "trapped soul(used)"
thisisasub = storycheck(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
  items(8) = "ship"
thisisasub = storycheck(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)


END SELECT
IF yo = 3 AND items(3) <> "" THEN
  CLS
   PRINT "MATERIALS NEEDED"
    PRINT "1) cloth"
    PRINT "2) more wood"
    PRINT "3) rutter"
  IF items(3) = "boat plans" THEN
   PRINT "HOW TO BUILD THE SHIP"
    FOR h = 1 TO 3
     FOR g = 1 TO 10
     chari = INT(RND * 28) + 128    '128-157
      PRINT CHR$(chari);            ' 158
     NEXT g                         ' 128
     PRINT
    NEXT h
  PRINT "you do not understand(you are not a ship builder)"
  END IF
 INPUT yo$
 GOTO bgn
END IF
LOOP UNTIL yo = 0
refresh
END SUB

SUB SelectMonsta
SCREEN 9
cg$ = ""

'nothighenough:
DO
  mon = INT(RND * 21) + 1

  'call water monsterz
  IF inship = 1 THEN
    M$ = "Kraken": howmuchbigger = 1: mAP = 25: mDP = 60: PUT (300, 100), kraken: bname$ = "Kraken": LOCATE 16, 13.5: PRINT bname$: EXIT SUB
  END IF

  'regular monsters
  SELECT CASE mon
    CASE 1 TO 4: M$ = "Bat": mAP = 2: mDP = 10: PUT (300, 100), bat: bname$ = "Bat": EXIT DO
    CASE 5 TO 7: M$ = "Babble": mAP = 4: mDP = 12: PUT (300, 100), babble: bname$ = "Babble": EXIT DO
    CASE 8 TO 9: M$ = "Spook": mAP = 6: mDP = 14: PUT (300, 100), spook: bname$ = "Spook": EXIT DO
    CASE 13 TO 16: M$ = "Slime": mAP = 1: mDP = 5: PUT (300, 100), slime: bname$ = "Slime": EXIT DO
                        ' slime
    'Beleth
    CASE 10 TO 12:
      IF lev = 2 OR lev > 2 THEN
        M$ = "Beleth": mAP = 8: mDP = 16: PUT (300, 100), beleth: bname$ = "Beleth"
        EXIT DO
      'ELSE GOTO nothighenough:
      END IF

    CASE 17 TO 19:
    IF lev = 5 OR lev > 5 THEN
      M$ = "SkanderSnake": mAP = 12: mDP = 20: PUT (300, 100), snake: bname$ = "SkanderSnake"
      EXIT DO
    'ELSE GOTO nothighenough
    END IF

    CASE 20 TO 21:
      IF lev = 6 OR lev > 6 THEN
        M$ = "Necro": mAP = 13: mDP = 30: PUT (300, 100), necro: bname$ = "Necro"
        EXIT DO
      'ELSE GOTO nothighenough
      END IF
  END SELECT
LOOP

howmuchbigger = 1
FOR x = 1 TO lev - 1
 whatlev = INT(RND * 2) + 1
   IF whatlev = 2 THEN cg$ = cg$ + "great ": howmuchbigger = howmuchbigger + 1
NEXT x

mAP = mAP * howmuchbigger
mDP = mDP * howmuchbigger

IF mapx = 4 AND mapy = 2 AND storystatus = 4 AND cx = 3 AND cy = 2 THEN
LINE (300, 100)-(350, 150), 0, BF
M$ = "Necro": mAP = 45: mDP = 30: PUT (300, 100), necro: bname$ = "Necro"
howmuchbigger = 1: cg$ = ""
END IF
'M$ = "King Beleth": mAP = 25: mDP = 50: PUT (300, 100), kbaleth: bname$ = "King Baleth"

LOCATE 16, 13.5: PRINT cg$ + bname$


END SUB

SUB showit (show)
SELECT CASE show
 CASE 1:
    COLOR 1: PRINT CHR$(219): COLOR 7
 CASE 2:
    COLOR 2: PRINT CHR$(219): COLOR 7
 CASE 3:
    COLOR 3: PRINT CHR$(219): COLOR 7
 CASE 4:
    COLOR 4: PRINT CHR$(219): COLOR 7
 CASE 5:
    COLOR 5: PRINT CHR$(219): COLOR 7
END SELECT

END SUB

SUB ShowMeDaGraphix

CLS
SCREEN 9

'Read graphics from other module.
readjunk joe(), bat(), slime(), ghost(), joeattax(), flame(), beleth(), babble(), spook()

END SUB

FUNCTION storycheck (x1, x2, x3, x4, x5, x6, x7, x8, x9, x10)

'basically, check to see how many items you have.. actually
'specific items
IF x1 = 1 AND items(1) = "dynomite" THEN ret = ret + 1
IF x2 = 1 AND items(2) = "dead wood" THEN ret = ret + 1
IF x3 = 1 AND items(3) = "boat plans" THEN ret = ret + 1
IF x4 = 1 AND items(4) = "rutter" THEN ret = ret + 1
IF x5 = 1 AND items(5) = "cloth" THEN ret = ret + 1
IF x6 = 1 AND items(6) = "wood" THEN ret = ret + 1
IF x7 = 1 AND items(7) = "dynomite" THEN ret = ret + 1
IF x8 = 1 AND items(8) = "dynomite" THEN ret = ret + 1
IF x9 = 1 AND items(9) = "dynomite" THEN ret = ret + 1
IF x10 = 1 AND items(10) = "dynomite" THEN ret = ret + 1

'depending on what items you got, that determines your storystatus

IF items(1) = "dynomite" THEN storystatus = 1.5
IF items(1) = "dynomite(used)" AND storystatus = 1.5 THEN storystatus = 2
IF items(2) = "dead wood" AND storystatus = 2 THEN storystatus = 2.5
IF items(2) = "dead wood(used)" AND storystatus = 2.5 THEN storystatus = 3
IF items(3) = "boat list" AND storystatus = 3 THEN storystatus = 3.2
IF items(4) <> "" AND items(5) <> "" AND items(6) <> "" AND storystatus = 3.2 THEN storystatus = 3.8
IF items(3) = "boat plans" AND storystatus = 3.8 THEN storystatus = 4
IF items(7) = "trapped soul" AND storystatus = 4 THEN storystatus = 4.3
IF items(7) = "trapped soul(used)" AND storystatus = 4.3 THEN storystatus = 5
IF items(8) = "ship" AND storystatus = 5 THEN storystatus = 5.5


'storystatus
'1) beginning
'1.5) dynomite
'2.5) you have dead wood
'3.2) have the boat plans   '3-4 looking for the ship stuff
'3.8) have all three items rutter,cloth,wood
'4) have the boat plans 'going to the death guy,and to sand man to find info
'4.3)have the soul
'5)resurected the guy 'build a ship and travel on it to the island basically the laststory line
'5.5) have the ship
storycheck = ret
END FUNCTION

SUB title (gef$)
CLS
SCREEN 9, 0, 0, 0
LINE (0, 0)-(640, 350), 7, BF
SCREEN 9, 0, 1, 0
LINE (0, 0)-(640, 350), 0, BF

t = TIMER + 2  'every two seconds something happens

gef$ = gef$
DO                             '0 white  '1 black
SCREEN 9, 0, 0, 0  'white
SCREEN 9, 0, 1, 1  'black
x = INT(RND * 640)
FOR y = 0 TO 350
x = x + INT(RND * 5) - 2
SCREEN 9, 0, 0, 0
SCREEN 9, 0, 1, 1
LINE (x, y)-(x + 1, y), 14
NEXT y
FOR s = 1500 TO 200 STEP -3
SCREEN 9, 0, 0, 0
SCREEN 9, 0, 1, 1
IF ll <> 1 THEN SOUND INT(RND * s) + 38, .04
NEXT s
CLS 'clears screen 1
delay (.1)
IF TIMER < t THEN
happyness = happyness + 1
SELECT CASE happyness
 CASE 1
   dastr$ = "THE"
   LOCATE 10, 5: PRINT "THE"
 CASE 2
   LOCATE 10, 5: PRINT "THE EVIL"
 CASE 3
   LOCATE 10, 5: PRINT "THE EVIL WRATH"
 CASE 4
   LOCATE 10, 5: PRINT "THE EVIL WRATH OF ZARGON!!!"
 CASE ELSE
LOCATE 14, 5: PRINT "THE EVIL WRATH OF ZARGON!!!!"
SCREEN 9, 0, 0, 1
LOCATE 15, 1
  PRINT "by Greg Milette"
  PRINT "Geoff Graves"
  PRINT "additional programming by"
  PRINT "Aaron Sokoloski"
  PRINT "Jeff Gariepy"
  PRINT "Joel Dau   ";
  PRINT "Jay Rodriguez"
  PRINT "Jacob Voelz   ";
  PRINT "hit any key to continue"

IF ll = 1 THEN GOTO skipeeee
'jeff's music goes here:
PLAY " o0 l20 ms ga+>d<g>g<g>d<d"
PLAY " o1 l20 ms cd+gc>c<cgf"
PLAY " o0 l20 ms ga+>d<g>g<g>d<d"
PLAY " o2 l20 ms cc p8 cc"
skipeeee:
'thecoolmusichere$ = "o1 l16 cbdfega>cbdefga <ccccc"  '>cbdefga"
'PLAY thecoolmusichere$
'x = 25
END SELECT
IF happyness < 5 AND ll <> 1 THEN PLAY "mb l64 o1cbcbcbcbcfcfcfcfcb"
'IF happyness > 5 THEN LOCATE 23: PRINT "hit enter to continue"
t = TIMER + 2
END IF
LOOP UNTIL INKEY$ <> ""

'LOCATE 21: PRINT "it is getting there, it is not completely"
'PRINT "balanced yet, but it will be good luck"
'LOCATE 23: INPUT "hit enter to continue"; yo$
'END
Lightning:


END SUB

SUB usnappa

CLS
gef$ = "ZARGON"
PRINT "ZARGON"
PRINT "by snappahed software 98"
PRINT
CALL hi(gef$, 1)

COLOR 7
LOCATE 1: PRINT gef$
PRINT
PRINT
PRINT
IF ll <> 1 THEN PLAY "o3g8"
PRINT "You";
IF ll <> 1 THEN PLAY "a8"
PRINT " Sna";
IF ll <> 1 THEN PLAY "b8":
PRINT "ppa";
IF ll <> 1 THEN PLAY "o4c8":
PRINT "hed";
PRINT
LOCATE 23: INPUT "hit enter to continue"; yo$
IF yo$ = "-99" THEN cheat$ = "yes"
END SUB

SUB watersp

SCREEN 9

Gain = INT(RND * 15) + 1 * lev  'bigger the lev, bigger the spels
FOR i = 1 TO 30
  y = 105
  r = INT(RND * 3)
  SELECT CASE r
  CASE 0
  C = 1
  CASE 1
  C = 11
  CASE 2
  C = 9
  END SELECT
  IF ll <> 1 THEN SOUND INT(RND * 200) + 200, .2
  FOR x = 400 TO 300 STEP -1
    y = y + (INT(RND * 3) - 1) / 1.5
    PSET (x, y), C
  NEXT x
NEXT i

Power = 25
cMP = cMP - 8
mDP = mDP - (Power + Gain)
damage = (Power + Gain)
IF mDP < 0 THEN mDP = 0
LINE (410, 195)-(550, 349), 0, BF
charstatz


END SUB

SUB wepshop (a$)
DIM cost(8)
CLS
RANDOMIZE TIMER
PRINT "You have just entered the weapons shop of Gothox Slothair."
PRINT
PRINT "You see a large, dirt covered blacksmith behind the counter, whom you assume is Gothox."
   M = INT(RND * 100) + 1
   IF M < 25 THEN
   f = .88
   MOOD$ = "good"
   END IF
   IF M > 25 AND M < 75 THEN
   f = 1
   MOOD$ = "normal"
   END IF
   IF M > 75 THEN
   MOOD$ = "angry"
   f = 1.22
   END IF
PRINT
ttop:
PRINT "Gothox appears to be in a(n) "; MOOD$; " mood"
PRINT
PRINT "you have "; gold; "gold"
PRINT "1. Buy a Weapon"
PRINT "2. Buy Armor"
'PRINT "3. Sell Weapon"
'PRINT "4. Sell Armor"
PRINT "0. Leave the store"
PRINT
PRINT "Please enter your selection"
INPUT cc
SELECT CASE cc
   CASE 1
   PRINT "I have the following items for sale"
   PRINT
   cost(1) = (20): PRINT "1. dagger "; cost(1)
   cost(2) = (30): PRINT "2. short sword "; cost(2)
   cost(3) = (65): PRINT "3. long sword "; cost(3)
   cost(4) = 88: PRINT "4. sword of thorns "; cost(4)
   cost(5) = 103: PRINT "5. broad sword "; cost(5)
   cost(6) = 250: PRINT "6. twohanded sword "; cost(6)
   cost(7) = 500: PRINT "7. Atlantean Sword "; cost(7)
   cost(8) = 834: PRINT "8. Germanic WarCleaver "; cost(8)
    INPUT wha
    cost(wha) = INT(cost(wha) * f)
   IF gold < cost(wha) THEN
      PRINT "you can't afford it": GOTO ttop
    ELSE
      gold = gold - cost(wha)
      wstatus = wha
    END IF
   CASE 2    'armor
   cost(1) = 20: PRINT "1. cloth "; cost(1)
   cost(2) = 40: PRINT "2. leather "; cost(2)
   cost(3) = 88: PRINT "3. plated leather "; cost(3)
   cost(4) = 98: PRINT "4. spiked leather "; cost(4)
   cost(5) = 134: PRINT "5. chain mail "; cost(5)
   cost(6) = 279: PRINT "6. platemail "; cost(6)
   cost(7) = 578: PRINT "7. Splint mail "; cost(7)
   cost(8) = 1004: PRINT "8. Rite of tough skin "; cost(8)
    INPUT wha
    cost(wha) = INT(cost(wha) * f)
   IF gold < cost(wha) THEN
      PRINT "you can't afford it": GOTO ttop
    ELSE
      gold = gold - cost(wha)
      astatus = wha
    END IF
CASE ELSE:
END SELECT


SELECT CASE a$
CASE "m": cy = cy - 1
CASE "i": cy = cy + 1
CASE "j": cx = cx + 1
CASE "l": cx = cx - 1
END SELECT
CALL crossroad
CALL where

END SUB

SUB where
SHARED nodraw
nodraw = 0

thisisasub = storycheck(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
DO



  DO
    a$ = INKEY$
  LOOP UNTIL a$ <> ""

  thisisasub = storycheck(0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
  battlechance = INT(RND * 20) + 1
  IF battlechance = 2 THEN CALL battleset
  IF a$ = "P" THEN cx = 1: cy = 1
  IF a$ = "G" THEN CALL savgam(99)
  IF a$ = "L" THEN CALL opengam(99)
  IF a$ = "B" THEN CALL battleset
  IF a$ = "C" THEN CALL dbattleset
  IF a$ = "E" THEN CALL ending
  chirp = INT(RND * 25) + 1
  IF chirp = 2 THEN
    FOR l = 1 TO 2
      FOR tm = 1 TO 700: NEXT tm
      FOR p = 1 TO 9
       FOR i = 2000 TO 1800 STEP -15
        'SOUND i, .05
       NEXT i
      NEXT p
    NEXT l
  END IF

  IF a$ = "F" THEN INPUT "new xp"; ex: CheckLevel
  IF a$ = "D" THEN LINE (0, 0)-(650, 350), 6, BF
  IF a$ = "D" THEN
    CLS :
    FOR y = 1 TO 10
      FOR x = 1 TO 20
       PRINT donttouch(x, y);
      NEXT x
      PRINT
    NEXT y
    INPUT yo$: refresh
  END IF
  IF a$ = "Z" THEN storystatus = 4.3
  IF a$ = "z" THEN storystatus = 2.5
  IF a$ = CHR$(0) + CHR$(80) THEN a$ = "m"
  IF a$ = CHR$(0) + CHR$(72) THEN a$ = "i"
  IF a$ = CHR$(0) + CHR$(75) THEN a$ = "j"
  IF a$ = CHR$(0) + CHR$(77) THEN a$ = "l"
  'cy=0 ? shit cuz it is in     x's  'none none subj1 add 'y's  'subj1 add1 none none
  IF a$ = "i" AND (donttouch(cx, cy) = 0 OR (POINT(x + 15, y - 15) = -1 AND cy = 0)) THEN LET cy = cy - 1 ELSE stoppi = 1
  IF a$ = "m" AND (donttouch(cx, cy + 2) = 0 OR (POINT(x + 15, y + 45) = 7 AND cy = 9)) THEN LET cy = cy + 1 ELSE stoppm = 1
  IF a$ = "j" AND (donttouch(cx - 1, cy + 1) = 0 OR (POINT(x - 15, y + 15) = -1 AND cx = 1)) THEN LET cx = cx - 1 ELSE stoppj = 1
  IF a$ = "l" AND (donttouch(cx + 1, cy + 1) = 0 OR (POINT(x + 45, y + 15) = 0 AND cx = 20)) THEN
   LET cx = cx + 1
    ELSE stoppl = 1
  END IF

  IF cy < 0 THEN
   mapy = mapy - 1
   cy = 9
   nodraw = 1
   IF mapy = 0 THEN mapy = 1: cy = 0
   crossroad
   'draw new map
  END IF                 'number of bottom
  IF cy > 9 THEN
   mapy = mapy + 1
   cy = 0
   IF mapy = 5 THEN mapy = 4: cy = 9
   nodraw = 1
   crossroad
   'draw new map
  END IF
  IF cx < 1 THEN  '0 to 1
   mapx = mapx - 1
   cx = 20
   IF mapx = 0 THEN mapx = 1: cx = 1
   nodraw = 1
   crossroad
   'draw new map
  END IF
  IF cx > 20 THEN
   mapx = mapx + 1
   cx = 1
   IF mapx = 5 THEN mapx = 4: cx = 20
   nodraw = 1
   crossroad
   'draw new map
  END IF
  'if you enter the castle  two entrances in the front
  IF mapx = 3 AND mapy = 2 THEN
   IF cx = 15 AND cy = 6 THEN CALL castle
   IF cx = 16 AND cy = 6 THEN CALL castle
  END IF


  IF (cx = hutspotx AND cy = hutspoty) THEN CALL hut(a$)
  IF (cx = wepshopx AND cy = wepshopy) THEN CALL wepshop(a$)
  IF (cx = healx AND cy = healy) THEN CALL healr(a$)
  IF items(8) = "ship" AND cx = 18 AND cy = 4 THEN inship = 1
  IF inship = 1 AND cx = 18 AND cy = 5 AND mapx = 2 AND mapy = 4 THEN inship = 0
  IF a$ = "s" AND cx = s.spotx AND cy = s.spoty THEN CALL found
  IF a$ = "I" THEN CALL seeitems
  IF a$ = "c" THEN CALL castspell
  'IF a$ = "S" THEN CALL searcher
  IF a$ = "2" THEN INPUT fuck$: IF fuck$ = "y" THEN END
  LET x = xquad(cx)
  LET y = yquad(cy)

  'fixing the movement prob.. ie the mod thing
  IF nodraw = 1 THEN GOTO skipit
  'make it move
  'ship is drawn in refresh

  SELECT CASE a$
   CASE "i"
     IF stoppi = 1 THEN GOTO skipit
     cend = y + 30
     FOR ct = cend TO y STEP -1
    IF (ct > (cend - 10) OR ct <= (cend - 20)) AND inship = 0 THEN PUT (x, ct), back1, PSET ELSE : IF inship = 0 THEN PUT (x, ct), back2, PSET
    IF inship = 1 THEN PUT (x, ct), fboat, PSET
    IF ll <> 1 THEN SOUND 0, .1
    'involve ground
  IF ct MOD 3 = 0 THEN CALL fixground(a$)
    NEXT ct
   CASE "m"
     IF stoppm = 1 THEN GOTO skipit
     cend = y - 30
     FOR ct = cend TO y STEP 1
    IF (ct < (cend + 10) OR ct >= (cend + 20)) AND inship = 0 THEN PUT (x, ct), front1, PSET ELSE : IF inship = 0 THEN PUT (x, ct), front2, PSET
     IF inship = 1 THEN PUT (x, ct), fboat, PSET
    IF ll <> 1 THEN SOUND 0, .1
  IF ct MOD 3 = 0 THEN CALL fixground(a$)
     NEXT ct
    y = yquad(cy - 1)
   CASE "j"
    IF stoppj = 1 THEN GOTO skipit
    cstart = x + 30
     FOR ct = cstart TO x STEP -1    'x+15 to x
   IF (ct > (cstart - 10) OR ct <= (cstart - 20)) AND inship = 0 THEN PUT (ct, y), sidel, PSET ELSE : IF inship = 0 THEN PUT (ct, y), sidel, PSET
     IF inship = 1 THEN PUT (ct, y), fboat, PSET
    IF ct MOD 3 = 0 THEN CALL fixground(a$)
     IF ll <> 1 THEN SOUND 0, .1
     NEXT ct
    x = xquad(cx + 1)
   CASE "l"
   IF stoppl = 1 THEN GOTO skipit
    cstart = x - 30
     FOR ct = cstart TO x STEP 1  '+15 ?
    IF (ct < (cstart + 10) OR ct >= (cstart + 20)) AND inship = 0 THEN PUT (ct, y), sider, PSET ELSE : IF inship = 0 THEN PUT (ct, y), sider, PSET
     IF inship = 1 THEN PUT (ct, y), fboat, PSET
   IF ct MOD 3 = 0 THEN CALL fixground(a$)
     IF ll <> 1 THEN SOUND 0, .1
     NEXT ct
    x = xquad(cx - 1)
  END SELECT
skipit:
  nodraw = 0                                   'need 2 more side images
  stoppm = 0
  stoppi = 0
  stoppj = 0
  stoppl = 0
  LET x = xquad(cx)
  LET y = yquad(cy)

  IF inship = 1 THEN
    PUT (x, y), fboat, PSET  'boat
     GET (x, y)-(x + 30, y + 30), dude1
     GET (x, y)-(x + 30, y + 30), dude2
     GOTO iminaship
  END IF
  SELECT CASE a$
   CASE "m"
     PUT (x, y), front1, PSET
     GET (x, y)-(x + 30, y + 30), dude1
     PUT (x, y), front2, PSET
     GET (x, y)-(x + 30, y + 30), dude2
   CASE "i"
     PUT (x, y), back1, PSET
     GET (x, y)-(x + 30, y + 30), dude1
     PUT (x, y), back2, PSET
     GET (x, y)-(x + 30, y + 30), dude2
   CASE "j"
     PUT (x, y), sidel, PSET
     GET (x, y)-(x + 30, y + 30), dude1
     PUT (x, y), sidel, PSET
     GET (x, y)-(x + 30, y + 30), dude2
   CASE "l"
     PUT (x, y), sider, PSET
     GET (x, y)-(x + 30, y + 30), dude1
     PUT (x, y), sider, PSET
     GET (x, y)-(x + 30, y + 30), dude2
  END SELECT
iminaship:

  'take this out
  'refresh
  IF quad2 = 0 THEN PUT (x, y), dude1, PSET:
  IF quad2 = 1 THEN PUT (x, y), dude2, PSET: 'PUT (x, y), cir, PSET
  'walk in place?  'opposite
  'nothing
  quad = quad + 1
  IF quad > 150 THEN
  quad = 0
  IF quad2 = 1 THEN PUT (x, y), dude1, PSET: cg = 1
  IF quad2 = 0 THEN PUT (x, y), dude2, PSET: cg = 2
  IF cg = 1 THEN quad2 = 0
  IF cg = 2 THEN quad2 = 1
  END IF
LOOP ''''loop forever

END SUB

SUB WinBattle
PALETTE 0, 0: PALETTE 1, 4: PALETTE 2, 48: PALETTE 3, 2
PALETTE 4, 6: PALETTE 5, 54: PALETTE 6, 10: PALETTE 7, 38
PALETTE 8, 46: PALETTE 9, 5: PALETTE 10, 25: PALETTE 11, 7
PALETTE 12, 57: PALETTE 13, 63: PALETTE 14, 9: PALETTE 15, 59

LOCATE 15, 24: PRINT "You Win!"

gsLOSS = INT(RND * 2) + 1
gnLOSS = INT(RND * 6) + 1
gbLOSS = INT(RND * 20) + 1
gvbLOSS = INT(RND * 40) + 1
gLoss = (-1 * howmuchbigger * 3)'laziness and gain some more gold
IF M$ = "Bat" THEN ex = ex + (4 * howmuchbigger): ggold = (5 - gLoss): gxp = 4 * howmuchbigger
IF M$ = "Babble" THEN ex = ex + (6 * howmuchbigger): ggold = (10 - gLoss): gxp = 6 * howmuchbigger
IF M$ = "Spook" THEN ex = ex + (12 * howmuchbigger): ggold = (14 - gLoss): gxp = 12 * howmuchbigger
IF M$ = "Beleth" THEN ex = ex + (18 * howmuchbigger): ggold = (23 - gnLOSS): gxp = 18 * howmuchbigger
IF M$ = "Slime" THEN ex = ex + (2 * howmuchbigger): ggold = (3 - gLoss): gxp = 2 * howmuchbigger
IF M$ = "Necro" THEN ex = ex + (20 * howmuchbigger): ggold = (20 - gLoss): gxp = 20 * howmuchbigger
IF M$ = "SkanderSnake" THEN ex = ex + (25 * howmuchbigger): ggold = (25 - gLoss): gxp = 25 * howmuchbigger
IF M$ = "Kraken" THEN ex = ex + (45): ggold = (30 - gLoss): gxp = 45

LOCATE 16, 24: PRINT "You Gained:"
LOCATE 17, 24: PRINT "    "; gxp'ex
LOCATE 18, 24: PRINT "Experience!"
LOCATE 19, 24: PRINT "And:"
LOCATE 20, 24: PRINT ggold; "gold!"   'cy and cx
IF M$ = "Necro" AND mapx = 4 AND mapy = 2 THEN
LOCATE 21, 24: PRINT "you picked up the soul": items(7) = "trapped soul"
delay (2)
CALL hut(a$)
END IF

gold = gold + ggold

'\delay (.9)                          '30 '60 '150 '280 '380
IF ex > nextlev THEN
addto = (nextlev + (lev * 30))
nextlev = nextlev + addto
lev = lev + 1:
IF (nextlev MOD 2) = 0 THEN splev = splev + 1
CheckLevel
END IF
'IF ll <> 1 THEN PLAY "mb t155 l64 o2 dp24 cecececececececeegegegegegegegeg g>c<g>c<g>c<g>c<g>c<g>c<g>c<g>c<f#af#af#af#af#af#af#af#a egegegegegegegegegegegegegegegegeg dgdgdgdgdgdgdgdgdgdgdgdgdgdgdg"
delay (1)

CLS
CALL crossroad
CALL where
'battleset

END SUB

FUNCTION xquad (x)
LET N = (x - 1) * 30
xquad = N
END FUNCTION

FUNCTION yquad (y)
M = y * 30
yquad = M
END FUNCTION

