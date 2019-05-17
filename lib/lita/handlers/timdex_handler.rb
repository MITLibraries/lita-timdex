module Lita
  module Handlers
    class TimdexHandler < Handler
      # insert handler code here

      route(/^ping/, :ping, help: { "ping" => "Checks TIMDEX!" })

      route(/^search\s+(.+)/, :search, command: true, help: { "search" => "Searches TIMDEX! for the provided string of text"})

      def ping(response)
        # Timdex no longer requires auth and will continue on just fine with
        # bad auth. The gem for now doesn't understand that so you need to
        # provide _something_ even if it's obviously junk like this.
        # Once the gem is updated, we can fix this until we need real auth
        # later.
        pong = Timdex.new('FAKE_FOR_NOW', 'IT_WILL_WORK_ANYWAY').ping

        response.reply(render_template('ping', data: pong))
      end

      def search(response)
        # This parses the submitted string, and sends it over to the Timdex gem's
        # search method.
        output = {}
        output['needle'] = response.matches[0][0]

        output['response'] = Timdex.new('FAKE_FOR_NOW', 'IT_WILL_WORK_ANYWAY').search(output['needle'])

        response.reply(render_template('search', data: output))
      end

      Lita.register_handler(self)
    end
  end
end
