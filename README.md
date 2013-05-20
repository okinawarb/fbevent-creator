Facebook Event Creator
======================

![fbevent-creator icon](http://dl.dropbox.com/u/2819285/fbevent-creator.png)


#### _Don't need to manually create periodical events any more._

Description
------------

_**Facebook Event Creator**_ is a Ruby script that creates events on Facebook, which can be run on Heroku.
Using this script and Heroku, you can weekly create an Facebook event for a group.
For example, Okinawa Ruby User Group, often called as `Okinawa.rb`, holds a weekly meetup in its Facebook Group. And the event is automatically created by this scrip running on Heroku.


Requirements
------------
- Ruby 1.9.3
- RubyGems: koala
- (Option) [Heroku](http://www.heroku.com) + [Heroku Scheduler](https://addons.heroku.com/scheduler)

How to Use
----------
1. Download this source code: `git clone git://github.com/yasulab/fbevent-creator.git`
2. Rename `config.json.sample` to `config.json` and set your own information.
3. Create a Facebook App w/ `create_event` permission, which creates an event instead of you.
4. Set its Access Token of to `config.json`.
5. Check if it works correctly by running test script: `ruby test-facebook-api.rb`.
6. Now, you can create an event via the script by: `ruby fbevent-creator.rb`
7. (Option) If you upload this script to [Heroku](http://www.heroku.com) and install [Heroku Scheduler](https://addons.heroku.com/scheduler), you'll able to periodically create Facebook event.

How to Activate your Facebook App
-------------------------------
1. Create an Facebook App and get its Client ID (If you don't know of it, visit [here](https://developers.facebook.com/docs/opengraph/getting-started/)).
2. Replace the following URI's `YOUR_APP_ID` with yours.

    `https://www.facebook.com/dialog/oauth?client_id=YOUR_APP_ID&scope=create_event&redirect_uri=https://www.facebook.com/connect/login_success.html&response_type=token`

3. Access the URI with your web browswer, and note the following `XXXX` value in the result.

    `https://www.facebook.com/connect/login_success.html#access_token=XXXX&expires_in=YYYY`

4. Replace `YOUR_ACCEES_TOKEN` in `config.json` (or `config.json.sample`) with `XXXX` that you noted.
5. Done!

How to Extend your Access Token
--------------------------
1. Visit [here](https://developers.facebook.com/tools/access_token/) and click `Debug` button next to your app's `User Token`.
2. Check if `Expires` is close to now. If not, skip this section (re-visit this section when it's close).
3. If close, replace `APP_ID`, `APP_SECRET`, and `ACCESS_TOKEN` with yours.

    `https://graph.facebook.com/oauth/access_token?client_id=APP_ID&client_secret=APP_SECRET&grant_type=fb_exchange_token&fb_exchange_token=ACCESS_TOKEN`

4. Visit the replaced URL with your web browser.
5. If it works correctly, you'll see something like this:

    `access_token=YOUR_ACCESS_TOKEN&expires=EXPIRED_DATE`

6. Visit [Debugger Tool](https://developers.facebook.com/tools/debug) and type `YOUR_ACCESS_TOKEN` above.
7. Check `Expired:` and if it's `in about 2months`, you've successfully extended the token, yay!

Developers
----------
 [@yasulab](http://twitter.com/yasulab), [@hanachin\_](http://twitter.com/hanachin\_)


Sample Usecase
-----------
With this script and Heroku, you can periodically create Facebook events like this:

- [Facebook event of Okinawa.rb](http://www.facebook.com/events/132459433547161/)

License
-------

Any resources included in this repository are under [MIT License](http://www.opensource.org/licenses/mit-license.html).

