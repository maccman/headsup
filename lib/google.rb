require 'nestful'

module Google
  class Email
    def initialize(result)
      @subject = result['title']
      @summary = result['summary']
      @link    = result['link']['href']
      @sent_at = Time.parse(result['issued'])
    end
    
    def serializable_hash(options = nil)
      {
        subject: @subject,
        summary: @summary,
        link: @link,
        sent_at: @sent_at
      }
    end
  end
  
  class Event
    def initialize(result)
      @link     = result['htmlLink']
      @name     = result['summary']
      @start_at = Time.parse(result['start']['date'])
      @end_at   = Time.parse(result['end']['date'])
    end
    
    def serializable_hash(options = nil)
      {
        link: @link,
        name: @name,
        start_at: @start_at,
        end_at: @end_at
      }
    end
  end
  
  class Client
    attr_reader :token, :options
    
    def initialize(token, options = {})
      @token   = token
      @options = options
    end
    
    def email
      result = Nestful.get(
        "https://mail.google.com/mail/feed/atom/", 
        headers: {"Authorization" => "OAuth #{token}"}
      )
      result = Hash.from_xml(result)
      result = result["feed"]["entry"] || []
      result = [result] unless result.is_a?(Array)
      result.map {|e| Email.new(e) }
    end
    
    def calendar
      result = Nestful.get(
        "https://www.googleapis.com/calendar/v3/calendars/primary/events", 
        params: {
          access_token: token,
          maxResults: 100000, 
          orderBy: "updated",
          timeMin: Time.current.beginning_of_day.xmlschema,
          timeMax: Time.current.end_of_day.xmlschema
        }
      )
      result = ActiveSupport::JSON.decode(result)
      (result["items"] || []).map {|i| Event.new(i) }
    end
  end
end