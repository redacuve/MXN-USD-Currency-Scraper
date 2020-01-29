<!-- Project Header -->
<p align="center">
  <img src="" alt="USD-MXN web scraper Logo" height="150" >
  <br>
  <h2 align="center">Ruby Section</h2>
  <h3 align="center">Final Project</h3>
  <h3 align="center">Capstone Project. Web Scraper</h3>
  <p align="center">
  <br>
   <a href="https://github.com/redacuve/MXN-USD-Currency-Scraper"><strong>Explore the repo »</strong></a>
  <br>
  <a href="https://github.com/redacuve/MXN-USD-Currency-Scraper/issues">Request Feature</a>
  </p>

<!-- TABLE OF CONTENTS -->

## Table of Contents

* [About the Project](#about-the-project)

* [Built With](#built-with)

* [Requirements](#requirements)

* [Getting Started](#getting-started)

* [Configuration](#configuration)

* [Contributing](#contributing)

* [License](#license)

* [Contact](#contact)

* [Acknowledgements](#acknowledgements)

<!-- ABOUT THE PROJECT -->

## About The Project

This is a USD-MXN web scraper.

In México is very useful to know the value of the dollar every day, every bank here in Mexico has it own price of the dollar, this web scrapper go to the webpage of every bank and scrap the value of the USD, then show it on the console, and it saves the prices of the buy and sell of each bank on a .csv file.
The program work with the next Banks in México:
```
      * Banamex
      * Bancomer
      * Banco_Azteca
      * Scotiabank
      * Banorte
      * Banregio
      * Banbajio
```
If the .csv doesn't exist is going to create a new one and save the prices there or if the .csv files exist is going to add the prices in the last row.

Project written in Ruby Languaje.

### Built With

* [Ruby](https://ruby-doc.org/core-2.7.0/)<br>
  Used Gems:
  * [Nokogiri](https://github.com/sparklemotion/nokogiri)
  * [Watir](https://github.com/watir/watir)
  * [Webdrivers](https://github.com/titusfortner/webdrivers)
  * [Bundler](https://github.com/rubygems/bundler)

<!-- REQUIREMENTS -->
## Requirements
  * Bundler 2.1.0 or later (https://rubygems.org/gems/bundler) 
  ```
  gem install nokogiri
  ```
  Optional:<br>
  * Google Chrome 72.0.3626 or later (https://www.google.com/intl/en/chrome/productivity/)
  <br>
  
  * Only If you want to install this manually: (see [Getting Started](#getting-started) #4)
    * Nokogiri 1.6.0 or later (https://rubygems.org/gems/nokogiri)
      ```
      gem install nokogiri
      ```
    * Watir 6.14 or later (https://rubygems.org/gems/watir)
      ```
      gem install watir
      ```
    * Webdrivers 4.0 or later (https://rubygems.org/gems/webdrivers/)
      ```
      gem install webdrivers
      ```
<!-- GETTING STARTED -->

## Getting Started

1. Install ruby [https://www.ruby-lang.org/en/documentation/installation/]

To get a local copy:<br>

2. Clone or fork the <a href="https://github.com/redacuve/MXN-USD-Currency-Scraper">repo</a> [git@github.com:redacuve/MXN-USD-Currency-Scraper.git]

To download:<br>

2. Download the <a href="https://github.com/redacuve/MXN-USD-Currency-Scraper">repo</a> [https://github.com/redacuve/MXN-USD-Currency-Scraper/archive/master.zip]<br>
3. Unzip the zip file<br>

4. Install the dependencies:
  This project is provided with a Gemfile with the 3 dependencies inside, you need to install first the gem bundler<br>
    ```
    gem install bundler
    ```
    then you can add the gems with the command:
    ```
    bundle install
    ```
    now the tree gems are installed in your system.<br>
    You can go to the next step #5.<br>
    <br>
  Note*: If you want to install the gems manually instead of using the bundler and the gem file you can do this:
  ```
      gem install nokogiri
      
      gem install watir
      
      gem install webdrivers
  ```
5. Go to directory of this project. this project looks like:
  ``` 
  MXN-USD-Currency-Scraper
  |__bin
  |   |__main.rb
  |
  |__config
  |   |__config.rb
  |
  |__lib
  |   |__scraper.rb
  |
  |__LICENSE
  |__README.md
  ```
6. Inside this project you need to type:
  ```
  ruby bin/main.rb
  ```
7. Then the program it's going to start and open one browser (chrome by default, but it isnt installed the default browser in your system).
  
8. The program is going to show you the price of the USD in MXN and save it on the .csv (by default dolar.csv on the directory). *note: this project requires the use of 'CSV' Class, but this is installed by default with ruby, no gem needed.
  
9. You can change some of the behavior of the program modifying the config.rb file. 

<!-- MODIFYING -->
## Configuration

This software is provided with a cofing.rb file (stored inside the config folder), in this file you can change the behavior of the program, for example:
* The name and directory of the .csv file (by default dolar.csv) is stored on the variable @path.

* The names of every bank is stored on the variable @names, if you change this, you need to change also he variable @codes and @sites.

* Every website of the bank is stored in @sites, this is the URL of every bak where the price of the USD is displayed.

* The @code variable is the most useful line, here is stored how we can obtain the data of every webpage we need to know where it is stored and give the Watir::Browser the data of what it needs to wait (the value of the USD Dollar) it need to start with 'Watir::Wait.until { browser' and finish with '.exists? }' if it is not done in this way, the program is not able to work. because it is going to show 'Wrong Code Format String'

<!-- CONTRIBUTING -->

## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project

2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)

3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)

4. Push to the Branch (`git push origin feature/AmazingFeature`)

5. Open a Pull Request

<!-- LICENSE -->

## License

This project is under the <a href="https://www.gnu.org/licenses/gpl-3.0.html">GNU Public License V3</a>
<br>
You can see the license here: [LICENSE](https://github.com/redacuve/MXN-USD-Currency-Scraper/blob/master/LICENSE)

<!-- CONTACT -->

## Contact

Rey David Cuevas Vela - [@redacuve](https://twitter.com/redacuve) - redacuve@gmail.com

Project Link: [github.com/redacuve/MXN-USD-Currency-Scraper](https://github.com/redacuve/MXN-USD-Currency-Scraper) - Currency Scraper

<!-- ACKNOWLEDGEMENTS -->

## Acknowledgements

* [Rey David Cuevas Vela](https://github.com/redacuve)
