# Hometime Practical

## Project Setup

### Git Repo Cloning and Setup

1. Fork this repo
2. Clone forked repo in your machine

   ```bash
   git clone git@github.com:carijutan-itchan/hometime-practical.git
   ```
3. Go to the project root and bundle install for install gems

   ```bash
   bundle install
   ```
4. Create database and run migration

   ```bash
   bin/rails db:create db:migrate
   ```
5. Test if the app server will boot w/ no issues.

   ```bash
   bin/rails s -p 8080
   ```
6. You can test this by using this API (POST METHOD)
   ```bash
   localhost:8080/reservations
   ```
   
 ## For testing
 1. I used Postman to test the API
 2. This are the sample payload for testing
 
   ```bash
    Payload 1

    {
      "reservation_code": "YYY12345678",
      "start_date": "2021-04-14",
      "end_date": "2021-04-18",
      "nights": 4,
      "guests": 4,
      "adults": 2,
      "children": 2,
      "infants": 0,
      "status": "accepted",
      "guest": {
        "first_name": "Wayne",
        "last_name": "Woodbridge",
        "phone": "639123456789",
        "email": "wayne_woodbridge@bnb.com"
        },
      "currency": "AUD",
      "payout_price": "4200.00",
      "security_price": "500",
      "total_price": "4700.00"
     }
   ```
   ```bash
   Payload 2
   
   {
    "reservation": {
      "code": "XXX12345678",
      "start_date": "2021-03-12",
      "end_date": "2021-03-16",
      "expected_payout_amount": "3800.00",
      "guest_details": {
        "localized_description": "4 guests",
        "number_of_adults": 2,
        "number_of_children": 2,
        "number_of_infants": 0
        },
      "guest_email": "wayne_woodbridge@bnb.com",
      "guest_first_name": "Wayne",
      "guest_last_name": "Woodbridge",
      "guest_phone_numbers": [
        "639123456789",
        "639123456789"
        ],
      "listing_security_price_accurate": "500.00",
      "host_currency": "AUD",
      "nights": 4,
      "number_of_guests": 4,
      "status_type": "accepted",
      "total_paid_amount_accurate": "4300.00"
      }
    }
   ```

 
