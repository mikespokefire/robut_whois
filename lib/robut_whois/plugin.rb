require "whois"

module RobutWhois
  class Plugin
    include Robut::Plugin
    
    # Responds with +message+ if the command sent to robut is 'echo'.
    def handle(time, sender_nick, message)
      words = message.split
      message_type = words.first
      domain = words[1]
      if message_type == 'whois' && domain
        begin
          reply Whois.query(domain).to_s
        rescue Timeout::Error
          reply "Sorry #{sender_nick}, request timed out for #{domain}"
        rescue Whois::ServerNotFound
          reply "Sorry #{sender_nick}, Unable to find a WHOIS server for #{domain}"
        end
      end
    end

    # Returns a description of how to use this plugin
    def usage
      "whois <domain> - Returns the WHOIS information for a domain"
    end
      
  end
end
