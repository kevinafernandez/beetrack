# Beetrack Evaluation

RoR 5.2.3 application

## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Setup](#setup)
* [Folders](#folders)

## General info
This project is a simple rails app who accepts GPS waypoints via API and display them in a map with Google Maps
	
## Technologies
For this project you must to consider or install this versions:
  * Ruby: 2.5.3
  * Rails: 5.2.3
  * Database: PostgreSQL 9.5
	* Sidekiq: 5.2.3

## Setup
* Clone this repo via HTTPS: `https://github.com/kevinafernandezbeetrack.git`

* Install all the gems && dependencies: `bundle install`

* Create the database: `rails db:create`

* Run all database migrations: `rails db:migrate`

* Start your rails server: `rails server`

* Start sidekiq for execute background jobs: `bundle exec sidekiq`

## Folders

* `app/models` - Contains two database models (Waypoint, Vehicle) for the application, there we define methods, validations, queries, and relations.

* `app/controllers` - Contains API controller for make post request and a HomeController to show the view

* `app/views` - Contains a template for display the vehicles and map

* `app/public/lib/javascript` - Contain a template for create the logic with Google maps

* `db` - Contains the migrations needed to create our database schema.