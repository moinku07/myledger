# MyLedger Django RestAPI

Django Admin dashboard http://myledger.durlov.com/admin
RestAPI http://myledger.durlov.com/api

Test username: `testuser`, password: 'asdf1234'


# Sample API calls

Registration

POST http://myledger.durlov.com/auth/register/
<pre>
<code>
{
	"username": "testuser3",
	"password": "12345678",
	"first_name": "Test",
	"last_name": "User 3",
	"email": "test3@user.com"
}
</code>
</pre>

Login

POST http://myledger.durlov.com/auth/login/
<pre>
<code>
{
	"username": "0469893062",
	"password": "asdf1234"
}

or

{
	"phone": "04XXXXXXX",
	"password": "asdf1234"
}

or 

{
	"email": "test3@user.com",
	"password": "asdf1234"
}

</code>
</pre>

Social Registration & Login

POST http://myledger.durlov.com/auth/social/
<pre>
<code>
{
	"network": "facebook",
	"identifier": "767676767676", // identifier provided by facebook
	"token": "EAAc......", // token provided by facebook
	"email": "test3@user.com",
	"first_name": "Test",
	"last_name": "User3"
}
</code>
</pre>

Follow http://myledger.durlov.com/api for API samples

Filters for api/account

Any field order `order=field_name` or `order=-field_name` 
Filter by user `user=2`
Filter by accounttype `accounttype=1`

http://myledger.durlov.com/api/account/?user=2&accounttype=1&order=created_at