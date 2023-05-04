import processing.video.*;
import processing.opengl.*;

Capture video;

PImage weatherIcon;
PImage healthIcon;
PImage newsIcon;
PImage emailIcon;

boolean hoverClk = false; // a flag to indicate whether the mouse is hovering over the clock icon
float btnxClk, btnyClk; // variables to store the position of the clock icon
float xOffClk, yOffClk = 0.0; // variables to store the offset of the clock icon from the mouse position when clicked
boolean hoverH = false; // a flag to indicate whether the mouse is hovering over the health app icon
float btnxH, btnyH; // variables to store the position of the helath icon
float xOffH, yOffH = 0.0; // variables to store the offset of the health icon from the mouse position when clicked
boolean hoverC = false; // for calender icon
float btnxC, btnyC;
float xOffC, yOffC = 0.0;
boolean hoverE = false; // for email icon
float btnxE, btnyE;
float xOffE, yOffE = 0.0;
boolean hoverW = false; // for weather icon
float btnxW, btnyW;
float xOffW, yOffW = 0.0;
boolean hoverN = false; // for news icon 
float btnxN, btnyN;
float xOffN, yOffN = 0.0;

boolean openEmail = false; // indicating email icon has yet to opened
boolean pressEmail = true; // indicating email icon has been clicked on
boolean openCalender = false; // for calendar icon
boolean pressCalender = true; 
boolean openNews = false; // for news icon
boolean pressNews = true;
boolean openWeather = false; // for weather icon
boolean pressWeather = true;
boolean openHealth = false; // for health icon
boolean pressHealth = true;

int month, day, min, hr; // variables storing current date and time

void setup()
{
  size(1000, 850); // size for canvas
  video = new Capture(this, 1000, 850, 30); // initialize a new video capture with the given dimensions and frame rate
  video.start(); // start the video capture
  
  // load the images for the app icons
  emailIcon = loadImage("emailapp.png");
  newsIcon = loadImage("newsapp.png");
  weatherIcon = loadImage("weatherapp.png");
  healthIcon = loadImage("healthapp.png");
  
  // set the x and y coordinates for each app button
  btnxClk = 100;
  btnyClk = 770;
  btnxC = 100;
  btnyC = 100;
  btnxH = 300;
  btnyH = 100;
  btnxE = 500;
  btnyE = 100;
  btnxW = 700;
  btnyW = 100;
  btnxN = 900;
  btnyN = 100;
  rectMode(RADIUS); // set the rectangle drawing mode to RADIUS
  
  // resize icons to desired dimensions
  healthIcon.resize(75,75);
  emailIcon.resize(100,80);
  newsIcon.resize(75,75);
  weatherIcon.resize(150,150);
}

void draw(){
  // Check if video is available
  if(video.available())
  // read the video
  {video.read();}
  background(0); // black background
  image(video, 0, 0); // Draw the video image at the top left corner of the canvas
  tint(250, 250); // Set tint color to white with low opacity
  
  // Check if mouse is over the clock button
  if(mouseX>btnxClk-75 && mouseX<btnxClk+75 && mouseY>btnyClk-75 && mouseY<btnyClk+75)
  {
    // Set the hover state of clock button to true while the other states will be equal to false
    hoverClk = true;
    hoverH = false;
    hoverC = false;
    hoverN = false;
    hoverE = false;
    hoverW = false;
  } 
  else if(mouseX>btnxH-75 && mouseX<btnxH+75 && mouseY>btnyH-75 && mouseY<btnyH+75)
  {
    // Set the hover state of health button to true while the other states will be equal to false
    hoverClk = false;
    hoverH = true;
    hoverC = false;
    hoverN = false;
    hoverE = false;
    hoverW = false;
  } 
  else if(mouseX>btnxC-75 && mouseX<btnxC+75 && mouseY>btnyC-75 && mouseY<btnyC+75)
  {
    // Set the hover state of calendar button to true while the other states will be equal to false
    hoverClk = false;
    hoverH = false;
    hoverC = true;
    hoverN = false;
    hoverE = false;
    hoverW = false;
  } 
  else if(mouseX>btnxN-75 && mouseX<btnxN+75 && mouseY>btnyN-75 && mouseY<btnyN+75) 
  {
    // Set the hover state of news button to true while the other states will be equal to false
    hoverClk = false;
    hoverH = false;
    hoverC = false;
    hoverN = true;
    hoverE = false;
    hoverW = false;
  } 
  else if(mouseX>btnxE-75 && mouseX<btnxE+75 && mouseY>btnyE-75 && mouseY<btnyE+75) 
  {
    // Set the hover state of email button to true while the other states will be equal to false
    hoverClk = false;
    hoverH = false;
    hoverC = false;
    hoverN = false;
    hoverE = true;
    hoverW = false;
  } 
  else if(mouseX>btnxW-75 && mouseX<btnxW+75 && mouseY > btnyW-25 && mouseY<btnyW+25)
  {
    // Set the hover state of weather button to true while the other states will be equal to false
    hoverClk = false;
    hoverH = false;
    hoverC = false;
    hoverN = false;
    hoverE = false;
    hoverW = true; 
  } 
  else 
  { // Set fill color to red and stroke color to black
    fill(250,0,0);
    stroke(0);
  }
  
  // Set fill color and draw a rectangle at a position with a width and height of 75 pixels for each button
  fill(0, 456, 321);
  rect(btnxN, btnyN, 75, 75);
  fill(453, 56, 234);
  rect(btnxE, btnyE, 75, 75);
  fill(0, 500, 200);
  rect(btnxW, btnyW, 75, 75);
  fill(123, 0, 545);
  rect(btnxC, btnyC, 75, 75);
  noFill();
  rect(btnxClk, btnyClk, 75, 36);
  fill(190, 400, 0);
  rect(btnxH, btnyH, 75, 75);
  
  month = month(); // Set the value of the variable "month" to the current month
  day = day(); // Set the value of the variable "day" to the current day
  
  // Drawing an image of an icon at its position
  image(emailIcon, btnxE-43, btnyE-35);
  image(weatherIcon, btnxW-75, btnyW-75);
  image(newsIcon, btnxN-33, btnyN-31);
  image(healthIcon, btnxH-34, btnyH-32);

  fill(250);
  textSize(50);

  // Check the current month and display the abbreviated month name at position (btnxC-30, btnyC-5)
  // Display the day number at position (btnxC-10, btnyC+33)
  if(month == 1)
  {text("Jan", btnxC-30, btnyC-5);} 
  else if(month == 2)
  {text("Feb", btnxC-30, btnyC-5);} 
  else if(month == 3)
  {text("Mar", btnxC-30, btnyC-5);} 
  else if(month == 4)
  {text("Apr", btnxC-30, btnyC-5);} 
  else if(month == 5)
  {text("May", btnxC-30, btnyC-5);} 
  else if(month == 6)
  {text("Jun", btnxC-30, btnyC-5);} 
  else if(month == 7)
  {text("Jul", btnxC-30, btnyC-5);} 
  else if(month == 8)
  {text("Aug", btnxC-30, btnyC-5);} 
  else if(month == 9)
  {text("Sep",btnxC-30, btnyC-5);} 
  else if(month == 10)
  {text("Oct", btnxC-30, btnyC-5);} 
  else if(month == 11)
  {text("Nov", btnxC-30, btnyC-5);} 
  else if(month == 12)
  {text("Dec", btnxC-30, btnyC-5);}
  text(day, btnxC-10, btnyC+33);
  
  // if open____ becomes true, run its assigned program
  if(openCalender)
  {calenderProg();} 
  else if(openWeather) 
  {weatherProg();} 
  else if(openEmail) 
  {emailProg();} 
  else if(openHealth)
  {healthProg();} 
  else if(openNews) 
  {newsProg();} 
  
  hr = hour(); // Set the value of the variable "hour" to the current month
  min = minute(); // Set the value of the variable "minute" to the current month
  
  // clock text position and color using hr and min
  fill(150, 324 , 6);
  textSize(30);
  text(hr, btnxClk-45, btnyClk+12);
  text(":", btnxClk-7, btnyClk+10);
  text(min, btnxClk+7, btnyClk+12);
}

void mouseClicked()
{
   if(hoverN && pressNews == true) // checks if the mouse is hovering over the news button and it has been clicked
   {
     openNews = true; // sets the program to open
     pressNews = false; // sets the button to not be pressed
   } 
   else if(hoverC && pressCalender == true) 
   {
     openCalender = true;
     pressCalender = false;
   } 
   else if(hoverE && pressEmail == true)
   {
     openEmail = true;
     pressEmail = false;
   } 
   else if(hoverH && pressHealth == true)
   {
     openHealth = true;
     pressHealth = false;
   } 
   else if(hoverW && pressWeather == true)
   {
     openWeather = true;
     pressWeather = false;
   } 
   else // if no buttons were clicked, then all press_____ remain true
   {
     openNews = false;
     pressNews = true;
     openCalender = false;
     pressCalender = true;
     openEmail = false;
     pressEmail = true;
     openHealth = false;
     pressHealth = true;
     openWeather = false;
     pressWeather = true;
   }
}

void calenderProg()
{
  strokeWeight(17); // Thickness of the border of the rectangle
  stroke(150, 400, 12); // Color of the border of the rectangle
  noFill(); // Remove fill from rectangle
  tint(250, 75); // Color and transparency of the rectangle
  rect(500, 495, 375, 250); // Draw a rectangle at position (500, 495) with a width of 375 and height of 250
  textSize(50); 
  
  // Check which month it is and display the name of the month
  if(month == 1)
  {text("Janurary", 380, 290);} 
  else if(month == 2)
  {text("Feburary", 380, 290);} 
  else if(month == 3)
  {text("March", 380, 290);}
  else if(month == 4)
  {text("April", 380, 290);} 
  else if(month == 5)
  {text("May", 380, 290);} 
  else if(month == 6)
  {text("June", 380, 290);} 
  else if(month == 7)
  {text("July", 380, 290);} 
  else if(month == 8)
  {text("August", 380, 290);} 
  else if(month == 9)
  {text("September", 380, 290);} 
  else if(month == 10)
  {text("October", 380, 290);} 
  else if(month == 11)
  {text("November", 380, 290);} 
  else if(month == 12)
  {text("December", 380, 290);}
  
  textSize(36);
  // Display the names of the days of the week
  text("Sun", 140, 325);
  text("Mon", 230, 325);
  text("Tues", 350, 325);
  text("Wed", 470, 325);
  text("Thurs", 590, 325);
  text("Fri", 710, 325);
  text("Sat", 810, 325);
  
  noStroke();
  fill(255);
  
  // Draw vertical  and horizontal lines to separate the days
  rect(215, 540, 6, 200);
  rect(325, 540, 6, 200);
  rect(445, 540, 6, 200);
  rect(565, 540, 6, 200);
  rect(685, 540, 6, 200);
  rect(785, 540, 6, 200);
  rect(500, 340, 370, 6);
  rect(500, 405, 370, 6);
  rect(500, 470, 370, 6);
  rect(500, 535, 370, 6);
  rect(500, 600, 370, 6);
  rect(500, 660, 370, 6);
  fill(250);
  
  // Display the dates for the first two rows
  text("1              2              3             4          5", 380, 380);
  text("6           7             8              9            10           11         12", 170, 450);
  text("13         14          15            16           17           18        19", 150, 520);
  text("20         21          22            23           24           25        26", 150, 575);
  text("27         28          29", 150, 640);
  fill(175);
  text("30         31", 150, 380);
  text("1             2             3           4", 500, 640);
  text("5           6             7              8              9           10         11", 170, 710);
  
  fill(250);
  strokeWeight(0);
}

void newsProg()
{
  fill(150, 400, 12);
  rect(500, 415, 375, 4);
  rect(500, 575, 375, 4);
  textSize(22);
  fill(250);
  text("ABC International News", 290, 275);
  text("CBS News", 290, 445);
  text("FOX News", 290, 605);
  textSize(17);
  text("Hyena spotted 60 miles outside Toronto??", 290, 290);
  text("Birds: Are they real?", 290, 460);
  text("Tommy Dang starring in the revamped Blade 2024??", 290, 620);
  textSize(15);
  text("This Friday, the Smith family had taken a road trip out to Glacier National Park for", 290, 315);
  text("a camping trip when not even an hour into the drive, they think they made a wrong turn", 290, 330);
  text("into Africa", 290, 345);
  text("What most may think started out as a conspiracy parody, is actually the origin of a real", 290, 485);
  text("movement. We have Peter Mclndoe to tell us more on the evidence to back this conspiracy.", 290, 500);
  text("Locals may know him as the Elevator Enthusiast. But did you ever think this", 290, 645);
  text("Professor could be in a movie?! The picture says it all!", 290, 660);
  text("Whether the rumors started Sundady or not is unkown.", 290, 675);
  text("Whether or not its all true... we may have to wait till the next class for a", 290, 690);
  text("solidified answer from Dr. Dang.", 290, 705);
  
  // Calling images used for project for each assigned news summary
  PImage abc = loadImage("hyena.jpg");
  PImage cbs = loadImage("bird.jpg");
  PImage fox = loadImage("Dang.png");
  abc.resize(100, 120);
  cbs.resize(120, 120);
  fox.resize(100, 115);
  image(abc, 165, 275);
  image(cbs, 165, 435);
  image(fox, 165, 600);
  
  strokeWeight(7);
  stroke(150, 400, 12);
  noFill();
  rect(500, 495, 375, 250); 
  tint(250, 75);
  fill(250);
  strokeWeight(0);
}
  
void emailProg()
{
  noFill();
  stroke(150, 400, 12);
  strokeWeight(3);
  rect(500, 630, 190, 60);
  rect(500, 750, 190, 60);
  rect(500, 510, 190, 60);
  rect(500, 390, 190, 60);
 
  fill(250);
  textSize(22);
  text("Bob L.          <robert.lowe@gmail.com>", 320, 355);
  text("Dr. Dang  <donotreply@blackboard.com>", 320, 475);
  text("Dawn E.(Doctor) <dawne.doc@aol.com>", 320, 595);
  text("Elon              <elonmusk@yahoo.com>", 320, 715);
 
  textSize(17);
  text("Hey just checkin' on how your NFT grind is going...", 320, 390);
  text("Project 3: Stove Design...", 320, 510);
  text("How's your ligament medication going?", 320, 630);
  text("Metaverse for 7 billion?...", 320, 750);
  
  tint(250,75);
  fill(250);
  strokeWeight(0);
}

void healthProg()
{
  strokeWeight(6);
  stroke(150, 400, 12);
  noFill();
  tint(250, 75);
  rect(500, 630, 190, 60);
  rect(500, 750, 190, 60);
  rect(500, 510, 190, 60);
  rect(500, 390, 190, 60);
  
  textSize(45);
  fill(150, 400, 12);
  text("Health Status", 380, 300);
  textSize(22);
  text("Hours active this week: ", 330, 360);
  text("Weight:", 330, 480);
  text("Last Run's Avg. Speed:", 330, 720);
  text("Height:", 330, 600);
  text("6' 2''", 450, 660);
  text("4 hrs approx", 450, 420);
  text("220 lbs", 450, 540);
  text("4.77 mph", 450, 780);
  
  fill(250);
  strokeWeight(0);
}

void weatherProg()
{
  tint(250, 75);  
  
  textSize(75);
  fill(250);
  
  text("Forcast this Week", 250, 300);
  textSize(22);
  
  text("Sun       29            50", 430, 400);
  text("Mon       26            56", 430, 430);
  text("Tues      25            36", 430, 460);
  text("Wed       23            47", 430, 490);
  text("Thu        25            48", 430, 520);
  text("Fri          30            57", 430, 550);
  text("Sat          33            61", 430, 580);
  text("Feels Like:         36", 430, 610);
  text("Air Quality:        37", 430, 640);
  text("Humidity:           57%", 430, 670);
  text("Lows", 480, 350);
  text("Highs", 560, 350);
  
  fill(250);
  strokeWeight(0);
}
