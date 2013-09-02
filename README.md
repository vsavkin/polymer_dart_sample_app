# Flea Market

## Introduction

The purpose of this project is to show how to build a single-page application using Polymer.Dart:

1. How to define custom components
2. How to organize use cases and complex UI interactions
3. How to organize the client/server communication
4. How to implement complex business rules on the client side

The "Flea Market" project will evolve over time as the Polymer project becomes more stable. So the implementation of the existing use cases will change and new use cases will be added.

## Functionality of the Application

The "Flea Market" application implements the following:

1. Viewing auctions
2. Bidding on items
3. Buying items

Such use cases as singing in/singing out, are creating new auctions are not going to be implemented and will be stubbed out.

## App in Action

This is a video showing the application in action:

VIDEO

## Feedback is Welcomed

Open issues, send pull requests.

## Known Issues

1. Accessing the parent context does not work

* WHEN FIXED: Remove the global eventBus

2. Passing primitive values when instantiating a component does not work

* WHEN FIXED: Create the field component

3. Investigate ways to set global helpers

* WHEN FIXED: Format date times, amounts, intervals
* WHEN FIXED: Handle malformed numbers
