1234567891011121314151617181920212223242526272829303132333435363738394041424344454647484950515253545556var unfollowNumber = 150;
 
var startingUrl;
startingUrl =  "CODE:";
startingUrl +=  "SET !TIMEOUT_PAGE 15" + "\n";
startingUrl +=  "URL GOTO=https://twitter.com/following" + "\n";
startingUrl +=  "WAIT SECONDS=2" + "\n";
 
var scrollDown;
scrollDown = "CODE:";
scrollDown += "URL GOTO=javascript:window.scrollBy(0,7000)" + "\n";
scrollDown += "WAIT SECONDS=2" + "\n"; 
 
var unfollow;
unfollow =  "CODE:";
unfollow +=  "SET !TIMEOUT_STEP 0" + "\n";
unfollow +=  "TAG POS={{I}} TYPE=BUTTON ATTR=TXT:Follow<SP>Following<SP>Unfollow<SP>Blocked<SP>Unblock<SP>Pen*" + "\n";
unfollow +=  "WAIT SECONDS=0.5" + "\n";
 
 
var error = "#EANF#";
var stopButton = "Macro stopped manually";
 
iimPlay(startingUrl);
 
for(i = 4; i <= unfollowNumber + 4; i++){
iimDisplay("Current loop: "+ i);
var unfollowExtract;
unfollowExtract =  "CODE:";
unfollowExtract +=  "SET !TIMEOUT_STEP 0" + "\n";
unfollowExtract +=  "TAG POS={{I}} TYPE=BUTTON ATTR=TXT:Follow<SP>Following<SP>Unfollow<SP>Blocked<SP>Unblock<SP>Pen* EXTRACT=TXT" + "\n";
 
iimSet("I", i);
iimPlay(unfollowExtract);
var unfollowExtract = iimGetLastExtract();
 
////Check for stopButton
var macroError = iimGetLastError();
if (macroError == stopButton){
break;}
//
 
if(unfollowExtract == error){
iimPlay(scrollDown);
}
 
iimSet("I", i);
iimPlay(unfollow);
 
////Check for stopButton
var macroError = iimGetLastError();
if (macroError == stopButton){
break;}
//
 
}