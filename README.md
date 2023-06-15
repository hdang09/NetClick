# NETCLICK - A Movie Web Application

<div align="center">
    <img src="./.github/favicon.png" alt="Logo" width="60" height="60" />
    <p>NetClick is an internet-connected streaming service that operates on a subscription model</p>
</div>

## 0. Introduction

- Team members:
  - Trần Hải Đăng
  - Trần Tấn Thành
  - Trần Minh Quân
- Technologies in use:
  - Tailwind CSS
  - Chart.js
  - JSP, Servlet
  - Microsoft SQL Server

## 1. Requirements

- Name of your system: NetClick
- What is the purpose of the system: To provide online movie browsing, searching, and watching, with admin features for managing accounts, and administering the movies.
- Who use the system: Movie enthusiasts and admins managing the movies and accounts.
- List all features your system can do, arrange the features in a specific classification:

### User features

**User Registration and Login**

The user registration and login feature enables users to create an account and securely log into the application. The login form requires users to enter their username and password, and the application verifies the credentials for authentication. If the entered password is incorrect, an error message is displayed.

The register form collects the user's desired username, email address, password, and re-typed password for confirmation. The application checks if the username already exists in the database and displays an error message if it is taken. It also ensures that the entered password matches the re-typed password and prompts the user to correct any mismatches.

User information, such as name, email address, and password, is stored to facilitate user identification and authentication.

**Movie Browsing and Searching**

The movie browsing and searching feature allows users to find movies based on different criteria. Users can search for movies by title, actor, or director. The application retrieves relevant movie information from its database based on the user's search input.

When a user selects a movie, the application displays detailed information about the movie. This includes a description of the plot, cast and crew details, ratings, reviews, release date, runtime, genre, and more. This comprehensive display helps users make informed decisions about the movies they want to watch.

The application also provides additional sections to enhance the browsing experience. The "Top List" section showcases popular movies, and the "Incoming Movies" section highlights upcoming releases. Additionally, the application offers recommendations based on user preferences and viewing history, suggesting movies that users might enjoy.

**History and Like Button** (Future plans)

The history and like button feature lets users mark movies as favorites, keeping track of their preferences. It saves this information for easy access and also records the user's watched movie history, allowing them to resume from where they left off.

**Reviews and Ratings**

Users have the ability to write reviews and provide ratings for movies using the reviews and ratings feature. They can share their opinions, thoughts, and experiences about a movie by writing a review. Additionally, users can rate movies based on their overall satisfaction or enjoyment level. The application also allows users to view reviews.

**Subscriptions Purchasing**

The ticket purchasing feature allows users to purchase subscriptions for watching movies. Users can choose from different subscription tiers such as weekly, monthly, or annually. The application displays available subscription options, including free and paid plans. Users can select their preferred subscription and proceed with the purchase using various payment methods such as credit cards, e-banking, ATMs, or Visa/MasterCard.

**Transaction History**

Users can view their transaction history through the transaction history feature. This feature provides a record of past purchases and upcoming ticket reservations. Users can refer to this history to track their movie-related transactions, including subscriptions and ticket reservations.

### Admin Features

**Movie Management**

- Admins should beable to add, edit, and delete movies from the application.
- Admins should be able to upload trailers and promotional materials for each movie.
- Admins should be able to set showtimes and update availability for each movie.

**User Management**

- Admins should be able to view and manage user accounts, including resetting passwords and deleting accounts if necessary.
- Admins should be able to view user transaction history and refund purchases if necessary.

## 2. Wireframe or screenshots of the system

You can view full our wireframe in here: [Figma](https://www.figma.com/file/CB9zF3wsmZimnx8U83VW4C/NetClick?type=design&node-id=0-1&t=Aq8fdv3htqCGwmyM-0)
<img src="./.github/wireframe.png" />

### Reister page

When user didn't have any account, we can go to this page:
<img src="./.github/register-page.png" />
If username exists or retype password not match, it will show the message:
<img src="./.github/register-error.png" />

### Login page

<!-- Here is the login page: -->
<img src="./.github/login-page.png" />
If the password is wrong, it will show the message:
<img src="./.github/login-error.png" />

### Home page

<!-- Here is the home page: -->
<img src="./.github/home-page.png" />

### Preview page

<!-- Here is the preview page for the film: -->
<img src="./.github/preview-page.png" />

### Movie page

If the user has purchased subscription, it will navigate to the **Movie page**
<img src="./.github/movie-page.png" />

### Subscription page

If the user hasn't purchased subscription, it will navigate to the **Subscription page**
<img src="./.github/subscription-page.png" /><br />
\The user can choose which payment method to pay:
<img src="./.github/subscription-page-2.png" />

### Payment page

Here is the page if the user choose to pay with credit card:
<img src="./.github/payment-credit.png" /><br />
And here is with digital card:
<img src="./.github/payment-digital.png" />

### Dashboard page (Admin)

<img src="./.github/dashboard.png" />

### User Management page (Admin)

<img src="./.github/user-mgmt.png" />

### Movie Management page (Admin)

<img src="./.github/movie-mgmt.png" />

### Movie Detail page (Admin)

<img src="./.github/movie-detail.png" />

### Movie Form page (Admin)

This page is used for creating and editing the movie

<img src="./.github/movie-form.png" />

## 3. Database design

You can view full our diagram in here: [QuickDBD](https://app.quickdatabasediagrams.com/#/d/o6Ffqs)
<img src="./.github/diagram.png" />

## 4. System design

## 5. Conclusion and Discussion

### Pros of NetClick:

- Provides a comprehensive movie browsing and searching experience for users.
- Offers various subscription options for users to choose from.
- Allows users to mark movies as favorites and track their viewing history.
- Provides admins with the ability to manage movies and user accounts efficiently.
- Offers a transaction history feature for users to track their purchases.

### Cons of NetClick:

- The application may face competition from existing online movie streaming platforms.
- The application's success may depend on the availability of popular and quality movie content.
- The application may require a significant amount of resources to maintain and update its database regularly.

### What was learned during the development of NetClick:

- .....
- .....
- .....

  <!-- - Developing an online movie streaming application requires a lot of effort and resources.
  - The importance of ensuring the security of user information, especially during registration and login processes.
  - The need to keep track of user preferences and viewing history to provide personalized recommendations and enhance the user experience.
  - The importance of offering multiple payment options for user convenience. -->

### Improvements for NetClick in the future:

- Integrate a feature that allows users to create watchlists for easy access to movies they plan to watch.
- Provide subtitles and dubbing options for users who prefer to watch movies in languages other than the original.
- Implement a feature that suggests movies based on real-time user activities such as search queries and browsing history.
- Offer a feature that provides users with recommendations for similar movies they may enjoy based on their ratings and reviews.
- Integrate with social media platforms to allow users to share their reviews and ratings with friends and followers.
