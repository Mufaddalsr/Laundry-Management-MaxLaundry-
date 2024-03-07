# Laundry-Management-MaxLaundry

MaxLaundry, a laundry management system, is a ionic (javascript framework) and .net project based on the use of RFID technology.
This is a 5 year old project with old dependencies and issues/bugs. I think this code will help me understand how to think before you code anything.

## 1. Git

I have previous experience using git and github as i have worked in a group environment. I usually prefer to integrate it with my IDE to not remember all sorts of commands and manually type it each time.

## 2. UML

### Use Case Diagram

<!-- ![uml-laundry-usecase-diagram](UML/Exported%20Images/Class.png) -->

### Activity Diagram

![uml-laundry-activity-diagram](/UML/Exported%20Images/Activity.png)

### Class Diagram

![uml-laundry-class-diagram](/UML/Exported%20Images/Class.png)

## 3. Domain Driven Design DDD

![dd-coreDoamin-diagram](DDD/ddd.png)

## 4. Metrics (Sonarcube)

I have finished setting up Sonarcube in docker and config into the project 
In my experince the setup is diffuclut to follow

I wasnt able the configure Sonarcube in my project. I instated used sonarCloud as an alternative integarted with github workflow pipelines

![first-scan](ScreenShots/Sonarcloud%20first_analysis%202024-03-03%20at%2010.57.44 AM.png)
First Scan


## 5. Clean Code Development

[Personal-CCD](/.github/workflows/CICD.yml)

![File-directory](ScreenShots/CCD_1%202024-03-07%20at%2010.08.04 AM.png)
1. I have Clear Structure to my project, it is also humanly understandable where you can find the component

![CCD_2](ScreenShots/CCD_2%202024-03-07%20at%2010.14.27 AM.png)
1. This is my API Services and it has proper meaningful name to understand the use of it with clear setions using comments 

![CCD_3](ScreenShots/CCD_3%202024-03-07%20at%2010.23.27 AM.png)
1. Using the IDE the code has whitespace and formatting depending on the language used.
1. I like to breakdown my code into smaller bits(components) as it is easier to work with, but it also increaes the number of file i need to make and remember.

1. usually I have some important configuration documentment if i refer to them in the future like if i a using a open source library for RFID to read tags there are ports and device config required based on the RFID reader device 

## 6. Build management

## 7. Continuous Delivery (GitHub Action)

[CI/CD](/.github/workflows/CICD.yml) : workflow to deploy build to my windows server

## 8. Unit tests

## 9. IDE

I have been using VS code as the main IDE for all types of development. It provides extensions which makes it easy to use 

Fav ShortCut
1. crt+f : for fast search and getting a count for how many places we have used function etc..
1. shift+option+f : quickly format the code structure

## 10. DSL

## 11. Functional Programming

