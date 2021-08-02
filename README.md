# Vocab_adder

#### Vocab_adder

#### By Kyle Kay-Perez

#### Shortcuts
- [Technologies Used](#technologies-used)
- [Description](#description)
- [Setup/Installation Requirements](#setup/installation-requirements)
- [Known Bugs](#known-bugs)
- [Valid Word Tests](#valid-word-tests)
- [Future Plans](#future-plans)
- [License](#license)
- [Contact Information](#contact-information)

## Technologies Used

* [Markdown](https://www.markdownguide.org/)
* [VS studio](https://code.visualstudio.com/)
* [Bootstrap](https://getbootstrap.com/)
* [Ruby](https://www.ruby-lang.org/en/)
* [Ruby Gems](https://rubygems.org/)

## Description

This is a program dedicated to adding words and definitions for class learning.

You can see the website [here](https://murmuring-waters-75236.herokuapp.com/)

## Setup/Installation Requirements

* Clone this repository from github to your desktop: [Github link for this project](https://github.com/professional-pigeon/Vocab_charity)
* navigate to the top level of the directory
* run "gem install bundler" then "bundle install" in your terminal
* To run tests run "rspec" in your terminal


## Known Bugs

* You can create blank entries or update blank definitions currently

## License

MIT License

Copyright (c) Kyle Kay-Perez 2021

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Contact Information

Kyle.KayPerez@gmail.com

Changes for resubmission

Hi Kyle, you're off to a really good start with this project. You've created a Word class and properly defined all of its methods. Your tests for the Word class are well written and are passing. Your routes follow REST conventions and are working to deliver full CRUD functionality. I like that you've added some styling as well. To get this project to meet all requirements you just need to define another class for Definitions. Currently, you're adding a definition by passing in:meaning from the params hash when you initialize an new Word object. Instead, the prompt wants you to create a new Definition object and associate it with a Word that's already in the @@words "database" in the Word class. The Definition class should include all the methods you included in your Word class to deliver full CRUD functionality. You'll need to add views for Definitions that the user will access via the additional routes you'll need to create in app.rb. This might sound like a lot but it's essentially just repeating what you've done so far with your Word class, only the extra routing adds a bit more complexity. I'd recommend looking at last week's Record Store project and following along with the lessons on Nested Routing and the Song class if you need a reference.

Like I said, you've got a solid foundation. Keeping working and you'll get this passing soon. If you have any questions or could use any clarification, feel free to reach out via Discord or email and I'll be happy to help.

Create Definition class and define routes for CRUD functionality
Create views for Definition class
Include complete unit testing for all methods within Definition class and integration testing for routes pertaining to Definition class
Fullfill all Objectives of this project

Make an application that contains a Word class. The homepage of the app should list all words. When a word is clicked, it should lead to a page with the word's definitions. Children should be able to add a word, and when viewing a word, be able to add, update or delete one or more definitions. This week you should deploy your application to Heroku so the kids can try it out!