# BeyondBullies
Beyond Bullies Smartphone App

The Beyond Bullies app for iOS and Android.

Overview

The beyond bullies app for iOS and Android will be a convenient and easy to use platform for young children to access for getting more information and guidance at hand. The app will have 

The San Diego Italian Film Festival app for iOS will be a convenient, easy to use platform. It will provide quick access to the festival schedule, allow users to purchase tickets directly in the app, browse venues and locations, and learn about the San Diego Italian Film Festival. This post is intended to go over all aspects of the app and explain how they will be implemented. The app will includes these features: schedule, ticket purchasing, venues, about page.

Schedule

Description

The festival schedule is intended to be one (1) tab in the app. It will include all films and the relevant metadata (times, posters, locations, etc...).

Implementation

In order to develop this feature a few things are required on the server side. The main requirement is a collection of all the films and metadata. This list should be in JSON format, it should contain the names of the films as the main keys, and the actual metadata within the dictionaries stored behind the names of the films. Here is an example of the film schedule in JSON:

{
   "[Name_of_Film]":{
      "premierDate":"[Date_of_Film_Premier]",
      "venueID":"[Venue_Identifier]",
      "imageURLs":["URL_of_Poster","URL_of_Another_Image"],
      "trailerURLs":["[URL_of_Film_Trailer]","[URL_of_Another_Trailer]"]
    }
}
Tickets

Description

Users will be able to purchase tickets directly within the app. Ideally, they will be able to do so using Apple Pay or another method of payment. Perhaps the ticket could then be kept right on the users device in the app, or in Wallet.

Implementation

First off we must have a way to accept payment through the app. In order to do this a payment platform must be enlisted, I would suggest a company such as Stripe due to their security and abundant development resources.

Venues

Description

The app will give users the ability to browse venues, the locations of them, and see what films are playing at which venues. They may also be able to get directions to any of the venues. This will be located as additional information when a user is looking at a film, and the venue will be shown on a map in the detail view.

Implementation

A collection of venues must be provided in JSON format (similar to fig. 1.1) containing important metadata such as: location coordinates, film names at venue, and so on.

About Us

Description

The about us page will contain information about the San Diego Italian Film Festival.

Implementation

These details do not seem necessary as there will not be much code required with this page.
