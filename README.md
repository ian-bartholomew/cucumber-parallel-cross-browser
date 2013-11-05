# Cucumber Parallel Cross Browser Basic Projec

Description
===========

This is a basic project that parallelizes tests, spinning off a new thread for each browser, via Thor.  This isn't that fancy, so it's not using tags, which would be another way to go with this.

Right now, the browser that are included out of the box are: FF, Chrome/webkit, and headless.

There is also another branch in this project, 'IE', that includes IE in the mix.  That requires some love at the momement, in the documentation department, and getting it easier to use, as you have to spin up a VM, install java, install the adapter, etc.  Basically, its IE, so of course its going to be a PITA.


Requirements
============

* Ruby 1.9.3+ ([RVM](https://rvm.io/) is the best at managing this)
* [Ruby Gems](http://rubygems.org/)
* Bundler: sudo gem install bundler rake


Project Layout
====

* features/*.feature : cucumber features
* features/step_definitions/web_steps.rb : generic steps that apply to all features
* features/step_definintions/[feature]_steps.rb : steps specific to an individual feature file
* support/env.rb : configures the driver and the hostname to use


Usage
===

In terminal, to install:

    $ cd cucumber-basic-folder
    $ bundle install
    
Then, to run the tests, while still in the folder:

	$ thor feature_runner:all_drivers_runner

To see all of the tests:
    
    $ thor list	
	

The tests will run through a sample feature, test each step, and as part of the last step, save a screen shot in the `screenshot/` directory for each data point in example table (see the search.feature) and for each browser.  Each browser is also resized to a standard size, to make comparing them easier.