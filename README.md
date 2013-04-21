Facebook Event Creator
======================

![fbevent-creator icon](http://dl.dropbox.com/u/2819285/fbevent-creator.png)


#### _Don't need to manually create periodical events any more._

Description
------------


_**Facebook Event Creator**_ is a Ruby script that automatically creates events on Facebook periodically.

Requirements
------------
- Ruby 1.9.3
- RubyGems: koala
- Unix server + crontab (Unix command)


How to use
----------
1. Install koala: `gem install koala`
2. Set your Facebook info, such as Client ID and Access Token, to `config.json`.
3. Check if your info is correctly set by typing: `ruby test.rb`
4. Now you can run the following command: `ruby fbevent-creator.rb`
5. (Option) If you run the command via `cron`, you can periodically create Facebook event.


Developers
----------
 [@yasulab](http://twitter.com/yasulab), [@hanachin\_](http://twitter.com/hanachin\_)


Sample Usecase
-----------
With `cron`, you can periodically create Facebook events like this:

- [Facebook event of Okinawa.rb](http://www.facebook.com/events/132459433547161/)

License
-------

Any resources included in this repository are under [MIT License](http://www.opensource.org/licenses/mit-license.html).

