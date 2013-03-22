desc "This task is called by the Heroku cron add-on"
task :call_page => :environment do
   require 'net/http'
   uri = URI.parse('http://a-kun-bot-kyoiku.herokuapp.com/tyokyos/tweet_tyokyo')
   Net::HTTP.get(uri)
 end
