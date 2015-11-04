# Party Planner

#### Problem Description:

Let’s say we have some customer records in a text file (customers.txt, see below) – one customer per line, JSON-encoded. We want to invite any customer within 100km of our Dublin office (GPS coordinates 53.3381985, -6.2592576) for some food and drinks on us.

Write a program that will read the full list of customers and output the names and user ids of matching customers (within 100 km), sorted by user id (ascending).

You can use the first formula from this Wikipedia article to calculate distance: https://en.wikipedia.org/wiki/Great-circle_distance but don't forget to convert degrees to radians. Your program should be tested.

#### Usage:
From the app directory:

```
ruby get_guests.rb customers.txt
```

Radius, home latitude and home longitude are optional command line arguments. They default to 100,53.3381985 and -6.2592576 respectively.

```
ruby get_guests.rb customers.txt 100 53.3381985 -6.2592576
```

#### Design:

Distance has been calculated using the law of cosines.

Data file is parsed and records are loaded into a Hash. This will be replaced by a Database for production scale.


