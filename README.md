# OnboardRocks
#What is Onboard Rocks ?

An open-source PHP application using the Onboard Informatics Property API. It is based on 150 million US property records. View a live demo here http://onboard.rocks/, Sign up for developer access to the API here, [https://developer.onboard-apis.com/].

It was built using the [Mini 2 application]. An extremely simple PHP barebone / skeleton application built on top of the wonderful Slim router / micro framework [1] [2] [docs].

Features

Search for properties based on address and radius
Pagination through result set
Return sales history for property based on property ID
Return county tax assessment for property based on property ID
Return AVM for property based on property ID
By default MINI allows user access to /public folder. The rest of the application (including .git files, swap files, etc) is not accessible.

Install Docker and Docker compose

Checkout git clone 

	$ git clone https://github.com/arvindr226/OnboardRocks.git
	$ cd OnboardRocks

Step 1-: Docker build 
		docker-compose up -d
